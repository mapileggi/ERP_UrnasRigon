program prjChatServer;

uses
  Vcl.Forms,
  UChatServer in 'UChatServer.pas' {FChatServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Servidor Chat ERP';
  Application.CreateForm(TFChatServer, FChatServer);
  Application.Run;
end.
