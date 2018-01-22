unit UItemGrupoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFItemGrupoCadastro = class(TFFormCadastro)
    lbcdItemGrupo: TLabel;
    lbdeItemGrupo: TLabel;
    eddeItemGrupo: TDBEdit;
    edcdItemGrupo: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FItemGrupoCadastro: TFItemGrupoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFItemGrupoCadastro.GravarRegistro;
begin
  DmERP.GravarItemGrupo;
end;

procedure TFItemGrupoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirItemGrupo;
end;

initialization
  RegisterClass(TFItemGrupoCadastro);

finalization
  UnRegisterClass(TFItemGrupoCadastro);

end.
