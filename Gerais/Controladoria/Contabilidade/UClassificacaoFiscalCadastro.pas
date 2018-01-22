unit UClassificacaoFiscalCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFClassificacaoFiscalCadastro = class(TFFormCadastro)
    lbcdClassifFiscal: TLabel;
    lbdeClassifFiscal: TLabel;
    eddeClassifFiscal: TDBEdit;
    edcdClassifFiscal: TDBCampoCodigo;
    ednuClassifFiscal: TDBEdit;
    lbnuClassifFiscal: TLabel;
    pcDadosClassifFiscal: TPageControl;
    tsTributacao: TTabSheet;
    tsTaxasIBPT: TTabSheet;
    dsClasFisTaxaIbpt: TDataSource;
    sbTributacao: TScrollBox;
    sbTaxasIBPT: TScrollBox;
    cbflUtilizaIbpt: TDBCheckBox;
    grClasFisTaxaIbpt: TDBGrid;
    lbvlIpi: TLabel;
    lbdeIpiClasse: TLabel;
    lbcdIpiTipo: TLabel;
    lbcdIpiCodigo: TLabel;
    lbcdIpiEnquadramento: TLabel;
    lbcdPisCodigo: TLabel;
    lbcdCofinsCodigo: TLabel;
    lbvlPercMva: TLabel;
    lbnuCest: TLabel;
    lbvlPercIpi: TLabel;
    lbvlPercIcmsReducao: TLabel;
    lbPercPis: TLabel;
    lbvlPercCofins: TLabel;
    lbdeExTipi: TLabel;
    edvlIpi: TDBEdit;
    eddeIpiClasse: TDBEdit;
    edcdIpiTipo: TDBCampoCodigo;
    edcdIpiCodigo: TDBCampoCodigo;
    edcdIpiEnquadramento: TDBCampoCodigo;
    edcdPisCodigo: TDBCampoCodigo;
    edcdCofinsCodigo: TDBCampoCodigo;
    edvlPercMva: TDBEdit;
    cbflCalculaStCnae: TDBCheckBox;
    ednuCest: TDBEdit;
    edvlPercIpi: TDBEdit;
    edvlPercIcmsReducao: TDBEdit;
    vlPercPis: TDBEdit;
    edvlPercCofins: TDBEdit;
    cbflAbatePisCofins: TDBCheckBox;
    cdflImprimeNota: TDBCheckBox;
    cbflUtilizaDnf: TDBCheckBox;
    eddeExTipi: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FClassificacaoFiscalCadastro: TFClassificacaoFiscalCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFClassificacaoFiscalCadastro.FormCreate(Sender: TObject);
begin
  inherited;

  pcDadosClassifFiscal.ActivePage := tsTributacao;
end;

procedure TFClassificacaoFiscalCadastro.GravarRegistro;
begin
  DmERP.GravarClassifFiscal;
end;

procedure TFClassificacaoFiscalCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirClassifFiscal;
end;

initialization
  RegisterClass(TFClassificacaoFiscalCadastro);

finalization
  UnRegisterClass(TFClassificacaoFiscalCadastro);

end.
