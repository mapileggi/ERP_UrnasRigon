unit URepresentanteCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, UDBCampoCodigo, Data.DB,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFRepresentanteCadastro = class(TFFormCadastro)
    edcdRepresentante: TDBCampoCodigo;
    edcdCidade: TDBCampoCodigo;
    lbcdRepresentante: TLabel;
    lbdeCpfCnpj: TLabel;
    lbdeRazaoSocial: TLabel;
    lbnmFantasia: TLabel;
    lbflFisJur: TLabel;
    lbcdCidade: TLabel;
    lbnuFone1: TLabel;
    lbnuFone2: TLabel;
    lbnuCelular: TLabel;
    lbnuFax: TLabel;
    lbdeEmail: TLabel;
    lbnmPessoaContato: TLabel;
    lbnuCep: TLabel;
    lbdeEndereco: TLabel;
    lbnuEndereco: TLabel;
    lbdeComplemento: TLabel;
    lbdeBairro: TLabel;
    lbdeObservacoes: TLabel;
    lbvlPercComissao: TLabel;
    eddeCpfCnpj: TDBEdit;
    eddeRazaoSocial: TDBEdit;
    ednmFantasia: TDBEdit;
    cbflFisJur: TDBComboBox;    
    ednuFone1: TDBEdit;
    ednuFone2: TDBEdit;
    ednuCelular: TDBEdit;
    ednuFax: TDBEdit;
    eddeEmail: TDBEdit;
    ednmPessoaContato: TDBEdit;
    ednuCep: TDBEdit;
    dedeEndereco: TDBEdit;
    ednuEndereco: TDBEdit;
    eddeComplemento: TDBEdit;
    eddeBairro: TDBEdit;
    mdeObservacoes: TDBMemo;
    edvlPercComissao: TDBEdit;
    cbflAtivo: TDBCheckBox;
    procedure cbflFisJurExit(Sender: TObject);
    procedure ednuCepExit(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FRepresentanteCadastro: TFRepresentanteCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFRepresentanteCadastro.GravarRegistro;
begin
  DmERP.GravarRepresentante;
end;

procedure TFRepresentanteCadastro.cbflFisJurExit(Sender: TObject);
begin
  inherited;

  if DmERP.qyRepresentante.FieldByName('flFisJur').AsString = 'J' then
    DmERP.qyRepresentante.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    DmERP.qyRepresentante.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';
end;

procedure TFRepresentanteCadastro.ednuCepExit(Sender: TObject);
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

  if DmERP.qyRepresentante.State in dsEditModes then
  begin
    DmERP.CarregarInfoCep(DmERP.qyRepresentante.FieldByName('nuCep').AsString,
                          sdeEndereco,
                          sdeComplemento,
                          sdeBairro,
                          icdCidade
                         );

    DmERP.qyRepresentante.FieldByName('deEndereco').AsString    := sdeEndereco;
    DmERP.qyRepresentante.FieldByName('deComplemento').AsString := sdeComplemento;
    DmERP.qyRepresentante.FieldByName('deBairro').AsString      := sdeBairro;

    if icdCidade > 0 then
      DmERP.qyRepresentante.FieldByName('cdCidade').AsInteger := icdCidade;
  end;
end;

procedure TFRepresentanteCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirRepresentante;
end;

initialization
  RegisterClass(TFRepresentanteCadastro);

finalization
  UnRegisterClass(TFRepresentanteCadastro);

end.
