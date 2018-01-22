unit UContaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB;

type
  TFContaCadastro = class(TFFormCadastro)
    lbcdConta: TLabel;
    lbdeConta: TLabel;
    eddeConta: TDBEdit;
    edcdConta: TDBCampoCodigo;
    lbnuDigito: TLabel;
    ednuDigito: TDBEdit;
    lbcdAgencia: TLabel;
    edcdAgencia: TDBCampoCodigo;
    lbnuConta: TLabel;
    ednuConta: TDBEdit;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FContaCadastro: TFContaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFContaCadastro.GravarRegistro;
begin
  DmERP.GravarConta;
end;

procedure TFContaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirConta;
end;

initialization
  RegisterClass(TFContaCadastro);

finalization
  UnRegisterClass(TFContaCadastro);

end.
