unit UAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFAguarde = class(TForm)
    pnLegenda: TPanel;
    imAguarde: TImage;
    lbAguarde: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Animar;
  end;
       (*
type
  TAnimationThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    destructor Destroy; override;
  public
  tela : TFAguarde;
    constructor Create();
    procedure FinishThreadExecution;
  end;
           *)
var
  FAguarde: TFAguarde;

implementation

{$R *.dfm}
           (*
constructor TAnimationThread.Create();
begin
  tela := TFAguarde.Create(Application);
  Synchronize(tela.Show);
  (Tela.imAguarde.Picture.Graphic as TGIFImage).Animate := True;
  Application.ProcessMessages;
  FreeOnterminate := True;
  inherited Create(True);
end;

destructor TAnimationThread.Destroy;
begin
  tela.Close;

  inherited Destroy;
end;

procedure TAnimationThread.Execute;
begin
  while not Terminated do
    Synchronize(tela.Animar);
end;

procedure TAnimationThread.FinishThreadExecution;
begin
  Synchronize(tela.close);
  Terminate;
end;
              *)
///
procedure TFAguarde.Animar;
begin
  Application.ProcessMessages;
end;

procedure TFAguarde.FormShow(Sender: TObject);
begin
  (imAguarde.Picture.Graphic as TGIFImage).Animate := True;
  Application.ProcessMessages;
end;

end.

