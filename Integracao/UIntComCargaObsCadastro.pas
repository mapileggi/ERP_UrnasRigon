unit UIntComCargaObsCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo;

type
  TFIntComCargaObsCadastro = class(TFFormCadastro)
    lbcdCarga: TLabel;
    edcdCarga: TDBCampoCodigo;
    lbdeObservacao: TLabel;
    mdeObservacao: TDBMemo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FIntComCargaObsCadastro: TFIntComCargaObsCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFIntComCargaObsCadastro.GravarRegistro;
begin
  DmERP.GravarObsCarga;
end;

procedure TFIntComCargaObsCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirObsCarga;
end;

initialization
  RegisterClass(TFIntComCargaObsCadastro);

finalization
  UnRegisterClass(TFIntComCargaObsCadastro);

end.
