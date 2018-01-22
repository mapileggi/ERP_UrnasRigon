unit UIntIndBaixaEtiqueta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFIntIndBaixaEtiqueta = class(TForm)
    dsDados: TDataSource;
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    lbDuploClicExcluir: TLabel;
    gbConsultar: TGroupBox;
    gbBaixar: TGroupBox;
    lbdtBaixa: TLabel;
    eddtBaixaIni: TDateTimePicker;
    lbdtBaixaA: TLabel;
    eddtBaixaFim: TDateTimePicker;
    lbcdSetor: TLabel;
    lbdeCodBarras: TLabel;
    dsSetor: TDataSource;
    lcbcdSetor: TDBLookupComboBox;
    edcdCodBarras: TEdit;
    btConsultar: TBitBtn;
    lbcdPedido: TLabel;
    edcdPedidoIni: TEdit;
    lbcdPedidoA: TLabel;
    edcdPedidoFim: TEdit;
    lbcdItem: TLabel;
    edcdItem: TEdit;
    btFechar: TBitBtn;
    lbcdCarga: TLabel;
    edcdCarga: TDBCampoCodigo;
    btBaixarLote: TBitBtn;
    qySetor: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure edcdCodBarrasChange(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btBaixarLoteClick(Sender: TObject);
  private
    procedure FocoCampoCodigoBarras;
    procedure AplicarFiltro;
    procedure BaixarEtiqueta(const sCodBarras : String; const bEhBaixaLote : Boolean);
    procedure BaixarEtiquetasEmLote;
  public
    { Public declarations }
  end;

var
  FIntIndBaixaEtiqueta: TFIntIndBaixaEtiqueta;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes;

{$R *.dfm}

procedure TFIntIndBaixaEtiqueta.BaixarEtiquetasEmLote;
var
  iQtd    : Integer;
  stDados : TStringList;
begin
  if lcbcdSetor.KeyValue = null then
    Aviso('Informe o setor antes de baixar.')
  else if (SameText(edcdCarga.ERPLbDescricaoCaption, edcdCarga.FDescricaoVazia)) or
          (SameText(edcdCarga.ERPLbDescricaoCaption, edcdCarga.FDescricaoInvalida)) then
    Aviso('Para baixar esta etiqueta, o código da carga deve ser informado.')
  else
  begin
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyPedido.MacroByName('filtro').Value := ' WHERE cdCarga = ' + edcdCarga.ERPEdCampoChaveText +
                                                         ' ORDER BY nuPedido, seq';
    DmIntegracao.qyPedido.Open;

    if DmIntegracao.qyPedido.IsEmpty then
      Aviso('Não existem pedidos na carga informada.')
    else
    begin
      stDados := TStringList.Create;

      DmIntegracao.qyPedido.First;

      while not DmIntegracao.qyPedido.Eof do
      begin
        iQtd := 1;

        while iQtd <= DmIntegracao.qyPedido.FieldByName('nuQtd').AsInteger do
        begin
          stDados.Clear;

          ExecuteSimplesSql(DmERP.fdConnERP,
                            'SELECT cdSetor ' +
                            '  FROM erp.intIndBaixaEtiqueta ' +
                            ' WHERE cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetor').AsString +
                            '   AND cdPedido = ' + DmIntegracao.qyPedido.FieldByName('nuPedido').AsString +
                            '   AND cdSeqPed = ' + DmIntegracao.qyPedido.FieldByName('seq').AsString +
                            '   AND cdIdQtde = ' + IntToStr(iQtd),
                            'cdSetor',
                            stDados
                           );

          if (StrToIntDef(stDados.Strings[0], 0) = 0) then
            BaixarEtiqueta(FormatFloat('00000000', DmIntegracao.qyPedido.FieldByName('nuPedido').AsInteger) +
                           FormatFloat('000', DmIntegracao.qyPedido.FieldByName('seq').AsInteger) +
                           FormatFloat('000', iQtd),
                           True
                          );

          Inc(iQtd);
        end;

        DmIntegracao.qyPedido.Next;
      end;

      if Assigned(stDados) then
        FreeAndNil(stDados);

      if DmIntegracao.qyPedido.Active then
        DmIntegracao.qyPedido.Close;

      DmIntegracao.fdConnInteg.Connected := False;

      Aviso('Baixa em lote finalizada.');
    end;
  end;
end;

procedure TFIntIndBaixaEtiqueta.BaixarEtiqueta(const sCodBarras : String; const bEhBaixaLote : Boolean);
var
  dthrAtual     : TDateTime;
  sMsgValidacao : String;
begin
  if lcbcdSetor.KeyValue = null then
    Aviso('Informe o setor antes de baixar.')
  else
  begin
    if (dsSetor.DataSet.FieldByName('cdSetor').AsInteger = 9) and
       (
        (SameText(edcdCarga.ERPLbDescricaoCaption, edcdCarga.FDescricaoVazia)) or
        (SameText(edcdCarga.ERPLbDescricaoCaption, edcdCarga.FDescricaoInvalida))
       ) then
    begin
      Aviso('Para baixar esta etiqueta, o código da carga deve ser informado.');
      edcdCodBarras.Clear;
      Abort;
    end;

    dthrAtual := DataHoraAtual(DmERP.fdConnERP);

    DmERP.qyIntIndBaixaEtiqueta.Insert;
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdSetor').AsInteger        := dsSetor.DataSet.FieldByName('cdSetor').AsInteger;
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdPedido').AsInteger       := StrToIntDef(Copy(sCodBarras, 1, 8), 0);
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdSeqPed').AsInteger       := StrToIntDef(Copy(sCodBarras, 9, 3), 0);
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdIdQtde').AsInteger       := StrToIntDef(Copy(sCodBarras, 12, 3), 0);

    if StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0) > 0 then
      DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdCarga').AsInteger      := StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0);

    DmERP.qyIntIndBaixaEtiqueta.FieldByName('deCarga').AsString         := edcdCarga.ERPLbDescricaoCaption;

    if not bEhBaixaLote then
    begin
      DmIntegracao.fdConnInteg.Connected := True;
      DmIntegracao.qyPedido.MacroByName('filtro').Value := ' WHERE nuPedido = ' + DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdPedido').AsString +
                                                           '   AND seq = ' + DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdSeqPed').AsString;
      DmIntegracao.qyPedido.Open;
    end;

    if not DmIntegracao.qyPedido.IsEmpty then
    begin
      DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdItem').AsString          := DmIntegracao.qyPedido.FieldByName('cdItem').AsString;
      DmERP.qyIntIndBaixaEtiqueta.FieldByName('deItem').AsString          := DmIntegracao.qyPedido.FieldByName('descricao').AsString;
      DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdCliente').AsInteger      := DmIntegracao.qyPedido.FieldByName('codigo_cliente').AsInteger;
      DmERP.qyIntIndBaixaEtiqueta.FieldByName('nuQtdTotalItem').AsInteger := DmIntegracao.qyPedido.FieldByName('nuQtd').AsInteger;
      DmERP.qyIntIndBaixaEtiqueta.FieldByName('dtcadpedido').AsDateTime   := DmIntegracao.qyPedido.FieldByName('dt_reg').AsDateTime;
    end;

    if not bEhBaixaLote then
    begin
      if DmIntegracao.qyPedido.Active then
        DmIntegracao.qyPedido.Close;

      DmIntegracao.fdConnInteg.Connected := False;
    end;

    DmERP.qyIntIndBaixaEtiqueta.FieldByName('dtBaixa').AsDateTime       := Trunc(dthrAtual);
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('hrBaixa').AsInteger        := HoraParaMinutos(dthrAtual);
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('cdUsuarioBaixa').AsInteger := FTelaInicial.FcdUsuario;

    DmERP.qyIntIndBaixaEtiqueta.FieldByName('deSetor').AsString         := dsSetor.DataSet.FieldByName('deSetor').AsString;
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('nmUsuBaixa').AsString      := FTelaInicial.FnmUsuario;
    DmERP.qyIntIndBaixaEtiqueta.FieldByName('deHrBaixa').AsString       := FormatDateTime('HH:mm', MinutosParaTime(DmERP.qyIntIndBaixaEtiqueta.FieldByName('hrBaixa').AsInteger));

    sMsgValidacao := '';

    if not bEhBaixaLote then
      sMsgValidacao := DmERP.BaixaEtiquetaValida;

    if Trim(sMsgValidacao) <> '' then
    begin
      DmERP.qyIntIndBaixaEtiqueta.Cancel;
      Aviso('As seguintes informações devem ser verificadas:' + #13#13 + sMsgValidacao);

      if Pos(' - Urna já baixada', sMsgValidacao) > 0 then
        Aviso('As seguintes informações devem ser verificadas:' + #13#13 + sMsgValidacao);
    end
    else
      DmERP.GravarBaixaEtiqueta;
  end;
end;

procedure TFIntIndBaixaEtiqueta.btBaixarLoteClick(Sender: TObject);
begin
  BaixarEtiquetasEmLote;
end;

procedure TFIntIndBaixaEtiqueta.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFIntIndBaixaEtiqueta.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  dsDados.DataSet.Close;

  Tab := FTelaInicial.pcTelas.ActivePage;

  if Assigned(Tab) then
  begin
    Tab.Parent      := nil;
    Tab.PageControl := nil;

    FreeAndNil(Tab);
  end;

  FTelaInicial.pcTelas.Visible   := FTelaInicial.pcTelas.PageCount > 0;
  FTelaInicial.imLogoERP.Visible := not FTelaInicial.pcTelas.Visible;
end;

procedure TFIntIndBaixaEtiqueta.edcdCodBarrasChange(Sender: TObject);
begin
  if Length(edcdCodBarras.Text) = 14 then
  begin
    BaixarEtiqueta(edcdCodBarras.Text, False);
    edcdCodBarras.Clear;

    FocoCampoCodigoBarras;
  end;
end;

procedure TFIntIndBaixaEtiqueta.AplicarFiltro;
var
  sWhere : String;
begin
  if (DmERP.qyIntIndBaixaEtiqueta.Active) then
    DmERP.qyIntIndBaixaEtiqueta.Close;

  sWhere := '';

  if (eddtBaixaIni.Checked) and
     (eddtBaixaFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtBaixaIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtBaixaFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtBaixa BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtBaixaIni.DateTime)) +
                    '             AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtBaixaFim.DateTime))
                   );

  if (StrToIntDef(edcdPedidoIni.Text, 0) > 0) and (StrToIntDef(edcdPedidoFim.Text, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdPedido BETWEEN ' + edcdPedidoIni.Text + ' AND ' + edcdPedidoFim.Text);

  if (Trim(edcdItem.Text) <> '') then
    AdicionaCondSql(sWhere, ' cdItem LIKE ' + QuotedStr('%' + edcdItem.Text + '%'));

  if Trim(sWhere) <> '' then
    DmERP.qyIntIndBaixaEtiqueta.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyIntIndBaixaEtiqueta.Open();
end;

procedure TFIntIndBaixaEtiqueta.FormCreate(Sender: TObject);
begin
  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');

  qySetor.Open();
  qySetor.First;

  if qySetor.Locate('cdSetor', VarArrayOf([FTelaInicial.FcdSetorUsuario]), []) then
    lcbcdSetor.KeyValue := FTelaInicial.FcdSetorUsuario;

  eddtBaixaIni.DateTime := DataHoraAtual(DmERP.fdConnERP);
  eddtBaixaFim.DateTime := eddtBaixaIni.DateTime;
  AplicarFiltro;

  btBaixarLote.Visible  := (FTelaInicial.FcdUsuario in[1,3]);
  lcbcdSetor.Enabled    := btBaixarLote.Visible;
end;

procedure TFIntIndBaixaEtiqueta.FocoCampoCodigoBarras;
begin
  if (edcdCodBarras.Visible) and (edcdCodBarras.Enabled) and (edcdCodBarras.CanFocus) then
    edcdCodBarras.SetFocus;
end;

procedure TFIntIndBaixaEtiqueta.FormShow(Sender: TObject);
begin
  if FTelaInicial.FcdSetorUsuario = 9 then
    edcdCarga.ERPEdCampoChaveSetFocus
  else
    FocoCampoCodigoBarras;
end;

procedure TFIntIndBaixaEtiqueta.grDadosDblClick(Sender: TObject);
begin
  if (DmERP.qyIntIndBaixaEtiqueta.Active) and (not DmERP.qyIntIndBaixaEtiqueta.IsEmpty) then
  begin
    DmERP.ExcluirBaixaEtiqueta;
    FocoCampoCodigoBarras;
  end;
end;

initialization
  RegisterClass(TFIntIndBaixaEtiqueta);

finalization
  UnRegisterClass(TFIntIndBaixaEtiqueta);

end.
