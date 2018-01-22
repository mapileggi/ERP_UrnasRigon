unit URelatoriosContabilidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet;

type
  TFRelatoriosContabilidade = class(TForm)
    pcRelatorios: TPageControl;
    tsDocumentosBordero: TTabSheet;
    sbRDB: TScrollBox;
    relDocBordero: TfrxReport;
    dbDocBordero: TfrxDBDataset;
    pnBotoes: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    tsRelacaoDocumentos: TTabSheet;
    sbRRD: TScrollBox;
    dbRelacaoDoc: TfrxDBDataset;
    relRelacaoDoc: TfrxReport;
    vtObsRelacDoc: TVirtualTable;
    vtObsRelacDocdeObservacoes: TStringField;
    dbRelacDocObs: TfrxDBDataset;
    tsExtratoViagem: TTabSheet;
    sbREV: TScrollBox;
    dbExtratoViagem: TfrxDBDataset;
    relExtratoViagem: TfrxReport;
    gbRDBFiltros: TGroupBox;
    lbRDBdtEmissao: TLabel;
    lbRDBdtEmissaoA: TLabel;
    lbRDBnmFornecedor: TLabel;
    lbRDBdtCompetenciaA: TLabel;
    lbRDBdtCompetencia: TLabel;
    lbRDBcdBordero: TLabel;
    lbRDBcdMotorista: TLabel;
    lbRDBcdVeiculo: TLabel;
    lbRDBdtSaida: TLabel;
    lbRDBdtSaidaA: TLabel;
    lbRDBdtRetornoA: TLabel;
    lbRDBdtRetorno: TLabel;
    lbRDBcdDocumentoTipo: TLabel;
    lbRDBcdDespesaTipo: TLabel;
    lbRDBcdEmpresa: TLabel;
    edRDBdtEmissaoIni: TDateTimePicker;
    edRDBdtEmissaoFim: TDateTimePicker;
    edRDBnmFornecedor: TEdit;
    edRDBdtCompetenciaFim: TDateTimePicker;
    edRDBdtCompetenciaIni: TDateTimePicker;
    edRDBcdBordero: TDBCampoCodigo;
    edRDBcdMotorista: TDBCampoCodigo;
    edRDBcdVeiculo: TDBCampoCodigo;
    edRDBdtSaidaIni: TDateTimePicker;
    edRDBdtSaidaFim: TDateTimePicker;
    edRDBdtRetornoFim: TDateTimePicker;
    edRDBdtRetornoIni: TDateTimePicker;
    edRDBcdDocumentoTipo: TDBCampoCodigo;
    edRDBcdDespesaTipo: TDBCampoCodigo;
    edRDBcdEmpresa: TDBCampoCodigo;
    gbRRDFiltros: TGroupBox;
    lbRRDdtEmissao: TLabel;
    lbRRDdtEmissaoA: TLabel;
    lbRRDnmFornecedor: TLabel;
    lbRRDdtCompetencia: TLabel;
    lbRRDcdDocumentoTipo: TLabel;
    lbRRDcdDespesaTipo: TLabel;
    lbRRDcdEmpresa: TLabel;
    edRRDdtEmissaoIni: TDateTimePicker;
    edRRDdtEmissaoFim: TDateTimePicker;
    edRRDnmFornecedor: TEdit;
    edRRDdtCompetencia: TDateTimePicker;
    edRRDcdDocumentoTipo: TDBCampoCodigo;
    edRRDcdDespesaTipo: TDBCampoCodigo;
    edRRDcdEmpresa: TDBCampoCodigo;
    cbRRDflContabiliza: TCheckBox;
    gbREVFiltros: TGroupBox;
    lbREVcdBordero: TLabel;
    lbREVcdMotorista: TLabel;
    lbREVcdVeiculo: TLabel;
    lbREVdtSaida: TLabel;
    lbREVdtSaidaA: TLabel;
    lbREVdtRetornoA: TLabel;
    lbREVdtRetorno: TLabel;
    edREVcdBordero: TDBCampoCodigo;
    edREVcdMotorista: TDBCampoCodigo;
    edREVcdVeiculo: TDBCampoCodigo;
    edREVdtSaidaIni: TDateTimePicker;
    edREVdtSaidaFim: TDateTimePicker;
    edREVdtRetornoFim: TDateTimePicker;
    edREVdtRetornoIni: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    function relDocBorderoUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function relRelacaoDocUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function relExtratoViagemUserFunction(const MethodName: string;
      var Params: Variant): Variant;
  private
    procedure ImprimirRelDocBordero;
    procedure ImprimirRelRelacaoDoc;
    procedure CarregarObsRelacaoDoc;
    procedure ImprimirRelExtratoViagem;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
    function UsuarioDataHoraImpressao : String;
  public
    { Public declarations }
  end;

var
  FRelatoriosContabilidade: TFRelatoriosContabilidade;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFRelatoriosContabilidade.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

procedure TFRelatoriosContabilidade.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
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

function TFRelatoriosContabilidade.relDocBorderoUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFRelatoriosContabilidade.relExtratoViagemUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFRelatoriosContabilidade.relRelacaoDocUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

procedure TFRelatoriosContabilidade.btImprimirClick(Sender: TObject);
begin
  if pcRelatorios.ActivePage = tsDocumentosBordero then
    ImprimirRelDocBordero
  else if pcRelatorios.ActivePage = tsRelacaoDocumentos then
  begin
    if (not edRRDdtCompetencia.Checked) or
       (FormatDateTime('dd/mm/yyyy', edRRDdtCompetencia.Date) = '30/12/1899') then
      Aviso('Competência não informada.')
    else if (StrToIntDef(edRRDcdEmpresa.ERPEdCampoChaveText, 0) = 0) then
      Aviso('Empresa não informada.')
    else
      ImprimirRelRelacaoDoc;
  end
  else if pcRelatorios.ActivePage = tsExtratoViagem then
    ImprimirRelExtratoViagem;
end;

procedure TFRelatoriosContabilidade.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFRelatoriosContabilidade.ImprimirRelDocBordero;
var
  sWhere : String;
  i      : Integer;
begin
  if DmERP.qyBorderoRel.Active then
    DmERP.qyBorderoRel.Close;

  sWhere := '';

  if (StrToIntDef(edRDBcdBordero.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdBordero = ' + edRDBcdBordero.ERPEdCampoChaveText);

  if (StrToIntDef(edRDBcdMotorista.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdMotorista = ' + edRDBcdMotorista.ERPEdCampoChaveText);

  if (StrToIntDef(edRDBcdVeiculo.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdVeiculo = ' + edRDBcdVeiculo.ERPEdCampoChaveText);

  if (edRDBdtSaidaIni.Checked) and
     (edRDBdtSaidaFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRDBdtSaidaIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRDBdtSaidaFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtSaida BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRDBdtSaidaIni.DateTime)) +
                    '             AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRDBdtSaidaFim.DateTime))
                   );

  if (edRDBdtRetornoIni.Checked) and
     (edRDBdtRetornoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRDBdtRetornoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRDBdtRetornoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtRetorno BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRDBdtRetornoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRDBdtRetornoFim.DateTime))
                   );

  if (edRDBdtCompetenciaIni.Checked) and
     (edRDBdtCompetenciaFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRDBdtCompetenciaIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRDBdtCompetenciaFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' TO_CHAR(dtCompetencia, ''yyyy/mm'') BETWEEN ' + QuotedStr(FormatDateTime('yyyy/mm', edRDBdtCompetenciaIni.DateTime)) +
                    '                   AND ' + QuotedStr(FormatDateTime('yyyy/mm', edRDBdtCompetenciaFim.DateTime))
                   );

  if (edRDBdtEmissaoIni.Checked) and
     (edRDBdtEmissaoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRDBdtEmissaoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRDBdtEmissaoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtEmissao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRDBdtEmissaoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRDBdtEmissaoFim.DateTime))
                   );

  if (StrToIntDef(edRDBcdEmpresa.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdEmpresa = ' + edRDBcdEmpresa.ERPEdCampoChaveText);

  if (StrToIntDef(edRDBcdDocumentoTipo.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdDocumentoTipo = ' + edRDBcdDocumentoTipo.ERPEdCampoChaveText);

  if (StrToIntDef(edRDBcdDespesaTipo.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdDespesaTipo = ' + edRDBcdDespesaTipo.ERPEdCampoChaveText);

  if (Trim(edRDBnmFornecedor.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmFornecedor) LIKE ' + QuotedStr('%' + LowerCase(edRDBnmFornecedor.Text) + '%'));

  if Trim(sWhere) <> '' then
    DmERP.qyBorderoRel.MacroByName('filtro').Value := ' WHERE ' + sWhere +
                                                      ' ORDER BY t.cdBordero, t.cdDespesaTipo, t.dtEmissao'
  else
    DmERP.qyBorderoRel.MacroByName('filtro').Value := ' ORDER BY t.cdBordero, t.cdDespesaTipo, t.dtEmissao';

  DmERP.qyBorderoRel.Open();

  if DmERP.qyBorderoRel.IsEmpty then
    Aviso('Não existem documentos de borderos cadastrados com os filtros informados.')
  else
  begin
    relDocBordero.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relDocBordero.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relDocBordero.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relDocBordero.ShowReport();
  end;
end;

procedure TFRelatoriosContabilidade.ImprimirRelRelacaoDoc;
var
  sWhere : String;
  i      : Integer;
begin
  if DmERP.qyDocumentoRel.Active then
    DmERP.qyDocumentoRel.Close;

  sWhere := '';

  if (edRRDdtCompetencia.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRRDdtCompetencia.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' TO_CHAR(dtCompetencia, ''mm/yyyy'') = ' + QuotedStr(FormatDateTime('mm/yyyy', edRRDdtCompetencia.DateTime))
                   );

  if (edRRDdtEmissaoIni.Checked) and
     (edRRDdtEmissaoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRRDdtEmissaoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRRDdtEmissaoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtEmissao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRRDdtEmissaoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRRDdtEmissaoFim.DateTime))
                   );

  if (StrToIntDef(edRRDcdEmpresa.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdEmpresa = ' + edRRDcdEmpresa.ERPEdCampoChaveText);

  if (StrToIntDef(edRRDcdDocumentoTipo.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdDocumentoTipo = ' + edRRDcdDocumentoTipo.ERPEdCampoChaveText);

  if (StrToIntDef(edRRDcdDespesaTipo.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdDespesaTipo = ' + edRRDcdDespesaTipo.ERPEdCampoChaveText);

  if (Trim(edRRDnmFornecedor.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmFornecedor) LIKE ' + QuotedStr('%' + LowerCase(edRRDnmFornecedor.Text) + '%'));

  if (cbRRDflContabiliza.Checked) then
    AdicionaCondSql(sWhere, ' flContabiliza = ''S'' ');

  if Trim(sWhere) <> '' then
    DmERP.qyDocumentoRel.MacroByName('filtro').Value := ' WHERE ' + sWhere +
                                                        ' ORDER BY t.cdEmpresa, t.deComp, t.cdDocumentoTipo, t.dtEmissao, t.cdDocumento';

  DmERP.qyDocumentoRel.Open();

  if DmERP.qyDocumentoRel.IsEmpty then
    Aviso('Não existem documentos cadastrados com os filtros informados.')
  else
  begin
    CarregarObsRelacaoDoc;
    relRelacaoDoc.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relRelacaoDoc.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relRelacaoDoc.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relRelacaoDoc.ShowReport();
  end;
end;

procedure TFRelatoriosContabilidade.CarregarObsRelacaoDoc;
begin
  vtObsRelacDoc.Clear;

  try
    DmERP.qyDocumentoRel.DisableControls;
    DmERP.qyDocumentoRel.First;

    while not DmERP.qyDocumentoRel.Eof do
    begin
      if Trim(DmERP.qyDocumentoRel.FieldByName('deObservacoes').AsString) <> '' then
      begin
        vtObsRelacDoc.Insert;
        vtObsRelacDoc.FieldByName('deObservacoes').AsString := DmERP.qyDocumentoRel.FieldByName('deObservacoes').AsString;
        vtObsRelacDoc.Post;
      end;

      DmERP.qyDocumentoRel.Next;
    end;
  finally
    DmERP.qyDocumentoRel.EnableControls;
  end;
end;

procedure TFRelatoriosContabilidade.ImprimirRelExtratoViagem;
var
  sWhere : String;
  i      : Integer;
begin
  if DmERP.qyExtratoViagem.Active then
    DmERP.qyExtratoViagem.Close;

  sWhere := '';

  if (StrToIntDef(edREVcdBordero.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdBordero = ' + edREVcdBordero.ERPEdCampoChaveText);

  if (StrToIntDef(edREVcdMotorista.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdMotorista = ' + edREVcdMotorista.ERPEdCampoChaveText);

  if (StrToIntDef(edREVcdVeiculo.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdVeiculo = ' + edREVcdVeiculo.ERPEdCampoChaveText);

  if (edREVdtSaidaIni.Checked) and
     (edREVdtSaidaFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edREVdtSaidaIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edREVdtSaidaFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtSaida BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edREVdtSaidaIni.DateTime)) +
                    '             AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edREVdtSaidaFim.DateTime))
                   );

  if (edREVdtRetornoIni.Checked) and
     (edREVdtRetornoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edREVdtRetornoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edREVdtRetornoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtRetorno BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edREVdtRetornoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edREVdtRetornoFim.DateTime))
                   );

  if Trim(sWhere) <> '' then
    DmERP.qyExtratoViagem.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyExtratoViagem.Open();

  if DmERP.qyExtratoViagem.IsEmpty then
    Aviso('Não existem borderos de viagens cadastrados com os filtros informados.')
  else
  begin
    relExtratoViagem.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relExtratoViagem.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relExtratoViagem.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relExtratoViagem.ShowReport();
  end;
end;

procedure TFRelatoriosContabilidade.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  relDocBordero.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relRelacaoDoc.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relExtratoViagem.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');

  btImprimir.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,   'IMGBTFECHAR_32X32');

  dtAtual                        := DataHoraAtual(DmERP.fdConnERP);
  edRDBdtSaidaIni.DateTime       := dtAtual;
  edRDBdtSaidaFim.DateTime       := dtAtual;
  edRDBdtRetornoIni.DateTime     := dtAtual;
  edRDBdtRetornoFim.DateTime     := dtAtual;
  edRDBdtCompetenciaIni.DateTime := StrToDateTime('01/' + FormatDateTime('mm/yyyy', dtAtual));
  edRDBdtCompetenciaFim.DateTime := edRDBdtCompetenciaIni.DateTime;
  edRDBdtEmissaoIni.DateTime     := dtAtual;
  edRDBdtEmissaoFim.DateTime     := dtAtual;
  edRDBdtSaidaIni.Checked        := False;
  edRDBdtSaidaFim.Checked        := False;
  edRDBdtRetornoIni.Checked      := False;
  edRDBdtRetornoFim.Checked      := False;
  edRDBdtCompetenciaIni.Checked  := False;
  edRDBdtCompetenciaFim.Checked  := False;
  edRDBdtEmissaoIni.Checked      := False;
  edRDBdtEmissaoFim.Checked      := False;

  edRRDdtCompetencia.DateTime    := edRDBdtCompetenciaIni.DateTime;
  edRRDdtEmissaoIni.DateTime     := dtAtual;
  edRRDdtEmissaoFim.DateTime     := dtAtual;
  edRRDdtEmissaoIni.Checked      := False;
  edRRDdtEmissaoFim.Checked      := False;

  vtObsRelacDoc.Open;

  edREVdtSaidaIni.DateTime       := dtAtual;
  edREVdtSaidaFim.DateTime       := dtAtual;
  edREVdtRetornoIni.DateTime     := dtAtual;
  edREVdtRetornoFim.DateTime     := dtAtual;
  edREVdtSaidaIni.Checked        := False;
  edREVdtSaidaFim.Checked        := False;
  edREVdtRetornoIni.Checked      := False;
  edREVdtRetornoFim.Checked      := False;

  pcRelatorios.ActivePage        := tsDocumentosBordero;
end;

end.
