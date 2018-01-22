unit URelatoriosDeptoPessoal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet, frxCross;

type
  TFRelatoriosDeptoPessoal = class(TForm)
    pcRelatorios: TPageControl;
    tsRegistroPonto: TTabSheet;
    sbRRP: TScrollBox;
    gbRRPFiltros: TGroupBox;
    lbRRPdtPonto: TLabel;
    lbRRPdtPontoA: TLabel;
    edRRPdtPontoIni: TDateTimePicker;
    edRRPdtPontoFim: TDateTimePicker;
    dbColabPonto: TfrxDBDataset;
    pnBotoes: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    relColabPonto: TfrxReport;
    lbRRPcdColaborador: TLabel;
    edRRPcdColaborador: TDBCampoCodigo;
    frxCrossObj: TfrxCrossObject;
    vtColabPonto: TVirtualTable;
    vtColabPontonmEmpresa: TStringField;
    vtColabPontodeCnpj: TStringField;
    vtColabPontonuInscEst: TStringField;
    vtColabPontocdColaborador: TIntegerField;
    vtColabPontonmColaborador: TStringField;
    vtColabPontocdCodigoFolha: TIntegerField;
    vtColabPontonuPis: TStringField;
    vtColabPontonuCtps: TStringField;
    vtColabPontodeCtpsSerie: TStringField;
    vtColabPontodtAdmissao: TDateField;
    vtColabPontodeCargo: TStringField;
    vtColabPontodeSetor: TStringField;
    vtColabPontodtPonto: TDateField;
    vtColabPontodeHoraPonto: TStringField;
    vtColabPontoflEntSai: TStringField;
    vtColabPontodeDiaSemana: TStringField;
    vtColabPontodeGrupoDia: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    function relColabPontoUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure FormShow(Sender: TObject);
  private
    procedure ImprimirRelColabPonto;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
    function TextoRodape : String;
    function UsuarioDataHoraImpressao : String;
  public
    { Public declarations }
  end;

var
  FRelatoriosDeptoPessoal: TFRelatoriosDeptoPessoal;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes, DateUtils;

{$R *.dfm}

function TFRelatoriosDeptoPessoal.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

function TFRelatoriosDeptoPessoal.TextoRodape : String;
var
  dtIni, dtFim : TDateTime;
begin
  if (edRRPdtPontoIni.Checked) and
     (edRRPdtPontoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRRPdtPontoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRRPdtPontoFim.Date) <> '30/12/1899') then
  begin
    dtIni := edRRPdtPontoIni.DateTime;
    dtFim := edRRPdtPontoFim.DateTime;
  end
  else
  begin
    dtIni := DataHoraAtual(DmERP.fdConnERP);
    dtIni := StrToDateTime('01/' + FormatDateTime('mm/yyyy', Trunc(dtIni)));
    dtFim := StrToDateTime(FormatFloat('00', DaysInMonth(dtIni)) + '/' + FormatDateTime('mm/yyyy', Trunc(dtIni)));
  end;

  Result := 'Reconheço a exatidão das horas constantes de acordo com minha frequência neste intervalo ' +
            FormatDateTime('dd/mm/yyyy', dtIni) + ' a ' + FormatDateTime('dd/mm/yyyy', dtFim) +
            '. Nos termos da Portaria MTB No. 3626 de 13/11/1991, artigo 13, o presente Cartão Ponto substitui ' +
            'o quadro de horário de Trabalho. Inclusive Ficha de Horário de Trabalho Externo.';
end;

procedure TFRelatoriosDeptoPessoal.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
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

function TFRelatoriosDeptoPessoal.relColabPontoUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;

  if SameText(MethodName, 'TextoRodape') then
    Result := TextoRodape;
end;

procedure TFRelatoriosDeptoPessoal.btImprimirClick(Sender: TObject);
begin
  if pcRelatorios.ActivePage = tsRegistroPonto then
    ImprimirRelColabPonto;
end;

procedure TFRelatoriosDeptoPessoal.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFRelatoriosDeptoPessoal.ImprimirRelColabPonto;
var
  sWhere : String;
  iContE,
  iContS : Integer;
  dtIni,
  dtFim  : TDateTime;

  procedure InserirRegistro(const dtDia : TDateTime; const sdeHoraPonto, sFlEntSai : String);
  begin
    vtColabPonto.Append;
    vtColabPonto.FieldByName('dtPonto').AsDateTime      := dtDia;
    vtColabPonto.FieldByName('deHoraPonto').AsString    := sdeHoraPonto;

    if sFlEntSai = 'E' then
    begin
      vtColabPonto.FieldByName('flEntSai').AsString     := IntToStr(iContE) + 'ª ' + sFlEntSai + 'nt';
      Inc(iContE);
    end
    else
    begin
      vtColabPonto.FieldByName('flEntSai').AsString     := IntToStr(iContS) + 'ª ' + sFlEntSai + 'ai';
      Inc(iContS);
    end;

    vtColabPonto.FieldByName('nmEmpresa').AsString      := DmERP.qyColabPontoRel.FieldByName('nmEmpresa').AsString;
    vtColabPonto.FieldByName('nuInscEst').AsString      := DmERP.qyColabPontoRel.FieldByName('deCnpj').AsString;
    vtColabPonto.FieldByName('deCnpj').AsString         := DmERP.qyColabPontoRel.FieldByName('nuInscEst').AsString;
    vtColabPonto.FieldByName('cdColaborador').AsInteger := StrToInt(edRRPcdColaborador.ERPEdCampoChaveText);
    vtColabPonto.FieldByName('nmColaborador').AsString  := DmERP.qyColabPontoRel.FieldByName('nmColaborador').AsString;
    vtColabPonto.FieldByName('cdCodigoFolha').AsInteger := DmERP.qyColabPontoRel.FieldByName('cdCodigoFolha').AsInteger;
    vtColabPonto.FieldByName('nuPis').AsString          := DmERP.qyColabPontoRel.FieldByName('nuPis').AsString;
    vtColabPonto.FieldByName('nuCtps').AsString         := DmERP.qyColabPontoRel.FieldByName('nuCtps').AsString;
    vtColabPonto.FieldByName('deCtpsSerie').AsString    := DmERP.qyColabPontoRel.FieldByName('deCtpsSerie').AsString;
    vtColabPonto.FieldByName('dtAdmissao').AsDateTime   := DmERP.qyColabPontoRel.FieldByName('dtAdmissao').AsDateTime;
    vtColabPonto.FieldByName('deCargo').AsString        := DmERP.qyColabPontoRel.FieldByName('deCargo').AsString;
    vtColabPonto.FieldByName('deSetor').AsString        := DmERP.qyColabPontoRel.FieldByName('deSetor').AsString;
    vtColabPonto.FieldByName('deDiaSemana').AsString    := Copy(DiaSemanaExtenso(dtDia), 1, 3);
    vtColabPonto.FieldByName('deGrupoDia').AsString     := vtColabPonto.FieldByName('dtPonto').AsString +
                                                           ' - ' + vtColabPonto.FieldByName('deDiaSemana').AsString;
    vtColabPonto.Post;
  end;
begin
  if not vtColabPonto.Active then
    vtColabPonto.Open;

  vtColabPonto.Clear;

  if DmERP.qyColabPontoRel.Active then
    DmERP.qyColabPontoRel.Close;

  sWhere := '';

  if (edRRPdtPontoIni.Checked) and
     (edRRPdtPontoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRRPdtPontoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRRPdtPontoFim.Date) <> '30/12/1899') then
  begin
    dtIni := edRRPdtPontoIni.DateTime;
    dtFim := edRRPdtPontoFim.DateTime;
  end
  else
  begin
    dtIni := DataHoraAtual(DmERP.fdConnERP);
    dtIni := StrToDateTime('01/' + FormatDateTime('mm/yyyy', Trunc(dtIni)));
    dtFim := StrToDateTime(FormatFloat('00', DaysInMonth(dtIni)) + '/' + FormatDateTime('mm/yyyy', Trunc(dtIni)));
  end;

  dtIni := Trunc(dtIni);
  dtFim := Trunc(dtFim);

  AdicionaCondSql(sWhere,
                  ' dtPonto BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtIni)) +
                  '             AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtFim))
                 );

  if (StrToIntDef(edRRPcdColaborador.ERPEdCampoChaveText, 0) > 0) then
    AdicionaCondSql(sWhere, ' cdColaborador = ' + edRRPcdColaborador.ERPEdCampoChaveText);

  if Trim(sWhere) <> '' then
    DmERP.qyColabPontoRel.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyColabPontoRel.Open();

  if DmERP.qyColabPontoRel.IsEmpty then
    Aviso('Não existem registros de ponto com os filtros informados.')
  else
  begin
    iContE := 1;
    iContS := 1;

    DmERP.qyColabPontoRel.First;

    while dtIni <= dtFim do
    begin
      if dtIni = DmERP.qyColabPontoRel.FieldByName('dtPonto').AsDateTime then
      begin
        InserirRegistro(DmERP.qyColabPontoRel.FieldByName('dtPonto').AsDateTime,
                        DmERP.qyColabPontoRel.FieldByName('deHoraPonto').AsString,
                        DmERP.qyColabPontoRel.FieldByName('flEntSai').AsString
                       );

        DmERP.qyColabPontoRel.Next;

        if (dtIni <> DmERP.qyColabPontoRel.FieldByName('dtPonto').AsDateTime) or (DmERP.qyColabPontoRel.Eof) then
        begin
          dtIni  := IncDay(dtIni);
          iContE := 1;
          iContS := 1;
        end;
      end
      else
      begin
        iContE := 1;
        iContS := 1;
        InserirRegistro(dtIni, '', 'E');
        InserirRegistro(dtIni, '', 'S');
        dtIni  := IncDay(dtIni);
        iContE := 1;
        iContS := 1;
      end;
    end;

    if not vtColabPonto.IsEmpty then
    begin
      relColabPonto.PrepareReport();

      if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relColabPonto.FindComponent('picLogoEmp') <> nil)) then
        TfrxPictureView(relColabPonto.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

      relColabPonto.ShowReport();
    end;
  end;
end;

procedure TFRelatoriosDeptoPessoal.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  relColabPonto.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relColabPonto.AddFunction('function TextoRodape : String', 'Sistema');

  btImprimir.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,   'IMGBTFECHAR_32X32');

  dtAtual                  := DataHoraAtual(DmERP.fdConnERP);
  edRRPdtPontoIni.DateTime := dtAtual;
  edRRPdtPontoFim.DateTime := dtAtual;

  edRRPdtPontoIni.Checked  := False;
  edRRPdtPontoFim.Checked  := False;

  pcRelatorios.ActivePage  := tsRegistroPonto;
end;

procedure TFRelatoriosDeptoPessoal.FormShow(Sender: TObject);
begin
  edRRPcdColaborador.ERPEdCampoChaveText := IntToStr(FTelaInicial.FcdColaborador);
  edRRPcdColaborador.ValidaCampoChave(IntToStr(FTelaInicial.FcdColaborador));

  edRRPcdColaborador.ERPEdCampoChaveEnabled := (FTelaInicial.FcdUsuario in[1, 10, 16]);
  edRRPcdColaborador.ERPBtProcurarEnabled   := edRRPcdColaborador.ERPEdCampoChaveEnabled;
end;

end.
