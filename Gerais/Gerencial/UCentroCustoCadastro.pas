unit UCentroCustoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFCentroCustoCadastro = class(TFFormCadastro)
    lbcdCentroCusto: TLabel;
    lbdeCentroCusto: TLabel;
    eddeCentroCusto: TDBEdit;
    edcdCentroCusto: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FCentroCustoCadastro: TFCentroCustoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFCentroCustoCadastro.GravarRegistro;
begin
  DmERP.GravarCentroCusto;
end;

procedure TFCentroCustoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirCentroCusto;
end;

initialization
  RegisterClass(TFCentroCustoCadastro);

finalization
  UnRegisterClass(TFCentroCustoCadastro);

end.
