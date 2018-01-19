unit UMostrarImg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFMostrarImg = class(TForm)
    pnImagem: TPanel;
    pnBotao: TPanel;
    btOk: TButton;
    imImagem: TImage;
    procedure btOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    FsPathImg : String;
  end;

var
  FMostrarImg: TFMostrarImg;

implementation

{$R *.dfm}

procedure TFMostrarImg.btOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFMostrarImg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btOk.Click;
end;

procedure TFMostrarImg.FormShow(Sender: TObject);
begin
  imImagem.Picture := nil;

  if FileExists(FsPathImg) then
  begin
  //start
    imImagem.Picture.LoadFromFile(FsPathImg);
  //stop
  end;

  if (btOk.Enabled) and (btOk.Visible) and (btOk.CanFocus) then
    btOk.SetFocus;
end;

end.

