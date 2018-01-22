unit USetorCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFSetorCadastro = class(TFFormCadastro)
    lbcdSetor: TLabel;
    lbdeSetor: TLabel;
    eddeSetor: TDBEdit;
    edcdSetor: TDBCampoCodigo;
    cbflControlaBaixa: TDBCheckBox;
    lbcdSetorAnterior: TLabel;
    edcdSetorAnterior: TDBCampoCodigo;
    cbflEhSetorExpedicao: TDBCheckBox;
    cbflEhSetorEmbalagem: TDBCheckBox;
    cbflEhSetorMontagem: TDBCheckBox;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FSetorCadastro: TFSetorCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFSetorCadastro.GravarRegistro;
begin
  DmERP.GravarSetor;
end;

procedure TFSetorCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirSetor;
end;

initialization
  RegisterClass(TFSetorCadastro);

finalization
  UnRegisterClass(TFSetorCadastro);

end.
