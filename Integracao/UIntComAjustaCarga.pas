unit UIntComAjustaCarga;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Error,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, UDBCampoCodigo, MemDS, VirtualTable, StrUtils,
  Vcl.Menus;

type
  TFIntComAjustaCarga = class(TForm)
    btSalvar: TBitBtn;
    btFechar: TBitBtn;
    dsPedidoEmCarga: TDataSource;
    qyPedidoEmCarga: TFDQuery;
    btConsultar: TBitBtn;
    grDados: TDBGrid;
    vtPedidosEscolhidos: TVirtualTable;
    vtPedidosEscolhidoscdPedido: TIntegerField;
    vtPedidosEscolhidostpPedido: TStringField;
    vtPedidosEscolhidosdtEmissao: TDateField;
    vtPedidosEscolhidosflStatusPed: TStringField;
    vtPedidosEscolhidoscdCliente: TIntegerField;
    vtPedidosEscolhidosdeRazaoSocial: TStringField;
    vtPedidosEscolhidosdeFantasia: TStringField;
    dsPedidosEscolhidos: TDataSource;
    lbcdPedido: TLabel;
    edcdPedido: TDBCampoCodigo;
    btSalvarPedEsc: TBitBtn;
    btExluirPedEsc: TBitBtn;
    grPedidosEscolhidos: TDBGrid;
    lbcdCarga: TLabel;
    vtPedidoEmCarga: TVirtualTable;
    nro_pedido: TIntegerField;
    vtPedidoEmCargarecnum: TIntegerField;
    vtPedidoEmCargacodigo_grupoPed: TIntegerField;
    vtPedidoEmCargacodigo_transp: TIntegerField;
    vtPedidoEmCargadata_emissao: TDateField;
    vtPedidoEmCargaobservacao: TStringField;
    vtPedidoEmCargaseq: TIntegerField;
    vtPedidoEmCargaflag_faturado: TStringField;
    vtPedidoEmCargadt_embarque: TDateField;
    vtPedidoEmCargahora_embarque: TStringField;
    vtPedidoEmCargacubagem: TFloatField;
    vtPedidoEmCargapeso_liquido: TFloatField;
    vtPedidoEmCargapeso_bruto: TFloatField;
    vtPedidoEmCargacod_veiculo: TIntegerField;
    vtPedidoEmCargacod_condutor: TIntegerField;
    edcdCarga: TDBCampoCodigo;
    pmSalvar: TPopupMenu;
    pmiPedidosEmCarga: TMenuItem;
    pmiDescricaoCarga: TMenuItem;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btSalvarPedEscClick(Sender: TObject);
    procedure btExluirPedEscClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure pmiPedidosEmCargaClick(Sender: TObject);
    procedure pmiDescricaoCargaClick(Sender: TObject);
  private
    procedure FecharConexaoIntegracao;
  public
    { Public declarations }
  end;

var
  FIntComAjustaCarga: TFIntComAjustaCarga;

implementation

{$R *.dfm}
{$R Icones.res}

uses
  uDmIntegracao, uDmERP, UTelaInicial, uFuncoes;

procedure TFIntComAjustaCarga.btConsultarClick(Sender: TObject);
var
  sListaPed : String;
  i         : Integer;
begin
  vtPedidoEmCarga.Clear;

  if qyPedidoEmCarga.Active then
    qyPedidoEmCarga.Close;

  qyPedidoEmCarga.MacroByName('listaPed').Clear;

  if StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0) = 0 then
    Aviso('Informe uma carga antes de consultar.')
  else if vtPedidosEscolhidos.IsEmpty then
    Aviso('Escolha pelo menos 1 pedido para verificar o ajuste.')
  else
  begin
    try
      DmIntegracao.fdConnInteg.Connected := True;

      qyPedidoEmCarga.ParamByName('cdCarga').AsInteger := StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0);

      vtPedidosEscolhidos.DisableControls;

      try
        vtPedidosEscolhidos.First;
        sListaPed := '';

        while not vtPedidosEscolhidos.Eof do
        begin
          if Trim(sListaPed) = '' then
            sListaPed := vtPedidosEscolhidos.FieldByName('cdPedido').AsString
          else
            sListaPed := sListaPed + ', ' + vtPedidosEscolhidos.FieldByName('cdPedido').AsString;

          vtPedidosEscolhidos.Next;
        end;
      finally
        vtPedidosEscolhidos.EnableControls;
      end;

      qyPedidoEmCarga.MacroByName('listaPed').Value := sListaPed;
      qyPedidoEmCarga.Open();

      if qyPedidoEmCarga.IsEmpty then
        Aviso('Não existem ajustes a serem feitos para os pedidos escolhidos na carga especificada.')
      else
      begin
        qyPedidoEmCarga.First;

        while not qyPedidoEmCarga.Eof do
        begin
          vtPedidoEmCarga.Insert;

          for i := 0 to qyPedidoEmCarga.FieldCount - 1 do
          begin
            if Assigned(vtPedidoEmCarga.FindField(qyPedidoEmCarga.Fields.Fields[i].FieldName)) then
              vtPedidoEmCarga.FieldByName(qyPedidoEmCarga.Fields.Fields[i].FieldName).Value := qyPedidoEmCarga.Fields.Fields[i].Value;
          end;

          vtPedidoEmCarga.Post;

          qyPedidoEmCarga.Next;
        end;

        pmiPedidosEmCarga.Enabled := True;
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    FecharConexaoIntegracao;
  end;
end;

procedure TFIntComAjustaCarga.btExluirPedEscClick(Sender: TObject);
begin
  if not vtPedidosEscolhidos.IsEmpty then
    vtPedidosEscolhidos.Delete;
end;

procedure TFIntComAjustaCarga.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  FecharConexaoIntegracao;

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

procedure TFIntComAjustaCarga.btSalvarClick(Sender: TObject);
var
  p : TPoint;
begin
//  pmSalvar.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  p := btSalvar.ClientToScreen(Point(0, btSalvar.Height));
  pmSalvar.Popup(p.X, p.Y);
end;

procedure TFIntComAjustaCarga.btSalvarPedEscClick(Sender: TObject);
begin
  if edcdPedido.ERPValorValido then
  begin
    vtPedidosEscolhidos.Append;
    vtPedidosEscolhidos.FieldByName('cdPedido').AsString := edcdPedido.ERPEdCampoChaveText;

    try
      DmIntegracao.fdConnInteg.Connected := True;

      DmIntegracao.qyPedido.MacroByName('filtro').Value := ' WHERE nuPedido = ' + edcdPedido.ERPEdCampoChaveText;
      DmIntegracao.qyPedido.Open;

      if DmIntegracao.qyPedido.IsEmpty then
        Aviso('Pedido inválido.')
      else
      begin
        vtPedidosEscolhidos.FieldByName('tpPedido').AsString      := DmIntegracao.qyPedido.FieldByName('tpPedido').AsString;
        vtPedidosEscolhidos.FieldByName('dtEmissao').AsDateTime   := DmIntegracao.qyPedido.FieldByName('dtEmissao').AsDateTime;
        vtPedidosEscolhidos.FieldByName('flStatusPed').AsString   := DmIntegracao.qyPedido.FieldByName('status_pedido').AsString;
        vtPedidosEscolhidos.FieldByName('cdCliente').AsInteger    := DmIntegracao.qyPedido.FieldByName('codigo_cliente').AsInteger;
        vtPedidosEscolhidos.FieldByName('deRazaoSocial').AsString := DmIntegracao.qyPedido.FieldByName('deRazaoSocial').AsString;
        vtPedidosEscolhidos.FieldByName('deFantasia').AsString    := DmIntegracao.qyPedido.FieldByName('deFantasia').AsString;
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyPedido.Active then
      DmIntegracao.qyPedido.Close;

    DmIntegracao.fdConnInteg.Connected := False;

    vtPedidosEscolhidos.Post;
    edcdPedido.ERPEdCampoChaveText := '';
    edcdPedido.ERPEdCampoChaveSetFocus;
  end;
end;

procedure TFIntComAjustaCarga.FecharConexaoIntegracao;
begin
  if qyPedidoEmCarga.Active then
    qyPedidoEmCarga.Close;

  if DmIntegracao.qyPedido.Active then
    DmIntegracao.qyPedido.Close;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFIntComAjustaCarga.FormCreate(Sender: TObject);
begin
  btSalvar.Glyph.LoadFromResourceName(HInstance,    'IMGBTSALVAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');
  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');

  btSalvarPedEsc.Glyph.LoadFromResourceName(HInstance,  'IMGBTSALVAR_16X16');
  btExluirPedEsc.Glyph.LoadFromResourceName(HInstance,  'IMGBTEXCLUIR_16X16');

  vtPedidosEscolhidos.Open;
  vtPedidoEmCarga.Open;

  pmiPedidosEmCarga.Enabled := False;
end;

procedure TFIntComAjustaCarga.pmiDescricaoCargaClick(Sender: TObject);
var
  sDescCarga : String;
  stDados    : TStringList;
begin
  stDados := TStringList.Create;

  if StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0) = 0 then
    Aviso('Escolha uma carga antes de alterar a sua descrição.')
  else
  begin
    if Pergunta('Confirma a alteração da descrição da carga?') then
    begin
      sDescCarga := '';

      while Trim(sDescCarga) = '' do
        sDescCarga := InputBox('Informe a nova descrição da carga', sDescCarga, '');

      ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                          'UPDATE grupoPed SET observacao = ' + QuotedStr(UpperCase(sDescCarga)) +
                          ' WHERE codigo_grupoPed = ' + edcdCarga.ERPEdCampoChaveText
                         );

      ExecuteInstrucaoSql(DmERP.fdConnERP,
                          'UPDATE erp.intComCarga SET deCarga = ' + QuotedStr(UpperCase(sDescCarga)) +
                          ' WHERE cdCarga = ' + edcdCarga.ERPEdCampoChaveText
                         );



      Informacao('Descrição da carga alterada com sucesso.');
    end;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TFIntComAjustaCarga.pmiPedidosEmCargaClick(Sender: TObject);
var
  sSql,
  sListaPed : String;
  stDados   : TStringList;
begin
  stDados := TStringList.Create;

  if vtPedidoEmCarga.IsEmpty then
    Aviso('Não existem ajustes a serem feitos para os pedidos escolhidos na carga especificada.')
  else
  begin
    if Pergunta('Confirma a inclusão dos pedidos na carga selecionada?') then
    begin
      vtPedidosEscolhidos.DisableControls;

      try
        vtPedidosEscolhidos.First;
        sListaPed := '';

        while not vtPedidosEscolhidos.Eof do
        begin
          if Trim(sListaPed) = '' then
            sListaPed := vtPedidosEscolhidos.FieldByName('cdPedido').AsString
          else
            sListaPed := sListaPed + ', ' + vtPedidosEscolhidos.FieldByName('cdPedido').AsString;

          vtPedidosEscolhidos.Next;
        end;
      finally
        vtPedidosEscolhidos.EnableControls;
      end;

      sSql := qyPedidoEmCarga.SQL.Text;
      sSql := AnsiReplaceStr(sSql, ':cdCarga', edcdCarga.ERPEdCampoChaveText);
      sSql := AnsiReplaceStr(sSql, '&listaPed', sListaPed);
      sSql := 'INSERT INTO grupoPed (recnum, codigo_grupoPed, nro_pedido, codigo_transp, data_emissao, observacao, seq, ' +
              '                      flag_faturado, dt_embarque, hora_embarque, cubagem, peso_liquido, peso_bruto, ' +
              '                      cod_veiculo, cod_condutor)' + sSql;

      ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, sSql);

      ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                        'select max(recnum) as ultRec from grupoPed',
                        'ultRec',
                        stDados
                       );

      ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, 'alter table grupoPed alter column recnum restart with ' + IntToStr(StrToIntDef(stDados.Strings[0], 0) + 1));
      Informacao('Pedidos ' + sListaPed + ' inseridos na carga ' + edcdCarga.ERPEdCampoChaveText + ' com sucesso.');

      pmiPedidosEmCarga.Enabled := False;
    end;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

initialization
  RegisterClass(TFIntComAjustaCarga);

finalization
  UnRegisterClass(TFIntComAjustaCarga);

end.
