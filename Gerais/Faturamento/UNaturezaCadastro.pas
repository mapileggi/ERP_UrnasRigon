unit UNaturezaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  UDBDateTime, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo, UBarraBotoesItens,
  Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFNaturezaCadastro = class(TFFormCadastro)
    lbcdNatureza: TLabel;
    lbdeNatureza: TLabel;
    lbNaturezaFiscal: TLabel;
    edcdNatureza: TDBCampoCodigo;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbnmUsuAlt: TLabel;
    eddeNatureza: TDBEdit;
    edNaturezaFiscal: TDBEdit;
    pcDados: TPageControl;
    tsFaturamento: TTabSheet;
    tsOutros: TTabSheet;
    tsParametrosContabeis: TTabSheet;
    sbParametrosContabeis: TScrollBox;
    sbOutros: TScrollBox;
    sbFaturamento: TScrollBox;
    gbParametros: TGroupBox;
    lbflConsignacao: TLabel;
    cbflNaturezaTipo: TDBCheckBox;
    cbflDentroEstado: TDBCheckBox;
    cbflExportacao: TDBCheckBox;
    cbflDrawback: TDBCheckBox;
    cbflDevolucao: TDBCheckBox;
    cbflDevolucaoOutraOper: TDBCheckBox;
    cbflVendaFutura: TDBCheckBox;
    cbflOperacaoTriangular: TDBCheckBox;
    cbflBonificacao: TDBCheckBox;
    cbflNaturezaServico: TDBCheckBox;
    cbflNaturezaTransporte: TDBCheckBox;
    cbflVendaOrdemSemValor: TDBCheckBox;
    cbflVendaOrgaoPublico: TDBCheckBox;
    edflConsignacao: TDBCampoCodigo;
    gbIPI: TGroupBox;
    lbcdIpiTipo: TLabel;
    edcdIpiTipo: TDBCampoCodigo;
    cbflIpiIncideIcms: TDBCheckBox;
    cbflIpiIncidePisCofins: TDBCheckBox;
    cbflIpiCred50Perc: TDBCheckBox;
    gbICMS: TGroupBox;
    lbcdIcmsTipo: TLabel;
    lbcdIcmsSitTrib: TLabel;
    lbcdIcmsSitTribSimples: TLabel;
    lbflIcmsCalcSubstTrib: TLabel;
    lbvlIcmsPercReducaoSubst: TLabel;
    lbflIcmsReducaoTipo: TLabel;
    lbvlIcmsReducaoPerc: TLabel;
    lbvlIcmsDesconto: TLabel;
    edcdIcmsTipo: TDBCampoCodigo;
    edcdIcmsSitTrib: TDBCampoCodigo;
    edcdIcmsSitTribSimples: TDBCampoCodigo;
    cbflIcmsCalcPartSimples: TDBCheckBox;
    cbflIcmsMsgAprovCred: TDBCheckBox;
    edflIcmsCalcSubstTrib: TDBCampoCodigo;
    edvlIcmsPercReducaoSubst: TDBEdit;
    edflIcmsReducaoTipo: TDBCampoCodigo;
    edvlIcmsReducaoPerc: TDBEdit;
    cbflIcmsCalcStUsoCon: TDBCheckBox;
    edvlIcmsDesconto: TDBEdit;
    cbflIcmsDebCreLivros: TDBCheckBox;
    lbcdPisTipo: TLabel;
    lbcdCofinsTipo: TLabel;
    lbcdContribSocialTipo: TLabel;
    lbcdImpostoRendaTipo: TLabel;
    lbcdOperSisdeclara: TLabel;
    cbflMovFinanceiro: TDBCheckBox;
    cbflMovFiscal: TDBCheckBox;
    cbflFaturamento: TDBCheckBox;
    cbflMovEstoque: TDBCheckBox;
    cbflEstoqueTerceiros: TDBCheckBox;
    cbflEstoqueArmazenagem: TDBCheckBox;
    cbflEntraCalcRentab: TDBCheckBox;
    cbflAbateRentab: TDBCheckBox;
    cbflConsideraSisdec: TDBCheckBox;
    cbflMsgLeiTransp: TDBCheckBox;
    edcdPisTipo: TDBCampoCodigo;
    edcdCofinsTipo: TDBCampoCodigo;
    edcdContribSocialTipo: TDBCampoCodigo;
    edcdImpostoRendaTipo: TDBCampoCodigo;
    cbflUtilizaControleTerc: TDBCheckBox;
    cbflGeraValorCalcBonif: TDBCheckBox;
    edcdOperSisdeclara: TDBCampoCodigo;
    cbflMovSelos: TDBCheckBox;
    cbflOperSemCredSt: TDBCheckBox;
    cbflOperSemCredIpi: TDBCheckBox;
    lbcdPisBase: TLabel;
    lbcdCofinsBase: TLabel;
    lbcdSimplesBase: TLabel;
    lbvlPercPis: TLabel;
    lbvlPercCofins: TLabel;
    lbvlPercAbatCofinsTitNf: TLabel;
    lbvlPercAbatPisTitNf: TLabel;
    lbflAbateRetencao: TLabel;
    lbvlPercIcms: TLabel;
    lbcdIpiCodigo: TLabel;
    lbcdIpiEnquadramento: TLabel;
    lbcdPisCodigo: TLabel;
    lbcdCofinsCodigo: TLabel;
    edcdPisBase: TDBCampoCodigo;
    edcdCofinsBase: TDBCampoCodigo;
    edcdSimplesBase: TDBCampoCodigo;
    cbflIsencaoPisCofins: TDBCheckBox;
    edvlPercPis: TDBEdit;
    edvlPercCofins: TDBEdit;
    cbflRetencaoPisCofinsCsll: TDBCheckBox;
    cbflAbatePisCofinsTitNf: TDBCheckBox;
    edvlPercAbatPisTitNf: TDBEdit;
    edvlPercAbatCofinsTitNf: TDBEdit;
    cbflProdMonofasSn: TDBCheckBox;
    edflAbateRetencao: TDBCampoCodigo;
    edvlPercIcms: TDBEdit;
    cbflDiferencaIcms: TDBCheckBox;
    edcdIpiCodigo: TDBCampoCodigo;
    edcdIpiEnquadramento: TDBCampoCodigo;
    edcdPisCodigo: TDBCampoCodigo;
    edcdCofinsCodigo: TDBCampoCodigo;
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FNaturezaCadastro: TFNaturezaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFNaturezaCadastro.FormCreate(Sender: TObject);
begin
  inherited;

  pcDados.ActivePage := tsFaturamento;
end;

procedure TFNaturezaCadastro.GravarRegistro;
begin
  DmERP.GravarNatureza;
end;

procedure TFNaturezaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirNatureza;
end;

initialization
  RegisterClass(TFNaturezaCadastro);

finalization
  UnRegisterClass(TFNaturezaCadastro);

end.
