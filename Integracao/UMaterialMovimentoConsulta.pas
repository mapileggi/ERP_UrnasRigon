unit UMaterialMovimentoConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFMaterialMovimentoConsulta = class(TForm)
    dsDados: TDataSource;
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    gbFiltros: TGroupBox;
    lbdtMovimento: TLabel;
    eddtMovimentoIni: TDateTimePicker;
    lbdtMovimentoA: TLabel;
    eddtMovimentoFim: TDateTimePicker;
    btConsultar: TBitBtn;
    eddtSituacaoMovFim: TDateTimePicker;
    lbdtSituacaoMovA: TLabel;
    eddtSituacaoMovIni: TDateTimePicker;
    lbdtSituacaoMov: TLabel;
    btFechar: TBitBtn;
    lbcdSituacaoMovimento: TLabel;
    cbcdSituacaoMovimento: TComboBox;
    cbflTipoMovimento: TComboBox;
    lbflTipoMovimento: TLabel;
    lbcdFornecedor: TLabel;
    edcdFornecedor: TDBCampoCodigo;
    lbcdMaterial: TLabel;
    edcdMaterial: TDBCampoCodigo;
    lbflTipoSolicitacao: TLabel;
    cbflTipoSolicitacao: TComboBox;
    vtMaterialMovConsulta: TVirtualTable;
    vtMaterialMovConsultacdMaterialMovimento: TIntegerField;
    vtMaterialMovConsultaflTipoMovimento: TStringField;
    vtMaterialMovConsultacdSituacaoMovimento: TIntegerField;
    vtMaterialMovConsultadtMovimento: TDateField;
    vtMaterialMovConsultahrMovimento: TIntegerField;
    vtMaterialMovConsultacdMaterial: TStringField;
    vtMaterialMovConsultadeMaterial: TStringField;
    vtMaterialMovConsultacdUnidadeMedida: TStringField;
    vtMaterialMovConsultanuQtde: TFloatField;
    vtMaterialMovConsultavlUnitario: TFloatField;
    vtMaterialMovConsultacdFornecedor: TIntegerField;
    vtMaterialMovConsultacdMaterialSolicitacao: TIntegerField;
    vtMaterialMovConsultadeNuNotaFiscal: TStringField;
    vtMaterialMovConsultadtSituacaoMov: TDateField;
    vtMaterialMovConsultahrSituacaoMov: TIntegerField;
    vtMaterialMovConsultacdUsuarioSituacaoMov: TIntegerField;
    vtMaterialMovConsultadeObservacoes: TStringField;
    vtMaterialMovConsultadtCadastro: TDateField;
    vtMaterialMovConsultahrCadastro: TIntegerField;
    vtMaterialMovConsultacdUsuarioCadastro: TIntegerField;
    vtMaterialMovConsultadtAlteracao: TDateField;
    vtMaterialMovConsultahrAlteracao: TIntegerField;
    vtMaterialMovConsultacdUsuarioAlteracao: TIntegerField;
    vtMaterialMovConsultavlUnitES: TFloatField;
    vtMaterialMovConsultadeSituacaoMovimento: TStringField;
    vtMaterialMovConsultadeHrCadastro: TStringField;
    vtMaterialMovConsultadeHrAlteracao: TStringField;
    vtMaterialMovConsultadeHrMovimento: TStringField;
    vtMaterialMovConsultadeHrSituacaoMov: TStringField;
    vtMaterialMovConsultanuQtdeMov: TFloatField;
    vtMaterialMovConsultanmFornecedor: TStringField;
    vtMaterialMovConsultacdSolicitante: TIntegerField;
    vtMaterialMovConsultanmSolicitante: TStringField;
    vtMaterialMovConsultaflTipoSolicitacao: TStringField;
    vtMaterialMovConsultadeTipoSolicitacao: TStringField;
    vtMaterialMovConsultanmUsuCad: TStringField;
    vtMaterialMovConsultanmUsuAlt: TStringField;
    vtMaterialMovConsultanmUsuSit: TStringField;
    vtMaterialMovConsultavlCusto: TFloatField;
    vtMaterialMovConsultacdCentroCusto: TIntegerField;
    vtMaterialMovConsultadeCentroCusto: TStringField;
    lbcdCentroCusto: TLabel;
    edcdCentroCusto: TDBCampoCodigo;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure vtDadosflSelecionadoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure grDadosDblClick(Sender: TObject);
  private
    procedure AplicarFiltro;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  FMaterialMovimentoConsulta: TFMaterialMovimentoConsulta;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes, UDmIntegracao;

{$R *.dfm}

procedure TFMaterialMovimentoConsulta.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
begin
   if not (
           (Screen.ActiveControl is TCustomMemo) or   // se não for um memo
           (Screen.ActiveControl is TDBLookupComboBox) or  // se não for um DbLookup
          // (Screen.ActiveControl is TCustomGrid) or // se não for uma grid o controle mudara com enter
           (Screen.ActiveForm.ClassName = 'TMessageForm')
          ) then
   begin
     if Msg.message = WM_KEYDOWN then
      begin
        case Msg.wParam of
        VK_RETURN,VK_DOWN : Screen.ActiveForm.Perform(WM_NextDlgCtl,0,0);   //,VK_TAB
        VK_UP             : Screen.ActiveForm.Perform(WM_NextDlgCtl,1,0);
        end;
      end;
   end;
end;

procedure TFMaterialMovimentoConsulta.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFMaterialMovimentoConsulta.btFecharClick(Sender: TObject);
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

procedure TFMaterialMovimentoConsulta.AplicarFiltro;
var
  sWhere : String;
  i      : Integer;
begin
  if not vtMaterialMovConsulta.Active then
    vtMaterialMovConsulta.Open;

  vtMaterialMovConsulta.Clear;

  if (DmERP.qyIntIndMaterialMovConsulta.Active) then
    DmERP.qyIntIndMaterialMovConsulta.Close;

  DmERP.qyIntIndMaterialMovConsulta.MacroByName('filtro').Clear;

  sWhere := '';

  if (eddtMovimentoIni.Checked) and
     (eddtMovimentoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtMovimentoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtMovimentoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtMovimento BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtMovimentoIni.DateTime)) +
                    '                 AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtMovimentoFim.DateTime))
                   );

  if (eddtSituacaoMovIni.Checked) and
     (eddtSituacaoMovFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtSituacaoMovIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtSituacaoMovFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtSituacaoMov BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtSituacaoMovIni.DateTime)) +
                    '                   AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtSituacaoMovFim.DateTime))
                   );

  if (cbflTipoMovimento.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' flTipoMovimento = ' + QuotedStr(Copy(cbflTipoMovimento.Text, 1, 1)));

  if (cbcdSituacaoMovimento.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' cdSituacaoMovimento = ' + IntToStr(cbcdSituacaoMovimento.ItemIndex));

  if (cbflTipoSolicitacao.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' flTipoSolicitacao = ' + QuotedStr(Copy(cbflTipoSolicitacao.Text, 1, 1)));

  if (Trim(edcdMaterial.ERPEdCampoChaveText) <> '') and (edcdMaterial.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdMaterial = ' + QuotedStr(edcdMaterial.ERPEdCampoChaveText));

  if (Trim(edcdFornecedor.ERPEdCampoChaveText) <> '') and (edcdFornecedor.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdFornecedor = ' + edcdFornecedor.ERPEdCampoChaveText);

  if Trim(sWhere) <> '' then
    sWhere := ' WHERE ' + sWhere;

  DmERP.qyIntIndMaterialMovConsulta.MacroByName('filtro').Value := sWhere +
                                                                   '  ORDER BY t.cdMaterial, t.cdMaterialMovimento ';

  DmERP.qyIntIndMaterialMovConsulta.Open();

  if not DmIntegracao.fdConnInteg.Connected then
    DmIntegracao.fdConnInteg.Connected := True;

  if not DmERP.qyIntIndMaterialMovConsulta.IsEmpty then
  begin
    vtMaterialMovConsulta.DisableControls;

    try
      DmERP.qyIntIndMaterialMovConsulta.First;

      while not DmERP.qyIntIndMaterialMovConsulta.Eof do
      begin
        vtMaterialMovConsulta.Append;

        for i := 0 to DmERP.qyIntIndMaterialMovConsulta.FieldCount - 1 do
        begin
          if Assigned(vtMaterialMovConsulta.FindField(DmERP.qyIntIndMaterialMovConsulta.Fields.Fields[i].FieldName)) then
            vtMaterialMovConsulta.FieldByName(DmERP.qyIntIndMaterialMovConsulta.Fields.Fields[i].FieldName).Value := DmERP.qyIntIndMaterialMovConsulta.Fields.Fields[i].Value;
        end;

        if DmIntegracao.qyItem.Active then
          DmIntegracao.qyItem.Close;

        DmIntegracao.qyItem.MacroByName('filtro').Value := ' AND TRIM(a.item) = ' + QuotedStr(DmERP.qyIntIndMaterialMovConsulta.FieldByName('cdMaterial').AsString);
        DmIntegracao.qyItem.Open;

        if not DmIntegracao.qyItem.IsEmpty then
        begin
          vtMaterialMovConsulta.FieldByName('deMaterial').AsString      := DmIntegracao.qyItem.FieldByName('deItem').AsString;
          vtMaterialMovConsulta.FieldByName('cdUnidadeMedida').AsString := DmIntegracao.qyItem.FieldByName('cdUnidadeMedida').AsString;
          vtMaterialMovConsulta.FieldByName('cdCentroCusto').AsInteger  := DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsInteger;

          if vtMaterialMovConsulta.FieldByName('cdCentroCusto').AsInteger > 0 then
            vtMaterialMovConsulta.FieldByName('deCentroCusto').AsString := DmIntegracao.qyItem.FieldByName('deCentroCusto').AsString
          else
            vtMaterialMovConsulta.FieldByName('deCentroCusto').AsString := 'Não Informado';
        end
        else
        begin
          vtMaterialMovConsulta.FieldByName('cdCentroCusto').AsInteger := 0;
          vtMaterialMovConsulta.FieldByName('deCentroCusto').AsString  := 'Não Informado';
          vtMaterialMovConsulta.FieldByName('cdUnidadeMedida').Clear;
        end;

        if (edcdCentroCusto.ERPValorValido) and (edcdCentroCusto.ERPEdCampoChaveText <> vtMaterialMovConsulta.FieldByName('cdCentroCusto').AsString) then
          vtMaterialMovConsulta.Cancel
        else
          vtMaterialMovConsulta.Post;

        DmERP.qyIntIndMaterialMovConsulta.Next;
      end;
    finally
      vtMaterialMovConsulta.EnableControls;
      vtMaterialMovConsulta.First;
    end;
  end;

  if DmIntegracao.qyItem.Active then
    DmIntegracao.qyItem.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if vtMaterialMovConsulta.IsEmpty then
    Aviso('Não existem movimentos de materiais cadastrados com os filtros informados.');
end;

procedure TFMaterialMovimentoConsulta.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');

  dtAtual                    := DataHoraAtual(DmERP.fdConnERP);

  eddtMovimentoIni.DateTime    := dtAtual - 5;
  eddtMovimentoFim.DateTime    := dtAtual;

  eddtSituacaoMovIni.DateTime := dtAtual;
  eddtSituacaoMovFim.DateTime := dtAtual;

  eddtSituacaoMovIni.Checked     := False;
  eddtSituacaoMovFim.Checked     := False;
end;

procedure TFMaterialMovimentoConsulta.grDadosDblClick(Sender: TObject);
var
  stSemCampos : TStringList;
begin
  stSemCampos := TStringList.Create;

  if (vtMaterialMovConsulta.Active) and (not vtMaterialMovConsulta.IsEmpty) then
  begin
    if (vtMaterialMovConsulta.FieldByName('flTipoMovimento').AsString = 'S') and
       (vtMaterialMovConsulta.FieldByName('cdMaterialSolicitacao').AsInteger > 0) then
      FTelaInicial.AbrirTela('FIntIndMaterialSolicCadastro',
                             'cdMaterialSolicitacao',
                             vtMaterialMovConsulta.FieldByName('cdMaterialSolicitacao').AsString,
                             stSemCampos
                            )
    else if (vtMaterialMovConsulta.FieldByName('flTipoMovimento').AsString = 'E') then
      FTelaInicial.AbrirTela('FIntIndMaterialEntCadastro',
                             'cdMaterialMovimento',
                             vtMaterialMovConsulta.FieldByName('cdMaterialMovimento').AsString,
                             stSemCampos
                            );
  end;

  if Assigned(stSemCampos) then
    FreeAndNil(stSemCampos);
end;

procedure TFMaterialMovimentoConsulta.vtDadosflSelecionadoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flSelecionado') then
    Text := '';
end;

initialization
  RegisterClass(TFMaterialMovimentoConsulta);

finalization
  UnRegisterClass(TFMaterialMovimentoConsulta);

end.
