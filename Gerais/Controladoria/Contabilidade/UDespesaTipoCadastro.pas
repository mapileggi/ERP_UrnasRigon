unit UDespesaTipoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFDespesaTipoCadastro = class(TFFormCadastro)
    lbcdDespesaTipo: TLabel;
    lbdeDespesaTipo: TLabel;
    eddeDespesaTipo: TDBEdit;
    edcdDespesaTipo: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FDespesaTipoCadastro: TFDespesaTipoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFDespesaTipoCadastro.GravarRegistro;
begin
  DmERP.GravarDespesaTipo;
end;

procedure TFDespesaTipoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirDespesaTipo;
end;

initialization
  RegisterClass(TFDespesaTipoCadastro);

finalization
  UnRegisterClass(TFDespesaTipoCadastro);

end.
