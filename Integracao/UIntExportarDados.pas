unit UIntExportarDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Error,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, DateUtils;

type
  TFIntExportarDados = class(TForm)
    btSalvar: TBitBtn;
    btFechar: TBitBtn;
    mLog: TMemo;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FIntExportarDados: TFIntExportarDados;

implementation

{$R *.dfm}
{$R Icones.res}

uses
  uDmIntegracao, uDmERP, UTelaInicial, uFuncoes;

procedure TFIntExportarDados.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  if DmIntegracao.qyCliente.Active then
    DmIntegracao.qyCliente.Close;

  DmIntegracao.qyCliente.MacroByName('filtro').Clear;

  DmIntegracao.fdConnInteg.Connected := False;

  Tab := FTelaInicial.pcTelas.ActivePage;

  if Assigned(Tab) then
  begin
    Tab.Parent      := nil;
    Tab.PageControl := nil;

    FreeAndNil(Tab);
  end;

  FTelaInicial.pcTelas.Visible   := FTelaInicial.pcTelas.PageCount > 0;
  FTelaInicial.imLogoERP.Visible := not FTelaInicial.pcTelas.Visible;
end;

procedure TFIntExportarDados.FormCreate(Sender: TObject);
begin
  btSalvar.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance, 'IMGBTFECHAR_32X32');
end;

initialization
  RegisterClass(TFIntExportarDados);

finalization
  UnRegisterClass(TFIntExportarDados);

end.
