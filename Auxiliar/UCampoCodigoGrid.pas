unit UCampoCodigoGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, Vcl.Imaging.GIFImg, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls, UDBCampoCodigo;

type
  TFCampoCodigoGrid = class(TForm)
    edcdCampoCodigo: TDBCampoCodigo;
    lbcdCampoCodigo: TLabel;
    btOk: TButton;
    procedure btOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCampoCodigoGrid: TFCampoCodigoGrid;

implementation

{$R *.dfm}

procedure TFCampoCodigoGrid.btOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFCampoCodigoGrid.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btOk.Click;
end;

procedure TFCampoCodigoGrid.FormShow(Sender: TObject);
begin
  if Trim(edcdCampoCodigo.ERPEdCampoChaveText) <> '' then
    edcdCampoCodigo.ValidaCampoChave(edcdCampoCodigo.ERPEdCampoChaveText);

  edcdCampoCodigo.ERPEdCampoChaveSetFocus;
end;

end.

