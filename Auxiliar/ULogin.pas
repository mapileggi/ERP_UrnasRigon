unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls, Data.DB, MemDS, Vcl.Imaging.pngimage, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, ShellApi;

type
  TFLogin = class(TForm)
    UniPanel1: TPanel;
    eddeLogin: TEdit;
    eddeSenha: TEdit;
    lbdeLogin: TLabel;
    lbdeSenha: TLabel;
    btEntrar: TButton;
    lbCopyright: TLabel;
    lbAcessoRestrito: TLabel;
    btFechar: TButton;
    imLogoCliente: TImage;
    procedure btEntrarClick(Sender: TObject);
    procedure eddeLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eddeSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses
  uDmERP, UTelaInicial, UTrocarSenha, UFuncoes, UHashes;

procedure TFLogin.btEntrarClick(Sender: TObject);
begin
  if Trim(eddeLogin.Text) = '' then
    Aviso('Nome de usuário não informado.')
  else if Trim(eddeSenha.Text) = '' then
    Aviso('Senha não informada.')
  else if (LowerCase(Trim(eddeSenha.Text)) = 'erp123') then
  begin
    DmERP.qyUsuarioPesq.Close;
    DmERP.qyUsuarioPesq.MacroByName('filtro').Value := ' WHERE LOWER(deLogin) = ' + QuotedStr(LowerCase(eddeLogin.Text)) +
                                                       '   AND deSenha = ''erp123'' ' +
                                                       '   AND flAtivo = ''S'' ';
    DmERP.qyUsuarioPesq.Open;

    if DmERP.qyUsuarioPesq.IsEmpty then
      Aviso('Usuário inválido.')
    else
    begin
      FTrocarSenha := TFTrocarSenha.Create(Application);

      try
        FTrocarSenha.eddeLogin.Text := Trim(eddeLogin.Text);
        FTrocarSenha.ShowModal;
      finally
        FreeAndNil(FTrocarSenha);
      end;
    end;
  end
  else
  begin
    DmERP.qyUsuarioPesq.Close;
    DmERP.qyUsuarioPesq.MacroByName('filtro').Value := ' WHERE LOWER(deLogin) = ' + QuotedStr(LowerCase(eddeLogin.Text)) +
                                                       '   AND deSenha = ' + QuotedStr(CalcHash2(eddeSenha.Text, haSHA1));
    DmERP.qyUsuarioPesq.Open;

    if DmERP.qyUsuarioPesq.IsEmpty then
      Aviso('Usuário ou senha inválido.')
    else
    begin
      if DmERP.qyUsuarioPesq.FieldByName('flAtivo').AsString <> 'S' then
        Aviso('Usuário informado está inativo.')
      else
      begin
        FTelaInicial.FcdUsuario        := DmERP.qyUsuarioPesq.FieldByName('cdUsuario').AsInteger;
        FTelaInicial.FnmUsuario        := DmERP.qyUsuarioPesq.FieldByName('nmUsuario').AsString;
        FTelaInicial.FdeLogin          := DmERP.qyUsuarioPesq.FieldByName('deLogin').AsString;
        FTelaInicial.FdeSenha          := DmERP.qyUsuarioPesq.FieldByName('deSenha').AsString;
        FTelaInicial.FdeEmail          := DmERP.qyUsuarioPesq.FieldByName('deEmail').AsString;
        FTelaInicial.FcdSetorUsuario   := 0;
        FTelaInicial.FdeSetorUsuario   := '';

        if not DmERP.qyUsuarioPesq.FieldByName('cdSetor').IsNull then
        begin
          FTelaInicial.FcdSetorUsuario := DmERP.qyUsuarioPesq.FieldByName('cdSetor').AsInteger;
          FTelaInicial.FdeSetorUsuario := DmERP.qyUsuarioPesq.FieldByName('deSetor').AsString;
        end;

        FTelaInicial.FcdColaborador    := 0;

        if not DmERP.qyUsuarioPesq.FieldByName('cdColaborador').IsNull then
          FTelaInicial.FcdColaborador  := DmERP.qyUsuarioPesq.FieldByName('cdColaborador').AsInteger;

        FTelaInicial.FbLoginOK         := True;
        FTelaInicial.lbInfoSistema.Caption := 'Usuário: ' + FTelaInicial.FnmUsuario;

        Close;
      end;
    end;
  end;
end;

procedure TFLogin.eddeSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btEntrar.Click;
end;

procedure TFLogin.FormCreate(Sender: TObject);
var
  stConfig      : TStringList;
  sVersaoAtual  : String;
begin
  if not (FileExists(ExtractFilePath(Application.ExeName) + 'ERP.ini')) then
  begin
    Erro('Arquivo de configuração não encontrado.');
    Application.Terminate;
  end
  else
  begin
    stConfig := TStringList.Create;
    stConfig.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ERP.ini');

    if stConfig.Count <> FiNumLinhasConfigERP then
    begin
      Erro('Arquivo de configuração incorreto.');
      Application.Terminate;
    end
    else
    begin
      sVersaoAtual                  := GetBuildInfo;
      FTelaInicial.FsPathServidor   := stConfig.Values['PathServidor'];
      FTelaInicial.FsNomeClienteERP := stConfig.Values['NomeClienteERP'];
      Self.Caption                  := '..: ' + FTelaInicial.FsNomeClienteERP + ' :.. | ' +
                                       FsNomeSistema + ' - Versão: ' + sVersaoAtual;
      FTelaInicial.Caption          := Self.Caption;

      if (not FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg')) and
         (FileExists(FTelaInicial.FsPathServidor + '\LogoLogin.jpg')) then
        CopyFile(PWideChar(FTelaInicial.FsPathServidor + '\LogoLogin.jpg'), PWideChar(ExtractFilePath(Application.ExeName) + 'LogoLogin.jpg'), True);

      if (not FileExists(ExtractFilePath(Application.ExeName) + '\LogoERP.jpg')) and
         (FileExists(FTelaInicial.FsPathServidor + '\LogoERP.jpg')) then
        CopyFile(PWideChar(FTelaInicial.FsPathServidor + '\LogoERP.jpg'), PWideChar(ExtractFilePath(Application.ExeName) + 'LogoERP.jpg'), True);

      stConfig.Clear;
      stConfig.LoadFromFile(FTelaInicial.FsPathServidor + '\VersaoERP.ini');

      if (stConfig.Count > 0) and (sVersaoAtual <> stConfig.Values['VersaoERP']) and
         (FileExists(FTelaInicial.FsPathServidor + '\ERPnovo.exe')) then
      begin
//        CopyFile(PChar(sPathServidor + '\ERPnovo.exe'), PChar(ExtractFilePath(Application.ExeName) + 'ERPnovo.exe'), False);
        Aviso('*** O sistema será atualizado! ***' + #13 + 'Pressione "OK" para continuar.');
        stConfig.Clear;
//        stConfig.Add('ping -n 10 -w 1000 0.0.0.1 > nul');
//        stConfig.Add('tskill ERP /a');  //taskkill /F /IM ERP.exe /T
//        stConfig.Add('ping -n 3 -w 1000 0.0.0.1 > nul');
//        stConfig.Add('del ' + ExtractFilePath(Application.ExeName) + 'ERP.exe');
//        stConfig.Add('ren ' + ExtractFilePath(Application.ExeName) + 'ERPnovo.exe ERP.exe');
//        stConfig.Add(ExtractFilePath(Application.ExeName) + 'ERP.exe');
//        stConfig.SaveToFile(ExtractFilePath(Application.ExeName) + 'Update.bat');
//        WinExec(PAnsiChar(ExtractFilePath(Application.ExeName) + 'Update.bat'), SW_HIDE);
//        RunAsAdmin(Handle, ExtractFilePath(Application.ExeName) + 'Update.bat', '');

        ShellExecute(Handle, 'open', PWideChar(ExtractFilePath(Application.ExeName) + 'UpdateERP.exe'), '', '', SW_HIDE);
        Application.Terminate;
      end;
    end;

    if Assigned(stConfig) then
      FreeAndNil(stConfig);
  end;
end;

procedure TFLogin.FormShow(Sender: TObject);
{var
  jpg : TJPEGImage;
  bmp : TBitmap;

  X, Y: Integer;  }
begin
  if (FileExists(ExtractFilePath(Application.ExeName) + 'LogoLogin.jpg')) then
  begin
    imLogoCliente.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'LogoLogin.jpg');

 {
    bmp := TBitmap.Create;
    jpg := TJPEGImage.Create;
    jpg.LoadFromFile(ExtractFilePath(Application.ExeName) + 'LogoLogin.jpg');
    bmp.Assign(jpg);
    jpg.Destroy;
    bmp.PixelFormat := pf24bit;
   // AddWatermark(bmp, 0.5, 'i was here');
    Canvas.Draw(0, 0, bmp);

    brush.style := bsClear;

    for y := 0 to imLogoCliente.height - 1 do
      for x := 0 to imLogoCliente.width - 1 do
      begin
        if (x mod 2)=(y mod 2) then
          imLogoCliente.canvas.pixels[x, y] := clWhite;
      end;

    imLogoCliente.Picture.Assign(bmp);

    bmp.Destroy;
 }
  end;
end;

procedure TFLogin.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFLogin.eddeLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btEntrar.Click;
end;

end.

