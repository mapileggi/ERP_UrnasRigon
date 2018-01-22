unit UFornecedorTipoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFFornecedorTipoCadastro = class(TFFormCadastro)
    lbcdFornecedorTipo: TLabel;
    lbdeFornecedorTipo: TLabel;
    eddeFornecedorTipo: TDBEdit;
    edcdFornecedorTipo: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FFornecedorTipoCadastro: TFFornecedorTipoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFFornecedorTipoCadastro.GravarRegistro;
begin
  DmERP.GravarFornecedorTipo;
end;

procedure TFFornecedorTipoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirFornecedorTipo;
end;

initialization
  RegisterClass(TFFornecedorTipoCadastro);

finalization
  UnRegisterClass(TFFornecedorTipoCadastro);

end.
