unit UTelaInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Themes, Math,
  System.ImageList, Vcl.ImgList, FireDAC.Stan.Error, Vcl.Imaging.jpeg, Data.DB, FireDAC.Stan.Param,
  Vcl.Imaging.pngimage, USysTrayIcon, System.Win.ScktComp, Vcl.Buttons;

type
  TFTelaInicial = class(TForm)
    spMenu: TSplitter;
    pnMenu: TPanel;
    tvMenu: TTreeView;
    btEscondeMostraMenu: TButton;
    pnTelas: TPanel;
    pcTelas: TPageControl;
    pnInfoSistema: TPanel;
    lbInfoSistema: TLabel;
    imLogoERP: TImage;
    tRecarregarAvisos: TTimer;
    stiAvisos: TSysTrayIcon;
    tUsuarioMensagem: TTimer;
    tMsgCargaEmAberto: TTimer;
    imgList: TImageList;
    skClient: TClientSocket;
    pnChat: TPanel;
    spChat: TSplitter;
    btEscondeMostraChat: TButton;
    pnChatCampos: TPanel;
    gbMensagensEntre: TGroupBox;
    lbdtMensagemA: TLabel;
    eddtMensagemIni: TDateTimePicker;
    eddtMensagemFim: TDateTimePicker;
    pnBotoes: TPanel;
    btEnviar: TBitBtn;
    mMsg: TMemo;
    pnNomes: TPanel;
    lbUsuarios: TLabel;
    lbNome: TLabel;
    lbHandles: TListBox;
    lbNomes: TListBox;
    Splitter1: TSplitter;
    reChat: TRichEdit;
    btConectar: TButton;
    procedure btEscondeMostraMenuClick(Sender: TObject);
    procedure tvMenuDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tRecarregarAvisosTimer(Sender: TObject);
    procedure stiAvisosBalloonClick(Sender: TObject);
    procedure stiAvisosLDblClick(Sender: TObject);
    procedure tUsuarioMensagemTimer(Sender: TObject);
    procedure tMsgCargaEmAbertoTimer(Sender: TObject);
    procedure skClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure skClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure skClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure btEscondeMostraChatClick(Sender: TObject);
    procedure lbNomesClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure btConectarClick(Sender: TObject);
    procedure lbNomesDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure skClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    procedure AbrirTelaMenu;
    function ExistemAvisos : Boolean;
    procedure AbrirQuadroAvisos;
    procedure AbrirUsuariosConect;
    function RetornaCodUsuarioDestChat(const sdeLogin : String) : Integer;
    procedure FormatarLinhaDataChat(const sLinhaData : String);
    procedure CarregarMensagensUsuChat(const bExibirMsg, bSomenteNaoLidas : Boolean);
    procedure EnviarMensagemChat(const sMensagem : String);
    procedure AvisoMsgChat;
    procedure ConectarClientChat;
  public
    FiTipoAviso,
    FcdUsuario,
    FcdColaborador,
    FcdSetorUsuario,
    FiUsuarioDestinoChat : Integer;
    FnmUsuario,
    FdeLogin,
    FdeSenha,
    FdeEmail,
    FdeSetorUsuario,
    FsEndServer,
    FsPathServidor,
    FsNomeChat,
    FsNomeClienteERP       : String;
    FbLoginOK,
    FbVerificaUsuConect    : Boolean;

    FNomeCampoChave,
    FValorFiltroCampoChave : String;
    FCamposValoresNovoReg  : TStringList;

    function TelaAberta(const sNomeTela : String) : Boolean;
    procedure CriarTela(const sNmForm, sTituloTela, sTituloMenuPai : String);
    procedure AbrirTela(const sNmForm,
                              sNomeCampoChave,
                              sValorFiltroCampoChave : String;
                        const stCamposValoresNovoReg : TStringList
                       );
  end;

var
  FTelaInicial: TFTelaInicial;

implementation

uses
  uDmERP, ULogin, uFuncoes, UTrocarSenha, URelatoriosContabilidade,
  URelatoriosContasReceber, UIntIndRelatoriosIndustrial, URelatoriosDeptoPessoal,
  UIntFinRelatoriosFinanceiro, URegistroPonto, UIntComCargaEmAberto;

{$R *.dfm}

procedure TFTelaInicial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmERP.UsuarioConectado('N');
  Sleep(1000);

  if Assigned(FCamposValoresNovoReg) then
    FreeAndNil(FCamposValoresNovoReg);

  DmERP.fdConnERP.DisposeOf;
end;

procedure TFTelaInicial.FormShow(Sender: TObject);
var
  i         : Integer;
  dthrAtual : TDateTime;
  sWhere    : String;
begin
  FbVerificaUsuConect    := False;
  FsNomeChat             := '';
  btEscondeMostraChat.Click;
  FNomeCampoChave        := '';
  FValorFiltroCampoChave := '';
  FCamposValoresNovoReg  := TStringList.Create;

  if DmERP.fdConnERP.Connected then
  begin
    FbLoginOK := False;
    FLogin    := TFLogin.Create(Application);

    try
      FLogin.ShowModal;
    finally
      FreeAndNil(FLogin);
    end;

    if not FbLoginOK then
    begin
      DmERP.fdConnERP.DisposeOf;
      Application.Terminate;
    end
    else
    begin
      dthrAtual := DataHoraAtual(DmERP.fdConnERP);

      eddtMensagemIni.DateTime := dthrAtual - 3;
      eddtMensagemFim.DateTime := dthrAtual;

      if DmERP.qyUsuarioConexao.Active then
        DmERP.qyUsuarioConexao.Close;

      DmERP.qyUsuarioConexao.MacroByName('filtro').Clear;

      sWhere := ' WHERE u.cdUsuario = ' + IntToStr(FcdUsuario) +
                '   AND u.dtConexao = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dthrAtual)) +
                '   AND u.flConectado = ''S'' ' +
                '   AND u.nmComputador = ' + QuotedStr(RetornaNomeComputador) +
                '   AND u.cdUsuarioConexao > COALESCE( ' +
                '                                     ( ' +
                '                                      SELECT MAX(x.cdUsuarioConexao) ' +
                '                                        FROM erp.usuarioConexao x ' +
                '                                       WHERE x.flConectado = ''N'' ' +
                '                                         AND x.cdUsuario = u.cdUsuario ' +
                '                                         AND x.nmComputador = u.nmComputador ' +
                '                                         AND x.dtConexao = u.dtConexao ' +
                '                                     ), 0 ' +
                '                                    ) ';

      DmERP.qyUsuarioConexao.MacroByName('filtro').Value := sWhere;
      DmERP.qyUsuarioConexao.Open();
{
      if not DmERP.qyUsuarioConexao.IsEmpty then
      begin
        Aviso('Você já está conectado neste computador.');
        Application.Terminate;
      end
      else   }
      begin
        pcTelas.Visible   := False;
        imLogoERP.Visible := True;

        DmERP.UsuarioConectado('S');

        if DmERP.qyPermissaoUsuario.Active then
          DmERP.qyPermissaoUsuario.Close;

        DmERP.qyPermissaoUsuario.MacroByName('filtro').Clear;
        DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := FcdUsuario;
        DmERP.qyPermissaoUsuario.Open();

        for i := tvMenu.Items.Count - 1 downto 0 do
        begin
          if (tvMenu.Items.Item[i].getFirstChild = nil) then
          begin
            if (tvMenu.Items.Item[i].Parent <> nil) then
            begin
              DmERP.qyPermissaoUsuario.First;

              if not (DmERP.qyPermissaoUsuario.Locate('cdUsuario;deTituloTela;deTituloPai;flAtivo',
                                                      VarArrayOf(
                                                                 [
                                                                  FcdUsuario,
                                                                  tvMenu.Items.Item[i].Text,
                                                                  tvMenu.Items.Item[i].Parent.Text,
                                                                  'S'
                                                                 ]
                                                                ),
                                                           []
                                                     )
                     ) then
                tvMenu.Items.Item[i].Delete;
            end;
          end;
        end;

        for i := 0 to tvMenu.Items.Count - 1 do
          if tvMenu.Items.Item[i].Parent = nil then
            tvMenu.Items.Item[i].Expanded := True;

        ConectarClientChat;

        FiTipoAviso := 1;

        if ExistemAvisos then
          stiAvisos.showballoontip;

        if (FileExists(ExtractFilePath(Application.ExeName) + 'LogoERP.jpg')) then
          imLogoERP.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'LogoERP.jpg');
      end;
    end;
  end;
end;

procedure TFTelaInicial.ConectarClientChat;
begin
  skClient.Address := RetornaIpComputador;
  skClient.Host    := FsEndServer;
//  skClient.Host    := '192.168.100.20';
  skClient.Open;
end;

procedure TFTelaInicial.lbNomesClick(Sender: TObject);
begin
  reChat.Clear;

  if (lbNomes.Count > 0) and (lbNomes.ItemIndex >= 0) then
  begin
    FiUsuarioDestinoChat := RetornaCodUsuarioDestChat(Trim(lbNomes.Items[lbNomes.ItemIndex]));
    CarregarMensagensUsuChat(True, False);
  end;
end;

procedure TFTelaInicial.AbrirQuadroAvisos;
var
  Tab : TTabSheet;
begin
  if TelaAberta('Quadro de Avisos' + 'Administrativo') then
  begin
    Tab := FTelaInicial.pcTelas.ActivePage;

    if Assigned(Tab) then
    begin
      Tab.Parent      := nil;
      Tab.PageControl := nil;

      FreeAndNil(Tab);
    end;
  end;

  CriarTela('FAvisosSistema', 'Quadro de Avisos', 'Administrativo');
end;

procedure TFTelaInicial.skClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Socket.SendText('+' + FdeLogin);
end;

procedure TFTelaInicial.skClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  btConectar.Visible := True;
end;

procedure TFTelaInicial.skClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode          := 0;
  btConectar.Visible := True;
end;

function TFTelaInicial.RetornaCodUsuarioDestChat(const sdeLogin : String) : Integer;
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

procedure TFTelaInicial.CarregarMensagensUsuChat(const bExibirMsg, bSomenteNaoLidas : Boolean);
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

  DmERP.qyUsuarioChat.ParamByName('cdUsuario').AsInteger        := FcdUsuario;
  DmERP.qyUsuarioChat.ParamByName('cdUsuarioDestino').AsInteger := FiUsuarioDestinoChat;

  DmERP.qyUsuarioChat.Open();

{  if (DmERP.qyUsuarioChat.IsEmpty) and (bExibirMsg) then
    Aviso('Não existem mensagens no intervalo de datas informado.')
  else  }
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
          FormatarLinhaDataChat(DmERP.qyUsuarioChat.FieldByName('dtMensagem').AsString + ' - ' +
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

procedure TFTelaInicial.EnviarMensagemChat(const sMensagem : String);
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  if DmERP.qyUsuarioChat.Active then
    DmERP.qyUsuarioChat.Close;

  DmERP.qyUsuarioChat.MacroByName('filtro').Clear;
  DmERP.qyUsuarioChat.MacroByName('filtro').Value := '   AND dtMensagem = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dthrAtual));

  DmERP.qyUsuarioChat.ParamByName('cdUsuario').AsInteger        := FTelaInicial.FcdUsuario;
  DmERP.qyUsuarioChat.ParamByName('cdUsuarioDestino').AsInteger := FiUsuarioDestinoChat;

  DmERP.qyUsuarioChat.Open();

  DmERP.qyUsuarioChat.Insert;
  DmERP.qyUsuarioChat.FieldByName('cdUsuario').AsInteger        := FcdUsuario;
  DmERP.qyUsuarioChat.FieldByName('nmComputador').AsString      := RetornaNomeComputador;
  DmERP.qyUsuarioChat.FieldByName('deIp').AsString              := RetornaIpComputador;
  DmERP.qyUsuarioChat.FieldByName('dtMensagem').AsDateTime      := Trunc(dthrAtual);
  DmERP.qyUsuarioChat.FieldByName('hrMensagem').AsInteger       := HoraParaMinutos(dthrAtual);
  DmERP.qyUsuarioChat.FieldByName('cdUsuarioDestino').AsInteger := FiUsuarioDestinoChat;
  DmERP.qyUsuarioChat.FieldByName('deMensagem').AsString        := sMensagem;
  DmERP.qyUsuarioChat.FieldByName('flMensagemLida').AsString    := 'N';

  DmERP.qyUsuarioChat.Post;

  DmERP.qyUsuarioChat.Close;
  DmERP.qyUsuarioChat.MacroByName('filtro').Clear;
end;

procedure TFTelaInicial.FormatarLinhaDataChat(const sLinhaData : String);
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

procedure TFTelaInicial.skClientRead(Sender: TObject; Socket: TCustomWinSocket);
  function PegaCod(s : String) : Char;
  begin
    Result := #0;

    if Length(s) > 0 then
      Result := S[1];
  end;

  function PegaTexto(s : String) : String;
  begin
    Result := '';

    if Length(s) > 0 then
      Result := Copy(s, 2, Length(s) - 1);
  end;

var
  dthrAtual : TDateTime;
  sMsg,
  sData,
  s,
  sHandle,
  sNome     : String;
  i, j      : Integer;
  stLista   : TStringList;
  bJaConect : Boolean;
begin
  s       := Socket.ReceiveText;
  stLista := TStringList.Create;

  if PegaCod(s) = '+' then
  begin
    stLista.Text := PegaTexto(s);

    if (FbVerificaUsuConect) then
    begin
      for i := 0 to stLista.Count - 1 do
      begin
        sNome := Copy(stLista.Strings[i], 1, Pos('||', stLista.Strings[i]) - 1);

        if (not SameText(sNome, FdeLogin)) then
        begin
          bJaConect := False;
          j         := 0;

          while j < lbNomes.Count do
          begin
            if SameText(lbNomes.Items[j], sNome) then
            begin
              bJaConect := True;
              j         := lbNomes.Count;
            end;

            Inc(j);
          end;

          if (not bJaConect) and (Pos('admin', sNome) = 0) then
          begin
            FiTipoAviso := 2;
            stiAvisos.TipTitle := 'Mensagens do Sistema';
            stiAvisos.TipInfo  := UpperCase(Copy(sNome, 1, 1)) + LowerCase(Copy(sNome, 2, Length(sNome) - 1)) +
                                ' acabou de se conectar.';
            stiAvisos.showballoontip;
          end;
        end;
      end;
    end;

    lbHandles.Clear;
    lbNomes.Clear;

    for i := 0 to stLista.Count - 1 do
    begin
      sNome   := Copy(stLista.Strings[i], 1, Pos('||', stLista.Strings[i]) - 1);
      sHandle := Trim(Copy(stLista.Strings[i], Pos('||', stLista.Strings[i]) + 2, Length(stLista.Strings[i])));

      if not SameText(sNome, FdeLogin) then
      begin
        lbNomes.Items.Add(sNome);
        lbHandles.Items.Add(sHandle);
      end;
    end;

    FbVerificaUsuConect := True;
  end
  else if PegaCod(s) = '>' then
  begin
    FsNomeChat := Trim(Copy(s, Pos(')', s) + 2, Pos(': ', s) - Pos(')', s) - 2));
    dthrAtual  := DataHoraAtual(DmERP.fdConnERP);
    sData      := FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + DiaSemanaExtenso(dthrAtual);

    if Pos(sData, reChat.Text) = 0 then
      FormatarLinhaDataChat(sData);

    reChat.Lines.Add(PegaTexto(s));

    if not SameText(FsNomeChat, FdeLogin) then
    begin
      FiTipoAviso := 2;
//      FiUsuarioDestinoChat := RetornaCodUsuarioDestChat(FsNomeChat);
      stiAvisos.TipTitle := 'Mensagens do Chat';
      stiAvisos.TipInfo  := 'Você recebeu mensagem de ' + FsNomeChat + '.';
      stiAvisos.showballoontip;
      AvisoMsgChat;
    end;
  end;

  if Assigned(stLista) then
    FreeAndNil(stLista);
end;

procedure TFTelaInicial.lbNomesDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin    {
  if FsNomeChat <> '' then
  begin
    if SameText(lbNomes.Items[Index], FsNomeChat) then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Brush.Color := clMenuHighlight
    end
    else
    begin
      Canvas.Font.Color := clWindowText;
      Canvas.Brush.Color := clWindow;
    end;
  end;    }
end;

procedure TFTelaInicial.AvisoMsgChat;
var
  i         : Integer;
  sMsgAviso : String;
begin
  if not pnChatCampos.Visible then
  begin
    sMsgAviso := 'MENSAGEM  NO  CHAT !';
    btEscondeMostraChat.Caption := '';

    for i := 1 to Length(sMsgAviso) do
    begin
      btEscondeMostraChat.Caption := btEscondeMostraChat.Caption + sMsgAviso[i];
      Sleep(350);
    end;
  end;
end;

procedure TFTelaInicial.stiAvisosBalloonClick(Sender: TObject);
begin
  if FiTipoAviso = 1 then
  begin
    if (ExistemAvisos) then
      AbrirQuadroAvisos;
  end
  else if FiTipoAviso = 2 then
  begin

  end;
end;

procedure TFTelaInicial.stiAvisosLDblClick(Sender: TObject);
begin
  if FiTipoAviso = 1 then
  begin
    if (ExistemAvisos) then
      AbrirQuadroAvisos;
  end;
end;

function TFTelaInicial.ExistemAvisos : Boolean;
begin
  stiAvisos.TipTitle := 'Avisos do sistema';
  stiAvisos.TipInfo  := '';
  Result             := False;

  if FcdUsuario > 0 then
  begin
    if DmERP.qyPermissaoUsuario.Active then
      DmERP.qyPermissaoUsuario.Close;

    DmERP.qyPermissaoUsuario.MacroByName('filtro').Clear;
    DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := FcdUsuario;
    DmERP.qyPermissaoUsuario.Open();
    DmERP.qyPermissaoUsuario.First;

    while not DmERP.qyPermissaoUsuario.Eof do
    begin
      if (DmERP.qyPermissaoUsuario.FieldByName('flAtivo').AsString = 'S') and
         (DmERP.qyPermissaoUsuario.FieldByName('flExibeQuadroAviso').AsString = 'S') then
      begin
        if DmERP.qyAviso.Active then
          DmERP.qyAviso.Close;

        DmERP.qyAviso.Open();

        if not DmERP.qyAviso.IsEmpty then
        begin
          DmERP.qyAviso.First;

          while not DmERP.qyAviso.Eof do
          begin
            if SameText(DmERP.qyAviso.FieldByName('nmForm').AsString,
                        DmERP.qyPermissaoUsuario.FieldByName('nmForm').AsString
                       ) then
            begin
              if DmERP.qyAuxiliar.Active then
                DmERP.qyAuxiliar.Close;

              DmERP.qyAuxiliar.SQL.Clear;
              DmERP.qyAuxiliar.SQL.Text := DmERP.qyAviso.FieldByName('deSql').AsString;
              DmERP.qyAuxiliar.Open();

              if (not DmERP.qyAuxiliar.IsEmpty) then
              begin
                Result := True;

                stiAvisos.TipInfo := stiAvisos.TipInfo + #13 +
                                     ' - ' + DmERP.qyAviso.FieldByName('deTituloAviso').AsString;
              end;
            end;

            DmERP.qyAviso.Next;
          end;
        end;
      end;

      DmERP.qyPermissaoUsuario.Next;
    end;

    if Trim(stiAvisos.TipInfo) <> '' then
      stiAvisos.TipInfo := 'Você possui avisos de:' + #13 + stiAvisos.TipInfo;
  end;
end;

procedure TFTelaInicial.AbrirUsuariosConect;
var
  Tab : TTabSheet;
begin
  if TelaAberta('Usuários Conectados' + 'Administrativo') then
  begin
    Tab := FTelaInicial.pcTelas.ActivePage;

    if Assigned(Tab) then
    begin
      Tab.Parent      := nil;
      Tab.PageControl := nil;

      FreeAndNil(Tab);
    end;
  end;

  CriarTela('FUsuariosConectados', 'Usuários Conectados', 'Administrativo');
end;

procedure TFTelaInicial.btEnviarClick(Sender: TObject);
var
  dthrAtual : TDateTime;
  sMsg,
  sData     : String;
begin
  if FiUsuarioDestinoChat <= 0 then
    Aviso('Escolha um nome na lista ao lado antes de enviar.')
  else
  begin
    if (lbNomes.Count > 0) and (lbNomes.ItemIndex > -1) then
    begin
      EnviarMensagemChat(mMsg.Text);

      dthrAtual := DataHoraAtual(DmERP.fdConnERP);
      sData     := FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + DiaSemanaExtenso(dthrAtual);

      if Pos(sData, reChat.Text) = 0 then
        FormatarLinhaDataChat(sData);

      sMsg := '(' + FormatDateTime('hh:nn', dthrAtual) + ') ' +
               UpperCase(Copy(FTelaInicial.FdeLogin, 1, 1)) +
               LowerCase(Copy(FTelaInicial.FdeLogin, 2, Length(FTelaInicial.FdeLogin) - 1)) + ': ' + mMsg.Text;

      reChat.Lines.Add(sMsg);
      skClient.Socket.SendText('>' + lbHandles.Items[lbNomes.ItemIndex] + '/hwd' +
                               sMsg
                              );

      mMsg.Clear;
      mMsg.SetFocus;
    end;
  end;
end;

procedure TFTelaInicial.btEscondeMostraChatClick(Sender: TObject);
begin
  if pnChatCampos.Visible then
  begin
    pnChatCampos.Visible        := False;
    btEscondeMostraChat.Caption := 'CHAT <';
    pnChat.Width                := btEscondeMostraChat.Width;
  end
  else
  begin
    pnChatCampos.Visible        := True;
    btEscondeMostraChat.Caption := 'CHAT >';
    pnChat.Width                := pnChatCampos.Width;
  end;
end;

procedure TFTelaInicial.btEscondeMostraMenuClick(Sender: TObject);
begin
  if tvMenu.Visible then
  begin
    tvMenu.Visible              := False;
    btEscondeMostraMenu.Caption := '>>';
    pnMenu.Width                := btEscondeMostraMenu.Width;
  end
  else
  begin
    tvMenu.Visible              := True;
    btEscondeMostraMenu.Caption := '<<';
    pnMenu.Width                := tvMenu.Width;
  end;
end;

procedure TFTelaInicial.btConectarClick(Sender: TObject);
begin
  ConectarClientChat;
  btConectar.Visible := False;
end;

procedure TFTelaInicial.tMsgCargaEmAbertoTimer(Sender: TObject);
var
  stAux : TStringList;
begin
  tMsgCargaEmAberto.Enabled := False;

  stAux := TStringList.Create;

  if FcdUsuario > 0 then
  begin
    if DmERP.qyPermissaoUsuario.Active then
      DmERP.qyPermissaoUsuario.Close;

    DmERP.qyPermissaoUsuario.MacroByName('filtro').Clear;
    DmERP.qyPermissaoUsuario.MacroByName('filtro').Value := ' AND nmForm = ''FIntComCargaEmAberto'' ';
    DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := FcdUsuario;
    DmERP.qyPermissaoUsuario.Open();

    if (DmERP.qyPermissaoUsuario.FieldByName('flAtivo').AsString = 'S') and
       (DmERP.qyPermissaoUsuario.FieldByName('flExibeQuadroAviso').AsString = 'S') then
    begin
      if DmERP.qyIntComCargaPesq.Active then
        DmERP.qyIntComCargaPesq.Close;

      DmERP.qyIntComCargaPesq.MacroByName('filtro').Clear;

      if FTelaInicial.FcdSetorUsuario = 1 then
        DmERP.qyIntComCargaPesq.MacroByName('filtro').Value := ' WHERE cdSituacao IN(1, 2) '
      else
        DmERP.qyIntComCargaPesq.MacroByName('filtro').Value := ' WHERE cdSituacao = 2 ';

      DmERP.qyIntComCargaPesq.Open();

      if (not DmERP.qyIntComCargaPesq.IsEmpty) then
        AbrirTela('FIntComCargaEmAberto', '', '', stAux);
    end;
  end;

  if Assigned(stAux) then
    FreeAndNil(stAux);

  tMsgCargaEmAberto.Enabled := True;
end;

procedure TFTelaInicial.tRecarregarAvisosTimer(Sender: TObject);
begin
  try
    FiTipoAviso := 1;

    tRecarregarAvisos.Enabled := False;

    if ExistemAvisos then
      stiAvisos.showballoontip;
  finally
    tRecarregarAvisos.Enabled := True;
  end;
end;

procedure TFTelaInicial.tUsuarioMensagemTimer(Sender: TObject);
begin
  try
    tUsuarioMensagem.Enabled := False;

    if DmERP.qyUsuarioMensagem.Active then
      DmERP.qyUsuarioMensagem.Close;

    DmERP.qyUsuarioMensagem.MacroByName('filtro').Value := ' WHERE cdUsuario = ' + IntToStr(FTelaInicial.FcdUsuario) +
                                                           '   AND flMensagemLida = ''N'' ';
    DmERP.qyUsuarioMensagem.Open();

    if not DmERP.qyUsuarioMensagem.IsEmpty then
    begin
      DmERP.qyUsuarioMensagem.First;

      while not DmERP.qyUsuarioMensagem.Eof do
      begin
        Informacao(DmERP.qyUsuarioMensagem.FieldByName('deMensagem').AsString);

        DmERP.qyUsuarioMensagem.Edit;
        DmERP.qyUsuarioMensagem.FieldByName('flMensagemLida').AsString := 'S';
        DmERP.qyUsuarioMensagem.Post;

        DmERP.qyUsuarioMensagem.Next;
      end;
    end;
  finally
    tUsuarioMensagem.Enabled := True;
  end;
end;

procedure TFTelaInicial.tvMenuDblClick(Sender: TObject);
begin
  AbrirTelaMenu;
end;

function TFTelaInicial.TelaAberta(const sNomeTela : String) : Boolean;
var
  i : Integer;
begin
  Result := False;

  for i := 0 to pcTelas.PageCount - 1 do
  begin
    if (SameText(pcTelas.Pages[i].Hint, sNomeTela)) then
    begin
      Result             := True;
      pcTelas.ActivePage := pcTelas.Pages[i];
      Break;
    end;
  end;
end;

procedure TFTelaInicial.CriarTela(const sNmForm, sTituloTela, sTituloMenuPai : String);
var
  tsTela       : TTabSheet;
  fcClasseForm : TFormClass;
  fForm        : TForm;
begin
  fcClasseForm := TFormClass(GetClass('T' + sNmForm));

  if fcClasseForm = nil then
  begin
    Erro('Tela "' + sTituloTela + '" do menu "' + sTituloMenuPai + '" não registrada.');
    Abort;
  end
  else
  begin
    tsTela             := TTabSheet.Create(pcTelas);
    tsTela.Font.Size   := 8;
    tsTela.Caption     := sTituloTela;
    tsTela.PageControl := pcTelas;
    tsTela.Hint        := sTituloTela + sTituloMenuPai;
    pcTelas.ActivePage := tsTela;
    fForm              := fcClasseForm.Create(nil);
    fForm.Parent       := tsTela;
    tsTela.Caption     := fForm.Caption;
    fForm.Align        := alClient;
    fForm.Show;

    pcTelas.Visible   := pcTelas.PageCount > 0;
    imLogoERP.Visible := not pcTelas.Visible;
  end;
end;

procedure TFTelaInicial.AbrirTelaMenu;
begin
  if SameText(tvMenu.Selected.Text, 'Trocar Senha') then
  begin
    FTrocarSenha := TFTrocarSenha.Create(Application);

    try
      FTrocarSenha.eddeLogin.Text := Trim(FdeLogin);
      FTrocarSenha.ShowModal;
    finally
      FreeAndNil(FTrocarSenha);
    end;
  end
  else if SameText(tvMenu.Selected.Text, 'Registro Ponto') then
  begin
    FRegistroPonto := TFRegistroPonto.Create(Application);

    try
      FRegistroPonto.ShowModal;
    finally
      FreeAndNil(FRegistroPonto);
    end;
  end
  else if pcTelas.PageCount = 20 then
    Aviso('Só é permitido abrir 20 telas ao mesmo tempo. ' +
          'Para abrir a tela "' + tvMenu.Selected.Text + '", feche alguma ' +
          'outra que já esteja aberta.')
  else
  begin
    if (tvMenu.Selected.getFirstChild = nil) then
    begin
      if (tvMenu.Selected.Enabled) and
         (tvMenu.Selected.Parent <> nil) then
      begin
        if (SameText(tvMenu.Selected.Text + tvMenu.Selected.Parent.Text,
                     'Relatórios' + 'Contas a Receber'
                    )
           ) then
        begin
          FRelatoriosContasReceber := TFRelatoriosContasReceber.Create(Application);

          try
            FRelatoriosContasReceber.ShowModal;
          finally
            FreeAndNil(FRelatoriosContasReceber);
          end;
        end
        else if (SameText(tvMenu.Selected.Text + tvMenu.Selected.Parent.Text,
                 'Relatórios' + 'Contabilidade'
                )
           ) then
        begin
          FRelatoriosContabilidade := TFRelatoriosContabilidade.Create(Application);

          try
            FRelatoriosContabilidade.ShowModal;
          finally
            FreeAndNil(FRelatoriosContabilidade);
          end;
        end
        else if (SameText(tvMenu.Selected.Text + tvMenu.Selected.Parent.Text,
                 'Relatórios' + 'Depto. Pessoal'
                )
           ) then
        begin
          FRelatoriosDeptoPessoal := TFRelatoriosDeptoPessoal.Create(Application);

          try
            FRelatoriosDeptoPessoal.ShowModal;
          finally
            FreeAndNil(FRelatoriosDeptoPessoal);
          end;
        end
        else if (SameText(tvMenu.Selected.Text + tvMenu.Selected.Parent.Text,
                 'Relatórios' + 'Industrial'
                )
           ) then
        begin
          FIntIndRelatoriosIndustrial := TFIntIndRelatoriosIndustrial.Create(Application);

          try
            FIntIndRelatoriosIndustrial.ShowModal;
          finally
            FreeAndNil(FIntIndRelatoriosIndustrial);
          end;
        end
        else if (SameText(tvMenu.Selected.Text + tvMenu.Selected.Parent.Text,
                 'Relatórios' + 'Financeiro'
                )
           ) then
        begin
          FIntFinRelatoriosFinanceiro := TFIntFinRelatoriosFinanceiro.Create(Application);

          try
            FIntFinRelatoriosFinanceiro.ShowModal;
          finally
            FreeAndNil(FIntFinRelatoriosFinanceiro);
          end;
        end
        else if (not (TelaAberta(tvMenu.Selected.Text + tvMenu.Selected.Parent.Text))) then
        begin
          if DmERP.qyPermissaoUsuario.Active then
            DmERP.qyPermissaoUsuario.Close;

          DmERP.qyPermissaoUsuario.MacroByName('filtro').Clear;
          DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := FcdUsuario;
          DmERP.qyPermissaoUsuario.Open();
          DmERP.qyPermissaoUsuario.First;

          if DmERP.qyPermissaoUsuario.Locate('cdUsuario;deTituloTela;deTituloPai;flAtivo',
                                             VarArrayOf(
                                                        [
                                                         FcdUsuario,
                                                         tvMenu.Selected.Text,
                                                         tvMenu.Selected.Parent.Text,
                                                         'S'
                                                        ]
                                                       ),
                                                  []
                                            ) then
            CriarTela(DmERP.qyPermissaoUsuario.FieldByName('nmForm').AsString,
                      tvMenu.Selected.Text,
                      tvMenu.Selected.Parent.Text
                     );
        end;
      end;
    end;
  end;
end;

procedure TFTelaInicial.AbrirTela(const sNmForm,
                                        sNomeCampoChave,
                                        sValorFiltroCampoChave : String;
                                  const stCamposValoresNovoReg : TStringList
                                 );
var
  Tab : TTabSheet;
begin
  if pcTelas.PageCount = 20 then
    Aviso('Só é permitido abrir 20 telas ao mesmo tempo. ' +
          'Para abrir esta tela, feche alguma ' +
          'outra que já esteja aberta.')
  else
  begin
    if DmERP.qyPermissaoUsuario.Active then
      DmERP.qyPermissaoUsuario.Close;

    DmERP.qyPermissaoUsuario.MacroByName('filtro').Clear;
    DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := FcdUsuario;
    DmERP.qyPermissaoUsuario.Open();
    DmERP.qyPermissaoUsuario.First;

    if DmERP.qyPermissaoUsuario.Locate('cdUsuario;nmForm;flAtivo',
                                       VarArrayOf(
                                                  [
                                                   FcdUsuario,
                                                   sNmForm,
                                                   'S'
                                                  ]
                                                 ),
                                            []
                                      ) then
    begin
      FNomeCampoChave        := sNomeCampoChave;
      FValorFiltroCampoChave := sValorFiltroCampoChave;

      if stCamposValoresNovoReg.Count > 0 then
        FCamposValoresNovoReg.AddStrings(stCamposValoresNovoReg);

      if TelaAberta(DmERP.qyPermissaoUsuario.FieldByName('deTituloTela').AsString +
                    DmERP.qyPermissaoUsuario.FieldByName('deTituloPai').AsString
                   ) then
      begin
        Tab := FTelaInicial.pcTelas.ActivePage;

        if Assigned(Tab) then
        begin
          Tab.Parent      := nil;
          Tab.PageControl := nil;

          FreeAndNil(Tab);
        end;
      end;

      CriarTela(sNmForm,
                DmERP.qyPermissaoUsuario.FieldByName('deTituloTela').AsString,
                DmERP.qyPermissaoUsuario.FieldByName('deTituloPai').AsString
               );
    end;
  end;
end;

end.
