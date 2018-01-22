unit UItemSubGrupoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TFItemSubGrupoCadastro = class(TFFormCadastro)
    lbcdItemGrupo: TLabel;
    lbdeItemSubGrupo: TLabel;
    eddeItemSubGrupo: TDBEdit;
    edcdItemGrupo: TDBCampoCodigo;
    grDados: TDBGrid;
    lbcdItemSubGrupo: TLabel;
    edcdItemSubGrupo: TDBEdit;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FItemSubGrupoCadastro: TFItemSubGrupoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFItemSubGrupoCadastro.GravarRegistro;
begin
  DmERP.GravarItemSubGrupo;
end;

procedure TFItemSubGrupoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirItemSubGrupo;
end;

initialization
  RegisterClass(TFItemSubGrupoCadastro);

finalization
  UnRegisterClass(TFItemSubGrupoCadastro);

end.
