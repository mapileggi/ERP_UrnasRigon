unit UMensagemAviso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls;

type
  TFMensagemAviso = class(TForm)
    pnMensagem: TPanel;
    pnBotao: TPanel;
    btOk: TButton;
    mMensagem: TMemo;
    procedure btOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemAviso: TFMensagemAviso;

implementation

{$R *.dfm}

procedure TFMensagemAviso.btOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFMensagemAviso.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btOk.Click;
end;

procedure TFMensagemAviso.FormShow(Sender: TObject);
begin
  if (mMensagem.Enabled) and (mMensagem.Visible) and (mMensagem.CanFocus) then
    mMensagem.SetFocus;
end;

end.

