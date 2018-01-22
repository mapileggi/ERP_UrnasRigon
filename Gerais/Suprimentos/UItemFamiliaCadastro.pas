unit UItemFamiliaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFItemFamiliaCadastro = class(TFFormCadastro)
    lbcdItemFamilia: TLabel;
    lbdeItemFamilia: TLabel;
    eddeItemFamilia: TDBEdit;
    edcdItemFamilia: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FItemFamiliaCadastro: TFItemFamiliaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFItemFamiliaCadastro.GravarRegistro;
begin
  DmERP.GravarItemFamilia;
end;

procedure TFItemFamiliaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirItemFamilia;
end;

initialization
  RegisterClass(TFItemFamiliaCadastro);

finalization
  UnRegisterClass(TFItemFamiliaCadastro);

end.
