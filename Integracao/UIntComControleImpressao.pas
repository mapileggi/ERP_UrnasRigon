unit UIntComControleImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, FireDAC.Stan.Error,
  UDBCampoCodigo, MemDS, VirtualTable, Vcl.Menus;

type
  TFIntComControleImpressao = class(TForm)
    dsDados: TDataSource;
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    gbFiltros: TGroupBox;
    lbdtCadastro: TLabel;
    eddtCadastroIni: TDateTimePicker;
    lbdtCadastroA: TLabel;
    eddtCadastroFim: TDateTimePicker;
    btConsultar: TBitBtn;
    lbcdModeloRelatorio: TLabel;
    btFechar: TBitBtn;
    vtDados: TVirtualTable;
    vtDadosflSelecionado: TStringField;
    cbcdModeloRelatorio: TComboBox;
    btSalvar: TBitBtn;
    vtDadosnuPedido: TIntegerField;
    vtDadoscdUsuarioImpressao: TIntegerField;
    vtDadosnuTipoImpressao: TIntegerField;
    vtDadosnmCidade: TStringField;
    vtDadossgUf: TStringField;
    vtDadosdtCadastro: TDateTimeField;
    cbNaoMostrarJaEnv: TCheckBox;
    pmMarcarDesmarcar: TPopupMenu;
    pmiMarcarTodos: TMenuItem;
    pmiDesmarcarTodos: TMenuItem;
    vtDadosdehrCadastro: TStringField;
    btExluir: TBitBtn;
    lbnuPedido: TLabel;
    ednuPedidoIni: TEdit;
    ednuPedidoFim: TEdit;
    lbnuPedidoA: TLabel;
    lbcdCarga: TLabel;
    edcdCarga: TDBCampoCodigo;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure grDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grDadosCellClick(Column: TColumn);
    procedure vtDadosflSelecionadoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btSalvarClick(Sender: TObject);
    procedure pmiMarcarTodosClick(Sender: TObject);
    procedure pmiDesmarcarTodosClick(Sender: TObject);
    procedure grDadosTitleClick(Column: TColumn);
    procedure btExluirClick(Sender: TObject);
  private
    procedure AplicarFiltro;
    procedure MarcarDesmarcar(const sMarcarDesmarcar : String);
  public
    { Public declarations }
  end;

var
  FIntComControleImpressao: TFIntComControleImpressao;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes;

const
  FsIndexFieldNames = 'sgUf,nmCidade,nuPedido';

{$R *.dfm}

procedure TFIntComControleImpressao.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFIntComControleImpressao.btExluirClick(Sender: TObject);
var
  snuPedidos : String;
begin
  snuPedidos := '';

  try
    vtDados.DisableControls;

    vtDados.First;

    while not vtDados.Eof do
    begin
      if UpperCase(vtDados.FieldByName('flEnvProducao').AsString) = 'S' then
      begin
        if Trim(snuPedidos) = '' then
          snuPedidos := vtDados.FieldByName('nuPedido').AsString
        else
          snuPedidos := snuPedidos + ', ' + vtDados.FieldByName('nuPedido').AsString;
      end;


      vtDados.Next;
    end;
  finally
    vtDados.EnableControls;
  end;

  if Trim(snuPedidos) = '' then
    Aviso('Selecione ao menos um pedido para poder excluir.')
  else if Pergunta('Confirma a exclusão dos pedidos selecionados da lista de impressão?') then
  begin
    ExecuteInstrucaoSql(DmERP.fdConnERP,
                        'DELETE FROM erp.intComItemPedImpresso ' +
                        ' WHERE nuPedido IN(' + snuPedidos + ')'
                       );
    btConsultar.Click;
  end;
end;

procedure TFIntComControleImpressao.btFecharClick(Sender: TObject);
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

procedure TFIntComControleImpressao.btSalvarClick(Sender: TObject);
begin
  try
    vtDados.DisableControls;

    vtDados.First;

    while not vtDados.Eof do
    begin
      if DmERP.qyIntComItemPedImpresso.Active then
        DmERP.qyIntComItemPedImpresso.Close;

      DmERP.qyIntComItemPedImpresso.MacroByName('filtro').Value := ' WHERE cdUsuarioImpressao = ' + vtDados.FieldByName('cdUsuarioImpressao').AsString +
                                                                   '   AND nuTipoImpressao = ' + vtDados.FieldByName('nuTipoImpressao').AsString +
                                                                   '   AND nuPedido = ' + vtDados.FieldByName('nuPedido').AsString;

      DmERP.qyIntComItemPedImpresso.Open();

      DmERP.qyIntComItemPedImpresso.First;

      while not DmERP.qyIntComItemPedImpresso.Eof do
      begin
        DmERP.qyIntComItemPedImpresso.Edit;
        DmERP.qyIntComItemPedImpresso.FieldByName('flEnvProducao').AsString := vtDados.FieldByName('flEnvProducao').AsString;
        DmERP.qyIntComItemPedImpresso.Post;
        DmERP.qyIntComItemPedImpresso.Next;
      end;

      vtDados.Next;
    end;
  finally
    vtDados.EnableControls;
    Aviso('Pedidos marcados como enviados a produção.');
  end;
end;

procedure TFIntComControleImpressao.AplicarFiltro;
var
  sWhere,
  sPedidos   : String;
  stListaPed : TStringList;

  function PedidoJaEstaNaLista(const sNuPedido : String) : Boolean;
  var
    intP : Integer;
  begin
    Result := False;

    intP := 0;

    while intP < stListaPed.Count do
    begin
      if stListaPed.Strings[intP] = sNuPedido then
      begin
        Result := True;
        intP   := stListaPed.Count;
      end;

      Inc(intP);
    end;

    if not Result then
      stListaPed.Add(sNuPedido);
  end;

  procedure CarregarInfoPedido;
  begin
    try
      DmIntegracao.fdConnInteg.Connected := True;
      DmIntegracao.qyPedido.MacroByName('filtro').Value := ' WHERE nuPedido = ' + DmERP.qyIntComItemPedImpresso.FieldByName('nuPedido').AsString;
      DmIntegracao.qyPedido.Open;

      if not DmIntegracao.qyPedido.IsEmpty then
      begin
        vtDados.FieldByName('nmCidade').AsString := DmIntegracao.qyPedido.FieldByName('deCidade').AsString;
        vtDados.FieldByName('sgUf').AsString     := DmIntegracao.qyPedido.FieldByName('sgUf').AsString;
      end;

      if DmIntegracao.qyPedido.Active then
        DmIntegracao.qyPedido.Close;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    DmIntegracao.fdConnInteg.Connected := False;
  end;
begin
  vtDados.Clear;

  if (DmERP.qyIntComItemPedImpresso.Active) then
    DmERP.qyIntComItemPedImpresso.Close;

  sWhere := '';

  if (eddtCadastroIni.Checked) and
     (eddtCadastroFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtCadastroIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtCadastroFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtCadastro BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtCadastroIni.DateTime)) +
                    '                AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtCadastroFim.DateTime))
                   );

  if cbNaoMostrarJaEnv.Checked then
    AdicionaCondSql(sWhere, ' flEnvProducao = ''N'' ');

  AdicionaCondSql(sWhere, ' cdUsuarioImpressao = ' + IntToStr(FTelaInicial.FcdUsuario));
  AdicionaCondSql(sWhere, ' nuTipoImpressao = ' + IntToStr(cbcdModeloRelatorio.ItemIndex + 1));

  if (StrToIntDef(ednuPedidoIni.Text, 0) > 0) and (StrToIntDef(ednuPedidoFim.Text, 0) > 0) then
    AdicionaCondSql(sWhere, ' nuPedido BETWEEN ' + ednuPedidoIni.Text + ' AND ' + ednuPedidoFim.Text)
  else if (StrToIntDef(ednuPedidoIni.Text, 0) > 0) then
    AdicionaCondSql(sWhere, ' nuPedido = ' + ednuPedidoIni.Text);

  sPedidos := '';

  if (Trim(edcdCarga.ERPEdCampoChaveText) <> '') and (edcdCarga.ERPValorValido) then
  begin
    try
      DmIntegracao.fdConnInteg.Connected := True;

      DmIntegracao.qyCarga.MacroByName('filtro').Value := ' WHERE cdCarga = ' + Trim(edcdCarga.ERPEdCampoChaveText);
      DmIntegracao.qyCarga.Open;

      if not DmIntegracao.qyCarga.IsEmpty then
      begin
        DmIntegracao.qyCarga.First;

        while not DmIntegracao.qyCarga.Eof do
        begin
          if Trim(sPedidos) = '' then
            sPedidos := DmIntegracao.qyCarga.FieldByName('nuPedido').AsString
          else
            sPedidos := sPedidos + ',' + DmIntegracao.qyCarga.FieldByName('nuPedido').AsString;

          DmIntegracao.qyCarga.Next;
        end;
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
  end;

  if Trim(sPedidos) <> '' then
    AdicionaCondSql(sWhere, ' nuPedido IN(' + sPedidos + ')');

  if Trim(sWhere) <> '' then
    DmERP.qyIntComItemPedImpresso.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyIntComItemPedImpresso.Open();

  if DmERP.qyIntComItemPedImpresso.IsEmpty then
    Aviso('Não existem impressões registradas com os filtros informados.')
  else
  begin
    try
      stListaPed        := TStringList.Create;
      stListaPed.Sorted := True;

      vtDados.DisableControls;

      DmERP.qyIntComItemPedImpresso.First;

      while not DmERP.qyIntComItemPedImpresso.Eof do
      begin
        if not PedidoJaEstaNaLista(DmERP.qyIntComItemPedImpresso.FieldByName('nuPedido').AsString) then
        begin
          vtDados.Insert;

          vtDados.FieldByName('flEnvProducao').AsString       := DmERP.qyIntComItemPedImpresso.FieldByName('flEnvProducao').AsString;
          vtDados.FieldByName('nuPedido').AsInteger           := DmERP.qyIntComItemPedImpresso.FieldByName('nuPedido').AsInteger;
          vtDados.FieldByName('cdUsuarioImpressao').AsInteger := DmERP.qyIntComItemPedImpresso.FieldByName('cdUsuarioImpressao').AsInteger;
          vtDados.FieldByName('nuTipoImpressao').AsInteger    := DmERP.qyIntComItemPedImpresso.FieldByName('nuTipoImpressao').AsInteger;
          vtDados.FieldByName('dtCadastro').AsDateTime        := DmERP.qyIntComItemPedImpresso.FieldByName('dtCadastro').AsDateTime;
          vtDados.FieldByName('dehrCadastro').AsString        := DmERP.qyIntComItemPedImpresso.FieldByName('dehrCadastro').AsString;

          CarregarInfoPedido;

          vtDados.Post;
        end;

        DmERP.qyIntComItemPedImpresso.Next;
      end;
    finally
      vtDados.IndexFieldNames := FsIndexFieldNames;
      vtDados.First;
      vtDados.EnableControls;

      if Assigned(stListaPed) then
        FreeAndNil(stListaPed);
    end;
  end;
end;

procedure TFIntComControleImpressao.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');
  btSalvar.Glyph.LoadFromResourceName(HInstance,    'IMGBTSALVAR_32X32');
  btExluir.Glyph.LoadFromResourceName(HInstance,    'IMGBTEXCLUIR_32X32');

  dtAtual                  := DataHoraAtual(DmERP.fdConnERP);

  eddtCadastroIni.DateTime := dtAtual;
  eddtCadastroFim.DateTime := dtAtual;

  cbcdModeloRelatorio.ItemIndex := 0;

  vtDados.Open;
  vtDados.IndexFieldNames := FsIndexFieldNames;
end;

procedure TFIntComControleImpressao.MarcarDesmarcar(const sMarcarDesmarcar : String);
begin
  if (vtDados.Active) and (not vtDados.IsEmpty) then
  begin
    try
      vtDados.DisableControls;

      vtDados.First;

      while not vtDados.Eof do
      begin
        vtDados.Edit;
        vtDados.FieldByName('flEnvProducao').AsString := sMarcarDesmarcar;
        vtDados.Post;

        vtDados.Next;
      end;
    finally
      vtDados.First;
      vtDados.EnableControls;
    end;
  end;
end;

procedure TFIntComControleImpressao.grDadosCellClick(Column: TColumn);
begin
  if SameText(Column.FieldName, 'flEnvProducao') then
  begin
    vtDados.Edit;

    if UpperCase(vtDados.FieldByName('flEnvProducao').AsString) = 'N' then
      vtDados.FieldByName('flEnvProducao').AsString := 'S'
    else
      vtDados.FieldByName('flEnvProducao').AsString := 'N';

    vtDados.Post;
  end;
end;

procedure TFIntComControleImpressao.grDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap : TBitmap;
begin
  if SameText(Column.FieldName, 'flEnvProducao') then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(vtDados.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grDados.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end;
end;

procedure TFIntComControleImpressao.grDadosTitleClick(Column: TColumn);
var
  i          : Integer;
  sIndexName : String;
begin
  for I := 0 to grDados.Columns.Count - 1 do
    grDados.Columns[i].Title.Font.Style := [];

  if SameText('sgUf,nmCidade,nuPedido', vtDados.IndexFieldNames) then
    vtDados.IndexFieldNames := 'nuPedido DESC';

  if vtDados.IndexFieldNames = Column.FieldName + ' ASC' then
    sIndexName := Column.FieldName + ' DESC'
  else
    sIndexName := Column.FieldName + ' ASC';

  vtDados.IndexFieldNames := sIndexName;

  Column.Title.Font.Style := [fsBold];
end;

procedure TFIntComControleImpressao.pmiDesmarcarTodosClick(Sender: TObject);
begin
  MarcarDesmarcar('N');
end;

procedure TFIntComControleImpressao.pmiMarcarTodosClick(Sender: TObject);
begin
  MarcarDesmarcar('S');
end;

procedure TFIntComControleImpressao.vtDadosflSelecionadoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flEnvProducao') then
    Text := '';
end;

initialization
  RegisterClass(TFIntComControleImpressao);

finalization
  UnRegisterClass(TFIntComControleImpressao);

end.
