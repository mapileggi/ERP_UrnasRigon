unit UIntFinRelatoriosFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet, frxCross, FireDAC.Stan.Error;

type
  TFIntFinRelatoriosFinanceiro = class(TForm)
    pcRelatorios: TPageControl;
    tsPendenciaRep: TTabSheet;
    sbRPR: TScrollBox;
    pnBotoes: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    dbPendRepRel: TfrxDBDataset;
    relPendRep: TfrxReport;
    gbRPRFiltros: TGroupBox;
    lbRPRcdRepresentante: TLabel;
    lbRPRdtDiaVcto: TLabel;
    edRPRcdRepresentante: TDBCampoCodigo;
    edRPRdtDiaVcto: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    function relPendRepUserFunction(const MethodName: string;
      var Params: Variant): Variant;
  private
    procedure ImprimirRelPendRep;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
    function UsuarioDataHoraImpressao : String;
    function EhUsuarioEscritorio : Boolean;
  public
    { Public declarations }
  end;

var
  FIntFinRelatoriosFinanceiro: TFIntFinRelatoriosFinanceiro;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFIntFinRelatoriosFinanceiro.EhUsuarioEscritorio : Boolean;
begin
  Result := FTelaInicial.FcdSetorUsuario = 1;
end;

function TFIntFinRelatoriosFinanceiro.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

procedure TFIntFinRelatoriosFinanceiro.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
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

function TFIntFinRelatoriosFinanceiro.relPendRepUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

procedure TFIntFinRelatoriosFinanceiro.btImprimirClick(Sender: TObject);
begin
  if pcRelatorios.ActivePage = tsPendenciaRep then
    ImprimirRelPendRep;
end;

procedure TFIntFinRelatoriosFinanceiro.btFecharClick(Sender: TObject);
begin
  DmIntegracao.fdConnInteg.Connected := False;
  Self.Close;
end;

procedure TFIntFinRelatoriosFinanceiro.ImprimirRelPendRep;
var
  sWhere : String;
begin
  if DmIntegracao.qyTitulo.Active then
    DmIntegracao.qyTitulo.Close;

  DmIntegracao.qyTitulo.MacroByName('filtro').Clear;

  sWhere := '';

  AdicionaCondSql(sWhere, ' d.flSituacao NOT IN(''P'', ''C'')');

  if (FormatDateTime('dd/mm/yyyy', edRPRdtDiaVcto.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtVencto < ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRPRdtDiaVcto.DateTime))
                   );

  if (Trim(edRPRcdRepresentante.ERPEdCampoChaveText) <> '') and (edRPRcdRepresentante.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdRepresentante = ' + edRPRcdRepresentante.ERPEdCampoChaveText);

  if Trim(sWhere) <> '' then
    sWhere := ' WHERE ' + sWhere;

  DmIntegracao.qyTitulo.MacroByName('filtro').Value := sWhere +
                                                       '  ORDER BY d.cdRepresentante, d.nmCidadeCli, d.nmFantasiaCli, d.dtVencto ';

  DmIntegracao.qyTitulo.ParamByName('dtDiaVcto').AsDateTime := edRPRdtDiaVcto.DateTime;
  DmIntegracao.qyTitulo.Open();

  if DmIntegracao.qyTitulo.IsEmpty then
    Aviso('Não existem pendências de representantes com os filtros informados.')
  else
  begin
    relPendRep.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relPendRep.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relPendRep.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relPendRep.ShowReport();
  end;
end;

procedure TFIntFinRelatoriosFinanceiro.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  relPendRep.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');

  btImprimir.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,   'IMGBTFECHAR_32X32');

  pcRelatorios.ActivePage := tsPendenciaRep;

  dtAtual                  := DataHoraAtual(DmERP.fdConnERP);
  edRPRdtDiaVcto.DateTime  := dtAtual;

  DmIntegracao.fdConnInteg.Connected := True;
end;

end.
