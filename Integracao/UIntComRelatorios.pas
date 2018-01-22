unit UIntComRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Stan.Error,
  Data.DB, MemDS, VirtualTable, frxClass, frxDBSet, Vcl.Buttons, frxBarcode,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DateUtils, Vcl.ExtCtrls, ComObj, ShellAPI,
  UDBCampoCodigo, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, frxExportXLS, frxExportXLSX,
  frxExportMail, frxExportPDF, Vcl.Imaging.GIFImg;

type
  TFIntComRelatorios = class(TForm)
    pcRelatorios: TPageControl;
    tsPedidos: TTabSheet;
    vtEtiqueta: TVirtualTable;
    vtEtiquetadtEmissao: TDateTimeField;
    vtEtiquetadeCidade: TStringField;
    vtEtiquetasgUf: TStringField;
    vtEtiquetadeRazaoSocial: TStringField;
    vtEtiquetadeFantasia: TStringField;
    vtEtiquetanuPedido: TIntegerField;
    vtEtiquetacdRep: TIntegerField;
    vtEtiquetadeTipoAlca: TStringField;
    vtEtiquetadeAdorno: TStringField;
    vtEtiquetadeChaveta: TStringField;
    vtEtiquetadeForracao: TStringField;
    vtEtiquetadeImagem: TStringField;
    vtEtiquetaflAlcaPadrao: TStringField;
    vtEtiquetaflAdornoPadrao: TStringField;
    vtEtiquetaflChavetaPadrao: TStringField;
    vtEtiquetaflForracaoPadrao: TStringField;
    vtEtiquetaseq: TIntegerField;
    vtEtiquetanuTotItens: TIntegerField;
    vtEtiquetadeCor: TStringField;
    vtPedido: TVirtualTable;
    vtPedidonuPedido: TIntegerField;
    vtPedidoseq: TIntegerField;
    vtPedidodeCidade: TStringField;
    vtPedidosgUf: TStringField;
    vtPedidocodigo_cliente: TIntegerField;
    vtPedidodeFantasia: TStringField;
    vtPedidodtEmissao: TDateTimeField;
    vtPedidostatus_pedido: TStringField;
    vtPedidocdItem: TStringField;
    vtPedidodescricao: TStringField;
    vtPedidonuQtd: TIntegerField;
    vtPedidoflAlcaPadrao: TStringField;
    vtPedidoflAdornoPadrao: TStringField;
    vtPedidoflChavetaPadrao: TStringField;
    vtPedidoflForracaoPadrao: TStringField;
    vtPedidodeDescIni: TStringField;
    vtPedidodeTipoAlca: TStringField;
    vtPedidodeAdorno: TStringField;
    vtPedidodeChaveta: TStringField;
    vtPedidodeForracao: TStringField;
    vtPedidodeImagem: TStringField;
    vtPedidodeRazaoSocial: TStringField;
    vtPedidocdRep: TIntegerField;
    vtPedidodt_reg: TDateTimeField;
    vtPedidovlPercDesc: TCurrencyField;
    vtPedidoitem: TStringField;
    vtPedidocgc: TStringField;
    vtPedidobairro: TStringField;
    vtPedidocep: TStringField;
    vtPedidoend: TStringField;
    vtPedidovl_unitario: TCurrencyField;
    vtPedidovl_bruto: TCurrencyField;
    vtPedidovl_lucro: TCurrencyField;
    vtPedidovl_margem: TCurrencyField;
    vtPedidovl_total: TCurrencyField;
    vtPedidovlDesc: TCurrencyField;
    vtPedidovlTotBruto: TCurrencyField;
    vtPedidocodigo_banco: TStringField;
    vtPedidonmBanco: TStringField;
    vtPedidotipo_cobranca: TIntegerField;
    vtPedidodeCobranca: TStringField;
    vtPedidodePrazo: TStringField;
    vtPedidovlDevido: TCurrencyField;
    vtPedidovlCredito: TCurrencyField;
    vtPedidodeObs3: TStringField;
    vtPedidodeObs4: TStringField;
    vtPedidodeObs: TStringField;
    vtPedidodePeriodo: TStringField;
    vtPedidocdGrupoFat: TIntegerField;
    vtPedidodeGrupoFat: TStringField;
    vtPedidodeRep: TStringField;
    vtPedidodeObsCli: TStringField;
    vtPedidocdCarga: TIntegerField;
    vtPedidodeCarga: TStringField;
    vtPedidocdUsuCad: TIntegerField;
    vtPedidodeUsuCad: TStringField;
    vtPedidovlDescNfs: TCurrencyField;
    vtPedidovlTotalItem: TCurrencyField;
    vtPedidotpPedido: TStringField;
    vtPedidonuTotItens: TIntegerField;
    vtPedidodeNatureza: TStringField;
    vtPedidonuTotVolumes: TIntegerField;
    vtPedidodeCor: TStringField;
    vtPedidoflComPedido: TStringField;
    vtPedidodePedidosAgrup: TStringField;
    vtPedidodtEmissaoNfs: TDateTimeField;
    dbRelEtiqueta: TfrxDBDataset;
    relIntComercial: TfrxReport;
    sbCampos: TScrollBox;
    btFechar: TBitBtn;
    tsTabelaPreco: TTabSheet;
    dbRelListaPreco: TfrxDBDataset;
    relListaPreco: TfrxReport;
    vtListaPreco: TVirtualTable;
    vtListaPrecocdTab: TIntegerField;
    vtListaPrecodeTab: TStringField;
    vtListaPrecocdItem: TStringField;
    vtListaPrecodeItem: TStringField;
    vtListaPrecocdTam: TIntegerField;
    vtListaPrecodeTam: TStringField;
    vtListaPrecovlUrna: TCurrencyField;
    relEtiqueta: TfrxReport;
    vtEtiquetaseqQtd: TIntegerField;
    frxBarCodeObject1: TfrxBarCodeObject;
    vtPedidonuQtdBaixaEmb: TIntegerField;
    vtPedidonuQtdBaixaCarreg: TIntegerField;
    dbPedido: TfrxDBDataset;
    vtEtiquetadeDescIni: TStringField;
    vtEtiquetacdItem: TStringField;
    vtPedidoflEtiqEnvProd: TStringField;
    vtPedidocdItemSubGrupo: TIntegerField;
    vtPedidodeItemSubGrupo: TStringField;
    vtPedidocdItemGrupo: TIntegerField;
    vtPedidodeItemGrupo: TStringField;
    vtPedidodeObsPed: TStringField;
    vtPedidoflEhPontoDoze: TStringField;
    vtPedidonuInscEst: TStringField;
    qyPedItemAgrup: TFDQuery;
    vtPedidodePathImgItem: TStringField;
    vtEtiquetadePathImgItem: TStringField;
    vtPedidonuNfs: TIntegerField;
    vtPedidovlFaturado: TCurrencyField;
    vtItensEscolhidos: TVirtualTable;
    vtItensEscolhidoscdItem: TStringField;
    vtItensEscolhidosdeItem: TStringField;
    dsItensEscolhidos: TDataSource;
    vtPedidoflDesc70: TStringField;
    vtPedidoflEhEbenzer: TStringField;
    vtPedidoflMostrarValor: TStringField;
    vtPedidosEscolhidos: TVirtualTable;
    dsPedidosEscolhidos: TDataSource;
    vtPedidosEscolhidoscdPedido: TIntegerField;
    vtPedidosEscolhidostpPedido: TStringField;
    vtPedidosEscolhidosdtEmissao: TDateField;
    vtPedidosEscolhidosflStatusPed: TStringField;
    vtPedidosEscolhidoscdCliente: TIntegerField;
    vtPedidosEscolhidosdeRazaoSocial: TStringField;
    vtPedidosEscolhidosdeFantasia: TStringField;
    vtPedidodeCompEmissao: TStringField;
    vtPedidodeCompEmisNfs: TStringField;
    vtPedidodeCorExt: TStringField;
    vtPedidodeTipoAlcaExt: TStringField;
    vtPedidodeAdornoExt: TStringField;
    vtPedidodeChavetaExt: TStringField;
    vtPedidodeForracaoExt: TStringField;
    vtPedidodeImagemExt: TStringField;
    vtEtiquetadeCorExt: TStringField;
    vtEtiquetadeTipoAlcaExt: TStringField;
    vtEtiquetadeAdornoExt: TStringField;
    vtEtiquetadeChavetaExt: TStringField;
    vtEtiquetadeForracaoExt: TStringField;
    vtEtiquetadeImagemExt: TStringField;
    vtPedidovlFrete: TCurrencyField;
    sbPedidos: TScrollBox;
    sbTabelaPreco: TScrollBox;
    gbFiltrosTabPreco: TGroupBox;
    lbcdTabPreco: TLabel;
    edcdTabPreco: TEdit;
    btTabelaPreco: TButton;
    btListaPedRep: TButton;
    btListaPed: TButton;
    btBilhetinho: TButton;
    btListProd: TButton;
    btEtiqueta: TButton;
    btValorVendasUF: TButton;
    btBaixaProd: TButton;
    btListaItemPed: TButton;
    btListaPed2: TButton;
    btListaPed3: TButton;
    btListaCarreg: TButton;
    btListaPedCli: TButton;
    btVendasMesEmissRep: TButton;
    btVendasMesEmisNfeRep: TButton;
    gbFiltrosPedido: TGroupBox;
    lbPedido: TLabel;
    lbPedidoA: TLabel;
    lbdtReg: TLabel;
    lbdtRegA: TLabel;
    lbcdCarga: TLabel;
    lbcdCargaA: TLabel;
    lbSeq: TLabel;
    lbSeqA: TLabel;
    lbcdItemA: TLabel;
    lbcdRep: TLabel;
    lbcdRepA: TLabel;
    lbdtEmissaoNfsA: TLabel;
    lbdtEmissaoNfs: TLabel;
    lbnuNfs: TLabel;
    lbnuNfsA: TLabel;
    lbcdCliente: TLabel;
    lbcdClienteA: TLabel;
    lbTipoProduto: TLabel;
    lbcdItem: TLabel;
    lbcdPedido: TLabel;
    lbdtEmissaoA: TLabel;
    lbdtEmissao: TLabel;
    lbcdItemInterv: TLabel;
    eddtRegIni: TDateTimePicker;
    eddtRegFim: TDateTimePicker;
    edSeqIni: TEdit;
    edSeqFim: TEdit;
    eddtEmissaoNfsFim: TDateTimePicker;
    eddtEmissaoNfsIni: TDateTimePicker;
    gbTipoPedido: TGroupBox;
    cbTpPedV: TCheckBox;
    cbTpPedA: TCheckBox;
    cbTpPedO: TCheckBox;
    gbSituacaoPed: TGroupBox;
    cbSitPedL: TCheckBox;
    cbSitPedC: TCheckBox;
    cbSitPedE: TCheckBox;
    cbSitPedR: TCheckBox;
    cbSitPedT: TCheckBox;
    cbSitPedB: TCheckBox;
    gbOutrasOpcoes: TGroupBox;
    cbSomenteEtiqNaoimpressa: TCheckBox;
    cbSomentePedSemCarga: TCheckBox;
    cbNaoImpPedCanc: TCheckBox;
    cbNaoImpAcessUrnZinco: TCheckBox;
    cbImprimirObsBilhet: TCheckBox;
    cbNaoImpRefUof: TCheckBox;
    cbNaoImpEnzibEnzit: TCheckBox;
    ednuNfsIni: TEdit;
    ednuNfsFim: TEdit;
    cbTipoProduto: TComboBox;
    edcdItem: TDBCampoCodigo;
    btSalvarItemEsc: TBitBtn;
    btExluirItemEsc: TBitBtn;
    grItensEscolhidos: TDBGrid;
    btSalvarPedEsc: TBitBtn;
    btExluirPedEsc: TBitBtn;
    grPedidosEscolhidos: TDBGrid;
    edcdClienteIni: TDBCampoCodigo;
    edcdClienteFim: TDBCampoCodigo;
    eddtEmissaoFim: TDateTimePicker;
    eddtEmissaoIni: TDateTimePicker;
    edcdCargaIni: TDBCampoCodigo;
    edcdCargaFim: TDBCampoCodigo;
    edcdPedidoIni: TDBCampoCodigo;
    edcdPedidoFim: TDBCampoCodigo;
    edcdItemIni: TDBCampoCodigo;
    edcdItemFim: TDBCampoCodigo;
    edcdRepIni: TDBCampoCodigo;
    edcdRepFim: TDBCampoCodigo;
    btReferenciasVendidas: TButton;
    lbcdGrupoFat: TLabel;
    edcdGrupoFatIni: TDBCampoCodigo;
    gbEstadosCli: TGroupBox;
    cbAC: TCheckBox;
    cbMT: TCheckBox;
    cbAL: TCheckBox;
    cbPA: TCheckBox;
    cbPE: TCheckBox;
    cbPB: TCheckBox;
    cbAP: TCheckBox;
    cbAM: TCheckBox;
    cbPR: TCheckBox;
    cbPI: TCheckBox;
    cbCE: TCheckBox;
    cbBA: TCheckBox;
    cbRN: TCheckBox;
    cbRJ: TCheckBox;
    cbES: TCheckBox;
    cbDF: TCheckBox;
    cbGO: TCheckBox;
    cbMA: TCheckBox;
    cbRO: TCheckBox;
    cbRR: TCheckBox;
    cbMG: TCheckBox;
    cbMS: TCheckBox;
    cbRS: TCheckBox;
    cbSC: TCheckBox;
    cbSE: TCheckBox;
    cbTO: TCheckBox;
    cbSP: TCheckBox;
    lbcdGrupoFatA: TLabel;
    edcdGrupoFatFim: TDBCampoCodigo;
    btClienteSemPed: TButton;
    relClientesSemPed: TfrxReport;
    vtPedidocdCidade: TIntegerField;
    lbnmCidade: TLabel;
    ednmCidade: TEdit;
    relClientes: TfrxReport;
    btClientes: TButton;
    vtPedidonuFoneCli1: TStringField;
    vtPedidonuFoneCli2: TStringField;
    vtPedidonuCelular: TStringField;
    vtPedidodeOrdCompEmis: TStringField;
    vtPedidodeOrdCompEmisNfs: TStringField;
    cbBilhetinhoUmCliPorPag: TCheckBox;
    edcdPedido: TDBCampoCodigo;
    btExportarDados: TButton;
    pmExportarDados: TPopupMenu;
    pmiWay: TMenuItem;
    pmiWebRouter: TMenuItem;
    sdDadosWay: TSaveDialog;
    btExtratoVendasCli: TButton;
    relExtratoVendaCli: TfrxReport;
    expExcel: TfrxXLSExport;
    vtPedidodeDescVarsItem: TStringField;
    vtEtiquetadeDescVarsItem: TStringField;
    vtPedidodeItemTexto01: TStringField;
    vtEtiquetadeItemTexto01: TStringField;
    vtPedidonuEndereco: TStringField;
    sdDadosWebRouter: TSaveDialog;
    lbcdCargaEsc: TLabel;
    btSalvarCargaEsc: TBitBtn;
    btExluirCargaEsc: TBitBtn;
    grCargasEscolhidas: TDBGrid;
    edcdCargaEsc: TDBCampoCodigo;
    vtCargasEscolhidas: TVirtualTable;
    dsCargasEscolhidas: TDataSource;
    vtCargasEscolhidascdCarga: TIntegerField;
    vtCargasEscolhidasdeCarga: TStringField;
    vtPedidodeTamanho: TStringField;
    relExpDadosRoutEasy: TfrxReport;
    vtPedidodeComplEnd: TStringField;
    vtPedidonuCep: TStringField;
    vtPedidodeEmail: TStringField;
    expExcelX: TfrxXLSXExport;
    pmiClientes: TMenuItem;
    pmiPedidos: TMenuItem;
    pmiRoutEasy: TMenuItem;
    relExpDadosWebRouter: TfrxReport;
    lbdePeriodo: TLabel;
    eddePeriodoIni: TDBCampoCodigo;
    lbdePeriodoA: TLabel;
    eddePeriodoFim: TDBCampoCodigo;
    btAcompMetasRep: TButton;
    vtPedidovlPrevisto: TCurrencyField;
    vtPedidodeItemTexto02: TStringField;
    vtPedidodeItemTexto03: TStringField;
    vtEtiquetadeItemTexto02: TStringField;
    vtEtiquetadeItemTexto03: TStringField;
    vtPedidovlMediaPrev: TCurrencyField;
    btExtratoCarga: TButton;
    vtPedidodeObsCompleta: TStringField;
    vtPedidonmMotorista: TStringField;
    vtEtiquetadeTamanho: TStringField;
    pmAcompMetas: TPopupMenu;
    pmiImprimirAcompMetas: TMenuItem;
    pmiEmailAcompMetas: TMenuItem;
    frPdfExport: TfrxPDFExport;
    lbcdGrupoCli: TLabel;
    edcdGrupoCliIni: TDBCampoCodigo;
    lbcdGrupoCliA: TLabel;
    edcdGrupoCliFim: TDBCampoCodigo;
    edcdCliente: TDBCampoCodigo;
    lbClienteEsc: TLabel;
    btSalvarClienteEsc: TBitBtn;
    btExluirClienteEsc: TBitBtn;
    grClientesEsc: TDBGrid;
    vtClientesEscolhidos: TVirtualTable;
    dsClientesEscolhidos: TDataSource;
    vtClientesEscolhidoscdCliente: TIntegerField;
    vtClientesEscolhidosdeRazaoSocial: TStringField;
    btListaConferencia: TButton;
    vtPedidodeEmailRep: TStringField;
    pmListaPed3: TPopupMenu;
    pmiImpListaPed3: TMenuItem;
    pmiEmailListaPed3: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btEtiquetaClick(Sender: TObject);
    procedure btListProdClick(Sender: TObject);
    procedure btBilhetinhoClick(Sender: TObject);
    procedure btListaPedClick(Sender: TObject);
    procedure btListaPedRepClick(Sender: TObject);
    function relIntComercialUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure btTabelaPrecoClick(Sender: TObject);
    procedure btValorVendasUFClick(Sender: TObject);
    procedure btBaixaProdClick(Sender: TObject);
    function relListaPrecoUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure FormShow(Sender: TObject);
    procedure btListaItemPedClick(Sender: TObject);
    procedure btListaPed2Click(Sender: TObject);
    procedure btListaPed3Click(Sender: TObject);
    procedure btListaCarregClick(Sender: TObject);
    procedure btListaPedCliClick(Sender: TObject);
    procedure btSalvarItemEscClick(Sender: TObject);
    procedure btExluirItemEscClick(Sender: TObject);
    procedure btSalvarPedEscClick(Sender: TObject);
    procedure btExluirPedEscClick(Sender: TObject);
    procedure btVendasMesEmissRepClick(Sender: TObject);
    procedure btVendasMesEmisNfeRepClick(Sender: TObject);
    procedure btReferenciasVendidasClick(Sender: TObject);
    procedure btClienteSemPedClick(Sender: TObject);
    function relClientesSemPedUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function relClientesUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure btClientesClick(Sender: TObject);
    procedure btExportarDadosClick(Sender: TObject);
    procedure btExtratoVendasCliClick(Sender: TObject);
    procedure btSalvarCargaEscClick(Sender: TObject);
    procedure btExluirCargaEscClick(Sender: TObject);
    procedure pmiRoutEasyClick(Sender: TObject);
    procedure pmiWebRouterClick(Sender: TObject);
    procedure pmiPedidosClick(Sender: TObject);
    procedure pmiClientesClick(Sender: TObject);
    procedure btAcompMetasRepClick(Sender: TObject);
    procedure btExtratoCargaClick(Sender: TObject);
    procedure pmiImprimirAcompMetasClick(Sender: TObject);
    procedure pmiEmailAcompMetasClick(Sender: TObject);
    procedure btSalvarClienteEscClick(Sender: TObject);
    procedure btExluirClienteEscClick(Sender: TObject);
    procedure btListaConferenciaClick(Sender: TObject);
    procedure pmiImpListaPed3Click(Sender: TObject);
    procedure pmiEmailListaPed3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FbMostrarValor   : Boolean;
    FstListaEmailRep : TStringList;
    FsPathRelatorios,
    FsNomeRelatorio  : String;

    procedure CarregarDadosPedido(const qyDados : TFDQuery; const iTipoImp : Integer; const bListaCliSemPed : Boolean);
    function FiltrosEscolhidos : String;
    procedure AplicaFiltroPedido(const qyDados : TFDQuery; const sOrdenacao : String);
    procedure GerarInfoPedido(const sOrdenacao : String; const iTipoImp : Integer; const bListaCliSemPed : Boolean);
    procedure ImprimirEmTela(const bEnviarPorEmail : Boolean;
                             const sNomeArq,
                                   sAssunto,
                                   sPara,
                                   sCc             : String;
                             const stTexto         : TStringList
                            );
    procedure ImprimirEtiqueta;
    procedure ImprimirListaProd;
    procedure ImprimirListaPed;
    procedure ImprimirListaPedRep;
    procedure ImprimirValorVendasUF;
    procedure ImprimirBilhetinho;
    procedure ImprimirBaixaProd;
    procedure ImprimirListaItemPed;
    procedure ImprimirListaPed2;
    procedure ImprimirListaPed3(const bEnviarPorEmail : Boolean);
    procedure ImprimirListaCarregamento;
    procedure ImprimirListaPedCli;
    procedure ImprimirVendasMesEmissRep;
    procedure ImprimirVendasMesEmissNfeRep;
    procedure ImprimirAcompMetasRep(const bEnviarPorEmail : Boolean);
    procedure ImprimirRefVendidas;
    procedure ImprimirExtratoVendasCli;
    procedure ImprimirClientesSemPed;
    procedure ImprimirClientes;
    procedure ImprimirExtratoCarregamento;
    procedure ImprimirListaConferencia;
    function UsuarioDataHoraImpressao : String;
    function ImprimirObsBilhet : Boolean;
    function ImprimirBilhetUmCliPorPag : Boolean;
    function ObsCargas : String;
    procedure ImprimirListaPreco;
    procedure FecharConexaoIntegracao;
    procedure ExecutaImpressao(const qyDados : TFDQuery; var sWhere : String; const sOrdenacao : String);
    procedure CarregarImgLogoEmpRel(const frxRelatorio : TfrxReport);
    procedure ExportarDadosWayCli;
    procedure ExportarDadosWayPed;
    procedure ExportarDadosWebRouteOld;
    procedure ExportarDadosWebRoute;
    procedure ExportarDadosRouteasy;
  public
    { Public declarations }
  end;

var
  FIntComRelatorios: TFIntComRelatorios;

implementation

uses
  uFuncoes, UTelaInicial, UEmail, uDmERP, uDmIntegracao, StrUtils, UFrameAguarde;

{$R *.dfm}
{$R Icones.res}

procedure TFIntComRelatorios.CarregarImgLogoEmpRel(const frxRelatorio : TfrxReport);
begin
  if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (frxRelatorio.FindComponent('picLogoEmp') <> nil)) then
    TfrxPictureView(frxRelatorio.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');
end;

function TFIntComRelatorios.FiltrosEscolhidos : String;
  procedure AdicionaValor(var sTexto : String; const sValor : String);
  begin
    if Trim(sTexto) = '' then
      sTexto := sValor
    else
      sTexto := sTexto + ',' + sValor;
  end;
var
  sAux : String;
  i    : Integer;
begin
  Result := '';

  if (eddtRegIni.Checked) and
     (eddtRegFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtRegIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtRegFim.Date) <> '30/12/1899') then
    AdicionaCondSql(Result,
                    ' t.dt_reg BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegIni.DateTime)) +
                    '              AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegFim.DateTime))
                   );

  if (eddtEmissaoIni.Checked) and
     (eddtEmissaoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtEmissaoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtEmissaoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(Result,
                    ' t.dtEmissao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoIni.DateTime)) +
                    '                 AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoFim.DateTime))
                   );

  if (eddtEmissaoNfsIni.Checked) and
     (eddtEmissaoNfsFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtEmissaoNfsIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtEmissaoNfsFim.Date) <> '30/12/1899') then
    AdicionaCondSql(Result,
                    ' t.dtEmissaoNfs BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoNfsIni.DateTime)) +
                    '                    AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoNfsFim.DateTime))
                   );

  if (Trim(eddePeriodoIni.ERPEdCampoChaveText) <> '') and
     (eddePeriodoIni.ERPValorValido) and
     (Trim(eddePeriodoFim.ERPEdCampoChaveText) <> '') and
     (eddePeriodoFim.ERPValorValido) then
    AdicionaCondSql(Result, ' t.dePeriodo BETWEEN ' + QuotedStr(eddePeriodoIni.ERPEdCampoChaveText) + ' AND ' + QuotedStr(eddePeriodoFim.ERPEdCampoChaveText));

  if (Trim(edcdPedidoIni.ERPEdCampoChaveText) <> '') and
     (edcdPedidoIni.ERPValorValido) and
     (Trim(edcdPedidoFim.ERPEdCampoChaveText) <> '') and
     (edcdPedidoFim.ERPValorValido) then
    AdicionaCondSql(Result, ' t.nuPedido BETWEEN ' + edcdPedidoIni.ERPEdCampoChaveText + ' AND ' + edcdPedidoFim.ERPEdCampoChaveText);

  if (StrToIntDef(edSeqIni.Text, 0) > 0) and (StrToIntDef(edSeqFim.Text, 0) > 0) then
    AdicionaCondSql(Result, ' t.seq BETWEEN ' + edSeqIni.Text + ' AND ' + edSeqFim.Text);

  if (Trim(edcdItemIni.ERPEdCampoChaveText) <> '') and
     (edcdItemIni.ERPValorValido) and
     (Trim(edcdItemFim.ERPEdCampoChaveText) <> '') and
     (edcdItemFim.ERPValorValido) then
    AdicionaCondSql(Result, ' t.cdItem BETWEEN ' + QuotedStr(edcdItemIni.ERPEdCampoChaveText) + ' AND ' + QuotedStr(edcdItemFim.ERPEdCampoChaveText));

  if (Trim(edcdCargaIni.ERPEdCampoChaveText) <> '') and
     (edcdCargaIni.ERPValorValido) and
     (Trim(edcdCargaFim.ERPEdCampoChaveText) <> '') and
     (edcdCargaFim.ERPValorValido) then
    AdicionaCondSql(Result,
                    ' t.cdCarga BETWEEN ' + Trim(edcdCargaIni.ERPEdCampoChaveText) +
                    '               AND ' + Trim(edcdCargaFim.ERPEdCampoChaveText)
                   );

  if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > 0) and
     (edcdRepIni.ERPValorValido) and
     (StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0) > 0) and
     (edcdRepFim.ERPValorValido) then
    AdicionaCondSql(Result, ' t.cdRep BETWEEN ' + Trim(edcdRepIni.ERPEdCampoChaveText) +
                            '             AND ' + Trim(edcdRepFim.ERPEdCampoChaveText)
                   );

  if (Trim(edcdClienteIni.ERPEdCampoChaveText) <> '') and
     (edcdClienteIni.ERPValorValido) and
     (Trim(edcdClienteFim.ERPEdCampoChaveText) <> '') and
     (edcdClienteFim.ERPValorValido) then
    AdicionaCondSql(Result, ' t.codigo_cliente BETWEEN ' + Trim(edcdClienteIni.ERPEdCampoChaveText) +
                            '                      AND ' + Trim(edcdClienteFim.ERPEdCampoChaveText)
                   );

  if (Trim(edcdGrupoFatIni.ERPEdCampoChaveText) <> '') and
     (edcdGrupoFatIni.ERPValorValido) and
     (Trim(edcdGrupoFatFim.ERPEdCampoChaveText) <> '') and
     (edcdGrupoFatFim.ERPValorValido) then
    AdicionaCondSql(Result,
                    ' t.cdGrupoFat BETWEEN ' + Trim(edcdGrupoFatIni.ERPEdCampoChaveText) +
                    '                  AND ' + Trim(edcdGrupoFatFim.ERPEdCampoChaveText)
                   );

  if cbSomentePedSemCarga.Checked then
    AdicionaCondSql(Result, ' t.cdCarga = 0');

  case cbTipoProduto.ItemIndex of
  1: AdicionaCondSql(Result, ' t.flTipoProduto = ''P'' ');
  2: AdicionaCondSql(Result, ' t.flTipoProduto = ''R'' ');
  end;

  sAux := '';

  if cbTpPedV.Checked then
    AdicionaValor(sAux, QuotedStr('V'));

  if cbTpPedA.Checked then
    AdicionaValor(sAux, QuotedStr('A'));

  if cbTpPedO.Checked then
    AdicionaValor(sAux, QuotedStr('O'));

  if Trim(sAux) <> '' then
    AdicionaCondSql(Result, ' t.tpPedido IN(' + sAux + ')');

  sAux := '';

  if cbSitPedL.Checked then
    AdicionaValor(sAux, QuotedStr('L'));

  if cbSitPedC.Checked then
    AdicionaValor(sAux, QuotedStr('C'));

  if cbSitPedE.Checked then
    AdicionaValor(sAux, QuotedStr('E'));

  if cbSitPedR.Checked then
    AdicionaValor(sAux, QuotedStr('R'));

  if cbSitPedT.Checked then
    AdicionaValor(sAux, QuotedStr('T'));

  if cbSitPedB.Checked then
    AdicionaValor(sAux, QuotedStr('B'));

  if Trim(sAux) <> '' then
    AdicionaCondSql(Result, ' t.status_pedido IN(' + sAux + ')');

  if cbNaoImpAcessUrnZinco.Checked then
    AdicionaCondSql(Result, ' t.item NOT LIKE ''ZINCO%'' AND t.item NOT LIKE ''ACES%''');

  if cbNaoImpEnzibEnzit.Checked then
    AdicionaCondSql(Result, ' t.item NOT LIKE ''ENZIBA%'' AND t.item NOT LIKE ''ENZIT%''');

  if cbNaoImpRefUof.Checked then
    AdicionaCondSql(Result, ' t.item NOT LIKE ''UOF%'' AND t.item NOT LIKE ''REFORMA%''');

  if (StrToIntDef(ednuNfsIni.Text, 0) > 0) and (StrToIntDef(ednuNfsFim.Text, 0) > 0) then
    AdicionaCondSql(Result, ' t.nuNfs BETWEEN ' + ednuNfsIni.Text + ' AND ' + ednuNfsFim.Text);

  sAux := '';

  for i := 0 to gbEstadosCli.ControlCount - 1 do
  begin
    if (gbEstadosCli.Controls[i] is TCheckBox) and ((gbEstadosCli.Controls[i] as TCheckBox).Checked) then
    begin
      if Trim(sAux) = '' then
        sAux := QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption)
      else
        sAux := sAux + ', ' + QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption);
    end;
  end;

  if Trim(sAux) <> '' then
    AdicionaCondSql(Result, ' t.sgUf IN(' + sAux + ')');

  if Trim(ednmCidade.Text) <> '' then
    AdicionaCondSql(Result, ' LOWER(t.deCidade) LIKE ' + QuotedStr('%' + LowerCase(ednmCidade.Text) + '%'));

  if not vtItensEscolhidos.IsEmpty then
  begin
    vtItensEscolhidos.DisableControls;

    try
      vtItensEscolhidos.First;
      sAux := '';

      while not vtItensEscolhidos.Eof do
      begin
        if Trim(sAux) = '' then
          sAux := QuotedStr(vtItensEscolhidos.FieldByName('cdItem').AsString)
        else
          sAux := sAux + ', ' + QuotedStr(vtItensEscolhidos.FieldByName('cdItem').AsString);

        vtItensEscolhidos.Next;
      end;

      AdicionaCondSql(Result, ' t.cdItem IN(' + sAux + ')');
    finally
      vtItensEscolhidos.EnableControls;
    end;
  end;

  if not vtPedidosEscolhidos.IsEmpty then
  begin
    vtPedidosEscolhidos.DisableControls;

    try
      vtPedidosEscolhidos.First;
      sAux := '';

      while not vtPedidosEscolhidos.Eof do
      begin
        if Trim(sAux) = '' then
          sAux := vtPedidosEscolhidos.FieldByName('cdPedido').AsString
        else
          sAux := sAux + ', ' + vtPedidosEscolhidos.FieldByName('cdPedido').AsString;

        vtPedidosEscolhidos.Next;
      end;

      AdicionaCondSql(Result, ' t.nuPedido IN(' + sAux + ')');
    finally
      vtPedidosEscolhidos.EnableControls;
    end;
  end;

  if not vtCargasEscolhidas.IsEmpty then
  begin
    vtCargasEscolhidas.DisableControls;

    try
      vtCargasEscolhidas.First;
      sAux := '';

      while not vtCargasEscolhidas.Eof do
      begin
        if Trim(sAux) = '' then
          sAux := vtCargasEscolhidas.FieldByName('cdCarga').AsString
        else
          sAux := sAux + ', ' + vtCargasEscolhidas.FieldByName('cdCarga').AsString;

        vtCargasEscolhidas.Next;
      end;

      AdicionaCondSql(Result, ' t.cdCarga IN(' + sAux + ')');
    finally
      vtCargasEscolhidas.EnableControls;
    end;
  end;

  if not vtClientesEscolhidos.IsEmpty then
  begin
    vtClientesEscolhidos.DisableControls;

    try
      vtClientesEscolhidos.First;
      sAux := '';

      while not vtClientesEscolhidos.Eof do
      begin
        if Trim(sAux) = '' then
          sAux := vtClientesEscolhidos.FieldByName('cdCliente').AsString
        else
          sAux := sAux + ', ' + vtClientesEscolhidos.FieldByName('cdCliente').AsString;

        vtClientesEscolhidos.Next;
      end;

      AdicionaCondSql(Result, ' t.codigo_cliente IN(' + sAux + ')');
    finally
      vtClientesEscolhidos.EnableControls;
    end;
  end;

  if (Trim(edcdGrupoCliIni.ERPEdCampoChaveText) <> '') and
     (edcdGrupoCliIni.ERPValorValido) and
     (Trim(edcdGrupoCliFim.ERPEdCampoChaveText) <> '') and
     (edcdGrupoCliFim.ERPValorValido) then
    AdicionaCondSql(Result, ' t.cdGrupoCli BETWEEN ' + Trim(edcdGrupoCliIni.ERPEdCampoChaveText) +
                            '                  AND ' + Trim(edcdGrupoCliFim.ERPEdCampoChaveText)
                   );
end;

procedure TFIntComRelatorios.AplicaFiltroPedido(const qyDados : TFDQuery; const sOrdenacao : String);
var
  sWhere : String;
begin
  qyDados.MacroByName('filtro').Clear;

  if eddtRegIni.DateTime > eddtRegFim.DateTime then
    Aviso('Data de cadastro inicial não pode ser maior que o final.')
  else if eddtEmissaoIni.DateTime > eddtEmissaoFim.DateTime then
    Aviso('Data de emissão inicial não pode ser maior que o final.')
  else if eddtEmissaoNfsIni.DateTime > eddtEmissaoNfsFim.DateTime then
    Aviso('Data de emissão da NFS inicial não pode ser maior que o final.')
  else if (StrToIntDef(edcdPedidoIni.ERPEdCampoChaveText, 0) > StrToIntDef(edcdPedidoFim.ERPEdCampoChaveText, 0)) then
    Aviso('Pedido inicial não pode ser maior que o final.')
  else if (StrToIntDef(edSeqIni.Text, 0) > StrToIntDef(edSeqFim.Text, 0)) then
    Aviso('Sequência inicial não pode ser maior que o final.')
  else if (StrToIntDef(edcdCargaIni.ERPEdCampoChaveText, 0) > StrToIntDef(edcdCargaFim.ERPEdCampoChaveText, 0)) then
    Aviso('Carga inicial não pode ser maior que o final.')
  else if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0)) then
    Aviso('Representante inicial não pode ser maior que o final.')
  else
  begin
    sWhere := FiltrosEscolhidos;

    if (Trim(sWhere) = '') then
    begin
      if (Pergunta('Nenhum filtro foi escolhido.' + #13 + 'Tem certeza que deseja continuar?')) then
        ExecutaImpressao(qyDados, sWhere, sOrdenacao)
      else
        Abort;
    end
    else
      ExecutaImpressao(qyDados, sWhere, sOrdenacao);
  end;
end;

procedure TFIntComRelatorios.ExecutaImpressao(const qyDados : TFDQuery; var sWhere : String; const sOrdenacao : String);
begin
  if cbNaoImpPedCanc.Checked then
    AdicionaCondSql(sWhere, ' t.status_pedido <> ''C'' ');

  if Trim(sWhere) <> '' then
  begin
    qyDados.MacroByName('filtro').Value := ' WHERE ' + sWhere + ' ' + sOrdenacao;
    qyDados.Open;
  end
  else
  begin
    FecharConexaoIntegracao;
    Aviso('Para imprimir, escolha pelo menos 1 opção de filtro.');
    Abort;
  end;
end;

procedure TFIntComRelatorios.CarregarDadosPedido(const qyDados : TFDQuery; const iTipoImp : Integer; const bListaCliSemPed : Boolean);
var
  sAux,
  sDesc,
  sdeCor,
  sdeTipoAlca,
  sdeAdorno,
  sdeChaveta,
  sdeForracao,
  sdeImagem,
  sdeCorExt,
  sdeTipoAlcaExt,
  sdeAdornoExt,
  sdeChavetaExt,
  sdeForracaoExt,
  sdeImagemExt,
  snmMotorista  : String;
  stDados,
  stListaCli    : TStringList;
  icdCarga,
  inuPedido     : Integer;
  bZerarCreDeb,
  bPedEtiqJaImp : Boolean;

  procedure MontaDescItem(const sDeCampoCod, sDeCampoExt, nmCampoPadrao : String; const bAdiciona : Boolean);
  var
    sDescVarsItem : String;
  begin
    if bAdiciona then
    begin
      sDescVarsItem := vtPedido.FieldByName(sDeCampoCod).AsString;

      if (SameText('ACESS', Copy(Trim(qyDados.FieldByName('cdItem').AsString), 1, 5))) or
         (SameText('SOBTAMP', Copy(Trim(qyDados.FieldByName('cdItem').AsString), 1, 7))) or
         (iTipoImp = 1 {Etiqueta}) then
        sDescVarsItem := sDescVarsItem +  '-' + vtPedido.FieldByName(sDeCampoExt).AsString;

      if (Trim(nmCampoPadrao) <> '') and (vtPedido.FieldByName(nmCampoPadrao).AsString = 'N') then
        sDescVarsItem := '(' + sDescVarsItem + ')';

      if Trim(vtPedido.FieldByName('deDescVarsItem').AsString) = '' then
        vtPedido.FieldByName('deDescVarsItem').AsString := sDescVarsItem
      else
        vtPedido.FieldByName('deDescVarsItem').AsString := vtPedido.FieldByName('deDescVarsItem').AsString + ' * ' + sDescVarsItem;
    end;
  end;

  function EhConfPadrao(const cdVar : Integer) : String; //; var sDesVarItem, sDesVarItemExt : String) : String;
  var
    scdItem : String;
  begin
    Result         := 'S';
{
    stDados.Clear;

    ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                      'SELECT b.valor   AS deVariavelSeq, ' +
                      '       b.mascara AS deMascara ' +
                      '  FROM vincItem a ' +
                      ' INNER JOIN valorVar b ON (b.codigo_variavel = a.codigo_variavel AND b.seq = a.valorVar) ' +
                      ' WHERE a.item = ' + QuotedStr(qyDados.FieldByName('item').AsString) +
                      '   AND a.codigo_variavel = ' + IntToStr(cdVar),
                      'deVariavelSeq,deMascara',
                      stDados
                     );

    if (stDados.Count > 0) then
    begin
      if (Trim(stDados.Strings[0]) <> '') then
        sDesVarItemExt := Trim(stDados.Strings[0]);

      if (Trim(stDados.Strings[1]) <> '') then
        sDesVarItem := Trim(stDados.Strings[1]);
    end;
}

    scdItem := Trim(qyDados.FieldByName('cdItem').AsString); //DmIntegracao.RetornaRefPadrao(

    if Pos('.12', scdItem) > 0 then
      scdItem := Copy(scdItem, 1, Length(scdItem) - 3);

    DmERP.qyIntSupItensCfgPad.First;

    if DmERP.qyIntSupItensCfgPad.Locate('cdItem', VarArrayOf([scdItem]), []) then
    begin
{      if ((cdVar = 15) and (sDesVarItem <> DmERP.qyIntSupItensCfgPad.FieldByName('cdTipoAlca').AsString)) or
         ((cdVar = 19) and (sDesVarItem <> DmERP.qyIntSupItensCfgPad.FieldByName('cdAdorno').AsString)) or
         ((cdVar = 20) and (sDesVarItem <> DmERP.qyIntSupItensCfgPad.FieldByName('cdChaveta').AsString)) or
         ((cdVar = 25) and (sDesVarItem <> DmERP.qyIntSupItensCfgPad.FieldByName('cdForracao').AsString)) then}
      if ((cdVar = 15) and (qyDados.FieldByName('deMascAlca').AsString <> DmERP.qyIntSupItensCfgPad.FieldByName('cdTipoAlca').AsString)) or
         ((cdVar = 19) and (qyDados.FieldByName('deMascAdorno').AsString <> DmERP.qyIntSupItensCfgPad.FieldByName('cdAdorno').AsString)) or
         ((cdVar = 20) and (qyDados.FieldByName('deMascChaveta').AsString <> DmERP.qyIntSupItensCfgPad.FieldByName('cdChaveta').AsString)) or
         ((cdVar = 25) and (qyDados.FieldByName('deMascForracao').AsString <> DmERP.qyIntSupItensCfgPad.FieldByName('cdForracao').AsString)) then
        Result  := 'N';
    end;
{
    case cdVar of
    10: sDesVarItem := 'C'  + sDesVarItem;
    15: sDesVarItem := 'A'  + sDesVarItem;
    19: sDesVarItem := 'AD' + sDesVarItem;
    20: sDesVarItem := 'CH' + sDesVarItem;
    25: sDesVarItem := 'F'  + sDesVarItem;
    30: sDesVarItem := 'I'  + sDesVarItem;
    end;
 }
{
    if (cdVar = 10) and
       (Pos('* C', qyDados.FieldByName('descricao').AsString) > 0) and
       (Copy(qyDados.FieldByName('descricao').AsString,
             (Pos('* C', qyDados.FieldByName('descricao').AsString) + 3),
             1
            ) <> 'H'
       ) then //cor
    begin
      sAux := Trim(
                   Copy(qyDados.FieldByName('descricao').AsString,
                        Pos('* C', qyDados.FieldByName('descricao').AsString) + 3,
                        Length(qyDados.FieldByName('descricao').AsString) - 3
                       )
                  );

      if Pos('*', sAux) > 0 then
        sAux := Trim(Copy(sAux, 1, Pos('*', sAux) - 1));

      sDesVarItem := 'C' + sAux;
    end
    else if (cdVar = 15)  and
            (Copy(qyDados.FieldByName('descricao').AsString,
                  (Pos('* C', qyDados.FieldByName('descricao').AsString) + 3),
                  1
                 ) <> 'D'
            ) and
            (Pos('* A', qyDados.FieldByName('descricao').AsString) > 0) then //alça
    begin
      sAux := Trim(
                   Copy(qyDados.FieldByName('descricao').AsString,
                        Pos('* A', qyDados.FieldByName('descricao').AsString) + 3,
                        Length(qyDados.FieldByName('descricao').AsString) - 3
                       )
                  );

      if Pos('*', sAux) > 0 then
        sAux := Trim(Copy(sAux, 1, Pos('*', sAux) - 1));

      sDesVarItem := 'A' + sAux;
    end
    else if (cdVar = 19) and (Pos('* AD', qyDados.FieldByName('descricao').AsString) > 0) then //adorno
    begin
      sAux := Trim(
                   Copy(qyDados.FieldByName('descricao').AsString,
                        Pos('* AD', qyDados.FieldByName('descricao').AsString) + 4,
                        Length(qyDados.FieldByName('descricao').AsString) - 3
                       )
                  );

      if Pos('*', sAux) > 0 then
        sAux := Trim(Copy(sAux, 1, Pos('*', sAux) - 1));

      sDesVarItem := 'AD' + sAux;
    end
    else if (cdVar = 20) and (Pos('* CH', qyDados.FieldByName('descricao').AsString) > 0) then //chaveta
    begin
      sAux := Trim(
                   Copy(qyDados.FieldByName('descricao').AsString,
                        Pos('* CH', qyDados.FieldByName('descricao').AsString) + 4,
                        Length(qyDados.FieldByName('descricao').AsString) - 3
                       )
                  );

      if Pos('*', sAux) > 0 then
        sAux := Trim(Copy(sAux, 1, Pos('*', sAux) - 1));

      sDesVarItem := 'CH' + sAux;
    end
    else if (cdVar = 25) and (Pos('* F', qyDados.FieldByName('descricao').AsString) > 0) then //chaveta
    begin
      sAux := Trim(
                   Copy(qyDados.FieldByName('descricao').AsString,
                        Pos('* F', qyDados.FieldByName('descricao').AsString) + 3,
                        Length(qyDados.FieldByName('descricao').AsString) - 3
                       )
                  );

      if Pos('*', sAux) > 0 then
        sAux := Trim(Copy(sAux, 1, Pos('*', sAux) - 1));

      sDesVarItem := 'F' + sAux;
    end
    else if (cdVar = 30) and (Pos('* I', qyDados.FieldByName('descricao').AsString) > 0) then //imagem
    begin
      sAux := Trim(
                   Copy(qyDados.FieldByName('descricao').AsString,
                        Pos('* I', qyDados.FieldByName('descricao').AsString) + 3,
                        Length(qyDados.FieldByName('descricao').AsString) - 3
                       )
                  );

      if Pos('*', sAux) > 0 then
        sAux := Trim(Copy(sAux, 1, Pos('*', sAux) - 1));

      sDesVarItem := 'I' + sAux;
    end;

    scdItem := Trim(qyDados.FieldByName('cdItem').AsString);

    if Pos('.12', scdItem) > 0 then
      scdItem := Copy(scdItem, 1, Length(scdItem) - 3);

    DmERP.qyIntSupItensCfgPad.First;

    if DmERP.qyIntSupItensCfgPad.Locate('cdItem', VarArrayOf([scdItem]), []) then
    begin
      if ((cdVar = 15) and (sAux <> DmERP.qyIntSupItensCfgPad.FieldByName('cdTipoAlca').AsString)) or
         ((cdVar = 19) and (sAux <> DmERP.qyIntSupItensCfgPad.FieldByName('cdAdorno').AsString)) or
         ((cdVar = 20) and (sAux <> DmERP.qyIntSupItensCfgPad.FieldByName('cdChaveta').AsString)) or
         ((cdVar = 25) and (sAux <> DmERP.qyIntSupItensCfgPad.FieldByName('cdForracao').AsString)) then
        Result  := 'N';
    end;
}
  end;

  function ClienteJaEstaNaLista(const sCodCli : String) : Boolean;
  var
    intC : Integer;
  begin
    Result := False;

    intC := 0;

    while intC < stListaCli.Count do
    begin
      if stListaCli.Strings[intC] = sCodCli then
      begin
        Result := True;
        intC   := stListaCli.Count;
      end;

      Inc(intC);
    end;

    if not Result then
      stListaCli.Add(sCodCli);
  end;

  procedure ListaEmailsRepres(const sEmailRep : String);
  var
    intI : Integer;
    bJaNaLista : Boolean;
  begin
    bJaNaLista := False;

    intI := 0;

    while intI < FstListaEmailRep.Count do
    begin
      if SameText(FstListaEmailRep.Strings[intI], sEmailRep) then
      begin
        bJaNaLista := True;
        intI       := FstListaEmailRep.Count;
      end;

      Inc(intI);
    end;

    if not bJaNaLista then
      FstListaEmailRep.Add(Trim(sEmailRep));
  end;

  function PedidosAgrupados : String;
  begin
    Result := '';

    if DmIntegracao.qyPedAgrup.Active then
      DmIntegracao.qyPedAgrup.Close;

    DmIntegracao.qyPedAgrup.ParamByName('nuPed').AsInteger := qyDados.FieldByName('nuPedido').AsInteger;
    DmIntegracao.qyPedAgrup.Open;

    if not DmIntegracao.qyPedAgrup.IsEmpty then
    begin
      DmIntegracao.qyPedAgrup.First;

      while not DmIntegracao.qyPedAgrup.Eof do
      begin
        if Trim(Result) = '' then
          Result := DmIntegracao.qyPedAgrup.FieldByName('pedido_ori').AsString
        else
          Result := Result + ', ' + DmIntegracao.qyPedAgrup.FieldByName('pedido_ori').AsString;

        DmIntegracao.qyPedAgrup.Next;
      end;
    end;
  end;

  function QtdMovItemPed(const sCampoMov : String) : Integer;
  begin
    Result := 0;

    if qyPedItemAgrup.Active then
      qyPedItemAgrup.Close;

    qyPedItemAgrup.ParamByName('cdPedido').AsInteger := vtPedido.FieldByName('nuPedido').AsInteger;
    qyPedItemAgrup.ParamByName('nuSeqPed').AsInteger := vtPedido.FieldByName('seq').AsInteger;
    qyPedItemAgrup.Open();

    if (not qyPedItemAgrup.IsEmpty) then
    begin
      qyPedItemAgrup.First;

      while not qyPedItemAgrup.Eof do
      begin
        stDados.Clear;

        ExecuteSimplesSql(DmERP.fdConnERP,
                          'SELECT COUNT(a.cdIdQtde) AS qtdBaixa ' +
                          '  FROM erp.intIndBaixaProducao a ' +
                          ' INNER JOIN erp.setor b ON (b.cdSetor = a.cdSetor) ' +
                          ' WHERE b.' + sCampoMov + ' = ''S'' ' +
                          '   AND a.cdPedido = ' + qyPedItemAgrup.FieldByName('nuPedidoOri').AsString +
                          '   AND a.cdSeqPed = ' + qyPedItemAgrup.FieldByName('nuSeqPedOri').AsString{ +
                          '   AND a.cdItem = ' + QuotedStr(qyPedItemAgrup.FieldByName('cdItem').AsString)},
                          'qtdBaixa',
                          stDados
                         );

        if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
          Result := Result + StrToIntDef(stDados.Strings[0], 0);

        qyPedItemAgrup.Next;
      end;
    end;
  end;
begin
{
  iTipoImp = 1 -> Etiqueta
  iTipoImp = 2 -> Rel. Produção
  iTipoImp = 3 -> Bilhetinho
  iTipoImp = 4 -> Lista Pedidos
  iTipoImp = 5 -> Lista Pedido Por Representante
  iTipoImp = 6 -> Valor Vendas UF
  iTipoImp = 7 -> Baixa de Produção
  iTipoImp = 8 -> Lista Item Pedidos
  iTipoImp = 9 -> Lista Pedidos 2
  iTipoImp = 10 -> Lista Pedidos 3
  iTipoImp = 11 -> Lista Carregamento
  iTipoImp = 12 -> Lista Pedido Por Cliente
  iTipoImp = 13 -> Vendas Mês Por Representante
  iTipoImp = 14 -> Vendas Mês Nfe Por Representante
  iTipoImp = 15 -> Referências Vendidas
  iTipoImp = 16 -> Extrato de Vendas Por Cliente
  iTipoImp = 17 -> Acomp. Metas Repres.
  iTipoImp = 18 -> Extrato Carregamento
  iTipoImp = 19 -> Rel. Conferência
}

  stDados           := TStringList.Create;
  stListaCli        := TStringList.Create;
  stListaCli.Sorted := True;
  FstListaEmailRep.Clear;

  if not qyDados.IsEmpty then
  begin
    qyDados.First;
    stListaCli.Add(qyDados.FieldByName('codigo_cliente').AsString);
    FstListaEmailRep.Add(Trim(qyDados.FieldByName('deEmailRep').AsString));
    inuPedido    := qyDados.FieldByName('nuPedido').AsInteger;
    bZerarCreDeb := False;
    icdCarga     := 0;

    while not qyDados.Eof do
    begin
      if not (iTipoImp in[13, 14, 16, 17]) then
      begin
        if DmERP.qyIntComItemPedImpresso.Active then
          DmERP.qyIntComItemPedImpresso.Close;

        DmERP.qyIntComItemPedImpresso.MacroByName('filtro').Value := ' WHERE cdUsuarioImpressao = ' + IntToStr(FTelaInicial.FcdUsuario) +
                                                                     '   AND nuTipoImpressao = ' + IntToStr(iTipoImp) +
                                                                     '   AND nuPedido = ' + qyDados.FieldByName('nuPedido').AsString +
                                                                     '   AND nuSeqItem = ' + qyDados.FieldByName('seq').AsString;

        DmERP.qyIntComItemPedImpresso.Open();
        bPedEtiqJaImp := not DmERP.qyIntComItemPedImpresso.IsEmpty;

        if (not bPedEtiqJaImp) then
        begin
          DmERP.qyIntComItemPedImpresso.Insert;
          DmERP.qyIntComItemPedImpresso.FieldByName('nuTipoImpressao').AsInteger := iTipoImp;
          DmERP.qyIntComItemPedImpresso.FieldByName('nuPedido').AsInteger        := qyDados.FieldByName('nuPedido').AsInteger;
          DmERP.qyIntComItemPedImpresso.FieldByName('nuSeqItem').AsInteger       := qyDados.FieldByName('seq').AsInteger;
          DmERP.qyIntComItemPedImpresso.Post;
        end;
      end;

      if (
          (not cbSomenteEtiqNaoimpressa.Checked) or
          (
           (cbSomenteEtiqNaoimpressa.Checked) and (not bPedEtiqJaImp)
          ) or
          (iTipoImp <> 1)
         ) then
      begin
        vtPedido.Append;

        snmMotorista := '';

        if (qyDados.FieldByName('cdCarga').AsInteger > 0) and
           (icdCarga <> qyDados.FieldByName('cdCarga').AsInteger) then
        begin
          icdCarga := qyDados.FieldByName('cdCarga').AsInteger;

          stDados.Clear;

          ExecuteSimplesSql(DmERP.fdConnERP,
                            'SELECT m.nmMotorista ' +
                            '  FROM erp.intComCarga a ' +
                            ' INNER JOIN erp.motorista m  ON (m.cdMotorista = a.cdMotorista) ' +
                            ' WHERE a.cdCarga = ' + qyDados.FieldByName('cdCarga').AsString,
                            'nmMotorista',
                            stDados
                           );

          if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
            snmMotorista := Trim(stDados.Strings[0]);
        end;

        if Trim(snmMotorista) <> '' then
          vtPedido.FieldByName('nmMotorista').AsString := snmMotorista;

        vtPedido.FieldByName('flEtiqEnvProd').AsString  := 'N';

        if iTipoImp in[2, 19] then
        begin
          if DmERP.qyIntComItemPedImpresso.Active then
            DmERP.qyIntComItemPedImpresso.Close;

          DmERP.qyIntComItemPedImpresso.MacroByName('filtro').Value := ' WHERE cdUsuarioImpressao = ' + IntToStr(FTelaInicial.FcdUsuario) +
                                                                       '   AND nuTipoImpressao = 1 ' +
                                                                       '   AND nuPedido = ' + qyDados.FieldByName('nuPedido').AsString +
                                                                       '   AND flEnvProducao = ''S'' ';

          DmERP.qyIntComItemPedImpresso.Open();

          if not DmERP.qyIntComItemPedImpresso.IsEmpty then
            vtPedido.FieldByName('flEtiqEnvProd').AsString  := 'S';
        end;

        vtPedido.FieldByName('flComPedido').AsString      := 'S';
        vtPedido.FieldByName('nuPedido').AsInteger        := qyDados.FieldByName('nuPedido').AsInteger;
        vtPedido.FieldByName('seq').AsInteger             := qyDados.FieldByName('seq').AsInteger;
        vtPedido.FieldByName('tpPedido').AsString         := qyDados.FieldByName('tpPedido').AsString;
        vtPedido.FieldByName('cdCidade').AsInteger        := qyDados.FieldByName('cdCidade').AsInteger;
        vtPedido.FieldByName('deCidade').AsString         := qyDados.FieldByName('deCidade').AsString;
        vtPedido.FieldByName('sgUf').AsString             := qyDados.FieldByName('sgUf').AsString;
        vtPedido.FieldByName('codigo_cliente').AsInteger  := qyDados.FieldByName('codigo_cliente').AsInteger;
        vtPedido.FieldByName('deFantasia').AsString       := qyDados.FieldByName('deFantasia').AsString;
        vtPedido.FieldByName('dtEmissao').AsDateTime      := qyDados.FieldByName('dtEmissao').AsDateTime;
        vtPedido.FieldByName('status_pedido').AsString    := qyDados.FieldByName('status_pedido').AsString;
        vtPedido.FieldByName('cdItem').AsString           := qyDados.FieldByName('cdItem').AsString;
        vtPedido.FieldByName('descricao').AsString        := qyDados.FieldByName('descricao').AsString;
        vtPedido.FieldByName('nuQtd').AsInteger           := qyDados.FieldByName('nuQtd').AsInteger;
        vtPedido.FieldByName('deRazaoSocial').AsString    := qyDados.FieldByName('deRazaoSocial').AsString;
        vtPedido.FieldByName('cdRep').AsInteger           := qyDados.FieldByName('cdRep').AsInteger;
        vtPedido.FieldByName('deRep').AsString            := qyDados.FieldByName('deRep').AsString;
        vtPedido.FieldByName('dt_reg').AsDateTime         := qyDados.FieldByName('dt_reg').AsDateTime;
        vtPedido.FieldByName('vlPercDesc').AsCurrency     := qyDados.FieldByName('vlPercDesc').AsCurrency;
        vtPedido.FieldByName('item').AsString             := qyDados.FieldByName('item').AsString;
        vtPedido.FieldByName('cgc').AsString              := qyDados.FieldByName('cgc').AsString;
        vtPedido.FieldByName('bairro').AsString           := qyDados.FieldByName('bairro').AsString;
        vtPedido.FieldByName('cep').AsString              := qyDados.FieldByName('cep').AsString;
        vtPedido.FieldByName('end').AsString              := qyDados.FieldByName('end').AsString;
        vtPedido.FieldByName('nuEndereco').AsString       := qyDados.FieldByName('nuEndereco').AsString;
        vtPedido.FieldByName('deComplEnd').AsString       := qyDados.FieldByName('deComplEnd').AsString;
        vtPedido.FieldByName('nuCep').AsString            := qyDados.FieldByName('nuCep').AsString;
        vtPedido.FieldByName('deEmail').AsString          := qyDados.FieldByName('deEmail').AsString;
        vtPedido.FieldByName('vl_unitario').AsCurrency    := qyDados.FieldByName('vl_unitario').AsCurrency;
        vtPedido.FieldByName('vl_bruto').AsCurrency       := qyDados.FieldByName('vl_bruto').AsCurrency;
        vtPedido.FieldByName('vl_lucro').AsCurrency       := qyDados.FieldByName('vl_lucro').AsCurrency;
        vtPedido.FieldByName('vl_margem').AsCurrency      := qyDados.FieldByName('vl_margem').AsCurrency;
        vtPedido.FieldByName('vl_total').AsCurrency       := qyDados.FieldByName('vl_total').AsCurrency;
        vtPedido.FieldByName('vlTotalItem').AsCurrency    := qyDados.FieldByName('vlTotalItem').AsCurrency;
        vtPedido.FieldByName('vlDesc').AsCurrency         := qyDados.FieldByName('vlDesc').AsCurrency;
        vtPedido.FieldByName('vlTotBruto').AsCurrency     := qyDados.FieldByName('vlTotBruto').AsCurrency;
        vtPedido.FieldByName('codigo_banco').AsString     := qyDados.FieldByName('codigo_banco').AsString;
        vtPedido.FieldByName('nmBanco').AsString          := qyDados.FieldByName('nmBanco').AsString;
        vtPedido.FieldByName('tipo_cobranca').AsInteger   := qyDados.FieldByName('tipo_cobranca').AsInteger;
        vtPedido.FieldByName('deCobranca').AsString       := qyDados.FieldByName('deCobranca').AsString;
        vtPedido.FieldByName('dePrazo').AsString          := qyDados.FieldByName('dePrazo').AsString;
        vtPedido.FieldByName('deObs3').AsString           := qyDados.FieldByName('deObs3').AsString;
        vtPedido.FieldByName('deObs4').AsString           := qyDados.FieldByName('deObs4').AsString;
        vtPedido.FieldByName('deObsPed').AsString         := qyDados.FieldByName('deObsPed').AsString;
        vtPedido.FieldByName('deObs').AsString            := qyDados.FieldByName('deObs').AsString;
        vtPedido.FieldByName('cdGrupoFat').AsInteger      := qyDados.FieldByName('cdGrupoFat').AsInteger;
        vtPedido.FieldByName('deGrupoFat').AsString       := qyDados.FieldByName('deGrupoFat').AsString;
        vtPedido.FieldByName('dePeriodo').AsString        := qyDados.FieldByName('dePeriodo').AsString;
        vtPedido.FieldByName('deObsCli').AsString         := qyDados.FieldByName('deObsCli').AsString;
        vtPedido.FieldByName('cdCarga').AsInteger         := qyDados.FieldByName('cdCarga').AsInteger;
        vtPedido.FieldByName('deCarga').AsString          := qyDados.FieldByName('deCarga').AsString;
        vtPedido.FieldByName('cdUsuCad').AsInteger        := qyDados.FieldByName('cdUsuCad').AsInteger;
        vtPedido.FieldByName('deUsuCad').AsString         := qyDados.FieldByName('deUsuCad').AsString;
        vtPedido.FieldByName('vlDescNfs').AsCurrency      := qyDados.FieldByName('vlDescNfs').AsCurrency;
        vtPedido.FieldByName('nuTotItens').AsInteger      := qyDados.FieldByName('nuTotItens').AsInteger;
        vtPedido.FieldByName('deNatureza').AsString       := qyDados.FieldByName('deNatureza').AsString;
        vtPedido.FieldByName('nuTotVolumes').AsInteger    := qyDados.FieldByName('nuTotVolumes').AsInteger;
        vtPedido.FieldByName('dtEmissaoNfs').AsDateTime   := qyDados.FieldByName('dtEmissaoNfs').AsDateTime;
        vtPedido.FieldByName('flEhPontoDoze').AsString    := qyDados.FieldByName('flEhPontoDoze').AsString;
        vtPedido.FieldByName('nuInscEst').AsString        := qyDados.FieldByName('nuInscEst').AsString;
        vtPedido.FieldByName('dePathImgItem').AsString    := qyDados.FieldByName('dePathImgItem').AsString;
        vtPedido.FieldByName('nuNfs').AsInteger           := qyDados.FieldByName('nuNfs').AsInteger;

        vtPedido.FieldByName('vlFaturado').AsCurrency     := qyDados.FieldByName('vlFaturado').AsCurrency;
        vtPedido.FieldByName('flDesc70').AsString         := qyDados.FieldByName('flDesc70').AsString;
        vtPedido.FieldByName('vlFrete').AsCurrency        := qyDados.FieldByName('vlFrete').AsCurrency;

        if (Pos('ENZIT', qyDados.FieldByName('cdItem').AsString) > 0) or
           (Pos('ENZIB', qyDados.FieldByName('cdItem').AsString) > 0) then
          vtPedido.FieldByName('flEhEbenzer').AsString    := 'S'
        else
          vtPedido.FieldByName('flEhEbenzer').AsString    := 'N';

        if FbMostrarValor then
          vtPedido.FieldByName('flMostrarValor').AsString := 'S'
        else
          vtPedido.FieldByName('flMostrarValor').AsString := 'N';

        vtPedido.FieldByName('vlDevido').AsCurrency       := 0;
        vtPedido.FieldByName('vlCredito').AsCurrency      := 0;

        if iTipoImp = 3 then  // Somente para bilhetinhos
        begin
          stDados.Clear;

          ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                            'SELECT SUM(t.vl_total - t.vl_pgto) AS vlDevido ' +
                            '  FROM titulo t ' +
                            '  LEFT OUTER JOIN nfs n ON (n.nro_titulo = t.nro_titulo AND n.nro_nfs <>  ' + qyDados.FieldByName('nuNfs').AsString + ')' +
                            ' WHERE t.codigo_cliente = ' + qyDados.FieldByName('codigo_cliente').AsString +
                            '   AND t.situacao_titulo NOT IN(''P'', ''C'') ' +
                            '   AND t.codigo_tipoDoc <> 4 ' +
                            '   AND t.dt_vcto <= CURRENT_DATE ',
                            'vlDevido',
                            stDados
                           );

          if (stDados.Count > 0) and (StrToCurrDef(stDados.Strings[0], 0) > 0) then
            vtPedido.FieldByName('vlDevido').AsCurrency := StrToCurrDef(stDados.Strings[0], 0);

          stDados.Clear;

          ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                            'SELECT SUM(ad.valor_adiantado - ad.valor_abatido) AS vlCredito ' +
    		                    '  FROM adianta ad ' +
		                        '  WHERE ad.cliente_fornec = ' + qyDados.FieldByName('codigo_cliente').AsString +
		                        '    AND ad.data <= CURRENT_DATE',
                            'vlCredito',
                            stDados
                           );

          if (stDados.Count > 0) and (StrToCurrDef(stDados.Strings[0], 0) > 0) then
            vtPedido.FieldByName('vlCredito').AsCurrency := StrToCurrDef(stDados.Strings[0], 0);
        end;

        vtPedido.FieldByName('vlPrevisto').AsCurrency  := 0;
        vtPedido.FieldByName('vlMediaPrev').AsCurrency := 0;

        if iTipoImp = 17 then  // Somente para análise de vendas rep
        begin
          stDados.Clear;

          ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                            'SELECT vl_prev ' +
                            '  FROM cotaFina ' +
                            ' WHERE codigo_repres = ' + qyDados.FieldByName('cdRep').AsString +
                            '   AND periodo = ' + QuotedStr(qyDados.FieldByName('dePeriodo').AsString),
                            'vl_prev',
                            stDados
                           );

          if (stDados.Count > 0) and (StrToCurrDef(stDados.Strings[0], 0) > 0) then
            vtPedido.FieldByName('vlPrevisto').AsCurrency := StrToCurrDef(stDados.Strings[0], 0);

          stDados.Clear;

          ExecuteSimplesSql(DmERP.fdConnERP,
                            'SELECT vlMediaPrevisto ' +
                            '  FROM erp.intComCotaFinanceira ' +
                            ' WHERE cdRepresentante = ' + qyDados.FieldByName('cdRep').AsString +
                            '   AND dePeriodo = ' + QuotedStr(qyDados.FieldByName('dePeriodo').AsString),
                            'vlMediaPrevisto',
                            stDados
                           );

          if (stDados.Count > 0) and (StrToCurrDef(stDados.Strings[0], 0) > 0) then
            vtPedido.FieldByName('vlMediaPrev').AsCurrency := StrToCurrDef(stDados.Strings[0], 0);
        end;

        if bZerarCreDeb then
        begin
          vtPedido.FieldByName('vlDevido').AsCurrency     := 0;
          vtPedido.FieldByName('vlCredito').AsCurrency    := 0;
        end;

        if Trim(qyDados.FieldByName('deCompEmissao').AsString) <> '' then
          vtPedido.FieldByName('deCompEmissao').AsString  := qyDados.FieldByName('deCompEmissao').AsString;

        if Trim(qyDados.FieldByName('deCompEmisNfs').AsString) <> '' then
          vtPedido.FieldByName('deCompEmisNfs').AsString  := qyDados.FieldByName('deCompEmisNfs').AsString;

        if Trim(qyDados.FieldByName('deOrdCompEmis').AsString) <> '' then
          vtPedido.FieldByName('deOrdCompEmis').AsString  := qyDados.FieldByName('deOrdCompEmis').AsString;

        if Trim(qyDados.FieldByName('deOrdCompEmisNfs').AsString) <> '' then
          vtPedido.FieldByName('deOrdCompEmisNfs').AsString  := qyDados.FieldByName('deOrdCompEmisNfs').AsString;

        sdeCor      := '';
        sdeTipoAlca := '';
        sdeAdorno   := '';
        sdeChaveta  := '';
        sdeForracao := '';
        sdeImagem   := '';

        sdeCorExt      := '';
        sdeTipoAlcaExt := '';
        sdeAdornoExt   := '';
        sdeChavetaExt  := '';
        sdeForracaoExt := '';
        sdeImagemExt   := '';

//        EhConfPadrao(10, sdeCor, sdeCorExt);
        vtPedido.FieldByName('flAlcaPadrao').AsString     := EhConfPadrao(15);//, sdeTipoAlca, sdeTipoAlcaExt);
        vtPedido.FieldByName('flAdornoPadrao').AsString   := EhConfPadrao(19);//, sdeAdorno, sdeAdornoExt);
        vtPedido.FieldByName('flChavetaPadrao').AsString  := EhConfPadrao(20);//, sdeChaveta, sdeChavetaExt);
        vtPedido.FieldByName('flForracaoPadrao').AsString := EhConfPadrao(25);//, sdeForracao, sdeForracaoExt);
//        EhConfPadrao(30, sdeImagem, sdeImagemExt);

        vtPedido.FieldByName('deTamanho').AsString  := qyDados.FieldByName('deMascTam').AsString;
        vtPedido.FieldByName('deCor').AsString      := 'C'  + qyDados.FieldByName('deMascCor').AsString; //sdeCor;
        vtPedido.FieldByName('deTipoAlca').AsString := 'A'  + qyDados.FieldByName('deMascAlca').AsString; //sdeTipoAlca;
        vtPedido.FieldByName('deAdorno').AsString   := 'AD'  + qyDados.FieldByName('deMascAdorno').AsString; //sdeAdorno;
        vtPedido.FieldByName('deChaveta').AsString  := 'CH'  + qyDados.FieldByName('deMascChaveta').AsString; //sdeChaveta;
        vtPedido.FieldByName('deForracao').AsString := 'F'  + qyDados.FieldByName('deMascForracao').AsString; //sdeForracao;
        vtPedido.FieldByName('deImagem').AsString   := 'I'  + qyDados.FieldByName('deMascImagem').AsString; //sdeImagem;

        vtPedido.FieldByName('deCorExt').AsString      := qyDados.FieldByName('deVarSeqCor').AsString; //sdeCorExt;
        vtPedido.FieldByName('deTipoAlcaExt').AsString := qyDados.FieldByName('deVarSeqAlca').AsString; //sdeTipoAlcaExt;
        vtPedido.FieldByName('deAdornoExt').AsString   := qyDados.FieldByName('deVarSeqAdorno').AsString; //sdeAdornoExt;
        vtPedido.FieldByName('deChavetaExt').AsString  := qyDados.FieldByName('deVarSeqChaveta').AsString; //sdeChavetaExt;
        vtPedido.FieldByName('deForracaoExt').AsString := qyDados.FieldByName('deVarSeqForracao').AsString; //sdeForracaoExt;
        vtPedido.FieldByName('deImagemExt').AsString   := qyDados.FieldByName('deVarSeqImagem').AsString; //sdeImagemExt;

        if Pos('*', vtPedido.FieldByName('descricao').AsString) = 0 then
          vtPedido.FieldByName('deDescIni').AsString  := Trim(qyDados.FieldByName('descricao').AsString)
        else
          vtPedido.FieldByName('deDescIni').AsString  := Trim(
                                                              Copy(qyDados.FieldByName('descricao').AsString,
                                                                   1,
                                                                   Pos('*', qyDados.FieldByName('descricao').AsString) - 1
                                                                  )
                                                             );

        MontaDescItem('deCor', 'deCorExt', '',
                     (not SameText('ACESS', Copy(Trim(qyDados.FieldByName('cdItem').AsString), 1, 5)))
                     );

        MontaDescItem('deTipoAlca', 'deTipoAlcaExt', 'flAlcaPadrao',
                     (not SameText('ACESS', Copy(Trim(qyDados.FieldByName('cdItem').AsString), 1, 5)))
                     );

        MontaDescItem('deAdorno', 'deAdornoExt', 'flAdornoPadrao', True);
        MontaDescItem('deChaveta', 'deChavetaExt', 'flChavetaPadrao', True);

        MontaDescItem('deForracao', 'deForracaoExt', 'flForracaoPadrao',
                     (not SameText('ACESS', Copy(Trim(qyDados.FieldByName('cdItem').AsString), 1, 5)))
                     );

        MontaDescItem('deImagem', 'deImagemExt', '', True);

        if (not SameText('ACESS', Copy(Trim(qyDados.FieldByName('cdItem').AsString), 1, 5))) then
          vtPedido.FieldByName('deDescVarsItem').AsString := vtPedido.FieldByName('deDescIni').AsString + ' * ' +
                                                             vtPedido.FieldByName('deDescVarsItem').AsString;

        vtPedido.FieldByName('nuQtdBaixaEmb').AsInteger    := 0;
        vtPedido.FieldByName('nuQtdBaixaCarreg').AsInteger := 0;

        vtPedido.FieldByName('cdItemGrupo').AsInteger      := qyDados.FieldByName('cdItemGrupo').AsInteger;
        vtPedido.FieldByName('deItemGrupo').AsString       := qyDados.FieldByName('deItemGrupo').AsString;
        vtPedido.FieldByName('cdItemSubGrupo').AsInteger   := qyDados.FieldByName('cdItemSubGrupo').AsInteger;
        vtPedido.FieldByName('deItemSubGrupo').AsString    := qyDados.FieldByName('deItemSubGrupo').AsString;
        vtPedido.FieldByName('deItemTexto01').AsString     := qyDados.FieldByName('deItemTexto01').AsString;
        vtPedido.FieldByName('deItemTexto02').AsString     := qyDados.FieldByName('deItemTexto02').AsString;
        vtPedido.FieldByName('deItemTexto03').AsString     := qyDados.FieldByName('deItemTexto03').AsString;
        vtPedido.FieldByName('deObsCompleta').AsString     := qyDados.FieldByName('deObsCompleta').AsString;
        vtPedido.FieldByName('deEmailRep').AsString        := qyDados.FieldByName('deEmailRep').AsString;

        if iTipoImp = 7 then
        begin
          stDados.Clear;

          ExecuteSimplesSql(DmERP.fdConnERP,
                            'SELECT COUNT(a.cdIdQtde) AS qtdBaixa ' +
                            '  FROM erp.intIndBaixaProducao a ' +
                            ' INNER JOIN erp.setor b ON (b.cdSetor = a.cdSetor) ' +
                            ' WHERE b.flEhSetorEmbalagem = ''S'' ' +
                            '   AND a.cdPedido = ' + vtPedido.FieldByName('nuPedido').AsString +
                            '   AND a.cdSeqPed = ' + vtPedido.FieldByName('seq').AsString,
                            'qtdBaixa',
                            stDados
                           );

          if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
            vtPedido.FieldByName('nuQtdBaixaEmb').AsInteger := StrToIntDef(stDados.Strings[0], 0);

          if vtPedido.FieldByName('nuQtdBaixaEmb').AsInteger = 0 then
            vtPedido.FieldByName('nuQtdBaixaEmb').AsInteger := QtdMovItemPed('flEhSetorEmbalagem');

          if vtPedido.FieldByName('nuQtdBaixaEmb').AsInteger > vtPedido.FieldByName('nuQtd').AsInteger then
            vtPedido.FieldByName('nuQtdBaixaEmb').AsInteger := vtPedido.FieldByName('nuQtd').AsInteger;

          stDados.Clear;

          ExecuteSimplesSql(DmERP.fdConnERP,
                            'SELECT COUNT(a.cdIdQtde) AS qtdBaixa ' +
                            '  FROM erp.intIndBaixaProducao a ' +
                            ' INNER JOIN erp.setor b ON (b.cdSetor = a.cdSetor) ' +
                            ' WHERE b.flEhSetorExpedicao = ''S'' ' +
                            '   AND a.cdPedido = ' + vtPedido.FieldByName('nuPedido').AsString +
                            '   AND a.cdSeqPed = ' + vtPedido.FieldByName('seq').AsString,
                            'qtdBaixa',
                            stDados
                           );

          if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
            vtPedido.FieldByName('nuQtdBaixaCarreg').AsInteger := StrToIntDef(stDados.Strings[0], 0);

          if vtPedido.FieldByName('nuQtdBaixaCarreg').AsInteger = 0 then
            vtPedido.FieldByName('nuQtdBaixaCarreg').AsInteger := QtdMovItemPed('flEhSetorExpedicao');

          if vtPedido.FieldByName('nuQtdBaixaCarreg').AsInteger > vtPedido.FieldByName('nuQtd').AsInteger then
            vtPedido.FieldByName('nuQtdBaixaCarreg').AsInteger := vtPedido.FieldByName('nuQtd').AsInteger;
        end;

        vtPedido.FieldByName('dePedidosAgrup').AsString := PedidosAgrupados;

        if (iTipoImp = 17) and  // Somente para análise de vendas rep
           (Trim(vtPedido.FieldByName('dePedidosAgrup').AsString) <> '') then
          vtPedido.Cancel
        else
          vtPedido.Post;
      end;

      qyDados.Next;

      ListaEmailsRepres(qyDados.FieldByName('deEmailRep').AsString);

      //Somente para os bilhetinhos
      if (iTipoImp = 3) and (inuPedido <> qyDados.FieldByName('nuPedido').AsInteger) then
      begin
        bZerarCreDeb := (ClienteJaEstaNaLista(qyDados.FieldByName('codigo_cliente').AsString));
        inuPedido    := qyDados.FieldByName('nuPedido').AsInteger;
      end;
    end;
  end;

  if bListaCliSemPed then
  begin
    if DmIntegracao.qyClientesSemPed.Active then
      DmIntegracao.qyClientesSemPed.Close;

    DmIntegracao.qyClientesSemPed.MacroByName('filtro').Clear;
    DmIntegracao.qyClientesSemPed.MacroByName('data').Clear;

    sAux := '';

    if (eddtRegIni.Checked) and
       (eddtRegFim.Checked) and
       (FormatDateTime('dd/mm/yyyy', eddtRegIni.Date) <> '30/12/1899') and
       (FormatDateTime('dd/mm/yyyy', eddtRegFim.Date) <> '30/12/1899') then
      sAux := ' p.dt_reg BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegIni.DateTime)) +
              '              AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegFim.DateTime))
    else if (eddtEmissaoIni.Checked) and
            (eddtEmissaoFim.Checked) and
            (FormatDateTime('dd/mm/yyyy', eddtEmissaoIni.Date) <> '30/12/1899') and
            (FormatDateTime('dd/mm/yyyy', eddtEmissaoFim.Date) <> '30/12/1899') then
      sAux := ' p.dt_emissao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoIni.DateTime)) +
              '                  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoFim.DateTime))
    else if (Trim(eddePeriodoIni.ERPEdCampoChaveText) <> '') and
            (eddePeriodoIni.ERPValorValido) and
            (Trim(eddePeriodoFim.ERPEdCampoChaveText) <> '') and
            (eddePeriodoFim.ERPValorValido) then
      sAux := ' p.periodo BETWEEN ' + QuotedStr(eddePeriodoIni.ERPEdCampoChaveText) + ' AND ' + QuotedStr(eddePeriodoFim.ERPEdCampoChaveText);

    if Trim(sAux) <> '' then
      DmIntegracao.qyClientesSemPed.MacroByName('data').Value := ' AND ' + sAux;

    sAux := '';

    if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > 0) and
       (edcdRepIni.ERPValorValido) and
       (StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0) > 0) and
       (edcdRepIni.ERPValorValido) then
      sAux := '  t.cdRep BETWEEN ' + Trim(edcdRepIni.ERPEdCampoChaveText) +
              '              AND ' + Trim(edcdRepFim.ERPEdCampoChaveText);

    if (Trim(edcdGrupoCliIni.ERPEdCampoChaveText) <> '') and
       (edcdGrupoCliIni.ERPValorValido) and
       (Trim(edcdGrupoCliFim.ERPEdCampoChaveText) <> '') and
       (edcdGrupoCliFim.ERPValorValido) then
      AdicionaCondSql(sAux, ' t.cdGrupoCli BETWEEN ' + Trim(edcdGrupoCliIni.ERPEdCampoChaveText) +
                            '                  AND ' + Trim(edcdGrupoCliFim.ERPEdCampoChaveText)
                     );

    if Trim(sAux) <> '' then
      sAux := ' WHERE ' + sAux;

    if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > 0) and
       (edcdRepIni.ERPValorValido) and
       (StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0) > 0) and
       (edcdRepIni.ERPValorValido) then
      sAux := sAux + ' ORDER BY t.cdRep, sgUF'
    else
      sAux := ' ORDER BY t.cdRep, t.cdCliente';

    DmIntegracao.qyClientesSemPed.MacroByName('filtro').Value := sAux;

    DmIntegracao.qyClientesSemPed.Open;

    if not DmIntegracao.qyClientesSemPed.IsEmpty then
    begin
      DmIntegracao.qyClientesSemPed.First;

      while not DmIntegracao.qyClientesSemPed.Eof do
      begin
        vtPedido.Append;

        vtPedido.FieldByName('flComPedido').AsString      := 'N';
        vtPedido.FieldByName('nuPedido').AsInteger        := 0;
        vtPedido.FieldByName('seq').AsInteger             := 0;

        vtPedido.FieldByName('deCidade').AsString         := DmIntegracao.qyClientesSemPed.FieldByName('deCidade').AsString;
        vtPedido.FieldByName('sgUf').AsString             := DmIntegracao.qyClientesSemPed.FieldByName('sgUf').AsString;
        vtPedido.FieldByName('codigo_cliente').AsInteger  := DmIntegracao.qyClientesSemPed.FieldByName('cdCliente').AsInteger;
        vtPedido.FieldByName('deFantasia').AsString       := DmIntegracao.qyClientesSemPed.FieldByName('deFantasiaCliente').AsString;
        vtPedido.FieldByName('nuQtd').AsInteger           := 0;
        vtPedido.FieldByName('deRazaoSocial').AsString    := DmIntegracao.qyClientesSemPed.FieldByName('deRazaoSocialCliente').AsString;
        vtPedido.FieldByName('cdRep').AsInteger           := DmIntegracao.qyClientesSemPed.FieldByName('cdRep').AsInteger;
        vtPedido.FieldByName('deRep').AsString            := DmIntegracao.qyClientesSemPed.FieldByName('deRazaoSocialRep').AsString;
        vtPedido.FieldByName('vlPercDesc').AsCurrency     := 0;
        vtPedido.FieldByName('cgc').AsString              := DmIntegracao.qyClientesSemPed.FieldByName('cgc').AsString;
        vtPedido.FieldByName('bairro').AsString           := DmIntegracao.qyClientesSemPed.FieldByName('bairro').AsString;
        vtPedido.FieldByName('cep').AsString              := DmIntegracao.qyClientesSemPed.FieldByName('cep').AsString;
        vtPedido.FieldByName('end').AsString              := DmIntegracao.qyClientesSemPed.FieldByName('end').AsString;
        vtPedido.FieldByName('vl_unitario').AsCurrency    := 0;
        vtPedido.FieldByName('vl_bruto').AsCurrency       := 0;
        vtPedido.FieldByName('vl_lucro').AsCurrency       := 0;
        vtPedido.FieldByName('vl_margem').AsCurrency      := 0;
        vtPedido.FieldByName('vl_total').AsCurrency       := 0;
        vtPedido.FieldByName('vlTotalItem').AsCurrency    := 0;
        vtPedido.FieldByName('vlDesc').AsCurrency         := 0;
        vtPedido.FieldByName('vlTotBruto').AsCurrency     := 0;
        vtPedido.FieldByName('deObsCli').AsString         := DmIntegracao.qyClientesSemPed.FieldByName('deObsCli').AsString;
        vtPedido.FieldByName('vlDescNfs').AsCurrency      := 0;
        vtPedido.FieldByName('vlDevido').AsCurrency       := 0;
        vtPedido.FieldByName('vlCredito').AsCurrency      := 0;
        vtPedido.FieldByName('nuTotItens').AsInteger      := 0;
        vtPedido.FieldByName('nuTotVolumes').AsInteger    := 0;

        vtPedido.Post;

        DmIntegracao.qyClientesSemPed.Next;
      end;
    end;
  end;

  if Assigned(stListaCli) then
    FreeAndNil(stListaCli);

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TFIntComRelatorios.ImprimirEtiqueta;
var
  iQtd : Integer;
begin
  vtEtiqueta.Clear;
  GerarInfoPedido(' ORDER BY t.nuPedido, t.seq',
                  1,
                  False
                 );

  vtPedido.First;

  while not vtPedido.Eof do
  begin
    iQtd := 1;

    while iQtd <= vtPedido.FieldByName('nuQtd').AsInteger do
    begin //Item Enzithan, Enzibac e Acessório de Fibra em metro só imprime a última etiqueta
      if (
          (iQtd = vtPedido.FieldByName('nuQtd').AsInteger) and
          (
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 5) = 'ENZIT') or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 5) = 'ENZIB') or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 7) = 'CAV.ACR') or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 7) = 'CAV.MDF') or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 8) = 'FIBRA.MT') or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 7) = 'SUP.CON') or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 4) = 'TRAV') or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 8) = 'EMB.URNA') or
           (
            (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 5) = 'ACESS') and
            (
             (SomenteNumeros(vtPedido.FieldByName('deAdorno').AsString) = '366') or
             (SomenteNumeros(vtPedido.FieldByName('deAdorno').AsString) = '370')
            )
           )
          )
         ) or
         (
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 5) <> 'ENZIT') and
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 5) <> 'ENZIB') and
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 7) <> 'CAV.ACR') and
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 7) <> 'CAV.MDF') and
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 8) <> 'FIBRA.MT') and
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 7) <> 'SUP.CON') and
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 4) <> 'TRAV') and
          (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 8) <> 'EMB.URNA') and
          (
           (
            (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 5) = 'ACESS') and
            (SomenteNumeros(vtPedido.FieldByName('deAdorno').AsString) <> '366') and
            (SomenteNumeros(vtPedido.FieldByName('deAdorno').AsString) <> '370')
           ) or
           (Copy(Trim(vtPedido.FieldByName('cdItem').AsString), 1, 5) <> 'ACESS')
          )
         ) then
      begin
        vtEtiqueta.Append;
        vtEtiqueta.FieldByName('cdItem').AsString           := vtPedido.FieldByName('cdItem').AsString;
        vtEtiqueta.FieldByName('dtEmissao').AsDateTime      := vtPedido.FieldByName('dtEmissao').AsDateTime;
        vtEtiqueta.FieldByName('deCidade').AsString         := vtPedido.FieldByName('deCidade').AsString;
        vtEtiqueta.FieldByName('sgUf').AsString             := vtPedido.FieldByName('sgUf').AsString;
        vtEtiqueta.FieldByName('deRazaoSocial').AsString    := vtPedido.FieldByName('deRazaoSocial').AsString;
        vtEtiqueta.FieldByName('deFantasia').AsString       := vtPedido.FieldByName('deFantasia').AsString;
        vtEtiqueta.FieldByName('flAlcaPadrao').AsString     := vtPedido.FieldByName('flAlcaPadrao').AsString;
        vtEtiqueta.FieldByName('flAdornoPadrao').AsString   := vtPedido.FieldByName('flAdornoPadrao').AsString;
        vtEtiqueta.FieldByName('flChavetaPadrao').AsString  := vtPedido.FieldByName('flChavetaPadrao').AsString;
        vtEtiqueta.FieldByName('flForracaoPadrao').AsString := vtPedido.FieldByName('flForracaoPadrao').AsString;
        vtEtiqueta.FieldByName('deCor').AsString            := vtPedido.FieldByName('deCor').AsString;
        vtEtiqueta.FieldByName('deTipoAlca').AsString       := vtPedido.FieldByName('deTipoAlca').AsString;
        vtEtiqueta.FieldByName('deAdorno').AsString         := vtPedido.FieldByName('deAdorno').AsString;
        vtEtiqueta.FieldByName('deChaveta').AsString        := vtPedido.FieldByName('deChaveta').AsString;
        vtEtiqueta.FieldByName('deForracao').AsString       := vtPedido.FieldByName('deForracao').AsString;
        vtEtiqueta.FieldByName('deImagem').AsString         := vtPedido.FieldByName('deImagem').AsString;
        vtEtiqueta.FieldByName('deCorExt').AsString         := vtPedido.FieldByName('deCorExt').AsString;
        vtEtiqueta.FieldByName('deTipoAlcaExt').AsString    := vtPedido.FieldByName('deTipoAlcaExt').AsString;
        vtEtiqueta.FieldByName('deAdornoExt').AsString      := vtPedido.FieldByName('deAdornoExt').AsString;
        vtEtiqueta.FieldByName('deChavetaExt').AsString     := vtPedido.FieldByName('deChavetaExt').AsString;
        vtEtiqueta.FieldByName('deForracaoExt').AsString    := vtPedido.FieldByName('deForracaoExt').AsString;
        vtEtiqueta.FieldByName('deImagemExt').AsString      := vtPedido.FieldByName('deImagemExt').AsString;
        vtEtiqueta.FieldByName('deDescIni').AsString        := vtPedido.FieldByName('deDescIni').AsString;
        vtEtiqueta.FieldByName('nuPedido').AsString         := vtPedido.FieldByName('nuPedido').AsString;
        vtEtiqueta.FieldByName('cdRep').AsString            := vtPedido.FieldByName('cdRep').AsString;
        vtEtiqueta.FieldByName('seq').AsInteger             := vtPedido.FieldByName('seq').AsInteger;
        vtEtiqueta.FieldByName('nuTotItens').AsInteger      := vtPedido.FieldByName('nuTotItens').AsInteger;
        vtEtiqueta.FieldByName('seqQtd').AsInteger          := iQtd;
        vtEtiqueta.FieldByName('dePathImgItem').AsString    := vtPedido.FieldByName('dePathImgItem').AsString;
        vtEtiqueta.FieldByName('deDescVarsItem').AsString   := vtPedido.FieldByName('deDescVarsItem').AsString;
        vtEtiqueta.FieldByName('deItemTexto01').AsString    := vtPedido.FieldByName('deItemTexto01').AsString;
        vtEtiqueta.FieldByName('deItemTexto02').AsString    := vtPedido.FieldByName('deItemTexto02').AsString;
        vtEtiqueta.FieldByName('deItemTexto03').AsString    := vtPedido.FieldByName('deItemTexto03').AsString;
        vtEtiqueta.FieldByName('deTamanho').AsString        := vtPedido.FieldByName('deTamanho').AsString;
        vtEtiqueta.Post;
      end;

      Inc(iQtd);
    end;

    vtPedido.Next;
  end;

  relEtiqueta.PrepareReport();
  relEtiqueta.ShowReport();
end;

procedure TFIntComRelatorios.ImprimirEmTela(const bEnviarPorEmail : Boolean;
                                            const sNomeArq,
                                                  sAssunto,
                                                  sPara,
                                                  sCc             : String;
                                            const stTexto         : TStringList
                                           );
begin
  relIntComercial.LoadFromFile(FsPathRelatorios + FsNomeRelatorio + '.fr3');
  relIntComercial.PrepareReport();
  CarregarImgLogoEmpRel(relIntComercial);

  if not bEnviarPorEmail then
    relIntComercial.ShowReport()
  else
  begin
    frPdfExport.DefaultPath := ExtractFilePath(Application.ExeName);
    frPdfExport.FileName    := sNomeArq;

    if FileExists(frPdfExport.DefaultPath + frPdfExport.FileName) then
      DeleteFile(frPdfExport.DefaultPath + frPdfExport.FileName);

    relIntComercial.Export(frPdfExport);

    FEmail := TFEmail.Create(Application);

    try
      FEmail.edAssunto.Text   := sAssunto;
      FEmail.mTextoEmail.Lines.AddStrings(stTexto);
      FEmail.edPara.Text      := sPara;
      FEmail.edCc.Text        := sCc;

      FEmail.lbListaAnexo.Items.Clear;
      FEmail.lbListaAnexo.Items.Add(frPdfExport.FileName);

      FEmail.ShowModal;
    finally
      FreeAndNil(FEmail);
    end;
  end;
end;

procedure TFIntComRelatorios.ImprimirListaProd;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.deCidade, t.codigo_cliente, t.nuPedido, t.seq',
                  2,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaProd';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirBilhetinho;
var
  stTexto : TStringList;
  sOrd : String;
begin
  if cbBilhetinhoUmCliPorPag.Checked then
    sOrd := ' ORDER BY t.sgUf, t.deCidade, t.codigo_cliente, t.nuPedido, t.seq'
//    sOrd := ' ORDER BY t.codigo_cliente, t.flEhPontoDoze, t.sgUf, t.deCidade, t.nuPedido, t.seq'
  else
    sOrd := ' ORDER BY t.flEhPontoDoze, t.sgUf, t.deCidade, t.codigo_cliente, t.nuPedido, t.seq';

  GerarInfoPedido(sOrd, 3, False);

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelBilhetinho';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaPed;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdCarga, t.cdRep, t.sgUf, t.deCidade, t.codigo_cliente, t.nuPedido, t.seq',
                  4,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaPed';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaPedRep;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdRep, t.sgUf, t.deCidade, t.codigo_cliente, t.dt_reg, t.tpPedido, t.nuPedido',
                  5,
                  True
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaPedRep';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirValorVendasUF;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.sgUf, t.deCidade, t.nuPedido',
                  6,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelValorVendasUF';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaItemPed;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdCarga, t.item, t.nuPedido',
                  8,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaItemPed';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirBaixaProd;
var
  stTexto : TStringList;
  bNaoImpPedCanc : Boolean;
begin
  bNaoImpPedCanc := cbNaoImpPedCanc.Checked;

  if cbNaoImpPedCanc.Checked then
    cbNaoImpPedCanc.Checked := False;

  GerarInfoPedido(' ORDER BY t.cdCarga, t.nuPedido, t.seq',
                  7,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelBaixaProd';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  cbNaoImpPedCanc.Checked := bNaoImpPedCanc;

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaPed2;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdCarga, t.flEhPontoDoze, t.nuPedido, t.seq',
                  9,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaPed2';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaPed3(const bEnviarPorEmail : Boolean);
var
  stTexto : TStringList;
begin
  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaPed3';
  FbMostrarValor  := False;

  if Pergunta('Deseja imprimir os valores?') then
    FbMostrarValor := True;

  stTexto.Add('Srs. Representantes,');
  stTexto.Add('');
  stTexto.Add('');
  stTexto.Add('Segue anexo relatório de pedidos com as cidades especificadas.');

  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     GerarInfoPedido(' ORDER BY t.cdCarga, t.deCidade, t.nuPedido',
                                     10,
                                     False
                                    );

                     ImprimirEmTela(bEnviarPorEmail,
                                    'Lista_Pedidos.pdf',
                                    'Lista de Pedidos',
                                    AnsiReplaceStr(FstListaEmailRep.CommaText, ',', ';'),
                                    FTelaInicial.FdeEmail,
                                    stTexto
                                   );
                   end
                  );

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaCarregamento;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdCarga, t.deCidade, t.codigo_cliente, t.nuPedido, t.seq',
                  11,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaCarreg';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaPedCli;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.sgUf, t.deCidade, t.codigo_cliente, t.dt_reg, t.tpPedido, t.nuPedido, t.seq',
                  12,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaPedCli';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirVendasMesEmissRep;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdRep',
                  13,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelVendasEmissRep';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirVendasMesEmissNfeRep;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdRep',
                  14,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelVendasEmissNfeRep';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirRefVendidas;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdItemSubGrupo, t.cdItem',
                  15,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelRefVendidas';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirExtratoVendasCli;
begin
  GerarInfoPedido(' ORDER BY t.cdRep, t.sgUf, t.deCidade, t.codigo_cliente',
                  16,
                  True
                 );

  expExcel.FileName := 'Extrato_Vendas.xls';

  relExtratoVendaCli.PrepareReport();
  CarregarImgLogoEmpRel(relExtratoVendaCli);
//  relExtratoVendaCli.ShowReport();
  relExtratoVendaCli.Export(expExcel);
end;

procedure TFIntComRelatorios.ImprimirAcompMetasRep(const bEnviarPorEmail : Boolean);
var
  stTexto : TStringList;
begin
  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelAcompMetasRep';

  stTexto.Add('Segue anexo relatório de acompanhamento de metas.');

  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     GerarInfoPedido(' ORDER BY t.cdRep, t.dePeriodo',
                                     17,
                                     False
                                    );

                     ImprimirEmTela(bEnviarPorEmail,
                                    'Acompanhamento_Metas.pdf',
                                    'Acompanhamento de Metas',
                                    vtPedido.FieldByName('deEmailRep').AsString,
                                    '',
                                    stTexto
                                   );
                   end
                  );

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirExtratoCarregamento;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdCarga, t.deCidade, t.codigo_cliente, t.nuPedido, t.seq',
                  18,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelExtratoCarreg';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirListaConferencia;
var
  stTexto : TStringList;
begin
  GerarInfoPedido(' ORDER BY t.cdCarga, t.deCidade, t.codigo_cliente, t.nuPedido, t.seq',
                  19,
                  False
                 );

  stTexto         := TStringList.Create;
  FsNomeRelatorio := 'RelListaConf';
  ImprimirEmTela(False, '', '', '', '', stTexto);

  if Assigned(stTexto) then
    FreeAndNil(stTexto);
end;

procedure TFIntComRelatorios.ImprimirClientesSemPed;
var
  sAux,
  sWhere : String;
  i      : Integer;
begin
  if not vtPedido.Active then
    vtPedido.Open;

  vtPedido.Clear;

  if (not eddtRegIni.Checked) or (not eddtRegFim.Checked) then
    Aviso('Data de cadastro inicial e final devem ser informadas.')
  else if eddtRegIni.DateTime > eddtRegFim.DateTime then
    Aviso('Data de cadastro inicial não pode ser maior que o final.')
  else if eddtEmissaoIni.DateTime > eddtEmissaoFim.DateTime then
    Aviso('Data de emissão inicial não pode ser maior que o final.')
  else
  begin
    try
      DmIntegracao.fdConnInteg.Connected := True;

      if DmIntegracao.qyClientesSemPed.Active then
        DmIntegracao.qyClientesSemPed.Close;

      DmIntegracao.qyClientesSemPed.MacroByName('filtro').Clear;
      DmIntegracao.qyClientesSemPed.MacroByName('data').Clear;

      sAux := '';

      if (eddtRegIni.Checked) and
         (eddtRegFim.Checked) and
         (FormatDateTime('dd/mm/yyyy', eddtRegIni.Date) <> '30/12/1899') and
         (FormatDateTime('dd/mm/yyyy', eddtRegFim.Date) <> '30/12/1899') then
        sAux := ' p.dt_reg BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegIni.DateTime)) +
                '              AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegFim.DateTime))
      else if (eddtEmissaoIni.Checked) and
              (eddtEmissaoFim.Checked) and
              (FormatDateTime('dd/mm/yyyy', eddtEmissaoIni.Date) <> '30/12/1899') and
              (FormatDateTime('dd/mm/yyyy', eddtEmissaoFim.Date) <> '30/12/1899') then
        sAux := ' p.dt_emissao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoIni.DateTime)) +
                '                  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtEmissaoFim.DateTime))
      else if (Trim(eddePeriodoIni.ERPEdCampoChaveText) <> '') and
              (eddePeriodoIni.ERPValorValido) and
              (Trim(eddePeriodoFim.ERPEdCampoChaveText) <> '') and
              (eddePeriodoFim.ERPValorValido) then
        sAux := ' p.periodo BETWEEN ' + QuotedStr(eddePeriodoIni.ERPEdCampoChaveText) + ' AND ' + QuotedStr(eddePeriodoFim.ERPEdCampoChaveText);

      if Trim(sAux) <> '' then
        DmIntegracao.qyClientesSemPed.MacroByName('data').Value := ' AND ' + sAux;

      sWhere := '';

      if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepIni.ERPValorValido) and
         (StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdRep BETWEEN ' + Trim(edcdRepIni.ERPEdCampoChaveText) +
                                '             AND ' + Trim(edcdRepFim.ERPEdCampoChaveText)
                       );

      if (Trim(edcdClienteIni.ERPEdCampoChaveText) <> '') and
         (edcdClienteIni.ERPValorValido) and
         (Trim(edcdClienteFim.ERPEdCampoChaveText) <> '') and
         (edcdClienteFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.codigo_cliente BETWEEN ' + Trim(edcdClienteIni.ERPEdCampoChaveText) +
                                '                      AND ' + Trim(edcdClienteFim.ERPEdCampoChaveText)
                       );

      if not vtClientesEscolhidos.IsEmpty then
      begin
        vtClientesEscolhidos.DisableControls;

        try
          vtClientesEscolhidos.First;
          sAux := '';

          while not vtClientesEscolhidos.Eof do
          begin
            if Trim(sAux) = '' then
              sAux := vtClientesEscolhidos.FieldByName('cdCliente').AsString
            else
              sAux := sAux + ', ' + vtClientesEscolhidos.FieldByName('cdCliente').AsString;

            vtClientesEscolhidos.Next;
          end;

          AdicionaCondSql(sWhere, ' t.codigo_cliente IN(' + sAux + ')');
        finally
          vtClientesEscolhidos.EnableControls;
        end;
      end;

      sAux := '';

      for i := 0 to gbEstadosCli.ControlCount - 1 do
      begin
        if (gbEstadosCli.Controls[i] is TCheckBox) and ((gbEstadosCli.Controls[i] as TCheckBox).Checked) then
        begin
          if Trim(sAux) = '' then
            sAux := QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption)
          else
            sAux := sAux + ', ' + QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption);
        end;
      end;

      if Trim(sAux) <> '' then
        AdicionaCondSql(sWhere, ' t.sgUf IN(' + sAux + ')');

      if Trim(ednmCidade.Text) <> '' then
        AdicionaCondSql(sWhere, ' LOWER(t.deCidade) LIKE ' + QuotedStr('%' + LowerCase(ednmCidade.Text) + '%'));

      if (Trim(edcdGrupoCliIni.ERPEdCampoChaveText) <> '') and
         (edcdGrupoCliIni.ERPValorValido) and
         (Trim(edcdGrupoCliFim.ERPEdCampoChaveText) <> '') and
         (edcdGrupoCliFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdGrupoCli BETWEEN ' + Trim(edcdGrupoCliIni.ERPEdCampoChaveText) +
                                '                  AND ' + Trim(edcdGrupoCliFim.ERPEdCampoChaveText)
                       );

      if Trim(sWhere) <> '' then
        sWhere := '  WHERE ' + sWhere + ' ORDER BY t.cdRep, t.sgUF'
      else
        sWhere := ' ORDER BY t.cdRep, t.sgUF';

      DmIntegracao.qyClientesSemPed.MacroByName('filtro').Value := sWhere;

      DmIntegracao.qyClientesSemPed.Open;

      if DmIntegracao.qyClientesSemPed.IsEmpty then
        Aviso('Não existem clientes sem pedido com os filtros informados.')
      else
      begin
        DmIntegracao.qyClientesSemPed.First;

        while not DmIntegracao.qyClientesSemPed.Eof do
        begin
          vtPedido.Append;
          vtPedido.FieldByName('cdRep').AsInteger           := DmIntegracao.qyClientesSemPed.FieldByName('cdRep').AsInteger;
          vtPedido.FieldByName('deRep').AsString            := DmIntegracao.qyClientesSemPed.FieldByName('deRazaoSocialRep').AsString;
          vtPedido.FieldByName('sgUf').AsString             := DmIntegracao.qyClientesSemPed.FieldByName('sgUf').AsString;
          vtPedido.FieldByName('deCidade').AsString         := DmIntegracao.qyClientesSemPed.FieldByName('deCidade').AsString;
          vtPedido.FieldByName('codigo_cliente').AsInteger  := DmIntegracao.qyClientesSemPed.FieldByName('cdCliente').AsInteger;
          vtPedido.FieldByName('deFantasia').AsString       := DmIntegracao.qyClientesSemPed.FieldByName('deFantasiaCliente').AsString;
          vtPedido.FieldByName('deRazaoSocial').AsString    := DmIntegracao.qyClientesSemPed.FieldByName('deRazaoSocialCliente').AsString;
          vtPedido.FieldByName('cgc').AsString              := DmIntegracao.qyClientesSemPed.FieldByName('cgc').AsString;
          vtPedido.FieldByName('bairro').AsString           := DmIntegracao.qyClientesSemPed.FieldByName('bairro').AsString;
          vtPedido.FieldByName('cep').AsString              := DmIntegracao.qyClientesSemPed.FieldByName('cep').AsString;
          vtPedido.FieldByName('end').AsString              := DmIntegracao.qyClientesSemPed.FieldByName('end').AsString;
          vtPedido.FieldByName('deObsCli').AsString         := DmIntegracao.qyClientesSemPed.FieldByName('deObsCli').AsString;
          vtPedido.Post;

          DmIntegracao.qyClientesSemPed.Next;
        end;

        relClientesSemPed.PrepareReport();
        CarregarImgLogoEmpRel(relClientesSemPed);
        relClientesSemPed.ShowReport();
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyClientesSemPed.Active then
      DmIntegracao.qyClientesSemPed.Close;

    DmIntegracao.qyClientesSemPed.MacroByName('filtro').Clear;

    FecharConexaoIntegracao;
  end;
end;

procedure TFIntComRelatorios.ImprimirClientes;
var
  sAux,
  sWhere : String;
  i      : Integer;
begin
  if not vtPedido.Active then
    vtPedido.Open;

  vtPedido.Clear;

  if eddtRegIni.DateTime > eddtRegFim.DateTime then
    Aviso('Data de cadastro inicial não pode ser maior que o final.')
  else if eddtEmissaoIni.DateTime > eddtEmissaoFim.DateTime then
    Aviso('Data de emissão inicial não pode ser maior que o final.')
  else
  begin
    try
      DmIntegracao.fdConnInteg.Connected := True;

      if DmIntegracao.qyCliente.Active then
        DmIntegracao.qyCliente.Close;

      DmIntegracao.qyCliente.MacroByName('filtro').Clear;

      sWhere := '';

      if (eddtRegIni.Checked) and
         (eddtRegFim.Checked) and
         (FormatDateTime('dd/mm/yyyy', eddtRegIni.Date) <> '30/12/1899') and
         (FormatDateTime('dd/mm/yyyy', eddtRegFim.Date) <> '30/12/1899') then
        AdicionaCondSql(sWhere,
                        ' t.dtCadastro BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegIni.DateTime)) +
                        '                  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegFim.DateTime))
                       );

      if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepIni.ERPValorValido) and
         (StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdRepresentante BETWEEN ' + Trim(edcdRepIni.ERPEdCampoChaveText) +
                                '                       AND ' + Trim(edcdRepFim.ERPEdCampoChaveText)
                       );

      if (Trim(edcdClienteIni.ERPEdCampoChaveText) <> '') and
         (edcdClienteIni.ERPValorValido) and
         (Trim(edcdClienteFim.ERPEdCampoChaveText) <> '') and
         (edcdClienteFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdCliente BETWEEN ' + Trim(edcdClienteIni.ERPEdCampoChaveText) +
                                '                 AND ' + Trim(edcdClienteFim.ERPEdCampoChaveText)
                       );

      if not vtClientesEscolhidos.IsEmpty then
      begin
        vtClientesEscolhidos.DisableControls;

        try
          vtClientesEscolhidos.First;
          sAux := '';

          while not vtClientesEscolhidos.Eof do
          begin
            if Trim(sAux) = '' then
              sAux := vtClientesEscolhidos.FieldByName('cdCliente').AsString
            else
              sAux := sAux + ', ' + vtClientesEscolhidos.FieldByName('cdCliente').AsString;

            vtClientesEscolhidos.Next;
          end;

          AdicionaCondSql(sWhere, ' t.cdCliente IN(' + sAux + ')');
        finally
          vtClientesEscolhidos.EnableControls;
        end;
      end;

      sAux := '';

      for i := 0 to gbEstadosCli.ControlCount - 1 do
      begin
        if (gbEstadosCli.Controls[i] is TCheckBox) and ((gbEstadosCli.Controls[i] as TCheckBox).Checked) then
        begin
          if Trim(sAux) = '' then
            sAux := QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption)
          else
            sAux := sAux + ', ' + QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption);
        end;
      end;

      if Trim(sAux) <> '' then
        AdicionaCondSql(sWhere, ' t.sgEstado IN(' + sAux + ')');

      if Trim(ednmCidade.Text) <> '' then
        AdicionaCondSql(sWhere, ' LOWER(t.nmCidade) LIKE ' + QuotedStr('%' + LowerCase(ednmCidade.Text) + '%'));

      if (Trim(edcdGrupoCliIni.ERPEdCampoChaveText) <> '') and
         (edcdGrupoCliIni.ERPValorValido) and
         (Trim(edcdGrupoCliFim.ERPEdCampoChaveText) <> '') and
         (edcdGrupoCliFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdGrupoCli BETWEEN ' + Trim(edcdGrupoCliIni.ERPEdCampoChaveText) +
                                '                  AND ' + Trim(edcdGrupoCliFim.ERPEdCampoChaveText)
                       );

      AdicionaCondSql(sWhere, ' flAtivo = ''S'' ');

      if Trim(sWhere) <> '' then
        sWhere := '  WHERE ' + sWhere + ' ORDER BY t.cdRepresentante, t.sgEstado, t.nmCidade, t.deRazaoSocial'
      else
        sWhere := ' ORDER BY t.cdRepresentante, t.sgEstado, t.nmCidade, t.deRazaoSocial';

      DmIntegracao.qyCliente.MacroByName('filtro').Value := sWhere;

      DmIntegracao.qyCliente.Open;

      if DmIntegracao.qyCliente.IsEmpty then
        Aviso('Não existem clientes com os filtros informados.')
      else
      begin
        DmIntegracao.qyCliente.First;

        while not DmIntegracao.qyCliente.Eof do
        begin
          vtPedido.Append;
          vtPedido.FieldByName('cdRep').AsInteger           := DmIntegracao.qyCliente.FieldByName('cdRepresentante').AsInteger;
          vtPedido.FieldByName('deRep').AsString            := DmIntegracao.qyCliente.FieldByName('nmRepresentante').AsString;
          vtPedido.FieldByName('sgUf').AsString             := DmIntegracao.qyCliente.FieldByName('sgEstado').AsString;
          vtPedido.FieldByName('deCidade').AsString         := DmIntegracao.qyCliente.FieldByName('nmCidade').AsString;
          vtPedido.FieldByName('codigo_cliente').AsInteger  := DmIntegracao.qyCliente.FieldByName('cdCliente').AsInteger;
          vtPedido.FieldByName('deFantasia').AsString       := DmIntegracao.qyCliente.FieldByName('nmFantasia').AsString;
          vtPedido.FieldByName('deRazaoSocial').AsString    := DmIntegracao.qyCliente.FieldByName('deRazaoSocial').AsString;
          vtPedido.FieldByName('cgc').AsString              := DmIntegracao.qyCliente.FieldByName('deCpfCnpj').AsString;
          vtPedido.FieldByName('bairro').AsString           := DmIntegracao.qyCliente.FieldByName('deBairro').AsString;
          vtPedido.FieldByName('cep').AsString              := DmIntegracao.qyCliente.FieldByName('nuCep').AsString;
          vtPedido.FieldByName('end').AsString              := DmIntegracao.qyCliente.FieldByName('deEndereco').AsString;
          vtPedido.FieldByName('deObsCli').AsString         := DmIntegracao.qyCliente.FieldByName('deObservacoes').AsString;
          vtPedido.FieldByName('dt_reg').AsDateTime         := DmIntegracao.qyCliente.FieldByName('dtCadastro').AsDateTime;
          vtPedido.FieldByName('nuFoneCli1').AsString       := DmIntegracao.qyCliente.FieldByName('nuFone1').AsString;
          vtPedido.FieldByName('nuFoneCli2').AsString       := DmIntegracao.qyCliente.FieldByName('nuFone2').AsString;
          vtPedido.FieldByName('nuCelular').AsString        := DmIntegracao.qyCliente.FieldByName('nuCelular').AsString;
          vtPedido.Post;

          DmIntegracao.qyCliente.Next;
        end;

        relClientes.PrepareReport();
        CarregarImgLogoEmpRel(relClientes);
        relClientes.ShowReport();
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyCliente.Active then
      DmIntegracao.qyCliente.Close;

    DmIntegracao.qyCliente.MacroByName('filtro').Clear;

    FecharConexaoIntegracao;
  end;
end;

procedure TFIntComRelatorios.GerarInfoPedido(const sOrdenacao : String; const iTipoImp : Integer; const bListaCliSemPed : Boolean);
var
  sAux,
  sWhere : String;

  procedure AdicionaValor(var sTexto : String; const sValor : String);
  begin
    if Trim(sTexto) = '' then
      sTexto := sValor
    else
      sTexto := sTexto + ',' + sValor;
  end;
begin
  vtPedido.Clear;

  try
    DmIntegracao.fdConnInteg.Connected := True;

    AplicaFiltroPedido(DmIntegracao.qyPedido, sOrdenacao);
    CarregarDadosPedido(DmIntegracao.qyPedido, iTipoImp, bListaCliSemPed);

    if (iTipoImp = 17) then // Somente para análise de vendas rep
    begin
      AplicaFiltroPedido(DmIntegracao.qyPedidoAgrup, sOrdenacao);
      CarregarDadosPedido(DmIntegracao.qyPedidoAgrup, iTipoImp, bListaCliSemPed);

      if DmIntegracao.qyCotaFin.Active then
        DmIntegracao.qyCotaFin.Close;

      DmIntegracao.qyCotaFin.MacroByName('filtro').Clear;

      sWhere := ' WHERE t.vlPrevisto > 0 ' + #13 +
                '   AND COALESCE( ( ' + #13 +
                '                   SELECT COUNT(p.nro_pedido) ' + #13 +
                '                     FROM pedido p ' + #13 +
                '                    INNER JOIN itemPed ip ON (ip.nro_pedido = p.nro_pedido) ' + #13 +
                '                    WHERE p.codigo_repres = t.cdRepresentante ' + #13 +
                '                      AND p.periodo = t.dePeriodo ' + #13;

      sAux := '';

      if cbTpPedV.Checked then
        AdicionaValor(sAux, QuotedStr('V'));

      if cbTpPedA.Checked then
        AdicionaValor(sAux, QuotedStr('A'));

      if cbTpPedO.Checked then
        AdicionaValor(sAux, QuotedStr('O'));

      if Trim(sAux) <> '' then
        sWhere := sWhere + ' AND p.tipo_pedido IN(' + sAux + ')';

      sAux := '';

      if cbSitPedL.Checked then
        AdicionaValor(sAux, QuotedStr('L'));

      if cbSitPedC.Checked then
        AdicionaValor(sAux, QuotedStr('C'));

      if cbSitPedE.Checked then
        AdicionaValor(sAux, QuotedStr('E'));

      if cbSitPedR.Checked then
        AdicionaValor(sAux, QuotedStr('R'));

      if cbSitPedT.Checked then
        AdicionaValor(sAux, QuotedStr('T'));

      if cbSitPedB.Checked then
        AdicionaValor(sAux, QuotedStr('B'));

      if Trim(sAux) <> '' then
        sWhere := sWhere + ' AND p.status_pedido IN(' + sAux + ')';

      if cbNaoImpAcessUrnZinco.Checked then
        sWhere := sWhere +
                  ' AND ip.item NOT LIKE ''ZINCO%'' ' + #13 +
                  ' AND ip.item NOT LIKE ''ACES%''' + #13;

      if cbNaoImpEnzibEnzit.Checked then
        sWhere := sWhere +
                  ' AND ip.item NOT LIKE ''ENZIBA%'' ' + #13 +
                  ' AND ip.item NOT LIKE ''ENZIT%''' + #13;


      if cbNaoImpRefUof.Checked then
        sWhere := sWhere +
                  ' AND ip.item NOT LIKE ''UOF%'' ' + #13 +
                  ' AND ip.item NOT LIKE ''REFORMA%''' + #13;

      sWhere := sWhere +  ' ), 0) = 0 ';

      if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepIni.ERPValorValido) and
         (StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdRepresentante BETWEEN ' + Trim(edcdRepIni.ERPEdCampoChaveText) +
                                '             AND ' + Trim(edcdRepFim.ERPEdCampoChaveText)
                       );


      if (Trim(eddePeriodoIni.ERPEdCampoChaveText) <> '') and
         (eddePeriodoIni.ERPValorValido) and
         (Trim(eddePeriodoFim.ERPEdCampoChaveText) <> '') and
         (eddePeriodoFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.dePeriodo BETWEEN ' + QuotedStr(eddePeriodoIni.ERPEdCampoChaveText) + ' AND ' + QuotedStr(eddePeriodoFim.ERPEdCampoChaveText));

      if (eddtEmissaoIni.Checked) and
         (eddtEmissaoFim.Checked) and
         (FormatDateTime('dd/mm/yyyy', eddtEmissaoIni.Date) <> '30/12/1899') and
         (FormatDateTime('dd/mm/yyyy', eddtEmissaoFim.Date) <> '30/12/1899') then
        AdicionaCondSql(sWhere,
                        ' t.dePeriodo BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm', eddtEmissaoIni.DateTime)) +
                        '                 AND ' + QuotedStr(FormatDateTime('yyyy-mm', eddtEmissaoFim.DateTime))
                       );

      DmIntegracao.qyCotaFin.MacroByName('filtro').Value := sWhere;
      DmIntegracao.qyCotaFin.Open();

      if not DmIntegracao.qyCotaFin.IsEmpty then
      begin
        DmIntegracao.qyCotaFin.First;

        while not DmIntegracao.qyCotaFin.Eof do
        begin
          vtPedido.Append;
          vtPedido.FieldByName('cdRep').AsInteger        := DmIntegracao.qyCotaFin.FieldByName('cdRepresentante').AsInteger;
          vtPedido.FieldByName('deRep').AsString         := DmIntegracao.qyCotaFin.FieldByName('deRep').AsString;
          vtPedido.FieldByName('dePeriodo').AsString     := DmIntegracao.qyCotaFin.FieldByName('dePeriodo').AsString;
          vtPedido.FieldByName('vlPrevisto').AsCurrency  := DmIntegracao.qyCotaFin.FieldByName('vlPrevisto').AsCurrency;
          vtPedido.FieldByName('vlFaturado').AsCurrency  := 0;
          vtPedido.FieldByName('vlMediaPrev').AsCurrency := 0;
          vtPedido.FieldByName('nuQtd').AsInteger        := 0;
          vtPedido.Post;

          DmIntegracao.qyCotaFin.Next;
        end;
      end;
    end;

    if iTipoImp in[16, 17] then
      vtPedido.IndexFieldNames := Trim(AnsiReplaceStr(AnsiReplaceStr(sOrdenacao, 't.', ''), 'ORDER BY', ''))
    else
      vtPedido.IndexFieldNames := '';
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  FecharConexaoIntegracao;

  if vtPedido.IsEmpty then
  begin
    Aviso('Não existem pedidos com os filtros informados.');
    Abort;
  end;
end;

procedure TFIntComRelatorios.FecharConexaoIntegracao;
begin
  if DmIntegracao.qyRepresentante.Active then
    DmIntegracao.qyRepresentante.Close;

  if DmIntegracao.qyPedido.Active then
    DmIntegracao.qyPedido.Close;

  if DmIntegracao.qyPedidoAgrup.Active then
    DmIntegracao.qyPedidoAgrup.Close;

  if DmIntegracao.qyPedAgrup.Active then
    DmIntegracao.qyPedAgrup.Close;

  if DmIntegracao.qyClientesSemPed.Active then
    DmIntegracao.qyClientesSemPed.Close;

  if DmIntegracao.qyCliente.Active then
    DmIntegracao.qyCliente.Close;

  if qyPedItemAgrup.Active then
    qyPedItemAgrup.Close;

  if DmIntegracao.qyCotaFin.Active then
    DmIntegracao.qyCotaFin.Close;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFIntComRelatorios.btBaixaProdClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirBaixaProd;
                   end
                  );
end;

procedure TFIntComRelatorios.btBilhetinhoClick(Sender: TObject);
begin
  FbMostrarValor := False;

  if Pergunta('Deseja imprimir os valores?') then
    FbMostrarValor := True;

  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirBilhetinho;
                   end
                  );
end;

procedure TFIntComRelatorios.btClientesClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirClientes;
                   end
                  );
end;

procedure TFIntComRelatorios.btClienteSemPedClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirClientesSemPed;
                   end
                  );
end;

procedure TFIntComRelatorios.btEtiquetaClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirEtiqueta;
                   end
                  );
end;

procedure TFIntComRelatorios.btExluirCargaEscClick(Sender: TObject);
begin
  if not vtCargasEscolhidas.IsEmpty then
    vtCargasEscolhidas.Delete;
end;

procedure TFIntComRelatorios.btExluirClienteEscClick(Sender: TObject);
begin
  if not vtClientesEscolhidos.IsEmpty then
    vtClientesEscolhidos.Delete;
end;

procedure TFIntComRelatorios.btExluirItemEscClick(Sender: TObject);
begin
  if not vtItensEscolhidos.IsEmpty then
    vtItensEscolhidos.Delete;
end;

procedure TFIntComRelatorios.btExluirPedEscClick(Sender: TObject);
begin
  if not vtPedidosEscolhidos.IsEmpty then
    vtPedidosEscolhidos.Delete;
end;

procedure TFIntComRelatorios.ExportarDadosRouteasy;
var
  XLApp, Sheet: OLEVariant;
  sPath : String;
begin
  GerarInfoPedido(' ORDER BY t.codigo_cliente, t.nuPedido, t.seq',
                  99,
                  False
                 );

  if not vtPedido.IsEmpty then
  begin
    sPath                 := ExtractFilePath(Application.ExeName);
    expExcelX.DefaultPath := sPath;
    expExcelX.FileName    := 'Dados_Routeasy_TMP.xlsx';

    if FileExists(sPath + expExcelX.FileName) then
      DeleteFile(sPath + expExcelX.FileName);

    if FileExists(sPath + 'Dados_Routeasy.xlsx') then
      DeleteFile(sPath + 'Dados_Routeasy.xlsx');

    relExpDadosRoutEasy.PrepareReport();
    relExpDadosRoutEasy.Export(expExcelX);

    if FileExists(expExcelX.FileName) then
    begin
      XLApp := CreateOleObject('Excel.Application');

      try
        //Esconde Excel
        XLApp.Visible := False;
        //Abre o Workbook
        XLApp.Workbooks.Open(expExcelX.FileName);
        Sheet := XLApp.Workbooks[ExtractFileName(expExcelX.FileName)].WorkSheets[1];

        XLApp.Workbooks[1].Worksheets[1].Name := 'deliveries';
        XLApp.Application.Workbooks[1].SaveAs(sPath + 'Dados_Routeasy.xlsx', 51);
      finally
        //Fecha o Excel
        if not VarIsEmpty(XLApp) then
        begin
          XLApp.Quit;
          XLAPP  := Unassigned;
          Sheet  := Unassigned;
        end;

        ShellExecute(handle, 'open', PChar(sPath + 'Dados_Routeasy.xlsx'), '', '', SW_SHOWMAXIMIZED);

        if FileExists(sPath + expExcelX.FileName) then
          DeleteFile(sPath + expExcelX.FileName);
      end;
    end;
  end;
end;

procedure TFIntComRelatorios.ExportarDadosWebRoute;
var
  XLApp, Sheet: OLEVariant;
  sPath : String;
begin
  GerarInfoPedido(' ORDER BY t.codigo_cliente, t.nuPedido, t.seq',
                  99,
                  False
                 );

  if not vtPedido.IsEmpty then
  begin
    sPath                 := ExtractFilePath(Application.ExeName);
    expExcelX.DefaultPath := sPath;
    expExcelX.FileName    := 'DadosWebRouter_TMP.xlsx';

    if FileExists(sPath + expExcelX.FileName) then
      DeleteFile(sPath + expExcelX.FileName);

    if FileExists(sPath + 'DadosWebRouter.xlsx') then
      DeleteFile(sPath + 'DadosWebRouter.xlsx');

    relExpDadosWebRouter.PrepareReport();
    relExpDadosWebRouter.Export(expExcelX);

    if FileExists(expExcelX.FileName) then
    begin
      XLApp := CreateOleObject('Excel.Application');

      try
        //Esconde Excel
        XLApp.Visible := False;
        //Abre o Workbook
        XLApp.Workbooks.Open(expExcelX.FileName);
        Sheet := XLApp.Workbooks[ExtractFileName(expExcelX.FileName)].WorkSheets[1];

        XLApp.Workbooks[1].Worksheets[1].Name := 'WebRouter';
        XLApp.Application.Workbooks[1].SaveAs(sPath + 'DadosWebRouter.xlsx', 51);
      finally
        //Fecha o Excel
        if not VarIsEmpty(XLApp) then
        begin
          XLApp.Quit;
          XLAPP  := Unassigned;
          Sheet  := Unassigned;
        end;

        ShellExecute(handle, 'open', PChar(sPath + 'DadosWebRouter.xlsx'), '', '', SW_SHOWMAXIMIZED);

        if FileExists(sPath + expExcelX.FileName) then
          DeleteFile(sPath + expExcelX.FileName);
      end;
    end;
  end;
end;

procedure TFIntComRelatorios.ExportarDadosWebRouteOld;
var
  stDados : TStringList;
  sEndereco,
  sInfo   : String;
  inuPed  : Integer;

  procedure AdicionaInfo(const sValor : String);
  begin
    if Trim(sInfo) = '' then
      sInfo := sValor
    else
      sInfo := sInfo + ';' + sValor;
  end;

begin
  stDados := TStringList.Create;
  stDados.Add('ENDEREÇOS;TEMPO PARADA (DIAS);TEMPO PARADA (HORAS);TEMPO PARADA (MINUTOS);DESCRIÇÃO;PESO(Kg);VOLUME(m³)');

  GerarInfoPedido(' ORDER BY t.codigo_cliente, t.nuPedido, t.seq',
                  99,
                  False
                 );

  if not vtPedido.IsEmpty then
  begin
    try
      vtPedido.DisableControls;

      vtPedido.First;

      inuPed := 0;
      sInfo  := '';

      while not vtPedido.Eof do
      begin
        if inuPed <> vtPedido.FieldByName('nuPedido').AsInteger then
        begin
          sEndereco := '';

          if Trim(vtPedido.FieldByName('end').AsString) <> '' then
            sEndereco := Trim(vtPedido.FieldByName('end').AsString);

          if Trim(vtPedido.FieldByName('nuEndereco').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(vtPedido.FieldByName('nuEndereco').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(vtPedido.FieldByName('nuEndereco').AsString);
          end;

          if Trim(vtPedido.FieldByName('bairro').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(vtPedido.FieldByName('bairro').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(vtPedido.FieldByName('bairro').AsString);
          end;

          if Trim(vtPedido.FieldByName('deCidade').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(vtPedido.FieldByName('deCidade').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(vtPedido.FieldByName('deCidade').AsString);
          end;

          if Trim(vtPedido.FieldByName('sgUf').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(vtPedido.FieldByName('sgUf').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(vtPedido.FieldByName('sgUf').AsString);
          end;

          if Trim(sEndereco) <> '' then
            AdicionaInfo(sEndereco);

          AdicionaInfo('0');
          AdicionaInfo('0,5');
          AdicionaInfo('30');
          AdicionaInfo(vtPedido.FieldByName('deRazaoSocial').AsString);
          AdicionaInfo(IntToStr(40 * vtPedido.FieldByName('nuTotVolumes').AsInteger)); //Peso
          AdicionaInfo('0'); //AdicionaInfo(vtPedido.FieldByName('nuTotVolumes').AsString);

          stDados.Add(sInfo);
          inuPed := vtPedido.FieldByName('nuPedido').AsInteger;
          sInfo  := '';
        end;

        vtPedido.Next;
      end;
    finally
      vtPedido.EnableControls;
    end;
  end;

  if stDados.Count > 1 then
  begin
    sdDadosWebRouter.FileName := 'DadosWebRouter_.xls';

    if sdDadosWebRouter.Execute then
      stDados.SaveToFile(sdDadosWebRouter.FileName);
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TFIntComRelatorios.btExportarDadosClick(Sender: TObject);
var
  p : TPoint;
begin
//  pmExportarDadosWay.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  p := btExportarDados.ClientToScreen(Point(0, btExportarDados.Height));
  pmExportarDados.Popup(p.X, p.Y);
end;

procedure TFIntComRelatorios.btExtratoCargaClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirExtratoCarregamento;
                   end
                  );
end;

procedure TFIntComRelatorios.btExtratoVendasCliClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirExtratoVendasCli;
                   end
                  );
end;

procedure TFIntComRelatorios.btVendasMesEmisNfeRepClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirVendasMesEmissNfeRep;
                   end
                  );
end;

procedure TFIntComRelatorios.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  if DmIntegracao.qyRepresentante.Active then
    DmIntegracao.qyRepresentante.Close;

  if DmIntegracao.qyPedido.Active then
    DmIntegracao.qyPedido.Close;

  if DmIntegracao.qyPedidoAgrup.Active then
    DmIntegracao.qyPedidoAgrup.Close;

  if DmIntegracao.qyPedAgrup.Active then
    DmIntegracao.qyPedAgrup.Close;

  if DmIntegracao.qyClientesSemPed.Active then
    DmIntegracao.qyClientesSemPed.Close;

  if DmIntegracao.qyListaPreco.Active then
    DmIntegracao.qyListaPreco.Close;

  if qyPedItemAgrup.Active then
    qyPedItemAgrup.Close;

  if DmIntegracao.qyCotaFin.Active then
    DmIntegracao.qyCotaFin.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  Tab := FTelaInicial.pcTelas.ActivePage;

  if Assigned(Tab) then
  begin
    Tab.Parent      := nil;
    Tab.PageControl := nil;

    FreeAndNil(Tab);
  end;

  FTelaInicial.pcTelas.Visible   := FTelaInicial.pcTelas.PageCount > 0;
  FTelaInicial.imLogoERP.Visible := not FTelaInicial.pcTelas.Visible;
end;

procedure TFIntComRelatorios.btListaCarregClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaCarregamento;
                   end
                  );
end;

procedure TFIntComRelatorios.btListaConferenciaClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaConferencia;
                   end
                  );
end;

procedure TFIntComRelatorios.btListaItemPedClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaItemPed;
                   end
                  );
end;

procedure TFIntComRelatorios.btListaPed2Click(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaPed2;
                   end
                  );
end;

procedure TFIntComRelatorios.btListaPed3Click(Sender: TObject);
var
  p : TPoint;
begin
  p := btListaPed3.ClientToScreen(Point(0, btListaPed3.Height));
  pmListaPed3.Popup(p.X, p.Y);
end;

procedure TFIntComRelatorios.btListaPedClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaPed;
                   end
                  );
end;

procedure TFIntComRelatorios.btListaPedCliClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaPedCli;
                   end
                  );
end;

procedure TFIntComRelatorios.btListaPedRepClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaPedRep;
                   end
                  );
end;

procedure TFIntComRelatorios.btListProdClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirListaProd;
                   end
                  );
end;

procedure TFIntComRelatorios.btReferenciasVendidasClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirRefVendidas;
                   end
                  );
end;

procedure TFIntComRelatorios.btSalvarCargaEscClick(Sender: TObject);
begin
  if edcdCargaEsc.ERPValorValido then
  begin
    vtCargasEscolhidas.Append;
    vtCargasEscolhidas.FieldByName('cdCarga').AsString := edcdCargaEsc.ERPEdCampoChaveText;
    vtCargasEscolhidas.FieldByName('deCarga').AsString := edcdCargaEsc.ERPLbDescricaoCaption;
    vtCargasEscolhidas.Post;
    edcdCargaEsc.ERPEdCampoChaveText := '';
    edcdCargaEsc.ERPEdCampoChaveSetFocus;
  end;
end;

procedure TFIntComRelatorios.btSalvarClienteEscClick(Sender: TObject);
begin
  if edcdCliente.ERPValorValido then
  begin
    vtClientesEscolhidos.Append;
    vtClientesEscolhidos.FieldByName('cdCliente').AsString     := edcdCliente.ERPEdCampoChaveText;
    vtClientesEscolhidos.FieldByName('deRazaoSocial').AsString := edcdCliente.ERPLbDescricaoCaption;
    vtClientesEscolhidos.Post;
    edcdCliente.ERPEdCampoChaveText := '';
    edcdCliente.ERPEdCampoChaveSetFocus;
  end;
end;

procedure TFIntComRelatorios.btSalvarItemEscClick(Sender: TObject);
begin
  if edcdItem.ERPValorValido then
  begin
    vtItensEscolhidos.Append;
    vtItensEscolhidos.FieldByName('cdItem').AsString := edcdItem.ERPEdCampoChaveText;
    vtItensEscolhidos.FieldByName('deItem').AsString := edcdItem.ERPLbDescricaoCaption;
    vtItensEscolhidos.Post;
    edcdItem.ERPEdCampoChaveText := '';
    edcdItem.ERPEdCampoChaveSetFocus;
  end;
end;

procedure TFIntComRelatorios.btSalvarPedEscClick(Sender: TObject);
begin
  if edcdPedido.ERPValorValido then
  begin
    vtPedidosEscolhidos.Append;
    vtPedidosEscolhidos.FieldByName('cdPedido').AsString := edcdPedido.ERPEdCampoChaveText;

    try
      DmIntegracao.fdConnInteg.Connected := True;

      DmIntegracao.qyPedido.MacroByName('filtro').Value := ' WHERE nuPedido = ' + edcdPedido.ERPEdCampoChaveText;
      DmIntegracao.qyPedido.Open;

      if DmIntegracao.qyPedido.IsEmpty then
        Aviso('Pedido inválido.')
      else
      begin
        vtPedidosEscolhidos.FieldByName('tpPedido').AsString      := DmIntegracao.qyPedido.FieldByName('tpPedido').AsString;
        vtPedidosEscolhidos.FieldByName('dtEmissao').AsDateTime   := DmIntegracao.qyPedido.FieldByName('dtEmissao').AsDateTime;
        vtPedidosEscolhidos.FieldByName('flStatusPed').AsString   := DmIntegracao.qyPedido.FieldByName('status_pedido').AsString;
        vtPedidosEscolhidos.FieldByName('cdCliente').AsInteger    := DmIntegracao.qyPedido.FieldByName('codigo_cliente').AsInteger;
        vtPedidosEscolhidos.FieldByName('deRazaoSocial').AsString := DmIntegracao.qyPedido.FieldByName('deRazaoSocial').AsString;
        vtPedidosEscolhidos.FieldByName('deFantasia').AsString    := DmIntegracao.qyPedido.FieldByName('deFantasia').AsString;
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyPedido.Active then
      DmIntegracao.qyPedido.Close;

    DmIntegracao.fdConnInteg.Connected := False;

    vtPedidosEscolhidos.Post;
    edcdPedido.ERPEdCampoChaveText := '';
    edcdPedido.ERPEdCampoChaveSetFocus;
  end;
end;

procedure TFIntComRelatorios.btTabelaPrecoClick(Sender: TObject);
begin
  ImprimirListaPreco;
end;

procedure TFIntComRelatorios.btValorVendasUFClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirValorVendasUF;
                   end
                  );
end;

procedure TFIntComRelatorios.btVendasMesEmissRepClick(Sender: TObject);
begin
  WaitShowProgress('Gerando Relatório...',
                   procedure
                   begin
                     ImprimirVendasMesEmissRep;
                   end
                  );
end;

procedure TFIntComRelatorios.btAcompMetasRepClick(Sender: TObject);
var
  p : TPoint;
begin
  p := btAcompMetasRep.ClientToScreen(Point(0, btAcompMetasRep.Height));
  pmAcompMetas.Popup(p.X, p.Y);
end;

procedure TFIntComRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FstListaEmailRep) then
    FreeAndNil(FstListaEmailRep);
end;

procedure TFIntComRelatorios.FormCreate(Sender: TObject);
var
  dthrAtual : TDateTime;
begin
  FsPathRelatorios     := FTelaInicial.FsPathServidor + '\Relatorios\Integracao\';
  btClienteSemPed.Hint := 'Filtros que são utilizados: ' + #13#13 +
                          ' - Representante' + #13 +
                          ' - Cliente' + #13 +
                          ' - Estados Clientes' + #13 +
                          ' - Cidade';

  btClientes.Hint      := btClienteSemPed.Hint;

  btFechar.Glyph.LoadFromResourceName(HInstance,           'IMGBTFECHAR_32X32');
  btSalvarItemEsc.Glyph.LoadFromResourceName(HInstance,    'IMGBTSALVAR_16X16');
  btExluirItemEsc.Glyph.LoadFromResourceName(HInstance,    'IMGBTEXCLUIR_16X16');
  btSalvarPedEsc.Glyph.LoadFromResourceName(HInstance,     'IMGBTSALVAR_16X16');
  btExluirPedEsc.Glyph.LoadFromResourceName(HInstance,     'IMGBTEXCLUIR_16X16');
  btSalvarCargaEsc.Glyph.LoadFromResourceName(HInstance,   'IMGBTSALVAR_16X16');
  btExluirCargaEsc.Glyph.LoadFromResourceName(HInstance,   'IMGBTEXCLUIR_16X16');
  btSalvarClienteEsc.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_16X16');
  btExluirClienteEsc.Glyph.LoadFromResourceName(HInstance, 'IMGBTEXCLUIR_16X16');

  dthrAtual := DataHoraAtual(DmERP.fdConnERP);
  dthrAtual := Trunc(dthrAtual);

  eddtRegIni.Date := StrToDateTime('01/' + FormatDateTime('mm/yyyy', IncMonth(dthrAtual, -5)));
  eddtRegFim.Date := dthrAtual;
  eddtRegIni.Checked := False;
  eddtRegFim.Checked := False;

  eddtEmissaoNfsIni.Date    := StrToDateTime('01/' + FormatDateTime('mm/yyyy', dthrAtual));
  eddtEmissaoNfsFim.Date    := EndOfTheMonth(eddtEmissaoNfsIni.Date);
  eddtEmissaoNfsIni.Checked := False;
  eddtEmissaoNfsFim.Checked := False;

  eddtEmissaoIni.Date       := StrToDateTime('01/' + FormatDateTime('mm/yyyy', dthrAtual));
  eddtEmissaoFim.Date       := EndOfTheMonth(eddtEmissaoIni.Date);
  eddtEmissaoIni.Checked    := False;
  eddtEmissaoFim.Checked    := False;

  if DmERP.qyIntSupItensCfgPad.Active then
    DmERP.qyIntSupItensCfgPad.Close;

  DmERP.qyIntSupItensCfgPad.MacroByName('filtro').Clear;
  DmERP.qyIntSupItensCfgPad.Open();

  vtPedido.Open;
  vtEtiqueta.Open;
  vtListaPreco.Open;
  vtItensEscolhidos.Open;
  vtPedidosEscolhidos.Open;
  vtCargasEscolhidas.Open;
  vtClientesEscolhidos.Open;

  FstListaEmailRep        := TStringList.Create;
  FstListaEmailRep.Sorted := True;
  FstListaEmailRep.Delimiter := ';';
  FstListaEmailRep.StrictDelimiter := True;

  pcRelatorios.ActivePage := tsPedidos;

  relIntComercial.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relIntComercial.AddFunction('function ObsCargas : String', 'Sistema'); //relListaProd | relListaConf | relExtratoCarreg
  relIntComercial.AddFunction('function ImprimirObsBilhet : Boolean', 'Sistema'); //relBilhetinho
  relIntComercial.AddFunction('function ImprimirBilhetUmCliPorPag : Boolean', 'Sistema'); //relBilhetinho

  relListaPreco.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relClientesSemPed.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relClientes.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
end;

procedure TFIntComRelatorios.FormShow(Sender: TObject);
begin
  edcdCargaIni.ERPEdCampoChaveSetFocus;
end;

function TFIntComRelatorios.ImprimirObsBilhet : Boolean;
begin
  Result := cbImprimirObsBilhet.Checked;
end;

function TFIntComRelatorios.ImprimirBilhetUmCliPorPag : Boolean;
begin
  Result := cbBilhetinhoUmCliPorPag.Checked;
end;

function TFIntComRelatorios.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

function TFIntComRelatorios.ObsCargas : String;
var
  stListaCargas : TStringList;
begin
  Result := '';

  try
    stListaCargas := TStringList.Create;
    vtPedido.DisableControls;
    vtPedido.First;

    while not vtPedido.Eof do
    begin
      if (stListaCargas.IndexOf(vtPedido.FieldByName('cdCarga').AsString) < 0) then
      begin
        if DmERP.qyIntComCargaPesq.Active then
          DmERP.qyIntComCargaPesq.Close;

        DmERP.qyIntComCargaPesq.MacroByName('filtro').Value := ' WHERE cdCarga = ' +
                                                                  vtPedido.FieldByName('cdCarga').AsString;

        DmERP.qyIntComCargaPesq.Open();

        if not DmERP.qyIntComCargaPesq.IsEmpty then
        begin
          if Trim(DmERP.qyIntComCargaPesq.FieldByName('deObservacao').AsString) <> '' then
          begin
            if Trim(Result) = '' then
              Result := 'OBSERVAÇÕES DA CARGA ' + vtPedido.FieldByName('cdCarga').AsString + ':' +
                        #13#13 + DmERP.qyIntComCargaPesq.FieldByName('deObservacao').AsString
            else
              Result := Result + #13#13 + 'OBSERVAÇÕES DA CARGA ' + vtPedido.FieldByName('cdCarga').AsString + ':' +
                        #13#13 + DmERP.qyIntComCargaPesq.FieldByName('deObservacao').AsString;
          end;
        end;
      end;

      stListaCargas.Add(vtPedido.FieldByName('cdCarga').AsString);

      vtPedido.Next;
    end;
  finally
    vtPedido.EnableControls;

    if Assigned(stListaCargas) then
      FreeAndNil(stListaCargas);
  end;
end;

procedure TFIntComRelatorios.pmiClientesClick(Sender: TObject);
begin
  ExportarDadosWayCli;
end;

procedure TFIntComRelatorios.pmiEmailAcompMetasClick(Sender: TObject);
begin
  ImprimirAcompMetasRep(True);
end;

procedure TFIntComRelatorios.pmiEmailListaPed3Click(Sender: TObject);
begin
  ImprimirListaPed3(True);
end;

procedure TFIntComRelatorios.pmiImpListaPed3Click(Sender: TObject);
begin
  ImprimirListaPed3(False);
end;

procedure TFIntComRelatorios.pmiImprimirAcompMetasClick(Sender: TObject);
begin
  ImprimirAcompMetasRep(False);

(*
procedure TForm1.Button1Click(Sender: TObject);
begin
  WaitShowMessage('Processando ...');

  try
    // seu codigo
  finally
    WaitCloseMessage;
  end;
end;
*)
end;

procedure TFIntComRelatorios.pmiPedidosClick(Sender: TObject);
begin
  ExportarDadosWayPed;
end;

procedure TFIntComRelatorios.pmiRoutEasyClick(Sender: TObject);
begin
  ExportarDadosRouteasy;
end;

procedure TFIntComRelatorios.pmiWebRouterClick(Sender: TObject);
begin
  ExportarDadosWebRoute;
end;

procedure TFIntComRelatorios.ExportarDadosWayCli;
var
  sAux,
  sWhere,
  sInfoCab,
  sInfoVal,
  sEndereco : String;
  i         : Integer;
  stDados   : TStringList;

  procedure AdicionaInfo(var sInfo : String; const sValor : String);
  begin
    if Trim(sInfo) = '' then
      sInfo := sValor
    else
      sInfo := sInfo + ';' + sValor;
  end;
begin
  stDados := TStringList.Create;

  if eddtRegIni.DateTime > eddtRegFim.DateTime then
    Aviso('Data de cadastro inicial não pode ser maior que o final.')
  else if eddtEmissaoIni.DateTime > eddtEmissaoFim.DateTime then
    Aviso('Data de emissão inicial não pode ser maior que o final.')
  else
  begin
    try
      DmIntegracao.fdConnInteg.Connected := True;

      if DmIntegracao.qyCliente.Active then
        DmIntegracao.qyCliente.Close;

      DmIntegracao.qyCliente.MacroByName('filtro').Clear;

      sWhere := '';

      if (eddtRegIni.Checked) and
         (eddtRegFim.Checked) and
         (FormatDateTime('dd/mm/yyyy', eddtRegIni.Date) <> '30/12/1899') and
         (FormatDateTime('dd/mm/yyyy', eddtRegFim.Date) <> '30/12/1899') then
        AdicionaCondSql(sWhere,
                        ' t.dtCadastro BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegIni.DateTime)) +
                        '                  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtRegFim.DateTime))
                       );

      if (StrToIntDef(edcdRepIni.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepIni.ERPValorValido) and
         (StrToIntDef(edcdRepFim.ERPEdCampoChaveText, 0) > 0) and
         (edcdRepFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdRepresentante BETWEEN ' + Trim(edcdRepIni.ERPEdCampoChaveText) +
                                '                       AND ' + Trim(edcdRepFim.ERPEdCampoChaveText)
                       );

      if (Trim(edcdClienteIni.ERPEdCampoChaveText) <> '') and
         (edcdClienteIni.ERPValorValido) and
         (Trim(edcdClienteFim.ERPEdCampoChaveText) <> '') and
         (edcdClienteFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdCliente BETWEEN ' + Trim(edcdClienteIni.ERPEdCampoChaveText) +
                                '                 AND ' + Trim(edcdClienteFim.ERPEdCampoChaveText)
                       );

      if not vtClientesEscolhidos.IsEmpty then
      begin
        vtClientesEscolhidos.DisableControls;

        try
          vtClientesEscolhidos.First;
          sAux := '';

          while not vtClientesEscolhidos.Eof do
          begin
            if Trim(sAux) = '' then
              sAux := vtClientesEscolhidos.FieldByName('cdCliente').AsString
            else
              sAux := sAux + ', ' + vtClientesEscolhidos.FieldByName('cdCliente').AsString;

            vtClientesEscolhidos.Next;
          end;

          AdicionaCondSql(sWhere, ' t.cdCliente IN(' + sAux + ')');
        finally
          vtClientesEscolhidos.EnableControls;
        end;
      end;

      sAux := '';

      for i := 0 to gbEstadosCli.ControlCount - 1 do
      begin
        if (gbEstadosCli.Controls[i] is TCheckBox) and ((gbEstadosCli.Controls[i] as TCheckBox).Checked) then
        begin
          if Trim(sAux) = '' then
            sAux := QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption)
          else
            sAux := sAux + ', ' + QuotedStr((gbEstadosCli.Controls[i] as TCheckBox).Caption);
        end;
      end;

      if Trim(sAux) <> '' then
        AdicionaCondSql(sWhere, ' t.sgEstado IN(' + sAux + ')');

      if Trim(ednmCidade.Text) <> '' then
        AdicionaCondSql(sWhere, ' LOWER(t.nmCidade) LIKE ' + QuotedStr('%' + LowerCase(ednmCidade.Text) + '%'));

      if (Trim(edcdGrupoCliIni.ERPEdCampoChaveText) <> '') and
         (edcdGrupoCliIni.ERPValorValido) and
         (Trim(edcdGrupoCliFim.ERPEdCampoChaveText) <> '') and
         (edcdGrupoCliFim.ERPValorValido) then
        AdicionaCondSql(sWhere, ' t.cdGrupoCli BETWEEN ' + Trim(edcdGrupoCliIni.ERPEdCampoChaveText) +
                                '                  AND ' + Trim(edcdGrupoCliFim.ERPEdCampoChaveText)
                       );

      if Trim(sWhere) <> '' then
        sWhere := '  WHERE ' + sWhere + ' ORDER BY t.cdCliente'
      else
        sWhere := ' ORDER BY t.cdCliente';

      DmIntegracao.qyCliente.MacroByName('filtro').Value := sWhere;

      DmIntegracao.qyCliente.Open;

      if DmIntegracao.qyCliente.IsEmpty then
        Aviso('Não existem clientes com os filtros informados.')
      else
      begin
        DmIntegracao.qyCliente.First;

        while not DmIntegracao.qyCliente.Eof do
        begin
//          CódCliente;Nome;DDD;Telefefone;Latitude;Longitude;Classificação;HorárioInicial;HorárioFim;Cidade;UF
          sInfoCab := '';
          sInfoVal := '';

          if DmIntegracao.qyCliente.FieldByName('cdCliente').AsInteger > 0 then
          begin
            AdicionaInfo(sInfoCab, 'CódCliente');
            AdicionaInfo(sInfoVal, DmIntegracao.qyCliente.FieldByName('cdCliente').AsString);
          end
          else
          begin
            AdicionaInfo(sInfoCab, '');
            AdicionaInfo(sInfoVal, '');
          end;

          if Trim(DmIntegracao.qyCliente.FieldByName('deRazaoSocial').AsString) <> '' then
          begin
            AdicionaInfo(sInfoCab, 'Nome');
            AdicionaInfo(sInfoVal, DmIntegracao.qyCliente.FieldByName('deRazaoSocial').AsString);
          end
          else
          begin
            AdicionaInfo(sInfoCab, '');
            AdicionaInfo(sInfoVal, '');
          end;

          AdicionaInfo(sInfoCab, ''); //DDD
          AdicionaInfo(sInfoVal, ''); //DDD

          AdicionaInfo(sInfoCab, ''); //Telefefone
          AdicionaInfo(sInfoVal, ''); //Telefefone

          AdicionaInfo(sInfoCab, ''); //Classificação
          AdicionaInfo(sInfoVal, ''); //Classificação

          AdicionaInfo(sInfoCab, ''); //HorárioInicial
          AdicionaInfo(sInfoVal, ''); //HorárioInicial

          AdicionaInfo(sInfoCab, ''); //HorárioFim
          AdicionaInfo(sInfoVal, ''); //HorárioFim

          sEndereco := '';

          if Trim(DmIntegracao.qyCliente.FieldByName('deEndereco').AsString) <> '' then
            sEndereco := Trim(DmIntegracao.qyCliente.FieldByName('deEndereco').AsString);

          if Trim(DmIntegracao.qyCliente.FieldByName('nuEndereco').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(DmIntegracao.qyCliente.FieldByName('nuEndereco').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(DmIntegracao.qyCliente.FieldByName('nuEndereco').AsString);
          end;

          if Trim(DmIntegracao.qyCliente.FieldByName('deBairro').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(DmIntegracao.qyCliente.FieldByName('deBairro').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(DmIntegracao.qyCliente.FieldByName('deBairro').AsString);
          end;

          if Trim(DmIntegracao.qyCliente.FieldByName('nmCidade').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(DmIntegracao.qyCliente.FieldByName('nmCidade').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(DmIntegracao.qyCliente.FieldByName('nmCidade').AsString);
          end;

          if Trim(DmIntegracao.qyCliente.FieldByName('sgEstado').AsString) <> '' then
          begin
            if Trim(sEndereco) = '' then
              sEndereco := ', ' + Trim(DmIntegracao.qyCliente.FieldByName('sgEstado').AsString)
            else
              sEndereco := sEndereco + ', ' + Trim(DmIntegracao.qyCliente.FieldByName('sgEstado').AsString);
          end;

          if Trim(sEndereco) <> '' then
          begin
            AdicionaInfo(sInfoCab, 'EndereçoCompleto');
            AdicionaInfo(sInfoVal, Copy(sEndereco, 1, 500));
          end
          else
          begin
            AdicionaInfo(sInfoCab, '');
            AdicionaInfo(sInfoVal, '');
          end;

          if Trim(DmIntegracao.qyCliente.FieldByName('nuCep').AsString) <> '' then
          begin
            AdicionaInfo(sInfoCab, 'CEP');
            AdicionaInfo(sInfoVal, Copy(Trim(DmIntegracao.qyCliente.FieldByName('nuCep').AsString), 1, 9));
          end
          else
          begin
            AdicionaInfo(sInfoCab, '');
            AdicionaInfo(sInfoVal, '');
          end;

          AdicionaInfo(sInfoCab, ''); //Latitude
          AdicionaInfo(sInfoVal, ''); //Latitude

          AdicionaInfo(sInfoCab, ''); //Longitude
          AdicionaInfo(sInfoVal, ''); //Longitude

//          stDados.Add(sInfoCab);
          stDados.Add(sInfoVal);

          DmIntegracao.qyCliente.Next;
        end;
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyCliente.Active then
      DmIntegracao.qyCliente.Close;

    DmIntegracao.qyCliente.MacroByName('filtro').Clear;

    FecharConexaoIntegracao;
  end;

  if stDados.Count > 0 then
  begin
    sdDadosWay.FileName := 'DadosWay_Clientes.csv';

    if sdDadosWay.Execute then
      stDados.SaveToFile(sdDadosWay.FileName);
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TFIntComRelatorios.ExportarDadosWayPed;
var
  stDados : TStringList;
  sInfo   : String;
  inuPed  : Integer;

  procedure AdicionaInfo(const sValor : String);
  begin
    if Trim(sInfo) = '' then
      sInfo := sValor
    else
      sInfo := sInfo + ';' + sValor;
  end;

begin
  stDados := TStringList.Create;
//  stDados.Add('CódCliente;NumeroPedido;Volume;Peso;Valor');

  GerarInfoPedido(' ORDER BY t.codigo_cliente, t.nuPedido, t.seq',
                  99,
                  False
                 );

  if not vtPedido.IsEmpty then
  begin
    try
      vtPedido.DisableControls;

      vtPedido.First;

      inuPed := 0;
      sInfo  := '';

      while not vtPedido.Eof do
      begin
        if inuPed <> vtPedido.FieldByName('nuPedido').AsInteger then
        begin
          AdicionaInfo(vtPedido.FieldByName('codigo_cliente').AsString);
          AdicionaInfo(vtPedido.FieldByName('nuPedido').AsString);
          AdicionaInfo(vtPedido.FieldByName('nuTotVolumes').AsString);
          AdicionaInfo(IntToStr(40 * vtPedido.FieldByName('nuTotVolumes').AsInteger)); //Peso
          AdicionaInfo(vtPedido.FieldByName('vl_Total').AsString);

          stDados.Add(sInfo);
          inuPed := vtPedido.FieldByName('nuPedido').AsInteger;
          sInfo  := '';
        end;

        vtPedido.Next;
      end;
    finally
      vtPedido.EnableControls;
    end;
  end;

  if stDados.Count > 1 then
  begin
    sdDadosWay.FileName := 'Rota_.csv';

    if sdDadosWay.Execute then
      stDados.SaveToFile(sdDadosWay.FileName);
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

function TFIntComRelatorios.relClientesSemPedUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFIntComRelatorios.relClientesUserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFIntComRelatorios.relListaPrecoUserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFIntComRelatorios.relIntComercialUserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if (SameText(FsNomeRelatorio, 'RelListaProd')) or
     (SameText(FsNomeRelatorio, 'RelListaConf')) or
     (SameText(FsNomeRelatorio, 'RelExtratoCarreg')) then
  begin
    if SameText(MethodName, 'OBSCARGAS') then
      Result := ObsCargas;
  end;

  if SameText(FsNomeRelatorio, 'RelBilhetinho') then
  begin
    if SameText(MethodName, 'ImprimirObsBilhet') then
      Result := ImprimirObsBilhet;

    if SameText(MethodName, 'ImprimirBilhetUmCliPorPag') then
      Result := ImprimirBilhetUmCliPorPag;
  end;

  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

procedure TFIntComRelatorios.ImprimirListaPreco;
var
  i : Integer;
begin
  vtListaPreco.Clear;

  try
    DmIntegracao.fdConnInteg.Connected := True;

    DmIntegracao.qyListaPreco.MacroByName('filtro').Value := ' AND t.cdTab = ' + edcdTabPreco.Text;
    DmIntegracao.qyListaPreco.Open;

    DmIntegracao.qyListaPreco.First;

    while not DmIntegracao.qyListaPreco.Eof do
    begin
      vtListaPreco.Insert;

      for i := 0 to DmIntegracao.qyListaPreco.FieldCount - 1 do
      begin
        if Assigned(vtListaPreco.FindField(DmIntegracao.qyListaPreco.Fields.Fields[i].FieldName)) then
          vtListaPreco.FieldByName(DmIntegracao.qyListaPreco.Fields.Fields[i].FieldName).Value := DmIntegracao.qyListaPreco.Fields.Fields[i].Value;
      end;

      vtListaPreco.Post;

      DmIntegracao.qyListaPreco.Next;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if DmIntegracao.qyListaPreco.Active then
    DmIntegracao.qyListaPreco.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if not vtListaPreco.IsEmpty then
  begin
    relListaPreco.PrepareReport();
    CarregarImgLogoEmpRel(relListaPreco);
    relListaPreco.ShowReport();
  end;
end;

initialization
  RegisterClass(TFIntComRelatorios);

finalization
  UnRegisterClass(TFIntComRelatorios);

end.
