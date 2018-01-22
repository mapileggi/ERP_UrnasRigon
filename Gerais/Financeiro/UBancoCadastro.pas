unit UBancoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFBancoCadastro = class(TFFormCadastro)
    lbcdBanco: TLabel;
    lbdeBanco: TLabel;
    eddeBanco: TDBEdit;
    edcdBanco: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FBancoCadastro: TFBancoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFBancoCadastro.GravarRegistro;
begin
  DmERP.GravarBanco;
end;

procedure TFBancoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirBanco;
end;

initialization
  RegisterClass(TFBancoCadastro);

finalization
  UnRegisterClass(TFBancoCadastro);

end.
