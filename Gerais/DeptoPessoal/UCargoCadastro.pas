unit UCargoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFCargoCadastro = class(TFFormCadastro)
    lbcdCargo: TLabel;
    lbdeCargo: TLabel;
    eddeCargo: TDBEdit;
    edcdCargo: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FCargoCadastro: TFCargoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFCargoCadastro.GravarRegistro;
begin
  DmERP.GravarCargo;
end;

procedure TFCargoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirCargo;
end;

initialization
  RegisterClass(TFCargoCadastro);

finalization
  UnRegisterClass(TFCargoCadastro);

end.
