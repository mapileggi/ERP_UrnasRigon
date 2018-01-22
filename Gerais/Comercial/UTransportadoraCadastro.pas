unit UTransportadoraCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB;

type
  TFTransportadoraCadastro = class(TFFormCadastro)
    lbcdTransportadora: TLabel;
    lbdeCpfCnpj: TLabel;
    lbdeRazaoSocial: TLabel;
    lbnmFantasia: TLabel;
    lbflFisJur: TLabel;
    lbcdCidade: TLabel;
    lbnuInscEst: TLabel;
    lbnuFone1: TLabel;
    lbnuFone2: TLabel;
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
    edcdTransportadora: TDBCampoCodigo;
    cbflIsentoInscEst: TDBCheckBox;
    denuInscEst: TDBEdit;
    ednuFone1: TDBEdit;
    ednuFone2: TDBEdit;
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
  FTransportadoraCadastro: TFTransportadoraCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFTransportadoraCadastro.GravarRegistro;
begin
  DmERP.GravarTransportadora;
end;

procedure TFTransportadoraCadastro.ednuCepExit(Sender: TObject);
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

  if DmERP.qyTransportadora.State in dsEditModes then
  begin
    DmERP.CarregarInfoCep(DmERP.qyTransportadora.FieldByName('nuCep').AsString,
                          sdeEndereco,
                          sdeComplemento,
                          sdeBairro,
                          icdCidade
                         );

    DmERP.qyTransportadora.FieldByName('deEndereco').AsString    := sdeEndereco;
    DmERP.qyTransportadora.FieldByName('deComplemento').AsString := sdeComplemento;
    DmERP.qyTransportadora.FieldByName('deBairro').AsString      := sdeBairro;

    if icdCidade > 0 then
      DmERP.qyTransportadora.FieldByName('cdCidade').AsInteger := icdCidade;
  end;
end;

procedure TFTransportadoraCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirTransportadora;
end;

procedure TFTransportadoraCadastro.cbflFisJurExit(Sender: TObject);
begin
  inherited;

  if DmERP.qyTransportadora.FieldByName('flFisJur').AsString = 'J' then
    DmERP.qyTransportadora.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    DmERP.qyTransportadora.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';
end;

initialization
  RegisterClass(TFTransportadoraCadastro);

finalization
  UnRegisterClass(TFTransportadoraCadastro);

end.
