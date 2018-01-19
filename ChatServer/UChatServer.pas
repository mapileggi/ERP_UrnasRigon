unit UChatServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TFChatServer = class(TForm)
    skServer: TServerSocket;
    lbNomes: TListBox;
    lbHandles: TListBox;
    lNomes: TLabel;
    Button1: TButton;
    mChat: TMemo;
    edMensagem: TEdit;
    btEnviar: TButton;
    lHandles: TLabel;
    lbMensagem: TLabel;
    lbChat: TLabel;
    procedure skServerClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure skServerClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure skServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure edMensagemKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure skServerClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
  private
    { Private declarations }
    function PegaCod(s : String) : Char;
    function PegaTexto(s : String) : String;
    function PegaNome(ID : HWND) : String;
    procedure SendToAll(s : String; menos : HWND = 0; bRegistraChat : Boolean = True);
    procedure SendToUser(sMsg : String; hwdUser : HWND);
    procedure AtualizaListaClientes;
    procedure TrataUsuarioDesconectado(hwdUser : HWND);
  public
    { Public declarations }
  end;

var
  FChatServer: TFChatServer;

implementation

{$R *.dfm}

procedure TFChatServer.Button1Click(Sender: TObject);
{var
  i : Integer; }
begin
{  if skServer.Socket.ActiveConnections > 0 then
  begin
    for i := 0 to skServer.Socket.ActiveConnections - 1 do
    begin
      if skServer.Socket.Connections[i].Handle = StrToInt(lbHandles.Items[lbNomes.ItemIndex]) then
        skServerClientDisconnect(Sender, skServer.Socket.Connections[i]);
    end;
  end;    }

  if lbNomes.Items.Count > 0 then
  begin
    skServer.Socket.Disconnect(StrToInt(lbHandles.Items[lbNomes.ItemIndex]));

    lbHandles.Items.Delete(lbNomes.ItemIndex);
    lbNomes.Items.Delete(lbNomes.ItemIndex);
  end;
end;

procedure TFChatServer.btEnviarClick(Sender: TObject);
begin
  SendToAll('Mensagem do servidor: ' + edMensagem.Text);
end;

procedure TFChatServer.edMensagemKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    btEnviar.Click;
    edMensagem.Clear;
  end;
end;

procedure TFChatServer.FormCreate(Sender: TObject);
begin
  skServer.Active := true;
end;

function TFChatServer.PegaCod(s : String) : Char;
begin
  Result := #0;

  if Length(s) > 0 then
    Result := S[1];
end;

function TFChatServer.PegaTexto(s : String) : String;
begin
  Result := '';

  if Length(s) > 0 then
    Result := Copy(s, 2, Length(s) - 1);
end;

function TFChatServer.PegaNome(ID : HWND) : String;
var
  i : Integer;
begin
  Result := 'NÃOIDENTIFICADO';

  for i := 0 to lbNomes.Items.Count - 1 do
  begin
    if lbHandles.Items[i] = IntToStr(ID) then
    begin
      Result := lbNomes.Items[i];
      Break;
    end;
  end;
end;

procedure TFChatServer.SendToAll(s : String; menos : HWND = 0; bRegistraChat : Boolean = True);
var
  i : Integer;
begin
  if skServer.Socket.ActiveConnections > 0 then
  begin
    for i := 0 to skServer.Socket.ActiveConnections - 1 do
    begin
      if skServer.Socket.Connections[i].Handle <> menos then
        skServer.Socket.Connections[i].SendText(s);
    end;
  end;

  if bRegistraChat then
    mChat.Lines.Add(s);
end;

procedure TFChatServer.SendToUser(sMsg : String; hwdUser : HWND);
var
  i : Integer;
begin
  if skServer.Socket.ActiveConnections > 0 then
  begin
    for i := 0 to skServer.Socket.ActiveConnections - 1 do
    begin
      if skServer.Socket.Connections[i].Handle = hwdUser then
      begin
        skServer.Socket.Connections[i].SendText('>' + sMsg);
        mChat.Lines.Add(sMsg);
        Break;
      end;
    end;
  end;
end;

procedure TFChatServer.skServerClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  lbNomes.Items.Add('');
  lbHandles.Items.Add(IntToStr(Socket.Handle));
end;

procedure TFChatServer.skServerClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
//  ShowMessage('Ocorreu um erro no servidor');
  ErrorCode := 0;
  TrataUsuarioDesconectado(Socket.Handle);
end;

procedure TFChatServer.skServerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  TrataUsuarioDesconectado(Socket.Handle);
end;
       (*
procedure TFChatServer.TrataUsuarioDesconectado(hwdUser : HWND);
var
  i, j, k  : Integer;
  stLista  : TStringList;
  bJaLista : Boolean;
begin
  stLista := TStringList.Create;

  if lbHandles.Items.Count > 0 then
  begin
    j := lbHandles.Items.Count;
    i := 0;

    while i < j do
    begin
      if (lbHandles.Items[i] = IntToStr(hwdUser)) then
      begin
  //      SendToAll(PegaNome(Socket.Handle) + ' acabou de desconectar.', Socket.Handle);
        lbNomes.Items.Delete(i);
        lbHandles.Items.Delete(i);
//        Break;
        j := lbHandles.Items.Count;
        i := 0;
      end
      else
      begin
        bJaLista := False;

        for k := 0 to stLista.Count - 1 do
        begin
          if stLista.Strings[k] = lbNomes.Items[i] + '||' + lbHandles.Items[i] then
          begin
            bJaLista := True;
            Break;
          end;
        end;

        if not bJaLista then
          stLista.Add(lbNomes.Items[i] + '||' + lbHandles.Items[i]);

        Inc(i);
      end;
    end;
         {
    for i := 0 to lbHandles.Items.Count - 1 do
    begin
      if lbHandles.Items[i] = IntToStr(Socket.Handle) then
      begin
  //      SendToAll(PegaNome(Socket.Handle) + ' acabou de desconectar.', Socket.Handle);
        lbNomes.Items.Delete(i);
        lbHandles.Items.Delete(i);
//        Break;
      end
      else
        stLista.Add(lbNomes.Items[i] + '||' + lbHandles.Items[i]);
    end;}
  end;

  if stLista.Count > 0 then
    SendToAll('+' + stLista.Text, 0, False)
  else
    SendToAll('+', 0, False);

  if Assigned(stLista) then
    FreeAndNil(stLista);

//  AtualizaListaClientes;
end;
                      *)

procedure TFChatServer.TrataUsuarioDesconectado(hwdUser : HWND);
var
  i : Integer;
  stHwd,
  stNome : TStringList;
begin
  stHwd  := TStringList.Create;
  stNome := TStringList.Create;

  i := 0;

  while i < lbHandles.Items.Count do
  begin
    if (Trim(lbHandles.Items[i]) <> '') and (lbHandles.Items[i] <> IntToStr(hwdUser)) then
    begin
      stHwd.Add(lbHandles.Items[i]);
      stNome.Add(lbNomes.Items[i]);
    end;

    Inc(i);
  end;

  lbHandles.Items.Clear;
  lbNomes.Items.Clear;

  i := 0;

  while i < stHwd.Count do
  begin
    lbHandles.Items.Add(stHwd.Strings[i]);
    lbNomes.Items.Add(stNome.Strings[i]);

    Inc(i);
  end;

  if Assigned(stHwd) then
    FreeAndNil(stHwd);

  if Assigned(stNome) then
    FreeAndNil(stNome);

  AtualizaListaClientes;
end;

procedure TFChatServer.AtualizaListaClientes;
var
  i       : Integer;
  stLista : TStringList;
begin
  stLista := TStringList.Create;

  for i := 0 to lbHandles.Items.Count - 1 do
    stLista.Add(lbNomes.Items[i] + '||' + lbHandles.Items[i]);

  if stLista.Count > 0 then
    SendToAll('+' + stLista.Text, 0, False)
  else
    SendToAll('+', 0, False);

  if Assigned(stLista) then
    FreeAndNil(stLista);
end;

procedure TFChatServer.skServerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  s, sHandle, sMsg : String;
  i : Integer;
  stLista : TStringList;
begin
  s       := Socket.ReceiveText;
  stLista := TStringList.Create;

  if PegaCod(s) = '+' then
  begin
//    SendToAll(PegaTexto(s) + ' acabou de se conectar.', Socket.Handle);

    for i := 0 to lbHandles.Items.Count - 1 do
    begin
      if lbHandles.Items[i] = IntToStr(Socket.Handle) then
        lbNomes.Items.Insert(i, PegaTexto(s));

      stLista.Add(Trim(lbNomes.Items[i]) + '||' + Trim(lbHandles.Items[i]));
    end;

    if stLista.Count > 0 then
      SendToAll('+' + Trim(stLista.Text), 0, False)
    else
      SendToAll('+', 0, False);
  end
  else if PegaCod(s) = '*' then
  begin
  //  SendToAll(PegaNome(Socket.Handle) + ' ESTÁ CHAMANDO A ATENÇÃO!.', Socket.Handle);
  end
  else if PegaCod(s) = '>' then
  begin
    sHandle := Copy(s, 2, Pos('/hwd', s) - 2);
    sMsg    := Trim(Copy(s, Pos('/hwd', s) + 4, Length(s)));

    SendToUser(sMsg, StrToIntDef(sHandle, 0));
  end;

  if Assigned(stLista) then
    FreeAndNil(stLista);
end;

end.
