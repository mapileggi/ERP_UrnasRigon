unit UEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, IdText, IdAttachmentFile, IdMessage, IdSMTP,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack,
  IdSSL, IdSSLOpenSSL;

type
  TFEmail = class(TForm)
    pnBotao: TPanel;
    pnDadosEmail: TPanel;
    mTextoEmail: TMemo;
    lbPara: TLabel;
    edPara: TEdit;
    edCc: TEdit;
    lbCc: TLabel;
    lbCco: TLabel;
    edCco: TEdit;
    lbAssunto: TLabel;
    edAssunto: TEdit;
    lbTextoEmail: TLabel;
    btEnviar: TBitBtn;
    btFechar: TBitBtn;
    lbAnexos: TLabel;
    lbListaAnexo: TListBox;
    procedure btFecharClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure EnviarEmail;
  public
    { Public declarations }
  end;

var
  FEmail: TFEmail;

implementation

{$R *.dfm}

uses
  UTelaInicial, uFuncoes;

procedure TFEmail.EnviarEmail;
var
  i                    : Integer;
  idAnexo              : TIdAttachmentFile;
  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      //Configura os parâmetros necessários para SSL
      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv2;
      IdSSLIOHandlerSocket.SSLOptions.Mode   := sslmClient;

      //IdSSLIOHandlerSocket.PassThrough := True;

      //Variável referente a mensagem
      idMsg                            := TIdMessage.Create(Self);
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := FTelaInicial.FnmUsuario;
      idMsg.From.Address               := FTelaInicial.FdeEmail;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := edAssunto.Text;

      //Add Destinatário(s)
      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := edPara.Text;

      if Trim(edCc.Text) <> '' then
        idMsg.CCList.EMailAddresses    := edCc.Text;

      if Trim(edCco.Text) <> '' then
        idMsg.BccList.EMailAddresses   := edCco.Text;

      //Variável do texto
      idText := TIdText.Create(idMsg.MessageParts);
      idText.Body.Add(mTextoEmail.Text);
      idText.ContentType := 'text/html; text/plain; charset=iso-8859-1';

      //Prepara o Servidor
      IdSMTP                           := TIdSMTP.Create(Self);
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utNoTLSSupport; //utUseExplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := 'email-ssl.com.br';   //'email-ssl.com.br' smtp.urnasrigon.com.br;
      IdSMTP.Port                      := 587; //587 465
      IdSMTP.Username                  := 'urnasrigon@urnasrigon.com.br';
      IdSMTP.Password                  := 'Rigon@1990';

     // IdSMTP.UseEhlo := False; TESTE

      //Conecta e Autentica
      IdSMTP.Connect;
      IdSMTP.Authenticate;

      if lbListaAnexo.Count > 0 then
      begin
        i := 0;

        while i < lbListaAnexo.Count do
        begin
          idAnexo := TIdAttachmentFile.Create(idMsg.MessageParts, lbListaAnexo.Items[i]);
          Inc(i);
        end;
      end;

      //Se a conexão foi bem sucedida, envia a mensagem
      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
          Aviso('E-mail enviado com sucesso.');
        except on E:Exception do
          begin
            Erro('Erro ao tentar enviar: ' + E.Message);
          end;
        end;
      end;

      //Depois de tudo pronto, desconecta do servidor SMTP
      if IdSMTP.Connected then
        IdSMTP.Disconnect;
    finally
      UnLoadOpenSSLLibrary;

      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
    begin

    end;
  end;
end;

procedure TFEmail.FormCreate(Sender: TObject);
begin
  btEnviar.Glyph.LoadFromResourceName(HInstance, 'IMGBTENVIAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance, 'IMGBTFECHAR_32X32');
end;

procedure TFEmail.FormShow(Sender: TObject);
begin
  if (edPara.Visible) and (edPara.CanFocus) then
    edPara.SetFocus;
end;

procedure TFEmail.btEnviarClick(Sender: TObject);
begin
  EnviarEmail;
end;

procedure TFEmail.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

end.

