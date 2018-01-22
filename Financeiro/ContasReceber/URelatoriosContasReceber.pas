unit URelatoriosContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet;

type
  TFRelatoriosContasReceber = class(TForm)
    pcRelatorios: TPageControl;
    tsCobrancaContato: TTabSheet;
    sbRCC: TScrollBox;
    dbCobrancaContato: TfrxDBDataset;
    pnBotoes: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    relCobrancaContato: TfrxReport;
    sbRCCFiltros: TScrollBox;
    gbRCCFiltros: TGroupBox;
    lbRCCdtContato: TLabel;
    lbRCCdtContatoA: TLabel;
    lbRCCcdCliente: TLabel;
    lbRCCcdRepresentante: TLabel;
    lbRCCdtCadastro: TLabel;
    lbRCCdtCadastroA: TLabel;
    lbRCCdtRetornoA: TLabel;
    lbRCCdtRetorno: TLabel;
    lbRCCsgUfCli: TLabel;
    lbRCCnmCidadeCli: TLabel;
    lbRCCcdSituacao: TLabel;
    lbRCCnmContato: TLabel;
    edRCCdtContatoIni: TDateTimePicker;
    edRCCdtContatoFim: TDateTimePicker;
    edRCCdtCadastroIni: TDateTimePicker;
    edRCCdtCadastroFim: TDateTimePicker;
    edRCCdtRetornoFim: TDateTimePicker;
    edRCCdtRetornoIni: TDateTimePicker;
    edRCCcdCliente: TDBCampoCodigo;
    edRCCcdRepresentante: TDBCampoCodigo;
    cbRCCsgUfCli: TComboBox;
    edRCCnmCidadeCli: TEdit;
    cbRCCcdSituacao: TComboBox;
    edRCCnmContato: TEdit;
    lbRCCcdUsuarioCadContato: TLabel;
    edRCCcdUsuarioCadContato: TDBCampoCodigo;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    function relCobrancaContatoUserFunction(const MethodName: string;
      var Params: Variant): Variant;
  private
    procedure ImprimirRelCobrancaContato;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
    function UsuarioDataHoraImpressao : String;
  public
    { Public declarations }
  end;

var
  FRelatoriosContasReceber: TFRelatoriosContasReceber;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFRelatoriosContasReceber.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

procedure TFRelatoriosContasReceber.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
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

function TFRelatoriosContasReceber.relCobrancaContatoUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

procedure TFRelatoriosContasReceber.btImprimirClick(Sender: TObject);
begin
  if pcRelatorios.ActivePage = tsCobrancaContato then
    ImprimirRelCobrancaContato;
end;

procedure TFRelatoriosContasReceber.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFRelatoriosContasReceber.ImprimirRelCobrancaContato;
var
  sWhere : String;
  i      : Integer;
begin
  if DmERP.qyCobrancaContatoRel.Active then
    DmERP.qyCobrancaContatoRel.Close;

  sWhere := '';

  if (edRCCdtCadastroIni.Checked) and
     (edRCCdtCadastroFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRCCdtCadastroIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRCCdtCadastroFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtCadCobranca BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRCCdtCadastroIni.DateTime)) +
                    '                   AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRCCdtCadastroFim.DateTime))
                   );

  if (cbRCCcdSituacao.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' cdSituacao = ' + IntToStr(cbRCCcdSituacao.ItemIndex));

  if (StrToIntDef(edRCCcdCliente.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdCliente = ' + edRCCcdCliente.ERPEdCampoChaveText);

  if (StrToIntDef(edRCCcdRepresentante.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdRepresentante = ' + edRCCcdRepresentante.ERPEdCampoChaveText);

  if (Trim(edRCCnmCidadeCli.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmCidade) LIKE ' + QuotedStr('%' + LowerCase(edRCCnmCidadeCli.Text) + '%'));

  if (cbRCCsgUfCli.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' UPPER(sgEstado) LIKE ' + QuotedStr('%' + UpperCase(cbRCCsgUfCli.Text) + '%'));

  if (edRCCdtContatoIni.Checked) and
     (edRCCdtContatoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRCCdtContatoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRCCdtContatoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtContato BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRCCdtContatoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRCCdtContatoFim.DateTime))
                   );

  if (edRCCdtRetornoIni.Checked) and
     (edRCCdtRetornoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRCCdtRetornoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRCCdtRetornoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtRetorno BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRCCdtRetornoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRCCdtRetornoFim.DateTime))
                   );

  if (Trim(edRCCnmContato.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmContato) LIKE ' + QuotedStr('%' + LowerCase(edRCCnmContato.Text) + '%'));

  if edRCCcdUsuarioCadContato.ERPValorValido then
    AdicionaCondSql(sWhere, ' cdUsuCadContato = ' + edRCCcdUsuarioCadContato.ERPEdCampoChaveText);

  if Trim(sWhere) <> '' then
    DmERP.qyCobrancaContatoRel.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyCobrancaContatoRel.Open();

  if DmERP.qyCobrancaContatoRel.IsEmpty then
    Aviso('Não existem contatos de cobranças cadastrados com os filtros informados.')
  else
  begin
    relCobrancaContato.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relCobrancaContato.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relCobrancaContato.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relCobrancaContato.ShowReport();
  end;
end;

procedure TFRelatoriosContasReceber.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  relCobrancaContato.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');

  btImprimir.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,   'IMGBTFECHAR_32X32');

  dtAtual                     := DataHoraAtual(DmERP.fdConnERP);
  edRCCdtCadastroIni.DateTime := dtAtual;
  edRCCdtCadastroFim.DateTime := dtAtual;
  edRCCdtContatoIni.DateTime  := dtAtual;
  edRCCdtContatoFim.DateTime  := dtAtual;
  edRCCdtRetornoIni.DateTime  := dtAtual;
  edRCCdtRetornoFim.DateTime  := dtAtual;
  edRCCdtCadastroIni.Checked  := False;
  edRCCdtCadastroFim.Checked  := False;
  edRCCdtContatoIni.Checked   := False;
  edRCCdtContatoFim.Checked   := False;
  edRCCdtRetornoIni.Checked   := False;
  edRCCdtRetornoFim.Checked   := False;

  pcRelatorios.ActivePage     := tsCobrancaContato;
end;

end.
