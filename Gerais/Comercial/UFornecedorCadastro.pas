unit UFornecedorCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFFornecedorCadastro = class(TFFormCadastro)
    lbcdFornecedor: TLabel;
    lbdeCpfCnpj: TLabel;
    lbdeRazaoSocial: TLabel;
    lbnmFantasia: TLabel;
    lbflFisJur: TLabel;
    lbcdCidade: TLabel;
    lbnuInscEst: TLabel;
    lbnuIndInscEst: TLabel;
    lbnuFone1: TLabel;
    lbnuFone2: TLabel;
    lbnuCelular: TLabel;
    lbnuFax: TLabel;
    lbdeEmail: TLabel;
    lbdeEmailNfe: TLabel;
    lbnmPessoaContato: TLabel;
    lbnuCep: TLabel;
    lbdeEndereco: TLabel;
    lbnuEndereco: TLabel;
    lbdeComplemento: TLabel;
    lbdeBairro: TLabel;
    lbdeObservacoes: TLabel;
    eddeCpfCnpj: TDBEdit;
    eddeRazaoSocial: TDBEdit;
    ednmFantasia: TDBEdit;
    cbflFisJur: TDBComboBox;
    edcdCidade: TDBCampoCodigo;
    edcdFornecedor: TDBCampoCodigo;
    cbflIsentoInscEst: TDBCheckBox;
    denuInscEst: TDBEdit;
    ednuIndInscEst: TDBCampoCodigo;
    ednuFone1: TDBEdit;
    ednuFone2: TDBEdit;
    ednuCelular: TDBEdit;
    ednuFax: TDBEdit;
    eddeEmail: TDBEdit;
    eddeEmailNfe: TDBEdit;
    ednmPessoaContato: TDBEdit;
    ednuCep: TDBEdit;
    dedeEndereco: TDBEdit;
    ednuEndereco: TDBEdit;
    eddeComplemento: TDBEdit;
    eddeBairro: TDBEdit;
    mdeObservacoes: TDBMemo;
    lbcdFornecedorTipo: TLabel;
    edcdFornecedorTipo: TDBCampoCodigo;
    cbflAtivo: TDBCheckBox;
    lbdeHomePage: TLabel;
    eddeHomePage: TDBEdit;
    lbcdMunicipio: TLabel;
    edcdMunicipio: TDBEdit;
    procedure cbflFisJurExit(Sender: TObject);
    procedure ednuCepExit(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FFornecedorCadastro: TFFornecedorCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFFornecedorCadastro.GravarRegistro;
begin
  DmERP.GravarFornecedor;
end;

procedure TFFornecedorCadastro.ednuCepExit(Sender: TObject);
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

  if DmERP.qyFornecedor.State in dsEditModes then
  begin
    DmERP.CarregarInfoCep(DmERP.qyFornecedor.FieldByName('nuCep').AsString,
                          sdeEndereco,
                          sdeComplemento,
                          sdeBairro,
                          icdCidade
                         );

    DmERP.qyFornecedor.FieldByName('deEndereco').AsString    := sdeEndereco;
    DmERP.qyFornecedor.FieldByName('deComplemento').AsString := sdeComplemento;
    DmERP.qyFornecedor.FieldByName('deBairro').AsString      := sdeBairro;

    if icdCidade > 0 then
      DmERP.qyFornecedor.FieldByName('cdCidade').AsInteger := icdCidade;
  end;
end;

procedure TFFornecedorCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirFornecedor;
end;

procedure TFFornecedorCadastro.cbflFisJurExit(Sender: TObject);
begin
  inherited;

  if DmERP.qyFornecedor.FieldByName('flFisJur').AsString = 'J' then
    DmERP.qyFornecedor.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    DmERP.qyFornecedor.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';
end;

initialization
  RegisterClass(TFFornecedorCadastro);

finalization
  UnRegisterClass(TFFornecedorCadastro);

end.
