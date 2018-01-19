unit UUsuarioChat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet, frxCross, FireDAC.Stan.Error;

type
  TFUsuarioChat = class(TForm)
    pnBotoes: TPanel;
    btEnviar: TBitBtn;
    btFechar: TBitBtn;
    gbMensagensEntre: TGroupBox;
    lbdtMensagemA: TLabel;
    eddtMensagemIni: TDateTimePicker;
    eddtMensagemFim: TDateTimePicker;
    mMsg: TMemo;
    pnNomes: TPanel;
    lbUsuarios: TLabel;
    lbNome: TLabel;
    lbNomes: TListBox;
    lbHandles: TListBox;
    spChat: TSplitter;
    reChat: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure mMsgKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lbNomesClick(Sender: TObject);
  private
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
    procedure EnviarMensagens(const sMensagem : String);
    procedure MensagemLida;
    procedure CarregarMensagens(const bExibirMsg, bSomenteNaoLidas : Boolean);
    procedure FormatarLinhaData(const sLinhaData : String);
    function RetornaCodUsuario(const sdeLogin : String) : Integer;
  public
    FiUsuarioDestino : Integer;
  end;

var
  FUsuarioChat: TFUsuarioChat;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFUsuarioChat.RetornaCodUsuario(const sdeLogin : String) : Integer;
var
  stDados : TStringList;
begin
  Result  := 0;
  stDados := TStringList.Create;

  ExecuteSimplesSql(DmERP.fdConnERP,
                    'SELECT cdUsuario ' +
                    '  FROM erp.usuario ' +
                    ' WHERE LOWER(deLogin) = ' + QuotedStr(LowerCase(Trim(sdeLogin))),
                    'cdUsuario',
                    stDados
                   );

  if (stDados.Count > 0) and (StrTointDef(stDados.Strings[0], 0) > 0) then
    Result := StrTointDef(stDados.Strings[0], 0);
end;

procedure TFUsuarioChat.FormatarLinhaData(const sLinhaData : String);
begin
  //Como adicionar uma linha formatada (cor, negrito, etc) num RichEdit
  reChat.SelAttributes.Color := clBLue; // Cor Azul
  reChat.SelAttributes.Style := [fsBold]; // Negrito e sublinhado
  reChat.Paragraph.Alignment := taCenter;

  reChat.Lines.Add(sLinhaData);

  reChat.SelAttributes.Style := []; // Volta ao estilo normal
  reChat.SelAttributes.Color := clBlack; // Volta à cor normal
  reChat.Paragraph.Alignment := taLeftJustify;
end;

procedure TFUsuarioChat.EnviarMensagens(const sMensagem : String);
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  if DmERP.qyUsuarioChat.Active then
    DmERP.qyUsuarioChat.Close;

  DmERP.qyUsuarioChat.MacroByName('filtro').Clear;
  DmERP.qyUsuarioChat.MacroByName('filtro').Value := '   AND dtMensagem = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dthrAtual));

  DmERP.qyUsuarioChat.ParamByName('cdUsuario').AsInteger        := FTelaInicial.FcdUsuario;
  DmERP.qyUsuarioChat.ParamByName('cdUsuarioDestino').AsInteger := FiUsuarioDestino;

  DmERP.qyUsuarioChat.Open();

  DmERP.qyUsuarioChat.Insert;
  DmERP.qyUsuarioChat.FieldByName('cdUsuario').AsInteger        := FTelaInicial.FcdUsuario;
  DmERP.qyUsuarioChat.FieldByName('nmComputador').AsString      := RetornaNomeComputador;
  DmERP.qyUsuarioChat.FieldByName('deIp').AsString              := RetornaIpComputador;
  DmERP.qyUsuarioChat.FieldByName('dtMensagem').AsDateTime      := Trunc(dthrAtual);
  DmERP.qyUsuarioChat.FieldByName('hrMensagem').AsInteger       := HoraParaMinutos(dthrAtual);
  DmERP.qyUsuarioChat.FieldByName('cdUsuarioDestino').AsInteger := FiUsuarioDestino;
  DmERP.qyUsuarioChat.FieldByName('deMensagem').AsString        := sMensagem;
  DmERP.qyUsuarioChat.FieldByName('flMensagemLida').AsString    := 'N';

  DmERP.qyUsuarioChat.Post;

  DmERP.qyUsuarioChat.Close;
  DmERP.qyUsuarioChat.MacroByName('filtro').Clear;
end;

procedure TFUsuarioChat.MensagemLida;
begin
  ExecuteInstrucaoSql(DmERP.fdConnERP,
                      'UPDATE erp.usuarioChat ' +
                      '   SET flMensagemLida = ''S'' ' +
                      ' WHERE cdUsuario = ' + IntToStr(FiUsuarioDestino) +
                      '   AND cdusuarioDestino = ' + IntToStr(FTelaInicial.FcdUsuario)
                     );

end;

procedure TFUsuarioChat.CarregarMensagens(const bExibirMsg, bSomenteNaoLidas : Boolean);
var
  sWhere,
  snmUsuChat,
  sHoraLogin  : String;
  bExibirNome : Boolean;
  dtMsg       : TDateTime;
  iPos        : Integer;
  clCor       : TColor;
begin
//  if not bSomenteNaoLidas then
    reChat.Lines.Clear;

  if DmERP.qyUsuarioChat.Active then
    DmERP.qyUsuarioChat.Close;

  DmERP.qyUsuarioChat.MacroByName('filtro').Clear;

  sWhere := '';

//  if bSomenteNaoLidas then
//    AdicionaCondSql(sWhere, 'flmensagemLida = ''N'' ');

  if (FormatDateTime('dd/mm/yyyy', eddtMensagemIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtMensagemFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtMensagem BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtMensagemIni.DateTime)) +
                    '                AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtMensagemFim.DateTime))
                   );

  if Trim(sWhere) <> '' then
    DmERP.qyUsuarioChat.MacroByName('filtro').Value := ' AND ' + sWhere;

  DmERP.qyUsuarioChat.ParamByName('cdUsuario').AsInteger        := FTelaInicial.FcdUsuario;
  DmERP.qyUsuarioChat.ParamByName('cdUsuarioDestino').AsInteger := FiUsuarioDestino;

  DmERP.qyUsuarioChat.Open();

  if (DmERP.qyUsuarioChat.IsEmpty) and (bExibirMsg) then
    Aviso('Não existem mensagens no intervalo de datas informado.')
  else
  begin
    try
      DmERP.qyUsuarioChat.DisableControls;
      DmERP.qyUsuarioChat.First;
      snmUsuChat := '';
      dtMsg      := 0;

      while not DmERP.qyUsuarioChat.Eof do
      begin
        if (Trim(snmUsuChat) = '') then
          bExibirNome := True;

        if DmERP.qyUsuarioChat.FieldByName('cdUsuario').AsInteger = FTelaInicial.FcdUsuario then
        begin
          if (not bExibirNome) and
             (not SameText(snmUsuChat, DmERP.qyUsuarioChat.FieldByName('deLoginOri').AsString)) then
            bExibirNome := True;

          snmUsuChat := DmERP.qyUsuarioChat.FieldByName('deLoginOri').AsString;
          clCor      := clNavy;
        end
        else
        begin
          if (not bExibirNome) and
             (not SameText(snmUsuChat, DmERP.qyUsuarioChat.FieldByName('deLoginDest').AsString)) then
            bExibirNome := True;

          snmUsuChat := DmERP.qyUsuarioChat.FieldByName('deLoginDest').AsString;
          clCor      := clTeal;
        end;
                {
        if bExibirNome then
        begin
          if Trim(mChat.Lines.Text) <> '' then
            mChat.Lines.Add('');

          mChat.Lines.Add(snmUsuChat);
          mChat.Lines.Add('');
        end;         }

        bExibirNome := False;

        if dtMsg <> DmERP.qyUsuarioChat.FieldByName('dtMensagem').AsDateTime then
        begin
          FormatarLinhaData(DmERP.qyUsuarioChat.FieldByName('dtMensagem').AsString + ' - ' +
                            DiaSemanaExtenso(DmERP.qyUsuarioChat.FieldByName('dtMensagem').AsDateTime)
                           );
          dtMsg := DmERP.qyUsuarioChat.FieldByName('dtMensagem').AsDateTime;
        end;

        sHoraLogin := '(' + DmERP.qyUsuarioChat.FieldByName('deHrMensagem').AsString + ') ' +
                      UpperCase(Copy(snmUsuChat, 1, 1)) + LowerCase(Copy(snmUsuChat, 2, Length(snmUsuChat)-1)) + ': ';

        reChat.Lines.Add(sHoraLogin + DmERP.qyUsuarioChat.FieldByName('deMensagem').AsString);

{
        reChat.SelStart  := 0;
        reChat.SelLength := Length(reChat.Text);

        iPos := reChat.FindText(sHoraLogin, 0, Length(reChat.Text), []);

        //Verifica se o texto foi encontrado
        if iPos >= 0 then
        begin
          reChat.SelStart            := iPos;
          reChat.SelLength           := Length(sHoraLogin);
          reChat.SelAttributes.Color := clCor;
          reChat.SelAttributes.Style := [fsBold];
        end;
}
        DmERP.qyUsuarioChat.Next;
      end;
    finally
      DmERP.qyUsuarioChat.EnableControls;
    end;
  end;
end;

procedure TFUsuarioChat.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
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

procedure TFUsuarioChat.btEnviarClick(Sender: TObject);
var
  dthrAtual : TDateTime;
  sMsg,
  sData     : String;
begin
  if FiUsuarioDestino <= 0 then
    Aviso('Escolha um nome na lista ao lado antes de enviar.')
  else
  begin
    if (lbNomes.Count > 0) and (lbNomes.ItemIndex > -1) then
    begin
      EnviarMensagens(mMsg.Text);

      dthrAtual := DataHoraAtual(DmERP.fdConnERP);
      sData     := FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + DiaSemanaExtenso(dthrAtual);

      if Pos(sData, reChat.Text) = 0 then
        FormatarLinhaData(sData);

      sMsg := '(' + FormatDateTime('hh:nn', dthrAtual) + ') ' +
               UpperCase(Copy(FTelaInicial.FdeLogin, 1, 1)) +
               LowerCase(Copy(FTelaInicial.FdeLogin, 2, Length(FTelaInicial.FdeLogin) - 1)) + ': ' + mMsg.Text;

      reChat.Lines.Add(sMsg);
      FTelaInicial.skClient.Socket.SendText('>' + lbHandles.Items[lbNomes.ItemIndex] + '/hwd' +
                                            sMsg
                                           );

      mMsg.Clear;
      mMsg.SetFocus;
    end;
  end;
end;

procedure TFUsuarioChat.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFUsuarioChat.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  btEnviar.Glyph.LoadFromResourceName(HInstance,    'IMGBTENVIAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');

  dtAtual                  := DataHoraAtual(DmERP.fdConnERP);
  eddtMensagemIni.DateTime := dtAtual - 2;
  eddtMensagemFim.DateTime := dtAtual;
end;

procedure TFUsuarioChat.FormShow(Sender: TObject);
begin
  if (mMsg.Visible) and (mMsg.Enabled) and (mMsg.CanFocus) then
    mMsg.SetFocus;
end;

procedure TFUsuarioChat.lbNomesClick(Sender: TObject);
begin
  reChat.Clear;

  if (lbNomes.Count > 0) and (lbNomes.ItemIndex >= 0) then
  begin
    FiUsuarioDestino := RetornaCodUsuario(Trim(lbNomes.Items[lbNomes.ItemIndex]));
    CarregarMensagens(True, False);
  end;
end;

procedure TFUsuarioChat.mMsgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin

  end;
end;

end.
