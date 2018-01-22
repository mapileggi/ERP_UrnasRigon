unit UAgenciaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB;

type
  TFAgenciaCadastro = class(TFFormCadastro)
    lbcdAgencia: TLabel;
    lbdeCnpj: TLabel;
    lbdeAgencia: TLabel;
    lbcdCidade: TLabel;
    lbnuFone1: TLabel;
    lbnuFone2: TLabel;
    lbnuFax: TLabel;
    lbnuCep: TLabel;
    lbdeEndereco: TLabel;
    lbnuEndereco: TLabel;
    lbdeComplemento: TLabel;
    lbdeBairro: TLabel;
    eddeCnpj: TDBEdit;
    eddeAgencia: TDBEdit;
    edcdCidade: TDBCampoCodigo;
    edcdAgencia: TDBCampoCodigo;
    ednuFone1: TDBEdit;
    ednuFone2: TDBEdit;
    ednuFax: TDBEdit;
    ednuCep: TDBEdit;
    dedeEndereco: TDBEdit;
    ednuEndereco: TDBEdit;
    eddeComplemento: TDBEdit;
    eddeBairro: TDBEdit;
    lbcdBanco: TLabel;
    edcdBanco: TDBCampoCodigo;
    lbnuDigito: TLabel;
    ednuDigito: TDBEdit;
    lbnuAgencia: TLabel;
    ednuAgencia: TDBEdit;
    procedure ednuCepExit(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FAgenciaCadastro: TFAgenciaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFAgenciaCadastro.GravarRegistro;
begin
  DmERP.GravarAgencia;
end;

procedure TFAgenciaCadastro.ednuCepExit(Sender: TObject);
var
  sdeEndereco,
  sdeComplemento,
  sdeBairro : String;
  icdCidade : Integer;
begin
  inherited;

  sdeEndereco    := '';
  sdeComplemento := '';
  sdeBairro      := '';
  icdCidade      := 0;

  if DmERP.qyAgencia.State in dsEditModes then
  begin
    DmERP.CarregarInfoCep(DmERP.qyAgencia.FieldByName('nuCep').AsString,
                          sdeEndereco,
                          sdeComplemento,
                          sdeBairro,
                          icdCidade
                         );

    DmERP.qyAgencia.FieldByName('deEndereco').AsString    := sdeEndereco;
    DmERP.qyAgencia.FieldByName('deComplemento').AsString := sdeComplemento;
    DmERP.qyAgencia.FieldByName('deBairro').AsString      := sdeBairro;

    if icdCidade > 0 then
      DmERP.qyAgencia.FieldByName('cdCidade').AsInteger := icdCidade;
  end;
end;

procedure TFAgenciaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirAgencia;
end;

initialization
  RegisterClass(TFAgenciaCadastro);

finalization
  UnRegisterClass(TFAgenciaCadastro);

end.
