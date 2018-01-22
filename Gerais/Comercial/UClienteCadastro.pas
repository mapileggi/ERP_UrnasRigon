unit UClienteCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB;

type
  TFClienteCadastro = class(TFFormCadastro)
    lbcdCliente: TLabel;
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
    edcdCliente: TDBCampoCodigo;
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
    lbcdRepresentante: TLabel;
    edcdRepresentante: TDBCampoCodigo;
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
  FClienteCadastro: TFClienteCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFClienteCadastro.GravarRegistro;
begin
  DmERP.GravarCliente;
end;

procedure TFClienteCadastro.ednuCepExit(Sender: TObject);
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

  if DmERP.qyCliente.State in dsEditModes then
  begin
    DmERP.CarregarInfoCep(DmERP.qyCliente.FieldByName('nuCep').AsString,
                          sdeEndereco,
                          sdeComplemento,
                          sdeBairro,
                          icdCidade
                         );

    DmERP.qyCliente.FieldByName('deEndereco').AsString    := sdeEndereco;
    DmERP.qyCliente.FieldByName('deComplemento').AsString := sdeComplemento;
    DmERP.qyCliente.FieldByName('deBairro').AsString      := sdeBairro;

    if icdCidade > 0 then
      DmERP.qyCliente.FieldByName('cdCidade').AsInteger := icdCidade;
  end;
end;

procedure TFClienteCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirCliente;
end;

procedure TFClienteCadastro.cbflFisJurExit(Sender: TObject);
begin
  inherited;

  if DmERP.qyCliente.FieldByName('flFisJur').AsString = 'J' then
    DmERP.qyCliente.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    DmERP.qyCliente.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';
end;

initialization
  RegisterClass(TFClienteCadastro);

finalization
  UnRegisterClass(TFClienteCadastro);

end.
