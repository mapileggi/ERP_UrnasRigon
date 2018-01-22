unit UTipoPatrimonioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFTipoPatrimonioCadastro = class(TFFormCadastro)
    lbcdPatrimonioTipo: TLabel;
    lbdePatrimonioTipo: TLabel;
    eddePatrimonioTipo: TDBEdit;
    edcdPatrimonioTipo: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FTipoPatrimonioCadastro: TFTipoPatrimonioCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFTipoPatrimonioCadastro.GravarRegistro;
begin
  DmERP.GravarTipoPatrimonio;
end;

procedure TFTipoPatrimonioCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirTipoPatrimonio;
end;

initialization
  RegisterClass(TFTipoPatrimonioCadastro);

finalization
  UnRegisterClass(TFTipoPatrimonioCadastro);

end.
