unit UMotoristaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFMotoristaCadastro = class(TFFormCadastro)
    lbcdMotorista: TLabel;
    lbnmMotorista: TLabel;
    ednmMotorista: TDBEdit;
    edcdMotorista: TDBCampoCodigo;
    lbdeCpf: TLabel;
    eddeCpf: TDBEdit;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FMotoristaCadastro: TFMotoristaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFMotoristaCadastro.GravarRegistro;
begin
  DmERP.GravarMotorista;
end;

procedure TFMotoristaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirMotorista;
end;

initialization
  RegisterClass(TFMotoristaCadastro);

finalization
  UnRegisterClass(TFMotoristaCadastro);

end.
