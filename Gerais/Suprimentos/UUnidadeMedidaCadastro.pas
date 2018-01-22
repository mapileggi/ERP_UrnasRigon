unit UUnidadeMedidaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFUnidadeMedidaCadastro = class(TFFormCadastro)
    lbcdUnidadeMedida: TLabel;
    lbdeUnidadeMedida: TLabel;
    eddeUnidadeMedida: TDBEdit;
    edcdUnidadeMedida: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FUnidadeMedidaCadastro: TFUnidadeMedidaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFUnidadeMedidaCadastro.GravarRegistro;
begin
  DmERP.GravarUnidadeMedida;
end;

procedure TFUnidadeMedidaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirUnidadeMedida;
end;

initialization
  RegisterClass(TFUnidadeMedidaCadastro);

finalization
  UnRegisterClass(TFUnidadeMedidaCadastro);

end.
