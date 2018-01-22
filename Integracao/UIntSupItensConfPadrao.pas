unit UIntSupItensConfPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Error,
  MemDS, VirtualTable, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus,
  frxClass, frxDBSet, frxExportXLS;

type
  TFIntSupItensConfPadrao = class(TForm)
    dsIntSupItensCfgPad: TDataSource;
    vtTipoAlca: TVirtualTable;
    vtAdorno: TVirtualTable;
    vtChaveta: TVirtualTable;
    vtForracao: TVirtualTable;
    vtTipoAlcacdRecNum: TIntegerField;
    vtTipoAlcacdVarItem: TIntegerField;
    vtTipoAlcadeVarItem: TStringField;
    vtAdornocdRecNum: TIntegerField;
    vtAdornocdVarItem: TIntegerField;
    vtAdornodeVarItem: TStringField;
    vtChavetacdRecNum: TIntegerField;
    vtChavetacdVarItem: TIntegerField;
    vtChavetadeVarItem: TStringField;
    vtForracaocdRecNum: TIntegerField;
    vtForracaocdVarItem: TIntegerField;
    vtForracaodeVarItem: TStringField;
    sbCampos: TScrollBox;
    btProcurar: TBitBtn;
    btSalvar: TBitBtn;
    btFechar: TBitBtn;
    sbDados: TScrollBox;
    grDados: TDBGrid;
    lbcdItem: TLabel;
    edcdItem: TEdit;
    btImprimir: TBitBtn;
    dbRelConfPadrao: TfrxDBDataset;
    relConfPadrao: TfrxReport;
    vtTipoAlcacdSeq: TIntegerField;
    vtAdornocdSeq: TIntegerField;
    vtChavetacdSeq: TIntegerField;
    vtForracaocdSeq: TIntegerField;
    sdDadosExcel: TSaveDialog;
    pmExportarExcel: TPopupMenu;
    pmiExportarExcel: TMenuItem;
    btConsultar: TBitBtn;
    cbSomenteItensAtivos: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure edcdItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btImprimirClick(Sender: TObject);
    function relConfPadraoUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure grDadosCellClick(Column: TColumn);
    procedure grDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pmiExportarExcelClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
  private
    procedure CarregarItensVariaveis;
    procedure CarregarItensConf;
    procedure CarregarValoresColuna(const qyInfo : TVirtualTable; const iColumnIndex : Integer);
    function UsuarioDataHoraImpressao : String;
    procedure ExportarDadosExcel;
  public
    { Public declarations }
  end;

var
  FIntSupItensConfPadrao: TFIntSupItensConfPadrao;

implementation

uses
  uFuncoes, UTelaInicial, uDmERP, uDmIntegracao;

{$R *.dfm}
{$R Icones.res}

function TFIntSupItensConfPadrao.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

procedure TFIntSupItensConfPadrao.CarregarValoresColuna(const qyInfo : TVirtualTable; const iColumnIndex : Integer);
begin
  grDados.Columns.Items[iColumnIndex].PickList.Clear;
  qyInfo.Open;
  qyInfo.First;

  while not qyInfo.Eof do
  begin
    grDados.Columns.Items[iColumnIndex].PickList.Add(qyInfo.FieldByName('deVarItem').AsString);
    qyInfo.Next;
  end;
end;

procedure TFIntSupItensConfPadrao.edcdItemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btProcurar.Click;
end;

procedure TFIntSupItensConfPadrao.CarregarItensVariaveis;
  procedure GravaVTItensVar(vtDados : TVirtualTable);
  begin
    vtDados.Insert;
    vtDados.FieldByName('cdRecNum').AsInteger  := DmIntegracao.qyItensVarItens.FieldByName('recNum').AsInteger;
    vtDados.FieldByName('cdVarItem').AsInteger := DmIntegracao.qyItensVarItens.FieldByName('mascara').AsInteger;
    vtDados.FieldByName('deVarItem').AsString  := DmIntegracao.qyItensVarItens.FieldByName('valor').AsString;
    vtDados.FieldByName('cdSeq').AsInteger     := DmIntegracao.qyItensVarItens.FieldByName('seq').AsInteger;
    vtDados.Post;
  end;
begin
  if not vtTipoAlca.Active then
    vtTipoAlca.Open;

  if not vtAdorno.Active then
    vtAdorno.Open;

  if not vtChaveta.Active then
    vtChaveta.Open;

  if not vtForracao.Active then
    vtForracao.Open;

  vtTipoAlca.Clear;
  vtAdorno.Clear;
  vtChaveta.Clear;
  vtForracao.Clear;

  DmIntegracao.qyItensVarItens.Open();
  DmIntegracao.qyItensVarItens.First;

  while not DmIntegracao.qyItensVarItens.Eof do
  begin
    if DmIntegracao.qyItensVarItens.FieldByName('codigo_variavel').AsInteger = 15 then
      GravaVTItensVar(vtTipoAlca)
    else if DmIntegracao.qyItensVarItens.FieldByName('codigo_variavel').AsInteger = 19 then
      GravaVTItensVar(vtAdorno)
    else if DmIntegracao.qyItensVarItens.FieldByName('codigo_variavel').AsInteger = 20 then
      GravaVTItensVar(vtChaveta)
    else if DmIntegracao.qyItensVarItens.FieldByName('codigo_variavel').AsInteger = 25 then
      GravaVTItensVar(vtForracao);

    DmIntegracao.qyItensVarItens.Next;
  end;

  if DmIntegracao.qyItensVarItens.Active then
    DmIntegracao.qyItensVarItens.Close;
end;

procedure TFIntSupItensConfPadrao.btImprimirClick(Sender: TObject);
begin
  try
    dsIntSupItensCfgPad.DataSet.DisableControls;

    relConfPadrao.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relConfPadrao.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relConfPadrao.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relConfPadrao.ShowReport();
  finally
    dsIntSupItensCfgPad.DataSet.EnableControls;
  end;
end;

procedure TFIntSupItensConfPadrao.ExportarDadosExcel;
var
  stDados : TStringList;
  sLinha  : String;

  procedure AdicionaInfo(const sValor : String);
  begin
    if Trim(sLinha) = '' then
      sLinha := sValor
    else
      sLinha := sLinha + ';' + sValor;
  end;
begin
  stDados := TStringList.Create;

  try
    DmERP.qyIntSupItensCfgPad.DisableControls;
    DmERP.qyIntSupItensCfgPad.First;

    while not DmERP.qyIntSupItensCfgPad.Eof do
    begin
      sLinha := '';
      AdicionaInfo(DmERP.qyIntSupItensCfgPad.FieldByName('cdItem').AsString);
      AdicionaInfo(DmERP.qyIntSupItensCfgPad.FieldByName('deTipoAlca').AsString);
      AdicionaInfo(DmERP.qyIntSupItensCfgPad.FieldByName('deAdorno').AsString);
      AdicionaInfo(DmERP.qyIntSupItensCfgPad.FieldByName('deChaveta').AsString);
      AdicionaInfo(DmERP.qyIntSupItensCfgPad.FieldByName('deForracao').AsString);

      stDados.Add(sLinha);

      DmERP.qyIntSupItensCfgPad.Next;
    end;

    DmERP.qyIntSupItensCfgPad.EnableControls;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if stDados.Count > 0 then
  begin
    stDados.Insert(0, 'Item;Tipo Alça;Adorno;Chaveta;Forração');

    sdDadosExcel.FileName := 'DadosItens.csv';

    if sdDadosExcel.Execute then
      stDados.SaveToFile(sdDadosExcel.FileName);
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TFIntSupItensConfPadrao.btProcurarClick(Sender: TObject);
begin
  if Trim(edcdItem.Text) = '' then
    Aviso('Informe um item para poder localizar.')
  else if DmERP.qyIntSupItensCfgPad.IsEmpty then
    Aviso('Não existe item para localizar.')
  else
  begin
    DmERP.qyIntSupItensCfgPad.First;
    DmERP.qyIntSupItensCfgPad.Locate('cdItem',
                                     VarArrayOf([Trim(edcdItem.Text)]),
                                     []
                                    );
  end;
end;

procedure TFIntSupItensConfPadrao.btSalvarClick(Sender: TObject);
begin
  if DmERP.qyIntSupItensCfgPad.State in dsEditModes then
    DmERP.qyIntSupItensCfgPad.Post;
end;

procedure TFIntSupItensConfPadrao.CarregarItensConf;
var
  sWhere : String;
begin
  try
    DmERP.qyIntSupItensCfgPad.DisableControls;

    try
      if DmERP.qyIntSupItensCfgPad.Active then
        DmERP.qyIntSupItensCfgPad.Close;

      DmERP.qyIntSupItensCfgPad.Open();
      DmIntegracao.fdConnInteg.Connected := True;

      CarregarItensVariaveis;
      DmIntegracao.qyItens.MacroByName('filtro').Clear;
      sWhere := ' WHERE item NOT LIKE ''KIT%'' ' +
                '   AND item NOT LIKE ''CZ.%'' ' +
                '   AND item NOT LIKE ''INVOLU%'' ' +
                '   AND tpItem = ''F'' ' +
                '   AND item NOT IN(''REFORMA'', ''SOBTAMP01'', ''ZINCO'', ' +
                '                   ''UOF'', ''ACESS'', ''CX.OSSOS'', ' +
                '                   ''SOBRETAM01'', ''CAV.ACR'', ''CAV.MDF'', ' +
                '                   ''SUP.CON'' ' +
                '                  ) '{ +
                '   AND flEhItemPad = ''S'' '};

      DmIntegracao.qyItens.MacroByName('filtro').Value := sWhere;
      DmIntegracao.qyItens.Open();
      CarregarValoresColuna(vtTipoAlca, 2);
      CarregarValoresColuna(vtAdorno,   3);
      CarregarValoresColuna(vtChaveta,  4);
      CarregarValoresColuna(vtForracao, 5);

      if not DmIntegracao.qyItens.IsEmpty then
      begin
        DmIntegracao.qyItens.First;

        while not DmIntegracao.qyItens.Eof do
        begin
          if not DmERP.qyIntSupItensCfgPad.Locate('cdItem',
                                                  VarArrayOf([Trim(DmIntegracao.qyItens.FieldByName('item').AsString)]),
                                                  []
                                                 ) then
          begin
            DmERP.qyIntSupItensCfgPad.Insert;
            DmERP.qyIntSupItensCfgPad.FieldByName('cdItem').AsString  := Trim(DmIntegracao.qyItens.FieldByName('item').AsString);
            DmERP.qyIntSupItensCfgPad.FieldByName('flAtivo').AsString := DmIntegracao.qyItens.FieldByName('flAtivo').AsString;
            DmERP.qyIntSupItensCfgPad.Post;
          end
          else if (DmERP.qyIntSupItensCfgPad.FieldByName('cdItem').AsString <> '') then
          begin
            DmERP.qyIntSupItensCfgPad.Edit;
            DmERP.qyIntSupItensCfgPad.FieldByName('flAtivo').AsString := DmIntegracao.qyItens.FieldByName('flAtivo').AsString;
            DmERP.qyIntSupItensCfgPad.Post;
          end;

          DmIntegracao.qyItens.Next;
        end;
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyItens.Active then
      DmIntegracao.qyItens.Close;

    DmIntegracao.fdConnInteg.Connected := False;

    DmERP.qyIntSupItensCfgPad.First;
  finally
    DmERP.qyIntSupItensCfgPad.EnableControls;
  end;
end;

procedure TFIntSupItensConfPadrao.FormCreate(Sender: TObject);
begin
  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');
  btProcurar.Glyph.LoadFromResourceName(HInstance,  'IMGBTPROCURAR_32X32');
  btSalvar.Glyph.LoadFromResourceName(HInstance,    'IMGBTSALVAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');
  btImprimir.Glyph.LoadFromResourceName(HInstance,  'IMGBTIMPRIMIR_32X32');

  relConfPadrao.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
end;

procedure TFIntSupItensConfPadrao.FormShow(Sender: TObject);
begin
  CarregarItensConf;
end;

procedure TFIntSupItensConfPadrao.grDadosCellClick(Column: TColumn);
begin
  if SameText(Column.FieldName, 'cdItem') then
    pmExportarExcel.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y)
  else if SameText(Column.FieldName, 'flCobrarCor') then
  begin
    DmERP.qyIntSupItensCfgPad.Edit;

    if UpperCase(DmERP.qyIntSupItensCfgPad.FieldByName('flCobrarCor').AsString) = 'N' then
      DmERP.qyIntSupItensCfgPad.FieldByName('flCobrarCor').AsString := 'S'
    else
      DmERP.qyIntSupItensCfgPad.FieldByName('flCobrarCor').AsString := 'N';

    DmERP.qyIntSupItensCfgPad.Post;
  end;
end;

procedure TFIntSupItensConfPadrao.grDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap : TBitmap;
begin
  if SameText(Column.FieldName, 'flCobrarCor') then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(DmERP.qyIntSupItensCfgPad.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grDados.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end;
end;

procedure TFIntSupItensConfPadrao.pmiExportarExcelClick(Sender: TObject);
begin
  ExportarDadosExcel;
end;

function TFIntSupItensConfPadrao.relConfPadraoUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

procedure TFIntSupItensConfPadrao.btConsultarClick(Sender: TObject);
begin
  if DmERP.qyIntSupItensCfgPad.Active then
    DmERP.qyIntSupItensCfgPad.Close;

  DmERP.qyIntSupItensCfgPad.MacroByName('filtro').Clear;

  if cbSomenteItensAtivos.Checked then
    DmERP.qyIntSupItensCfgPad.MacroByName('filtro').Value := ' WHERE flAtivo = ''S'' ';

  DmERP.qyIntSupItensCfgPad.Open();
end;

procedure TFIntSupItensConfPadrao.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  if DmIntegracao.qyItensVarItens.Active then
    DmIntegracao.qyItensVarItens.Close;

  if DmIntegracao.qyItens.Active then
    DmIntegracao.qyItens.Close;

  DmIntegracao.fdConnInteg.Connected := False;

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

initialization
  RegisterClass(TFIntSupItensConfPadrao);

finalization
  UnRegisterClass(TFIntSupItensConfPadrao);

end.
