unit UFrAguarde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.GIFImg;

type
  TFrAguarde = class(TFrame)
    pnLegenda: TPanel;
    lbAguarde: TLabel;
    imAguarde: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
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
    frAgr : TFrAguarde;

    constructor Create(F_Parent : TWinControl);
    procedure Animar;
  end;          *)

implementation

{$R *.dfm}

             (*
////////////////////////////////////////////////////////////////////////////////
constructor TAnimationThread.Create(F_Parent : TWinControl);
begin
  frAgr         := TFrAguarde.Create(Application);
  frAgr.Parent  := F_Parent;
  frAgr.Visible := True;
  frAgr.BringToFront;
  (frAgr.imAguarde.Picture.Graphic as TGIFImage).Animate := True;
  Application.ProcessMessages;
  FreeOnTerminate := True;
  inherited Create(True);
end;

destructor TAnimationThread.Destroy;
begin
  frAgr.imAguarde.Visible := False;
  FreeAndNil(frAgr);
  inherited Destroy;
end;

procedure TAnimationThread.Execute;
begin
  while not Terminated do
    Synchronize(Animar);
end;

procedure TAnimationThread.Animar;
begin
  (frAgr.imAguarde.Picture.Graphic as TGIFImage).Animate := True;
  Application.ProcessMessages;
end;      *)

end.
