unit uDmERP;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Dialogs, Vcl.Forms, System.Variants,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Xml.Win.msxmldom, StrUtils,
  { Classes }
  uFuncoes;

type
  TDmERP = class(TDataModule)
    fdConnERP: TFDConnection;
    qyCliente: TFDQuery;
    dlPhysPg: TFDPhysPgDriverLink;
    qyCidade: TFDQuery;
    qyCidadePesq: TFDQuery;
    qyClientePesq: TFDQuery;
    qyIndInscEstPesq: TFDQuery;
    qyRepresentante: TFDQuery;
    qyRepresPesq: TFDQuery;
    qyUsuario: TFDQuery;
    qyPermissaoUsuario: TFDQuery;
    qyCobranca: TFDQuery;
    qyCobrancaContatoRel: TFDQuery;
    qyCobrancaContato: TFDQuery;
    qyCobrancaSituacao: TFDQuery;
    dsCobrancaSituacao: TDataSource;
    qyAviso: TFDQuery;
    qyAuxiliar: TFDQuery;
    qyIntSupItensCfgPad: TFDQuery;
    qyIntComCarga: TFDQuery;
    qyIntComItemPedImpresso: TFDQuery;
    qyEmpresa: TFDQuery;
    qyFatDiario: TFDQuery;
    qyFatDiarioPesq: TFDQuery;
    qyVeiculo: TFDQuery;
    qyVeiculoPesq: TFDQuery;
    qySetor: TFDQuery;
    qyUsuarioTela: TFDQuery;
    qyUsuarioPesq: TFDQuery;
    qyTelasDisponiveis: TFDQuery;
    qyTela: TFDQuery;
    qyTelaPesq: TFDQuery;
    qyPatrimonioTipo: TFDQuery;
    qyPatrimonioTipoPesq: TFDQuery;
    qyPatrimonio: TFDQuery;
    qyPatrimonioPesq: TFDQuery;
    qyPatrimonioManut: TFDQuery;
    qyPatrimonioManutPesq: TFDQuery;
    dsPatrimonioSituacao: TDataSource;
    qyPatrimonioSituacao: TFDQuery;
    qyCobrancaContatocdcobranca: TIntegerField;
    qyCobrancaContatocdcobrancacontato: TIntegerField;
    qyCobrancaContatodtcontato: TDateField;
    qyCobrancaContatonmcontato: TWideStringField;
    qyCobrancaContatodeobscontato: TWideStringField;
    qyCobrancaContatoflretornar: TWideStringField;
    qyCobrancaContatodtretorno: TDateField;
    qyCobrancaContatohrretorno: TIntegerField;
    qyCobrancaContatodtcadastro: TDateField;
    qyCobrancaContatohrcadastro: TIntegerField;
    qyCobrancaContatocdusuariocadastro: TIntegerField;
    qyCobrancaContatodtalteracao: TDateField;
    qyCobrancaContatohralteracao: TIntegerField;
    qyCobrancaContatocdusuarioalteracao: TIntegerField;
    qyCobrancaContatodehrretorno: TWideStringField;
    qyCobrancaContatodehrretornogrid: TWideStringField;
    qyCobrancaContatonmusucad: TWideStringField;
    qyCobrancaContatonmusualt: TWideStringField;
    qyFornecedor: TFDQuery;
    qyFornecedorTipo: TFDQuery;
    qyMotorista: TFDQuery;
    qyDocumentoTipo: TFDQuery;
    qyDespesaTipo: TFDQuery;
    qyBordero: TFDQuery;
    qyDocumento: TFDQuery;
    qyBorderoRel: TFDQuery;
    qyDocumentoRel: TFDQuery;
    qyIntComPedidosAntigos: TFDQuery;
    qyIntComItensPedAntigos: TFDQuery;
    qyIntSupItensCfgPadcditem: TWideStringField;
    qyIntSupItensCfgPadcdtipoalcarecnum: TIntegerField;
    qyIntSupItensCfgPadcdtipoalca: TIntegerField;
    qyIntSupItensCfgPaddetipoalca: TWideStringField;
    qyIntSupItensCfgPadcdadornorecnum: TIntegerField;
    qyIntSupItensCfgPadcdadorno: TIntegerField;
    qyIntSupItensCfgPaddeadorno: TWideStringField;
    qyIntSupItensCfgPadcdchavetarecnum: TIntegerField;
    qyIntSupItensCfgPadcdchaveta: TIntegerField;
    qyIntSupItensCfgPaddechaveta: TWideStringField;
    qyIntSupItensCfgPadcdforracaorecnum: TIntegerField;
    qyIntSupItensCfgPadcdforracao: TIntegerField;
    qyIntSupItensCfgPaddeforracao: TWideStringField;
    qyIntSupItensCfgPaddtcadastro: TDateField;
    qyIntSupItensCfgPadhrcadastro: TIntegerField;
    qyIntSupItensCfgPadcdusuariocadastro: TIntegerField;
    qyIntSupItensCfgPaddtalteracao: TDateField;
    qyIntSupItensCfgPadhralteracao: TIntegerField;
    qyIntSupItensCfgPadcdusuarioalteracao: TIntegerField;
    qyEstoqueProducaoRel: TFDQuery;
    qyClassifFiscal: TFDQuery;
    qyClasFisTaxaIbpt: TFDQuery;
    qyUnidadeMedida: TFDQuery;
    qyItemGrupo: TFDQuery;
    qyItemSubGrupo: TFDQuery;
    qyItemFamilia: TFDQuery;
    qyItem: TFDQuery;
    qyVariavel: TFDQuery;
    qyVariavelItens: TFDQuery;
    qyItemVinculoVariavel: TFDQuery;
    qyItemVinculoVariavelcditem: TWideStringField;
    qyItemVinculoVariavelcdvariavel: TIntegerField;
    qyItemVinculoVariavelcdvariavelitempadrao: TIntegerField;
    qyItemVinculoVariaveldtcadastro: TDateField;
    qyItemVinculoVariavelhrcadastro: TIntegerField;
    qyItemVinculoVariavelcdusuariocadastro: TIntegerField;
    qyItemVinculoVariaveldehrcadastro: TWideStringField;
    qyItemVinculoVariaveldeitem: TWideStringField;
    qyItemVinculoVariaveldevariavel: TWideStringField;
    qyItemVinculoVariaveldevariavelitempadrao: TWideStringField;
    qyItemVinculoVariavelnmusucad: TWideStringField;
    qyItemVarItensLib: TFDQuery;
    qyItemVariavelItensBloq: TFDQuery;
    qyItemVariavelItensBloqcditem: TWideStringField;
    qyItemVariavelItensBloqcdvariavel: TIntegerField;
    qyItemVariavelItensBloqcdvariavelitem: TIntegerField;
    qyItemVariavelItensBloqdtcadastro: TDateField;
    qyItemVariavelItensBloqhrcadastro: TIntegerField;
    qyItemVariavelItensBloqcdusuariocadastro: TIntegerField;
    qyItemVariavelItensBloqdevalor: TWideStringField;
    qyItemVarItensLibcdvariavelitem: TIntegerField;
    qyItemVarItensLibdevalor: TWideStringField;
    qyItemVarItensLibcdvariavel: TIntegerField;
    qyUsuarioMensagem: TFDQuery;
    qyColaborador: TFDQuery;
    qyColabSituacaoHst: TFDQuery;
    qyCargo: TFDQuery;
    qyColabPonto: TFDQuery;
    qyColabPontoRel: TFDQuery;
    qyIntIndItemRelacionado: TFDQuery;
    qyIntIndItemRelacionadoRel: TFDQuery;
    qyProducaoDiariaRel: TFDQuery;
    qyExtratoViagem: TFDQuery;
    qyIntIndMaterialMovEnt: TFDQuery;
    qyMaterialMovSit: TFDQuery;
    qyIntIndMaterialSolic: TFDQuery;
    qyIntIndMaterialMovSai: TFDQuery;
    qyIntIndMatEstoqueConsulta: TFDQuery;
    qyIntIndMaterialMovConsulta: TFDQuery;
    qyUsuariocdusuario: TIntegerField;
    qyUsuarionmusuario: TWideStringField;
    qyUsuarioflativo: TWideStringField;
    qyUsuariodelogin: TWideStringField;
    qyUsuariodesenha: TWideStringField;
    qyUsuariodeemail: TWideStringField;
    qyUsuariodtcadastro: TDateField;
    qyUsuariohrcadastro: TIntegerField;
    qyUsuariocdusuariocadastro: TIntegerField;
    qyUsuariodtalteracao: TDateField;
    qyUsuariohralteracao: TIntegerField;
    qyUsuariocdusuarioalteracao: TIntegerField;
    qyUsuariocdsetor: TIntegerField;
    qyUsuariocdcolaborador: TIntegerField;
    qyUsuariodesetor: TWideStringField;
    qyUsuariodehrcadastro: TWideStringField;
    qyUsuariodehralteracao: TWideStringField;
    qyUsuarionmusucad: TWideStringField;
    qyUsuarionmusualt: TWideStringField;
    qyTransportadora: TFDQuery;
    qyBanco: TFDQuery;
    qyAgencia: TFDQuery;
    qyConta: TFDQuery;
    qyCobrancaTipo: TFDQuery;
    qyColabDependentes: TFDQuery;
    qyColabDependentescdcolaborador: TIntegerField;
    qyColabDependentescdcolabdependentes: TIntegerField;
    qyColabDependentesnmdependente: TWideStringField;
    qyColabDependentescdgrauparentesco: TIntegerField;
    qyColabDependentesdtnascimento: TDateField;
    qyColabDependentesdtcadastro: TDateField;
    qyColabDependenteshrcadastro: TIntegerField;
    qyColabDependentescdusuariocadastro: TIntegerField;
    qyColabDependentesdtalteracao: TDateField;
    qyColabDependenteshralteracao: TIntegerField;
    qyColabDependentescdusuarioalteracao: TIntegerField;
    qyColabDependentesdehrcadastro: TWideStringField;
    qyColabDependentesdehralteracao: TWideStringField;
    qyColabDependentesnmusucad: TWideStringField;
    qyColabDependentesnmusualt: TWideStringField;
    qyColabDependentesdegrauparentesco: TWideStringField;
    qyEscala: TFDQuery;
    qyColabSetorHst: TFDQuery;
    qyColabCargoHst: TFDQuery;
    qyColabEscalaHst: TFDQuery;
    qyColabSalarioHst: TFDQuery;
    qyEscalaItem: TFDQuery;
    qyEscalaItemcdescala: TIntegerField;
    qyEscalaItemcdescalaitem: TIntegerField;
    qyEscalaItemdeescalaitem: TWideStringField;
    qyEscalaItemdtcadastro: TDateField;
    qyEscalaItemhrcadastro: TIntegerField;
    qyEscalaItemcdusuariocadastro: TIntegerField;
    qyEscalaItemdtalteracao: TDateField;
    qyEscalaItemhralteracao: TIntegerField;
    qyEscalaItemcdusuarioalteracao: TIntegerField;
    qyEscalaItemdehrcadastro: TWideStringField;
    qyEscalaItemdehralteracao: TWideStringField;
    qyEscalaItemnmusucad: TWideStringField;
    qyEscalaItemnmusualt: TWideStringField;
    qyColaboradorRel: TFDQuery;
    qyEmpresaLogo: TFDQuery;
    qyIntIndBaixaProducao: TFDQuery;
    qyIntIndBaixaProducaocditem: TWideStringField;
    qyIntIndBaixaProducaocdsetor: TIntegerField;
    qyIntIndBaixaProducaocdidqtde: TIntegerField;
    qyIntIndBaixaProducaodeitem: TWideStringField;
    qyIntIndBaixaProducaodtbaixa: TDateField;
    qyIntIndBaixaProducaohrbaixa: TIntegerField;
    qyIntIndBaixaProducaocdusuariobaixa: TIntegerField;
    qyIntIndBaixaProducaodehrbaixa: TWideStringField;
    qyIntIndBaixaProducaodesetor: TWideStringField;
    qyIntIndBaixaProducaonmusubaixa: TWideStringField;
    qyIntIndBaixaProducaoflemestoque: TWideStringField;
    qyIntIndBaixaProducaodtcadpedido: TDateField;
    qyIntIndBaixaProducaocdpedido: TIntegerField;
    qyIntIndBaixaProducaocdseqped: TIntegerField;
    qyIntIndBaixaProducaocdidqtdeseqped: TIntegerField;
    qyIntIndBaixaProducaonuqtdtotalitem: TIntegerField;
    qyIntIndBaixaProducaocdcliente: TIntegerField;
    qyIntIndBaixaProducaocdcarga: TIntegerField;
    qyIntIndBaixaProducaodecarga: TWideStringField;
    qyIntIndBaixaProducaoflehsetorexpedicao: TWideStringField;
    qyIntIndBaixaProducaoflehsetorembalagem: TWideStringField;
    qyIntIndBaixaProducaoflehsetormontagem: TWideStringField;
    qyIntIndBaixaProducaocdtamanho: TIntegerField;
    qyIntIndBaixaProducaodetamanho: TWideStringField;
    qyIntIndBaixaProducaocdcor: TIntegerField;
    qyIntIndBaixaProducaodecor: TWideStringField;
    qyIntIndBaixaProducaocdalca: TIntegerField;
    qyIntIndBaixaProducaodealca: TWideStringField;
    qyIntIndBaixaProducaocdadorno: TIntegerField;
    qyIntIndBaixaProducaodeadorno: TWideStringField;
    qyIntIndBaixaProducaocdchaveta: TIntegerField;
    qyIntIndBaixaProducaodechaveta: TWideStringField;
    qyIntIndBaixaProducaocdforracao: TIntegerField;
    qyIntIndBaixaProducaodeforracao: TWideStringField;
    qyIntIndBaixaProducaocdimagem: TIntegerField;
    qyIntIndBaixaProducaodeimagem: TWideStringField;
    qyIntIndBaixaProducaocditemrelacionado: TIntegerField;
    qyIntIndBaixaProducaocditembase: TWideStringField;
    qyIntIndBaixaProducaodeitembase: TWideStringField;
    qyIntIndBaixaProducaocdtamanhobase: TIntegerField;
    qyIntIndBaixaProducaodetamanhobase: TWideStringField;
    qyIntIndBaixaProducaodesetorant: TWideStringField;
    qyIntIndBaixaProducaoflehsetantmont: TWideStringField;
    qyIntIndBaixaProducaoflehrevenda: TWideStringField;
    qyIntIndBaixaProducaodtalteracao: TDateField;
    qyIntIndBaixaProducaohralteracao: TIntegerField;
    qyIntIndBaixaProducaocdusuarioalteracao: TIntegerField;
    qyIntIndBaixaProducaoflehacessorio: TWideStringField;
    qyIntIndBaixaProducaocdempresa: TIntegerField;
    qyIntIndBaixaProducaonmempresa: TWideStringField;
    qyIntIndBaixaProducaoflmovestsetorant: TWideStringField;
    qyIntIndBaixaProducaocdsetoranterior: TIntegerField;
    qyIntIndBaixaProducaocdidqtdeanterior: TIntegerField;
    qyIntComCargaPesq: TFDQuery;
    qyReciboAvulso: TFDQuery;
    qyReciboAvulsoRel: TFDQuery;
    qyIntIndMaterialEstoqueRel: TFDQuery;
    qyNatureza: TFDQuery;
    qyCentroCusto: TFDQuery;
    qyUsuarioConexao: TFDQuery;
    qyUsuarioChat: TFDQuery;
    qyPedido: TFDQuery;
    qyCidadeDW: TFDQuery;
    qyClienteDW: TFDQuery;
    qyRepresentanteDW: TFDQuery;
    qyVariavelDW: TFDQuery;
    qyVariavelItensDW: TFDQuery;
    qyItemGrupoDW: TFDQuery;
    qyItemSubGrupoDW: TFDQuery;
    qyItemDW: TFDQuery;
    qyItemCombinacaoVendaDW: TFDQuery;
    qyVendasDW: TFDQuery;
    qyTempoDW: TFDQuery;
    qyIntSupItensCfgPadcdtipoalcaseq: TIntegerField;
    qyIntSupItensCfgPadcdadornoseq: TIntegerField;
    qyIntSupItensCfgPadcdchavetaseq: TIntegerField;
    qyIntSupItensCfgPadcdforracaoseq: TIntegerField;
    qyIntSupItensCfgPadflcobrarcor: TWideStringField;
    qyIntComCotaFin: TFDQuery;
    qyIntComCargaAlerta: TFDQuery;
    qyIntComCargaAlertacdcarga: TIntegerField;
    qyIntComCargaAlertacdcargaalerta: TIntegerField;
    qyIntComCargaAlertadecargaalerta: TWideStringField;
    qyIntComCargaAlertadtcadastro: TDateField;
    qyIntComCargaAlertahrcadastro: TIntegerField;
    qyIntComCargaAlertacdusuariocadastro: TIntegerField;
    qyIntComCargaAlertadtalteracao: TDateField;
    qyIntComCargaAlertahralteracao: TIntegerField;
    qyIntComCargaAlertacdusuarioalteracao: TIntegerField;
    qyIntComCargaAlertadehrcadastro: TWideStringField;
    qyIntComCargaAlertadehralteracao: TWideStringField;
    qyIntComCargaAlertanmusucad: TWideStringField;
    qyIntComCargaAlertanmusualt: TWideStringField;
    qyIntComCargaAlertaPesq: TFDQuery;
    qyIntSupItensCfgPadflativo: TWideStringField;
    procedure fdConnERPError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure DataModuleCreate(Sender: TObject);
    procedure qyClienteAfterScroll(DataSet: TDataSet);
    procedure qyClienteNewRecord(DataSet: TDataSet);
    procedure qyRepresentanteAfterScroll(DataSet: TDataSet);
    procedure qyCobrancaNewRecord(DataSet: TDataSet);
    procedure qyCobrancaContatoBeforePost(DataSet: TDataSet);
    procedure qyCobrancaContatoBeforeOpen(DataSet: TDataSet);
    procedure qyCobrancaAfterScroll(DataSet: TDataSet);
    procedure qyCobrancaContatoNewRecord(DataSet: TDataSet);
    procedure qyCobrancaBeforePost(DataSet: TDataSet);
    procedure qyClienteBeforePost(DataSet: TDataSet);
    procedure qyCidadeBeforePost(DataSet: TDataSet);
    procedure qyRepresentanteBeforePost(DataSet: TDataSet);
    procedure qyUsuarioBeforePost(DataSet: TDataSet);
    procedure qyAvisoBeforePost(DataSet: TDataSet);
    procedure qyIntSupItensCfgPaddetipoalcaValidate(Sender: TField);
    procedure qyIntSupItensCfgPaddechavetaValidate(Sender: TField);
    procedure qyIntSupItensCfgPaddeforracaoValidate(Sender: TField);
    procedure qyIntSupItensCfgPaddeadornoValidate(Sender: TField);
    procedure qyIntSupItensCfgPadBeforePost(DataSet: TDataSet);
    procedure qyCobrancaContatoAfterScroll(DataSet: TDataSet);
    procedure qyEmpresaBeforePost(DataSet: TDataSet);
    procedure qyEmpresaAfterScroll(DataSet: TDataSet);
    procedure qyFatDiarioBeforePost(DataSet: TDataSet);
    procedure qyFatDiarioNewRecord(DataSet: TDataSet);
    procedure qyVeiculoBeforePost(DataSet: TDataSet);
    procedure qyVeiculoAfterScroll(DataSet: TDataSet);
    procedure qySetorBeforePost(DataSet: TDataSet);
    procedure qyUsuarioNewRecord(DataSet: TDataSet);
    procedure qyUsuarioPesqAfterClose(DataSet: TDataSet);
    procedure qyUsuarioTelaBeforeOpen(DataSet: TDataSet);
    procedure qyTelasDisponiveisBeforeOpen(DataSet: TDataSet);
    procedure qyUsuarioTelaBeforePost(DataSet: TDataSet);
    procedure qyUsuarioAfterScroll(DataSet: TDataSet);
    procedure qyTelaBeforePost(DataSet: TDataSet);
    procedure qyTelaNewRecord(DataSet: TDataSet);
    procedure qyTelaPesqAfterClose(DataSet: TDataSet);
    procedure qyPatrimonioTipoPesqAfterClose(DataSet: TDataSet);
    procedure qyPatrimonioTipoBeforePost(DataSet: TDataSet);
    procedure qyPatrimonioPesqAfterClose(DataSet: TDataSet);
    procedure qyPatrimonioBeforePost(DataSet: TDataSet);
    procedure qyPatrimonioManutPesqAfterClose(DataSet: TDataSet);
    procedure qyPatrimonioManutBeforePost(DataSet: TDataSet);
    procedure qyPatrimonioManutNewRecord(DataSet: TDataSet);
    procedure qyFornecedorBeforePost(DataSet: TDataSet);
    procedure qyFornecedorAfterScroll(DataSet: TDataSet);
    procedure qyFornecedorNewRecord(DataSet: TDataSet);
    procedure qyRepresentanteNewRecord(DataSet: TDataSet);
    procedure qyFornecedorTipoBeforePost(DataSet: TDataSet);
    procedure qyMotoristaBeforePost(DataSet: TDataSet);
    procedure qyDocumentoTipoBeforePost(DataSet: TDataSet);
    procedure qyDespesaTipoBeforePost(DataSet: TDataSet);
    procedure qyBorderoBeforePost(DataSet: TDataSet);
    procedure qyDocumentoBeforePost(DataSet: TDataSet);
    procedure qyDocumentoNewRecord(DataSet: TDataSet);
    procedure qyIntComItensPedAntigosBeforeOpen(DataSet: TDataSet);
    procedure qyIntComPedidosAntigosAfterScroll(DataSet: TDataSet);
    procedure qyIntComItemPedImpressoBeforePost(DataSet: TDataSet);
    procedure qySetorNewRecord(DataSet: TDataSet);
    procedure qyClassifFiscalBeforePost(DataSet: TDataSet);
    procedure qyClasFisTaxaIbptBeforeOpen(DataSet: TDataSet);
    procedure qyClassifFiscalAfterScroll(DataSet: TDataSet);
    procedure qyClassifFiscalNewRecord(DataSet: TDataSet);
    procedure qyItemFamiliaBeforePost(DataSet: TDataSet);
    procedure qyItemGrupoBeforePost(DataSet: TDataSet);
    procedure qyItemNewRecord(DataSet: TDataSet);
    procedure qyVariavelBeforePost(DataSet: TDataSet);
    procedure qyVariavelAfterScroll(DataSet: TDataSet);
    procedure qyVariavelItensBeforeOpen(DataSet: TDataSet);
    procedure qyVariavelItensBeforePost(DataSet: TDataSet);
    procedure qyItemVinculoVariavelcdvariavelValidate(Sender: TField);
    procedure qyItemVinculoVariavelcdvariavelitempadraoValidate(Sender: TField);
    procedure qyItemVinculoVariavelBeforePost(DataSet: TDataSet);
    procedure qyItemVinculoVariavelAfterOpen(DataSet: TDataSet);
    procedure qyItemVinculoVariavelAfterPost(DataSet: TDataSet);
    procedure qyUsuarioMensagemBeforePost(DataSet: TDataSet);
    procedure qyColaboradorAfterScroll(DataSet: TDataSet);
    procedure qyColaboradorBeforePost(DataSet: TDataSet);
    procedure qyCargoBeforePost(DataSet: TDataSet);
    procedure qyColaboradorAfterPost(DataSet: TDataSet);
    procedure qyColabPontoBeforePost(DataSet: TDataSet);
    procedure qyIntIndItemRelacionadoBeforePost(DataSet: TDataSet);
    procedure qyIntIndMaterialMovEntBeforePost(DataSet: TDataSet);
    procedure qyIntIndMaterialMovEntNewRecord(DataSet: TDataSet);
    procedure qyIntIndMaterialSolicBeforePost(DataSet: TDataSet);
    procedure qyIntIndMaterialMovSaiBeforePost(DataSet: TDataSet);
    procedure qyIntIndMaterialMovSaiNewRecord(DataSet: TDataSet);
    procedure qyIntIndMaterialSolicAfterScroll(DataSet: TDataSet);
    procedure qyIntIndMaterialMovSaiBeforeOpen(DataSet: TDataSet);
    procedure qyIntIndMaterialSolicNewRecord(DataSet: TDataSet);
    procedure qyTransportadoraAfterScroll(DataSet: TDataSet);
    procedure qyTransportadoraBeforePost(DataSet: TDataSet);
    procedure qyTransportadoraNewRecord(DataSet: TDataSet);
    procedure qyMotoristaAfterScroll(DataSet: TDataSet);
    procedure qyAgenciaAfterScroll(DataSet: TDataSet);
    procedure qyAgenciaBeforePost(DataSet: TDataSet);
    procedure qyContaBeforePost(DataSet: TDataSet);
    procedure qyCobrancaTipoBeforePost(DataSet: TDataSet);
    procedure qyCobrancaTipoNewRecord(DataSet: TDataSet);
    procedure qyIntIndBaixaProducaoBeforePost(DataSet: TDataSet);
    procedure qyColaboradorNewRecord(DataSet: TDataSet);
    procedure qyColabDependentesBeforePost(DataSet: TDataSet);
    procedure qyEscalaBeforePost(DataSet: TDataSet);
    procedure qyEscalaItemBeforePost(DataSet: TDataSet);
    procedure qyEscalaAfterScroll(DataSet: TDataSet);
    procedure qyIntComCargaNewRecord(DataSet: TDataSet);
    procedure qyReciboAvulsoBeforePost(DataSet: TDataSet);
    procedure qyReciboAvulsoAfterScroll(DataSet: TDataSet);
    procedure qyReciboAvulsoNewRecord(DataSet: TDataSet);
    procedure qyNaturezaNewRecord(DataSet: TDataSet);
    procedure qyUsuarioConexaoBeforePost(DataSet: TDataSet);
    procedure qyUsuarioChatBeforePost(DataSet: TDataSet);
    procedure qyPedidoNewRecord(DataSet: TDataSet);
    procedure qyPedidoBeforePost(DataSet: TDataSet);
    procedure qyTempoDWBeforePost(DataSet: TDataSet);
    procedure qyIntSupItensCfgPadflcobrarcorGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qyIntComCotaFinBeforePost(DataSet: TDataSet);
    procedure qyIntComCargaAlertaBeforePost(DataSet: TDataSet);
    procedure qyIntComCargaAfterScroll(DataSet: TDataSet);
  private
    FscdItemVinculo : String;

    procedure GravarCamposAutomaticos(const qyDados : TFDQuery);
//--------- Integração ---------------------------------------------------------
    procedure GravarCamposItensVarItens(const icdVar     : Integer;
                                        const sdeVarItem,
                                              scdFieldRecNum,
                                              scdFieldMasc : String
                                       );
//--------- Fim Integração -----------------------------------------------------
  public
    procedure UsuarioConectado(const sConectado : String);
    procedure CarregarInfoCep(const sCep : String;
                                var sdeEndereco,
                                    sdeComplemento,
                                    sdeBairro : String;
                                var icdCidade : Integer
                             );

    function RegistrarPonto : Boolean;

    function TelaValida : String;
    procedure GravarTela;
    procedure ExcluirTela;

    function UsuarioValido : String;
    procedure GravarUsuario;
    procedure ExcluirUsuario;

    function EmpresaValida : String;
    procedure GravarEmpresa;
    procedure ExcluirEmpresa;

    function SetorValido : String;
    procedure GravarSetor;
    procedure ExcluirSetor;

    function VeiculoValido : String;
    procedure GravarVeiculo;
    procedure ExcluirVeiculo;

    function MotoristaValido : String;
    procedure GravarMotorista;
    procedure ExcluirMotorista;

    function FornecedorTipoValido : String;
    procedure GravarFornecedorTipo;
    procedure ExcluirFornecedorTipo;

    function CentroCustoValido : String;
    procedure GravarCentroCusto;
    procedure ExcluirCentroCusto;

    function FornecedorValido : String;
    procedure GravarFornecedor;
    procedure ExcluirFornecedor;

    function ClienteValido : String;
    procedure GravarCliente;
    procedure ExcluirCliente;

    function RepresentanteValido : String;
    procedure GravarRepresentante;
    procedure ExcluirRepresentante;

    function TransportadoraValida : String;
    procedure GravarTransportadora;
    procedure ExcluirTransportadora;

    function BancoValido : String;
    procedure GravarBanco;
    procedure ExcluirBanco;

    function AgenciaValida : String;
    procedure GravarAgencia;
    procedure ExcluirAgencia;

    function ContaValida : String;
    procedure GravarConta;
    procedure ExcluirConta;

    function CobrancaTipoValida : String;
    procedure GravarCobrancaTipo;
    procedure ExcluirCobrancaTipo;

    function ReciboAvulsoValido : String;
    procedure GravarReciboAvulso;
    procedure ExcluirReciboAvulso;

    function EscalaValida : String;
    procedure GravarEscala;
    procedure ExcluirEscala;

    function EscalaItemValido : String;
    procedure GravarEscalaItem;
    procedure ExcluirEscalaItem;

    function CargoValido : String;
    procedure GravarCargo;
    procedure ExcluirCargo;

    function ColaboradorValido : String;
    procedure GravarColaborador;
    procedure ExcluirColaborador;

    function ColabDependenteValido : String;
    procedure GravarColabDependente;
    procedure ExcluirColabDependente;

    function PedidoValido : String;
    procedure GravarPedido;
    procedure ExcluirPedido;

    function UnidadeMedidaValida : String;
    procedure GravarUnidadeMedida;
    procedure ExcluirUnidadeMedida;

    function ItemGrupoValido : String;
    procedure GravarItemGrupo;
    procedure ExcluirItemGrupo;

    function ItemSubGrupoValido : String;
    procedure GravarItemSubGrupo;
    procedure ExcluirItemSubGrupo;

    function ItemFamiliaValida : String;
    procedure GravarItemFamilia;
    procedure ExcluirItemFamilia;

    function ItemValido : String;
    procedure GravarItem;
    procedure ExcluirItem;

    function TipoPatrimonioValido : String;
    procedure GravarTipoPatrimonio;
    procedure ExcluirTipoPatrimonio;

    function PatrimonioValido : String;
    procedure GravarPatrimonio;
    procedure ExcluirPatrimonio;

    function ClassifFiscalValida : String;
    procedure GravarClassifFiscal;
    procedure ExcluirClassifFiscal;

    function DocumentoTipoValido : String;
    procedure GravarDocumentoTipo;
    procedure ExcluirDocumentoTipo;

    function DespesaTipoValido : String;
    procedure GravarDespesaTipo;
    procedure ExcluirDespesaTipo;

    function VariavelValida : String;
    procedure GravarVariavel;
    procedure ExcluirVariavel;

    function VariavelItemValido : String;
    procedure GravarVariavelItem;
    procedure ExcluirVariavelItem;

    function ItemVinculoVariavelValido : String;
    procedure GravarItemVinculoVariavel;
    procedure ExcluirItemVinculoVariavel;

    function PatrimonioManutencaoValida : String;
    procedure GravarPatrimonioManutencao;
    procedure ExcluirPatrimonioManutencao;

    function BorderoValido : String;
    procedure GravarBordero;
    procedure ExcluirBordero;

    function DocumentoValido : String;
    procedure GravarDocumento;
    procedure ExcluirDocumento;

    function CobrancaValida : String;
    procedure GravarCobranca;
    procedure ExcluirCobranca;

    function CobrancaContatoValido : String;
    procedure GravarCobrancaContato;
    procedure ExcluirCobrancaContato;

    function FatDiarioValido : String;
    procedure GravarFatDiario;
    procedure ExcluirFatDiario;

    function NaturezaValida : String;
    procedure GravarNatureza;
    procedure ExcluirNatureza;

//--------- Integração ---------------------------------------------------------
    function ItemRelacionadoValido : String;
    procedure GravarItemRelacionado;
    procedure ExcluirItemRelacionado;

    function CargaValida : String;
    procedure GravarCarga;
    procedure ExcluirCarga;

    function CargaAlertaValida : String;
    procedure GravarCargaAlerta;
    procedure ExcluirCargaAlerta;

    function BaixaProducaoValida : TStringList;
    procedure GravarBaixaProducao;
    procedure ExcluirBaixaProducao;

    function MaterialMovValido(const qyMov : TFDQuery) : String;
    procedure GravarMaterialMov(const qyMov : TFDQuery; const bExibirMsg : Boolean);
    procedure ExcluirMaterialMov(const qyMov : TFDQuery);

    procedure BeforePostMaterialMov(const qyMov : TFDQuery);

    function MaterialSolicValido : String;
    procedure GravarMaterialSolic;
    procedure ExcluirMaterialSolic;
//--------- Fim Integração -----------------------------------------------------
  end;

var
  DmERP: TDmERP;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  UTelaInicial, uDmIntegracao;

{$R *.dfm}

procedure TDmERP.CarregarInfoCep(const sCep : String;
                                   var sdeEndereco,
                                       sdeComplemento,
                                       sdeBairro : String;
                                   var icdCidade : Integer
                                );
resourcestring
  __rINFORME_NR_CEP = 'Informe o número do cep.';
  __rCEP_INVALIDO = 'O número do CEP deve ser composto por 8 bytes.';
  __rCEP_NAO_ENCONTRADO = 'Cep não encontrado.';
const
  _rCep = 'cep';
  _rLogradouro = 'logradouro';
  _rBairro = 'bairro';
  _rLocalidade = 'localidade';
  _rComplemento = 'complemento';
  _rUF = 'uf';
  _rWS = 'https://viacep.com.br/ws/';
  _rXML = '/xml/';
  _rERRO = 'erro';
  _rTrue = 'true';
var
  _rDXML  : IXMLDocument;
  snmCidade,
  sSgEstado,
  sCepNum : String;
  stDados : TStringList;
begin
  sCepNum := SomenteNumeros(sCep);
{
  if sCepNum.IsEmpty then
  begin
    Aviso(__rINFORME_NR_CEP);
    Abort;
  end;

  if sCepNum.Length <> 8 then
  begin
    Aviso(__rCEP_INVALIDO);
    Abort;
  end;
}
  _rDXML := TXMLDocument.Create(nil);

  try
    _rDXML.FileName := _rWS + sCepNum + _rXML;
    _rDXML.Active := True;
    { Quando consultado um CEP de formato válido, porém inexistente, }
    { por exemplo: "99999999", o retorno conterá um valor de "erro"  }
    { igual a "true". Isso significa que o CEP consultado não foi    }
    { encontrado na base de dados. https://viacep.com.br/            }

    if _rDXML.DocumentElement.ChildValues[0] = _rTrue then
      Aviso(__rCEP_NAO_ENCONTRADO)
    else
    begin
      sCepNum        := _rDXML.DocumentElement.ChildNodes[_rCep].Text;
      sdeEndereco    := _rDXML.DocumentElement.ChildNodes[_rLogradouro].Text;
      sdeComplemento := _rDXML.DocumentElement.ChildNodes[_rComplemento].Text;
      sdeBairro      := _rDXML.DocumentElement.ChildNodes[_rBairro].Text;
      snmCidade      := _rDXML.DocumentElement.ChildNodes[_rLocalidade].Text;
      sSgEstado      := _rDXML.DocumentElement.ChildNodes[_rUF].Text;

      if (Trim(snmCidade) <> '') and (Trim(sSgEstado) <> '') then
      begin
        snmCidade := RemoverAcentos(snmCidade);
        snmCidade := UpperCase(snmCidade);

        stDados := TStringList.Create;

        ExecuteSimplesSql(fdConnERP,
                          'SELECT cdCidade ' +
                          '  FROM erp.cidade ' +
                          ' WHERE UPPER(erp.RemoverAcento(nmCidade)) = ' + QuotedStr(snmCidade) +
                          '   AND sgEstado = ' + QuotedStr(sSgEstado),
                          'cdCidade',
                          stDados
                         );

        if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
          icdCidade := StrToIntDef(stDados.Strings[0], 0);

        if Assigned(stDados) then
          FreeAndNil(stDados);
      end;
    end;
  finally
    _rDXML := nil;
  end;
end;

procedure TDmERP.GravarCamposAutomaticos(const qyDados : TFDQuery);
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(fdConnERP);

  if qyDados.State = dsInsert then
  begin
    if Assigned(qyDados.FindField('cdUsuarioCadastro')) then
      qyDados.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

    if Assigned(qyDados.FindField('nmUsuCad')) then
    begin
      if qyDados.FieldByName('nmUsuCad').ReadOnly then
        qyDados.FieldByName('nmUsuCad').ReadOnly         := False;

      qyDados.FieldByName('nmUsuCad').AsString           := FTelaInicial.FnmUsuario;
    end;

    if Assigned(qyDados.FindField('dtCadastro')) then
      qyDados.FieldByName('dtCadastro').AsDateTime       := Trunc(dthrAtual);

    if Assigned(qyDados.FindField('hrCadastro')) then
      qyDados.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dthrAtual);

    if Assigned(qyDados.FindField('dehrCadastro')) then
    begin
      if qyDados.FieldByName('dehrCadastro').ReadOnly then
        qyDados.FieldByName('dehrCadastro').ReadOnly     := False;

      qyDados.FieldByName('dehrCadastro').AsString       := FormatDateTime('hh:mm', dthrAtual);
    end;
  end
  else
  begin
    if Assigned(qyDados.FindField('cdUsuarioAlteracao')) then
      qyDados.FieldByName('cdUsuarioAlteracao').AsInteger := FTelaInicial.FcdUsuario;

    if Assigned(qyDados.FindField('nmUsuAlt')) then
    begin
      if qyDados.FieldByName('nmUsuAlt').ReadOnly then
        qyDados.FieldByName('nmUsuAlt').ReadOnly          := False;

      qyDados.FieldByName('nmUsuAlt').AsString            := FTelaInicial.FnmUsuario;
    end;

    if Assigned(qyDados.FindField('dtAlteracao')) then
      qyDados.FieldByName('dtAlteracao').AsDateTime       := Trunc(dthrAtual);

    if Assigned(qyDados.FindField('hrAlteracao')) then
      qyDados.FieldByName('hrAlteracao').AsInteger        := HoraParaMinutos(dthrAtual);

    if Assigned(qyDados.FindField('dehrAlteracao')) then
    begin
      if qyDados.FieldByName('dehrAlteracao').ReadOnly then
        qyDados.FieldByName('dehrAlteracao').ReadOnly     := False;

      qyDados.FieldByName('dehrAlteracao').AsString       := FormatDateTime('hh:mm', dthrAtual);
    end;
  end;
end;

procedure TDmERP.UsuarioConectado(const sConectado : String);
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  if qyUsuarioConexao.Active then
    qyUsuarioConexao.Close;

  qyUsuarioConexao.MacroByName('filtro').Clear;
  qyUsuarioConexao.MacroByName('filtro').Value := ' WHERE cdUsuario = ' + IntToStr(FTelaInicial.FcdUsuario) +
                                                  '   AND dtConexao = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dthrAtual));
  qyUsuarioConexao.Open();

  qyUsuarioConexao.Insert;
  qyUsuarioConexao.FieldByName('cdUsuario').AsInteger   := FTelaInicial.FcdUsuario;
  qyUsuarioConexao.FieldByName('nmComputador').AsString := RetornaNomeComputador;
  qyUsuarioConexao.FieldByName('deIp').AsString         := RetornaIpComputador;
  qyUsuarioConexao.FieldByName('dtConexao').AsDateTime  := Trunc(dthrAtual);
  qyUsuarioConexao.FieldByName('hrConexao').AsInteger   := HoraParaMinutos(dthrAtual);
  qyUsuarioConexao.FieldByName('flconectado').AsString  := sConectado;
  qyUsuarioConexao.Post;

  qyUsuarioConexao.Close;
  qyUsuarioConexao.MacroByName('filtro').Clear;
end;

function TDmERP.RegistrarPonto : Boolean;
var
  dthrAtual : TDateTime;
  sFlEntSai : String;
begin
  Result := FTelaInicial.FcdColaborador > 0;

  if not Result then
    Aviso('Usuário não vinculado a um colaborador.')
  else
  begin
    if qyColabPonto.Active then
      qyColabPonto.Close;

    dthrAtual := DataHoraAtual(fdConnERP);

    qyColabPonto.MacroByName('filtro').Value := ' WHERE cdColaborador = ' + IntToStr(FTelaInicial.FcdColaborador) +
                                                '   AND dtPonto = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dthrAtual));
    qyColabPonto.Open();
    qyColabPonto.Last;

    if qyColabPonto.FieldByName('flEntSai').AsString = 'E' then
      sFlEntSai := 'S'
    else
      sFlEntSai := 'E';

    qyColabPonto.Insert;
    qyColabPonto.FieldByName('cdColaborador').AsInteger := FTelaInicial.FcdColaborador;
    qyColabPonto.FieldByName('dtPonto').AsDateTime      := Trunc(dthrAtual);
    qyColabPonto.FieldByName('hrPonto').AsString        := FormatDateTime('hh:nn:ss', dthrAtual);
    qyColabPonto.FieldByName('flEntSai').AsString       := sFlEntSai;
    qyColabPonto.Post;
  end;
end;

function TDmERP.TelaValida : String;
begin
  Result := '';

  if (Trim(qyTela.FieldByName('deTituloTela').AsString) = '') then
    AdicionaLinha(Result, ' - Item menu tela deve ser informado');

  if (Trim(qyTela.FieldByName('deTituloPai').AsString) = '') then
    AdicionaLinha(Result, ' - Item menu pai deve ser informado');

  if (Trim(qyTela.FieldByName('nmForm').AsString) = '') then
    AdicionaLinha(Result, ' - Classe do form deve ser informada');
end;

procedure TDmERP.GravarTela;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := TelaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyTela.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyTela);
      qyTela.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Tela inserida com sucesso.')
      else
        Informacao('Tela alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirTela;
begin
  if qyTela.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyTela.Delete;
      Informacao('Tela excluída com sucesso.');
    end;
  end;
end;

function TDmERP.UsuarioValido : String;
var
  stDados : TStringList;
  sAux    : String;
begin
  Result := '';

  if (Trim(qyUsuario.FieldByName('deLogin').AsString) = '') then
    AdicionaLinha(Result, ' - Login deve ser informado')
  else
  begin
    sAux := '';

    if qyUsuario.State <> dsInsert then
      sAux := ' AND cdUsuario <> ' + qyUsuario.FieldByName('cdUsuario').AsString;

    stDados := TStringList.Create;

    ExecuteSimplesSql(fdConnERP,
                      'SELECT cdUsuario ' +
                      '  FROM erp.usuario ' +
                      ' WHERE deLogin = ' + QuotedStr(qyUsuario.FieldByName('deLogin').AsString) +
                      '   AND flAtivo = ''S'' ' +
                      sAux,
                      'cdUsuario',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      AdicionaLinha(Result, ' - Login já existe vinculado a outro cadastro');

    if Assigned(stDados) then
      FreeAndNil(stDados);
  end;

  if (Trim(qyUsuario.FieldByName('deSenha').AsString) = '') then
    AdicionaLinha(Result, ' - Senha deve ser informada');

  if (qyUsuario.FieldByName('cdSetor').IsNull) then
    AdicionaLinha(Result, ' - Setor deve ser informado');
end;

procedure TDmERP.GravarUsuario;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := UsuarioValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyUsuario.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyUsuario);
      qyUsuario.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Usuário inserido com sucesso.')
      else
        Informacao('Usuário alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirUsuario;
begin
  if qyUsuario.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      if not qyUsuarioTela.Active then
        qyUsuarioTela.Open();

      qyUsuarioTela.First;

      while not qyUsuarioTela.Eof do
        qyUsuarioTela.Delete;

      qyUsuario.Delete;
      Informacao('Usuário excluído com sucesso.');
    end;
  end;
end;

function TDmERP.EmpresaValida : String;
begin
  Result := '';

  if (Trim(qyEmpresa.FieldByName('deCnpj').AsString) = '') then
    AdicionaLinha(Result, ' - CNPJ deve ser informado');

  if (Trim(qyEmpresa.FieldByName('deRazaoSocial').AsString) = '') then
    AdicionaLinha(Result, ' - Razão social deve ser informada');

  if (qyEmpresa.FieldByName('cdCidade').AsInteger > 0) and
     (Trim(qyEmpresa.FieldByName('nuInscEst').AsString) <> '') then
  begin
    if qyCidadePesq.Active then
      qyCidadePesq.Close;

    qyCidadePesq.MacroByName('filtro').Value := ' WHERE cdCidade=' + qyEmpresa.FieldByName('cdCidade').AsString;
    qyCidadePesq.Open();

    if not qyCidadePesq.IsEmpty then
    begin
      if not ValidaInscEst(qyEmpresa.FieldByName('nuInscEst').AsString,
                           qyCidadePesq.FieldByName('sgEstado').AsString
                          ) then
        AdicionaLinha(Result, ' - Inscrição estadual inválida para o estado ' + qyEmpresa.FieldByName('sgEstado').AsString);
    end;
  end;
end;

procedure TDmERP.GravarEmpresa;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := EmpresaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyEmpresa.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyEmpresa);
      qyEmpresa.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Empresa inserida com sucesso.')
      else
        Informacao('Empresa alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirEmpresa;
begin
  if qyEmpresa.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyEmpresa.Delete;
      Informacao('Empresa excluída com sucesso.');
    end;
  end;
end;

function TDmERP.SetorValido : String;
var
  stDados : TStringList;
begin
  Result := '';

  if (Trim(qySetor.FieldByName('deSetor').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição do setor');

  if (qySetor.FieldByName('cdSetorAnterior').AsInteger > 0) and
     (qySetor.FieldByName('cdSetor').AsInteger > 0) then
  begin
    if (qySetor.FieldByName('cdSetorAnterior').AsInteger = qySetor.FieldByName('cdSetor').AsInteger) then
      AdicionaLinha(Result, ' - Setor anterior não pode ser o mesmo que o principal');

    if qySetor.State = dsEdit then
    begin
      stDados := TStringList.Create;

      ExecuteSimplesSql(fdConnERP,
                        'SELECT deSetor ' +
                        '  FROM erp.setor ' +
                        ' WHERE cdSetorAnterior = ' + qySetor.FieldByName('cdSetorAnterior').AsString +
                        '   AND cdSetor <> ' + qySetor.FieldByName('cdSetor').AsString,
                        'deSetor',
                        stDados
                       );

      if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
        AdicionaLinha(Result, ' - Setor anterior já atribuído ao setor "' + Trim(stDados.Strings[0]) + '"');

      if Assigned(stDados) then
        FreeAndNil(stDados);
    end;
  end;
end;

procedure TDmERP.GravarSetor;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := SetorValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qySetor.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qySetor);
      qySetor.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Setor inserido com sucesso.')
      else
        Informacao('Setor alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirSetor;
begin
  if qySetor.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qySetor.Delete;
      Informacao('Setor excluído com sucesso.');
    end;
  end;
end;

function TDmERP.VeiculoValido : String;
var
  stDados : TStringList;
begin
  Result := '';

  if (qyVeiculo.FieldByName('cdVeiculoTipo').IsNull) then
    AdicionaLinha(Result, ' - Tipo de veículo deve ser informado');

  if (Trim(qyVeiculo.FieldByName('dePlaca').AsString) = '') then
    AdicionaLinha(Result, ' - Placa deve ser informada')
  else
  begin
    stDados := TStringList.Create;

    if qyVeiculo.State = dsInsert then
    begin
      ExecuteSimplesSql(fdConnERP,
                        'SELECT cdVeiculo ' +
                        '  FROM erp.veiculo ' +
                        ' WHERE dePlaca = ' + QuotedStr(UpperCase(Trim(qyVeiculo.FieldByName('dePlaca').AsString))),
                        'cdVeiculo',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        AdicionaLinha(Result, ' - Placa informada já existe para outro cadastro');
    end
    else
    begin
      ExecuteSimplesSql(fdConnERP,
                        'SELECT cdVeiculo ' +
                        '  FROM erp.veiculo ' +
                        ' WHERE dePlaca = ' + QuotedStr(UpperCase(Trim(qyVeiculo.FieldByName('dePlaca').AsString))) +
                        '   AND cdVeiculo <> ' + qyVeiculo.FieldByName('cdVeiculo').AsString,
                        'cdVeiculo',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        AdicionaLinha(Result, ' - Placa informada já existe para outro cadastro');
    end;

    if Assigned(stDados) then
      FreeAndNil(stDados);
  end;
end;

procedure TDmERP.GravarVeiculo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := VeiculoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyVeiculo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyVeiculo);
      qyVeiculo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Veículo inserido com sucesso.')
      else
        Informacao('Veículo alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirVeiculo;
begin
  if qyVeiculo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyVeiculo.Delete;
      Informacao('Veículo excluído com sucesso.');
    end;
  end;
end;

function TDmERP.MotoristaValido : String;
begin
  Result := '';

  if (Trim(qyMotorista.FieldByName('nmMotorista').AsString) = '') then
    AdicionaLinha(Result, ' - Nome do motorista deve ser informado');
end;

procedure TDmERP.GravarMotorista;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := MotoristaValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyMotorista.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyMotorista);
      qyMotorista.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Motorista inserido com sucesso.')
      else
        Informacao('Motorista alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirMotorista;
begin
  if qyMotorista.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyMotorista.Delete;
      Informacao('Motorista excluído com sucesso.');
    end;
  end;
end;

procedure TDmERP.qyUsuarioChatBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyUsuarioChat, 'usuarioChat', 'cdUsuarioChat', qyUsuarioChat.FieldByName('cdUsuarioChat').AsInteger);
end;

procedure TDmERP.qyUsuarioConexaoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyUsuarioConexao, 'usuarioConexao', 'cdUsuarioConexao', qyUsuarioConexao.FieldByName('cdUsuarioConexao').AsInteger);
end;

function TDmERP.FornecedorTipoValido : String;
begin
  Result := '';

  if (Trim(qyFornecedorTipo.FieldByName('deFornecedorTipo').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição do tipo de fornecedor deve ser informada');
end;

procedure TDmERP.GravarFornecedorTipo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := FornecedorTipoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyFornecedorTipo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyFornecedorTipo);
      qyFornecedorTipo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Tipo de Fornecedor inserido com sucesso.')
      else
        Informacao('Tipo de Fornecedor alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirFornecedorTipo;
begin
  if qyFornecedorTipo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyFornecedorTipo.Delete;
      Informacao('Tipo de Fornecedor excluído com sucesso.');
    end;
  end;
end;

function TDmERP.CentroCustoValido : String;
begin
  Result := '';

  if (Trim(qyCentroCusto.FieldByName('deCentroCusto').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição do centro de custo deve ser informada');
end;

procedure TDmERP.GravarCentroCusto;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := CentroCustoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyCentroCusto.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyCentroCusto);
      qyCentroCusto.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Centro de Custo inserido com sucesso.')
      else
        Informacao('Centro de Custo alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCentroCusto;
begin
  if qyCentroCusto.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyCentroCusto.Delete;
      Informacao('Centro de Custo excluído com sucesso.');
    end;
  end;
end;

function TDmERP.FornecedorValido : String;
begin
  Result := '';

  if (Trim(qyFornecedor.FieldByName('deCpfCnpj').AsString) <> '') and
     (not (ValidaCpfCnpj(qyFornecedor.FieldByName('deCpfCnpj').AsString))) then
  begin
    if (qyFornecedor.FieldByName('flFisJur').AsString = 'J') then
      AdicionaLinha(Result, ' - CNPJ inválido')
    else
      AdicionaLinha(Result, ' - CPF inválido');
  end;  

  if (qyFornecedor.FieldByName('flFisJur').AsString = 'J') then
  begin
    if (Trim(qyFornecedor.FieldByName('deCpfCnpj').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, o CNPJ deve ser informado');

    if (Trim(qyFornecedor.FieldByName('deRazaoSocial').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, a razão social deve ser informada');
  end;

  if (qyFornecedor.FieldByName('cdCidade').AsInteger > 0) and
     (Trim(qyFornecedor.FieldByName('nuInscEst').AsString) <> '') then
  begin
    if qyCidadePesq.Active then
      qyCidadePesq.Close;

    qyCidadePesq.MacroByName('filtro').Value := ' WHERE cdCidade=' + qyFornecedor.FieldByName('cdCidade').AsString;
    qyCidadePesq.Open();

    if not qyCidadePesq.IsEmpty then
    begin
      if not ValidaInscEst(qyFornecedor.FieldByName('nuInscEst').AsString,
                           qyCidadePesq.FieldByName('sgEstado').AsString
                          ) then
        AdicionaLinha(Result, ' - Inscrição estadual inválida para o estado ' + qyCidade.FieldByName('sgEstado').AsString);
    end;
  end;
end;

procedure TDmERP.GravarFornecedor;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := FornecedorValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyFornecedor.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyFornecedor);
      qyFornecedor.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Fornecedor inserido com sucesso.')
      else
        Informacao('Fornecedor alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirFornecedor;
begin
  if qyFornecedor.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyFornecedor.Delete;
      Informacao('Fornecedor excluído com sucesso.');
    end;
  end;
end;

function TDmERP.ClienteValido : String;
begin
  Result := '';

  if (Trim(qyCliente.FieldByName('deCpfCnpj').AsString) <> '') and
     (not (ValidaCpfCnpj(qyCliente.FieldByName('deCpfCnpj').AsString))) then
  begin
    if (qyCliente.FieldByName('flFisJur').AsString = 'J') then
      AdicionaLinha(Result, ' - CNPJ inválido')
    else
      AdicionaLinha(Result, ' - CPF inválido');
  end;

  if (qyCliente.FieldByName('flFisJur').AsString = 'J') then
  begin
    if (Trim(qyCliente.FieldByName('deCpfCnpj').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, o CNPJ deve ser informado');

    if (Trim(qyCliente.FieldByName('deRazaoSocial').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, a razão social deve ser informada');
  end;

  if (qyCliente.FieldByName('cdCidade').AsInteger > 0) and
     (Trim(qyCliente.FieldByName('nuInscEst').AsString) <> '') then
  begin
    if qyCidadePesq.Active then
      qyCidadePesq.Close;

    qyCidadePesq.MacroByName('filtro').Value := ' WHERE cdCidade=' + qyCliente.FieldByName('cdCidade').AsString;
    qyCidadePesq.Open();

    if not qyCidadePesq.IsEmpty then
    begin
      if not ValidaInscEst(qyCliente.FieldByName('nuInscEst').AsString,
                           qyCidadePesq.FieldByName('sgEstado').AsString
                          ) then
        AdicionaLinha(Result, ' - Inscrição estadual inválida para o estado ' + qyCidade.FieldByName('sgEstado').AsString);
    end;
  end;
end;

procedure TDmERP.GravarCliente;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ClienteValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyCliente.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyCliente);
      qyCliente.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Cliente inserido com sucesso.')
      else
        Informacao('Cliente alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCliente;
begin
  if qyCliente.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyCliente.Delete;
      Informacao('Cliente excluído com sucesso.');
    end;
  end;
end;

function TDmERP.TransportadoraValida : String;
begin
  Result := '';

  if (Trim(qyTransportadora.FieldByName('deCpfCnpj').AsString) <> '') and
     (not (ValidaCpfCnpj(qyTransportadora.FieldByName('deCpfCnpj').AsString))) then
  begin
    if (qyTransportadora.FieldByName('flFisJur').AsString = 'J') then
      AdicionaLinha(Result, ' - CNPJ inválido')
    else
      AdicionaLinha(Result, ' - CPF inválido');
  end;

  if (qyTransportadora.FieldByName('flFisJur').AsString = 'J') then
  begin
    if (Trim(qyTransportadora.FieldByName('deCpfCnpj').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, o CNPJ deve ser informado');

    if (Trim(qyTransportadora.FieldByName('deRazaoSocial').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, a razão social deve ser informada');
  end;

  if (qyTransportadora.FieldByName('cdCidade').AsInteger > 0) and
     (Trim(qyTransportadora.FieldByName('nuInscEst').AsString) <> '') then
  begin
    if qyCidadePesq.Active then
      qyCidadePesq.Close;

    qyCidadePesq.MacroByName('filtro').Value := ' WHERE cdCidade=' + qyTransportadora.FieldByName('cdCidade').AsString;
    qyCidadePesq.Open();

    if not qyCidadePesq.IsEmpty then
    begin
      if not ValidaInscEst(qyTransportadora.FieldByName('nuInscEst').AsString,
                           qyCidadePesq.FieldByName('sgEstado').AsString
                          ) then
        AdicionaLinha(Result, ' - Inscrição estadual inválida para o estado ' + qyCidade.FieldByName('sgEstado').AsString);
    end;
  end;
end;

procedure TDmERP.GravarTransportadora;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := TransportadoraValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyTransportadora.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyTransportadora);
      qyTransportadora.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Transportadora inserida com sucesso.')
      else
        Informacao('Transportadora alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirTransportadora;
begin
  if qyTransportadora.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyTransportadora.Delete;
      Informacao('Transportadora excluída com sucesso.');
    end;
  end;
end;

procedure TDmERP.qyAgenciaAfterScroll(DataSet: TDataSet);
begin
  qyAgencia.FieldByName('deCnpj').EditMask  := '99.999.999/9999-99;0;_';
  qyAgencia.FieldByName('nuFone1').EditMask := '(99) 9999-99999;0;_';
  qyAgencia.FieldByName('nuFone2').EditMask := '(99) 9999-99999;0;_';
  qyAgencia.FieldByName('nuFax').EditMask   := '(99) 9999-99999;0;_';
  qyAgencia.FieldByName('nuCep').EditMask   := '99999-999;0;_';
end;

procedure TDmERP.qyAgenciaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyAgencia, 'agencia', 'cdAgencia', qyAgencia.FieldByName('cdAgencia').AsInteger);
end;

procedure TDmERP.qyAvisoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyAviso, 'aviso', 'cdAviso', qyAviso.FieldByName('cdAviso').AsInteger);
end;

procedure TDmERP.qyBorderoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyBordero, 'bordero', 'cdBordero', qyBordero.FieldByName('cdBordero').AsInteger);
end;

procedure TDmERP.qyCargoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyCargo, 'cargo', 'cdCargo', qyCargo.FieldByName('cdCargo').AsInteger);
end;

procedure TDmERP.qyCidadeBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyCidade, 'cidade', 'cdCidade', qyCidade.FieldByName('cdCidade').AsInteger);
end;

procedure TDmERP.qyClasFisTaxaIbptBeforeOpen(DataSet: TDataSet);
begin
  qyClasFisTaxaIbpt.ParamByName('cdClassifFiscal').AsInteger := qyClassifFiscal.FieldByName('cdClassifFiscal').AsInteger;
end;

procedure TDmERP.qyClassifFiscalAfterScroll(DataSet: TDataSet);
begin
  if qyClasFisTaxaIbpt.Active then
    qyClasFisTaxaIbpt.Close;

  qyClasFisTaxaIbpt.Open();
end;

procedure TDmERP.qyClassifFiscalBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyClassifFiscal, 'classifFiscal', 'cdClassifFiscal', qyClassifFiscal.FieldByName('cdClassifFiscal').AsInteger);
end;

procedure TDmERP.qyClassifFiscalNewRecord(DataSet: TDataSet);
begin
  qyClassifFiscal.FieldByName('flCalculaStCnae').AsString        := 'N';
  qyClassifFiscal.FieldByName('flAbatePisCofins').AsString       := 'N';
  qyClassifFiscal.FieldByName('flImprimeNota').AsString          := 'N';
  qyClassifFiscal.FieldByName('flUtilizaDnf').AsString           := 'N';
  qyClassifFiscal.FieldByName('flIcmsReducaoPf').AsString        := 'N';
  qyClassifFiscal.FieldByName('flIcmsReducaoIndustria').AsString := 'N';
  qyClassifFiscal.FieldByName('flEntraDesoneracao').AsString     := 'N';
  qyClassifFiscal.FieldByName('flUtilizaIbpt').AsString          := 'N';
end;

procedure TDmERP.qyClienteAfterScroll(DataSet: TDataSet);
begin
  if qyCliente.FieldByName('flFisJur').AsString = 'J' then
    qyCliente.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    qyCliente.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';

  qyCliente.FieldByName('nuFone1').EditMask   := '(99) 9999-99999;0;_';
  qyCliente.FieldByName('nuFone2').EditMask   := '(99) 9999-99999;0;_';
  qyCliente.FieldByName('nuCelular').EditMask := '(99) 99999-9999;0;_';
  qyCliente.FieldByName('nuFax').EditMask     := '(99) 9999-99999;0;_';
  qyCliente.FieldByName('nuCep').EditMask     := '99999-999;0;_';
end;

procedure TDmERP.qyClienteBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyCliente, 'cliente', 'cdCliente', qyCliente.FieldByName('cdCliente').AsInteger);
end;

procedure TDmERP.qyClienteNewRecord(DataSet: TDataSet);
begin
  qyCliente.FieldByName('flAtivo').AsString         := 'S';
  qyCliente.FieldByName('flIsentoInscEst').AsString := 'S';
end;

procedure TDmERP.qyCobrancaAfterScroll(DataSet: TDataSet);
begin
  if qyCobrancaContato.Active then
    qyCobrancaContato.Close;

  qyCobrancaContato.Open();
end;

procedure TDmERP.qyCobrancaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyCobranca, 'cobranca', 'cdCobranca', qyCobranca.FieldByName('cdCobranca').AsInteger);
end;

procedure TDmERP.qyCobrancaContatoAfterScroll(DataSet: TDataSet);
begin
  qyCobrancaContato.FieldByName('dehrRetorno').EditMask := '99:99;0;_';
end;

procedure TDmERP.qyCobrancaContatoBeforeOpen(DataSet: TDataSet);
begin
  qyCobrancaContato.ParamByName('cdCobranca').AsInteger := qyCobranca.FieldByName('cdCobranca').AsInteger;
end;

procedure TDmERP.qyCobrancaContatoBeforePost(DataSet: TDataSet);
var
  stDados : TStringList;
begin
  if qyCobrancaContato.State = dsInsert then
  begin
    qyCobrancaContato.FieldByName('cdCobranca').AsInteger := qyCobranca.FieldByName('cdCobranca').AsInteger;

    stDados := TStringList.Create;

    try
      ExecuteSimplesSql(fdConnERP,
                        'SELECT MAX(cdCobrancaContato) AS ultCod ' +
                        '  FROM erp.cobrancaContato ' +
                        ' WHERE cdCobranca = ' + qyCobranca.FieldByName('cdCobranca').AsString,
                        'ultCod',
                        stDados
                       );
      qyCobrancaContato.FieldByName('cdCobrancaContato').AsInteger := StrToIntDef(stDados.Strings[0], 0) + 1
    finally
      if Assigned(stDados) then
        FreeAndNil(stDados);
    end;
  end;

  if qyCobrancaContato.FieldByName('dehrRetorno').AsString <> '' then
  begin
    qyCobrancaContato.FieldByName('hrRetorno').AsInteger := StrToIntDef(Copy(qyCobrancaContato.FieldByName('dehrRetorno').AsString, 3, 2), 0) +
                                                            (StrToIntDef(Copy(qyCobrancaContato.FieldByName('dehrRetorno').AsString, 1, 2), 0) * 60);
    qyCobrancaContato.FieldByName('dehrRetornoGrid').AsString := Copy(qyCobrancaContato.FieldByName('dehrRetorno').AsString, 1, 2) +
                                                                 ':' +
                                                                 Copy(qyCobrancaContato.FieldByName('dehrRetorno').AsString, 3, 2);
  end
  else
    qyCobrancaContato.FieldByName('hrRetorno').Clear;
end;

procedure TDmERP.qyCobrancaContatoNewRecord(DataSet: TDataSet);
begin
  qyCobrancaContato.FieldByName('dtContato').AsDateTime := Trunc(DataHoraAtual(fdConnERP));
  qyCobrancaContato.FieldByName('flRetornar').AsString  := 'S';
end;

procedure TDmERP.qyCobrancaNewRecord(DataSet: TDataSet);
begin
  qyCobranca.FieldByName('cdSituacao').AsInteger := 1;
end;

procedure TDmERP.qyCobrancaTipoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyCobrancaTipo, 'cobrancaTipo', 'cdCobrancaTipo', qyCobrancaTipo.FieldByName('cdCobrancaTipo').AsInteger);
end;

procedure TDmERP.qyCobrancaTipoNewRecord(DataSet: TDataSet);
begin
  qyCobrancaTipo.FieldByName('flContabilidade').AsString     := 'N';
  qyCobrancaTipo.FieldByName('flFluxoCaixa').AsString        := 'N';
  qyCobrancaTipo.FieldByName('flEntraConcialiacao').AsString := 'N';
  qyCobrancaTipo.FieldByName('nuDiasAcrescimo').AsInteger    := 0;
end;

procedure TDmERP.qyColabDependentesBeforePost(DataSet: TDataSet);
begin
  if qyColabDependentes.State = dsInsert then
  begin
    qyColabDependentes.FieldByName('cdColaborador').AsInteger := qyColaborador.FieldByName('cdColaborador').AsInteger;

    GerarCodigo(fdConnERP, qyColabDependentes,
                'colabDependentes',
                'cdColabDependentes',
                qyColabDependentes.FieldByName('cdColabDependentes').AsInteger,
                ' WHERE cdColaborador = ' + qyColaborador.FieldByName('cdColaborador').AsString
               );
  end;
end;

procedure TDmERP.qyColaboradorAfterPost(DataSet: TDataSet);
  procedure GravarHistorico(const qyDados : TFDQuery; const sNomeTabela, sNomeCampoChave, sNomeCampoData : String);
  var
    dthrHst,
    dthrAtual : TDateTime;
  begin
    if qyAuxiliar.Active then
      qyAuxiliar.Close;

    qyAuxiliar.SQL.Text := 'SELECT ' + sNomeCampoChave + ', ' + sNomeCampoData +
                           '  FROM erp.' + sNomeTabela +
                           ' WHERE cdColaborador = ' + qyColaborador.FieldByName('cdColaborador').AsString +
                           ' ORDER BY ' + sNomeCampoData + ' DESC, hrCadastro DESC';

    qyAuxiliar.Open();

    if (qyAuxiliar.IsEmpty) or
       (qyAuxiliar.FieldByName(sNomeCampoChave).Value <> qyColaborador.FieldByName(sNomeCampoChave).Value) then
    begin
      dthrAtual := DataHoraAtual(fdConnERP);

      dthrHst := dthrAtual;

      if (not qyAuxiliar.IsEmpty) then
        dthrHst := qyAuxiliar.FieldByName(sNomeCampoData).AsDateTime;

      if qyDados.Active then
        qyDados.Close;

      qyDados.MacroByName('filtro').Value := ' WHERE cdColaborador = ' + qyColaborador.FieldByName('cdColaborador').AsString +
                                             '   AND ' + sNomeCampoChave + ' = ' + AnsiReplaceStr(qyColaborador.FieldByName(sNomeCampoChave).AsString, ',', '.') +
                                             '   AND ' + sNomeCampoData + ' = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dthrHst));

      qyDados.Open();

      if not qyDados.IsEmpty then
        qyDados.Delete;

      qyDados.Insert;
      qyDados.FieldByName('cdColaborador').AsInteger     := qyColaborador.FieldByName('cdColaborador').AsInteger;
      qyDados.FieldByName(sNomeCampoChave).Value         := qyColaborador.FieldByName(sNomeCampoChave).Value;
      qyDados.FieldByName(sNomeCampoData).AsDateTime     := Trunc(dthrAtual);
      qyDados.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;
      qyDados.FieldByName('dtCadastro').AsDateTime       := Trunc(dthrAtual);
      qyDados.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dthrAtual);
      qyDados.Post;
    end;

    qyAuxiliar.Close;
  end;
begin
  if (qyColaborador.Active) and
     (not qyColaborador.IsEmpty) and
     (qyColaborador.FieldByName('cdColaborador').AsInteger > 0) then
  begin
    if (qyColaborador.FieldByName('cdColabSituacao').AsInteger > 0) then
      GravarHistorico(qyColabSituacaoHst, 'colabSituacaoHst', 'cdColabSituacao', 'dtSituacao');

    if (qyColaborador.FieldByName('cdSetor').AsInteger > 0) then
      GravarHistorico(qyColabSetorHst, 'colabSetorHst', 'cdSetor', 'dtHistorico');

    if (qyColaborador.FieldByName('cdEscala').AsInteger > 0) then
      GravarHistorico(qyColabEscalaHst, 'colabEscalaHst', 'cdEscala', 'dtHistorico');

    if (qyColaborador.FieldByName('cdCargo').AsInteger > 0) then
      GravarHistorico(qyColabCargoHst, 'colabCargoHst', 'cdCargo', 'dtHistorico');

    if (qyColaborador.FieldByName('vlSalario').AsCurrency > 0) then
      GravarHistorico(qyColabSalarioHst, 'colabSalarioHst', 'vlSalario', 'dtHistorico');
  end;
end;

procedure TDmERP.qyColaboradorAfterScroll(DataSet: TDataSet);
begin
  qyColaborador.FieldByName('deCpf').EditMask     := '999.999.999-99;0;_';
  qyColaborador.FieldByName('nuFone').EditMask    := '(99) 9999-99999;0;_';
  qyColaborador.FieldByName('nuCelular').EditMask := '(99) 99999-9999;0;_';
  qyColaborador.FieldByName('nuCep').EditMask     := '99999-999;0;_';

  if qyColabDependentes.Active then
    qyColabDependentes.Close;

  qyColabDependentes.MacroByName('filtro').Clear;

  qyColabDependentes.ParamByName('cdColaborador').AsInteger := qyColaborador.FieldByName('cdColaborador').AsInteger;
  qyColabDependentes.Open();
end;

procedure TDmERP.qyColaboradorBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyColaborador, 'colaborador', 'cdColaborador', qyColaborador.FieldByName('cdColaborador').AsInteger);
end;

procedure TDmERP.qyColaboradorNewRecord(DataSet: TDataSet);
begin
  qyColaborador.FieldByName('flEstudante').AsString             := 'N';
  qyColaborador.FieldByName('flUsaValeTransp').AsString         := 'N';
  qyColaborador.FieldByName('cdColabSituacao').AsInteger        := 1;
  qyColaborador.FieldByName('nuDiasContratoExp').AsInteger      := 0;
  qyColaborador.FieldByName('nuDiasContratoExpExtra').AsInteger := 0;
  qyColaborador.FieldByName('cdSalarioTipo').AsInteger          := 1;
  qyColaborador.FieldByName('vlSalario').AsCurrency             := 0;
  qyColaborador.FieldByName('vlValeTransp').AsCurrency          := 0;
  qyColaborador.FieldByName('vlPercAdicInsalub').AsCurrency     := 0;
  qyColaborador.FieldByName('vlPercAdicPeric').AsCurrency       := 0;
end;

procedure TDmERP.qyColabPontoBeforePost(DataSet: TDataSet);
begin
  GravarCamposAutomaticos(qyColabPonto);
end;

procedure TDmERP.qyContaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyConta, 'conta', 'cdConta', qyConta.FieldByName('cdConta').AsInteger);
end;

procedure TDmERP.qyDespesaTipoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyDespesaTipo, 'despesaTipo', 'cdDespesaTipo', qyDespesaTipo.FieldByName('cdDespesaTipo').AsInteger);
end;

procedure TDmERP.qyDocumentoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyDocumento, 'documento', 'cdDocumento', qyDocumento.FieldByName('cdDocumento').AsInteger);
end;

procedure TDmERP.qyDocumentoNewRecord(DataSet: TDataSet);
var
  dthrAtual : TDateTime;
  wDia,
  wMes,
  wAno      : Word;
begin
  dthrAtual := DataHoraAtual(fdConnERP);
  dthrAtual := Trunc(dthrAtual);
  DecodeDate(dthrAtual, wAno, wMes, wDia);

  qyDocumento.FieldByName('dtCompetencia').AsDateTime := EncodeDate(wAno, wMes, 1);
  qyDocumento.FieldByName('flContabiliza').AsString   := 'N';
end;

procedure TDmERP.qyDocumentoTipoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyDocumentoTipo, 'documentoTipo', 'cdDocumentoTipo', qyDocumentoTipo.FieldByName('cdDocumentoTipo').AsInteger);
end;

procedure TDmERP.qyEmpresaAfterScroll(DataSet: TDataSet);
begin
  qyEmpresa.FieldByName('deCnpj').EditMask    := '99.999.999/9999-99;0;_';
  qyEmpresa.FieldByName('nuFone1').EditMask   := '(99) 9999-99999;0;_';
  qyEmpresa.FieldByName('nuFone2').EditMask   := '(99) 9999-99999;0;_';
  qyEmpresa.FieldByName('nuCelular').EditMask := '(99) 99999-9999;0;_';
  qyEmpresa.FieldByName('nuFax').EditMask     := '(99) 9999-99999;0;_';
  qyEmpresa.FieldByName('nuCep').EditMask     := '99999-999;0;_';
end;

procedure TDmERP.qyEmpresaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyEmpresa, 'empresa', 'cdEmpresa', qyEmpresa.FieldByName('cdEmpresa').AsInteger);
end;

procedure TDmERP.qyEscalaAfterScroll(DataSet: TDataSet);
begin
  if qyEscalaItem.Active then
    qyEscalaItem.Close;

  qyEscalaItem.MacroByName('filtro').Clear;

  qyEscalaItem.ParamByName('cdEscala').AsInteger := qyEscala.FieldByName('cdEscala').AsInteger;
  qyEscalaItem.Open();
end;

procedure TDmERP.qyEscalaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyEscala, 'escala', 'cdEscala', qyEscala.FieldByName('cdEscala').AsInteger, '');
end;

procedure TDmERP.qyEscalaItemBeforePost(DataSet: TDataSet);
begin
  if qyEscalaItem.State = dsInsert then
  begin
    qyEscalaItem.FieldByName('cdEscala').AsInteger := qyEscala.FieldByName('cdEscala').AsInteger;

    GerarCodigo(fdConnERP, qyEscalaItem,
                'escalaItem',
                'cdEscalaItem',
                qyEscalaItem.FieldByName('cdEscalaItem').AsInteger,
                ' WHERE cdEscala = ' + qyEscala.FieldByName('cdEscala').AsString
               );
  end;
end;

procedure TDmERP.qyFatDiarioBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyFatDiario, 'fatDiario', 'cdFatDiario', qyFatDiario.FieldByName('cdFatDiario').AsInteger);
end;

procedure TDmERP.qyFatDiarioNewRecord(DataSet: TDataSet);
var
  dtAtual : TDateTime;
begin
  dtAtual := DataHoraAtual(fdConnERP);
  qyFatDiario.FieldByName('dtMovimento').AsDateTime := Trunc(dtAtual);
end;

procedure TDmERP.qyFornecedorAfterScroll(DataSet: TDataSet);
begin
  if qyFornecedor.FieldByName('flFisJur').AsString = 'J' then
    qyFornecedor.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    qyFornecedor.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';

  qyFornecedor.FieldByName('nuFone1').EditMask   := '(99) 9999-99999;0;_';
  qyFornecedor.FieldByName('nuFone2').EditMask   := '(99) 9999-99999;0;_';
  qyFornecedor.FieldByName('nuCelular').EditMask := '(99) 99999-9999;0;_';
  qyFornecedor.FieldByName('nuFax').EditMask     := '(99) 9999-99999;0;_';
  qyFornecedor.FieldByName('nuCep').EditMask     := '99999-999;0;_';
end;

procedure TDmERP.qyFornecedorBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyFornecedor, 'fornecedor', 'cdFornecedor', qyFornecedor.FieldByName('cdFornecedor').AsInteger);
end;

procedure TDmERP.qyFornecedorNewRecord(DataSet: TDataSet);
begin
  qyFornecedor.FieldByName('flAtivo').AsString         := 'S';
  qyFornecedor.FieldByName('flIsentoInscEst').AsString := 'S';
end;

procedure TDmERP.qyFornecedorTipoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyFornecedorTipo, 'fornecedorTipo', 'cdFornecedorTipo', qyFornecedorTipo.FieldByName('cdFornecedorTipo').AsInteger);
end;

procedure TDmERP.qyIntComCargaAfterScroll(DataSet: TDataSet);
begin
  if qyIntComCargaAlerta.Active then
    qyIntComCargaAlerta.Close;

  qyIntComCargaAlerta.MacroByName('filtro').Clear;

  qyIntComCargaAlerta.ParamByName('cdCarga').AsInteger := qyIntComCarga.FieldByName('cdCarga').AsInteger;
  qyIntComCargaAlerta.Open();
end;

procedure TDmERP.qyIntComCargaAlertaBeforePost(DataSet: TDataSet);
begin
  if qyIntComCargaAlerta.State = dsInsert then
  begin
    qyIntComCargaAlerta.FieldByName('cdCarga').AsInteger := qyIntComCarga.FieldByName('cdCarga').AsInteger;

    GerarCodigo(fdConnERP, qyIntComCargaAlerta,
                'intComCargaAlerta',
                'cdCargaAlerta',
                qyIntComCargaAlerta.FieldByName('cdCargaAlerta').AsInteger,
                ' WHERE cdCarga = ' + qyIntComCarga.FieldByName('cdCarga').AsString
               );
  end;
end;

procedure TDmERP.qyIntComCargaNewRecord(DataSet: TDataSet);
begin
  qyIntComCarga.FieldByName('cdSituacao').AsInteger        := 1;
  qyIntComCarga.FieldByName('cdPrioridade').AsInteger      := 1;
  qyIntComCarga.FieldByName('flSetorLixa').AsString        := 'N';
  qyIntComCarga.FieldByName('flSetorFaturamento').AsString := 'N';
  qyIntComCarga.FieldByName('flSetorExpedicao').AsString   := 'N';
end;

procedure TDmERP.qyIntComCotaFinBeforePost(DataSet: TDataSet);
begin
  GravarCamposAutomaticos(qyIntComCotaFin);
end;

procedure TDmERP.qyIntComItemPedImpressoBeforePost(DataSet: TDataSet);
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(fdConnERP);

  if qyIntComItemPedImpresso.State = dsInsert then
  begin
    qyIntComItemPedImpresso.FieldByName('flEnvProducao').AsString       := 'N';
    qyIntComItemPedImpresso.FieldByName('cdUsuarioImpressao').AsInteger := FTelaInicial.FcdUsuario;
    qyIntComItemPedImpresso.FieldByName('dtCadastro').AsDateTime        := Trunc(dthrAtual);
    qyIntComItemPedImpresso.FieldByName('hrCadastro').AsInteger         := HoraParaMinutos(dthrAtual);
  end;
end;

procedure TDmERP.qyIntComItensPedAntigosBeforeOpen(DataSet: TDataSet);
begin
  qyIntComItensPedAntigos.ParamByName('cdPedido').AsInteger := qyIntComPedidosAntigos.FieldByName('cdPedido').AsInteger;
end;

procedure TDmERP.qyIntComPedidosAntigosAfterScroll(DataSet: TDataSet);
begin
  if qyIntComItensPedAntigos.Active then
    qyIntComItensPedAntigos.Close;

  qyIntComItensPedAntigos.Open();
end;

procedure TDmERP.qyIntSupItensCfgPadBeforePost(DataSet: TDataSet);
begin
  GravarCamposAutomaticos(qyIntSupItensCfgPad);
end;

procedure TDmERP.qyIntSupItensCfgPaddeadornoValidate(Sender: TField);
begin
  GravarCamposItensVarItens(19, Sender.AsString, 'cdAdornoRecNum', 'cdAdorno');
end;

procedure TDmERP.qyIntSupItensCfgPaddechavetaValidate(Sender: TField);
begin
  GravarCamposItensVarItens(20, Sender.AsString, 'cdChavetaRecNum', 'cdChaveta');
end;

procedure TDmERP.qyIntSupItensCfgPaddeforracaoValidate(Sender: TField);
begin
  GravarCamposItensVarItens(25, Sender.AsString, 'cdForracaoRecNum', 'cdForracao');
end;

procedure TDmERP.qyIntSupItensCfgPaddetipoalcaValidate(Sender: TField);
begin
  GravarCamposItensVarItens(15, Sender.AsString, 'cdTipoAlcaRecNum', 'cdTipoAlca');
end;

procedure TDmERP.qyIntSupItensCfgPadflcobrarcorGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flCobrarCor') then
    Text := '';
end;

procedure TDmERP.qyItemFamiliaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyItemFamilia, 'itemFamilia', 'cdItemFamilia', qyItemFamilia.FieldByName('cdItemFamilia').AsInteger);
end;

procedure TDmERP.qyItemGrupoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyItemGrupo, 'itemGrupo', 'cdItemGrupo', qyItemGrupo.FieldByName('cdItemGrupo').AsInteger);
end;

procedure TDmERP.qyItemNewRecord(DataSet: TDataSet);
begin
  qyItem.FieldByName('flAtivo').AsString       := 'S';
  qyItem.FieldByName('flItemRevenda').AsString := 'N';
end;

procedure TDmERP.qyIntIndBaixaProducaoBeforePost(DataSet: TDataSet);
begin
  GravarCamposAutomaticos(DmERP.qyIntIndBaixaProducao);
end;

procedure TDmERP.qyIntIndItemRelacionadoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyIntIndItemRelacionado, 'intIndItemRelacionado', 'cdItemRelacionado', qyIntIndItemRelacionado.FieldByName('cdItemRelacionado').AsInteger);
end;

procedure TDmERP.qyItemVinculoVariavelAfterOpen(DataSet: TDataSet);
begin
  FscdItemVinculo := qyItemVinculoVariavel.FieldByName('cdItem').AsString;
end;

procedure TDmERP.qyItemVinculoVariavelAfterPost(DataSet: TDataSet);
begin
  FscdItemVinculo := qyItemVinculoVariavel.FieldByName('cdItem').AsString;
end;

procedure TDmERP.qyItemVinculoVariavelBeforePost(DataSet: TDataSet);
var
  strValidacao : String;
begin
  if (qyItemVinculoVariavel.State = dsInsert) and (Trim(FscdItemVinculo) <> '') then
    qyItemVinculoVariavel.FieldByName('cdItem').AsString := FscdItemVinculo;

  strValidacao := ItemVinculoVariavelValido;

  if Trim(strValidacao) <> '' then
  begin
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao);
    qyItemVinculoVariavel.Cancel;
  end;
end;

procedure TDmERP.qyItemVinculoVariavelcdvariavelitempadraoValidate(
  Sender: TField);
var
  stDados : TStringList;
begin
  if (qyItemVinculoVariavel.Active) and
     (not qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').IsNull) and
     (qyItemVinculoVariavel.State in dsEditModes) then
  begin
    if (qyItemVinculoVariavel.FieldByName('cdVariavel').IsNull) then
      Aviso('Informe a variável antes.')
    else
    begin
      stDados := TStringList.Create;

      ExecuteSimplesSql(fdConnERP,
                        'SELECT deValor ' +
                        '  FROM erp.variavelItens ' +
                        ' WHERE cdVariavel = ' + qyItemVinculoVariavel.FieldByName('cdVariavel').AsString +
                        '   AND cdVariavelItem = ' + qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').AsString,
                        'deValor',
                        stDados
                       );

      if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
        qyItemVinculoVariavel.FieldByName('deVariavelItemPadrao').AsString := Trim(stDados.Strings[0])
      else
      begin
        Aviso('Valor inválido.');
        qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').Clear;
        qyItemVinculoVariavel.FieldByName('deVariavelItemPadrao').Clear;
      end;

      if Assigned(stDados) then
        FreeAndNil(stDados);
    end;
  end;
end;

procedure TDmERP.qyItemVinculoVariavelcdvariavelValidate(Sender: TField);
var
  stDados : TStringList;
begin
  if (qyItemVinculoVariavel.Active) and
     (not qyItemVinculoVariavel.FieldByName('cdVariavel').IsNull) and
     (qyItemVinculoVariavel.State in dsEditModes) then
  begin
    qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').Clear;
    qyItemVinculoVariavel.FieldByName('deVariavelItemPadrao').Clear;

    stDados := TStringList.Create;

    ExecuteSimplesSql(fdConnERP,
                      'SELECT deVariavel ' +
                      '  FROM erp.variavel ' +
                      ' WHERE cdVariavel = ' + qyItemVinculoVariavel.FieldByName('cdVariavel').AsString,
                      'deVariavel',
                      stDados
                     );

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
      qyItemVinculoVariavel.FieldByName('deVariavel').AsString := Trim(stDados.Strings[0])
    else
    begin
      Aviso('Valor inválido.');
      qyItemVinculoVariavel.FieldByName('cdVariavel').Clear;
      qyItemVinculoVariavel.FieldByName('deVariavel').Clear;
    end;

    if Assigned(stDados) then
      FreeAndNil(stDados);
  end;
end;

procedure TDmERP.qyIntIndMaterialMovEntBeforePost(DataSet: TDataSet);
begin
  BeforePostMaterialMov(qyIntIndMaterialMovEnt);
end;

procedure TDmERP.BeforePostMaterialMov(const qyMov : TFDQuery);
var
  dthrAtual : TDateTime;
  stDados   : TStringList;

  procedure GravarCamposSit;
  begin
    qyMov.FieldByName('cdUsuarioSituacaoMov').AsInteger := FTelaInicial.FcdUsuario;
    qyMov.FieldByName('dtSituacaoMov').AsDateTime       := Trunc(dthrAtual);
    qyMov.FieldByName('hrSituacaoMov').AsInteger        := HoraParaMinutos(dthrAtual);

    if qyMov.FieldByName('nmUsuSit').ReadOnly then
      qyMov.FieldByName('nmUsuSit').ReadOnly            := False;

    qyMov.FieldByName('nmUsuSit').AsString              := FTelaInicial.FnmUsuario;

    if qyMov.FieldByName('dehrSituacaoMov').ReadOnly then
      qyMov.FieldByName('dehrSituacaoMov').ReadOnly     := False;

    qyMov.FieldByName('dehrSituacaoMov').AsString       := FormatDateTime('hh:mm', dthrAtual);
  end;
begin
  GerarCodigo(fdConnERP, qyMov, 'intIndMaterialMovimento', 'cdMaterialMovimento', qyMov.FieldByName('cdMaterialMovimento').AsInteger);

  stDados   := TStringList.Create;
  dthrAtual := DataHoraAtual(fdConnERP);

  if qyMov.State = dsInsert then
  begin
    qyMov.FieldByName('dtMovimento').AsDateTime := Trunc(dthrAtual);
    qyMov.FieldByName('hrMovimento').AsInteger  := HoraParaMinutos(dthrAtual);

    GravarCamposSit;
  end
  else if (qyMov.State = dsEdit) then
  begin
    stDados.Clear;
    ExecuteSimplesSql(fdConnERP,
                      'SELECT cdSituacaoMovimento ' +
                      '  FROM erp.intIndMaterialMovimento ' +
                      ' WHERE cdMaterialMovimento = ' + qyMov.FieldByName('cdMaterialMovimento').AsString,
                      'cdSituacaoMovimento',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) and
       (StrToIntDef(stDados.Strings[0], 0) = 1) and
       (StrToIntDef(stDados.Strings[0], 0) <> qyMov.FieldByName('cdSituacaoMovimento').AsInteger) then
      GravarCamposSit;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.qyIntIndMaterialMovEntNewRecord(DataSet: TDataSet);
begin
  qyIntIndMaterialMovEnt.FieldByName('cdSituacaoMovimento').AsInteger := 2;
  qyIntIndMaterialMovEnt.FieldByName('flTipoMovimento').AsString      := 'E';
end;

procedure TDmERP.qyIntIndMaterialMovSaiBeforeOpen(DataSet: TDataSet);
begin
  qyIntIndMaterialMovSai.ParamByName('cdMaterialSolicitacao').AsInteger := qyIntIndMaterialSolic.FieldByName('cdMaterialSolicitacao').AsInteger;
end;

procedure TDmERP.qyIntIndMaterialMovSaiBeforePost(DataSet: TDataSet);
begin
  BeforePostMaterialMov(qyIntIndMaterialMovSai);
end;

procedure TDmERP.qyIntIndMaterialMovSaiNewRecord(DataSet: TDataSet);
begin
  qyIntIndMaterialMovSai.FieldByName('cdSituacaoMovimento').AsInteger := 2;
  qyIntIndMaterialMovSai.FieldByName('flTipoMovimento').AsString      := 'S';
end;

procedure TDmERP.qyIntIndMaterialSolicAfterScroll(DataSet: TDataSet);
begin
  if qyIntIndMaterialMovSai.Active then
    qyIntIndMaterialMovSai.Close;

  qyIntIndMaterialMovSai.Open();
end;

procedure TDmERP.qyIntIndMaterialSolicBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyIntIndMaterialSolic, 'intIndMaterialSolicitacao', 'cdMaterialSolicitacao', qyIntIndMaterialSolic.FieldByName('cdMaterialSolicitacao').AsInteger);
end;

procedure TDmERP.qyIntIndMaterialSolicNewRecord(DataSet: TDataSet);
begin
  qyIntIndMaterialSolic.FieldByName('flTipoSolicitacao').AsString := 'I';
end;

procedure TDmERP.qyMotoristaAfterScroll(DataSet: TDataSet);
begin
  qyMotorista.FieldByName('deCpf').EditMask := '999.999.999-99;0;_';
end;

procedure TDmERP.qyMotoristaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyMotorista, 'motorista', 'cdMotorista', qyMotorista.FieldByName('cdMotorista').AsInteger);
end;

procedure TDmERP.qyNaturezaNewRecord(DataSet: TDataSet);
begin
  qyNatureza.FieldByName('flDentroEstado').AsString          := 'S';
  qyNatureza.FieldByName('flExportacao').AsString            := 'N';
  qyNatureza.FieldByName('flDrawback').AsString              := 'N';
  qyNatureza.FieldByName('flDevolucao').AsString             := 'N';
  qyNatureza.FieldByName('flDevolucaoOutraOper').AsString    := 'N';
  qyNatureza.FieldByName('flConsignacao').AsString           := 'N';
  qyNatureza.FieldByName('flVendaFutura').AsString           := 'N';
  qyNatureza.FieldByName('flOperacaoTriangular').AsString    := 'N';
  qyNatureza.FieldByName('flBonificacao').AsString           := 'N';
  qyNatureza.FieldByName('flNaturezaServico').AsString       := 'N';
  qyNatureza.FieldByName('flNaturezaTransporte').AsString    := 'N';
  qyNatureza.FieldByName('flVendaOrdemSemValor').AsString    := 'N';
  qyNatureza.FieldByName('flVendaOrgaoPublico').AsString     := 'N';
  qyNatureza.FieldByName('flIpiIncideIcms').AsString         := 'N';
  qyNatureza.FieldByName('flIpiIncidePisCofins').AsString    := 'N';
  qyNatureza.FieldByName('flIpiCred50Perc').AsString         := 'N';
  qyNatureza.FieldByName('flIcmsCalcPartSimples').AsString   := 'N';
  qyNatureza.FieldByName('flIcmsMsgAprovCred').AsString      := 'N';
  qyNatureza.FieldByName('flIcmsCalcSubstTrib').AsString     := 'N';
  qyNatureza.FieldByName('flIcmsReducaoCalc').AsString       := 'N';
  qyNatureza.FieldByName('flIcmsCalcStUsoCon').AsString      := 'N';
  qyNatureza.FieldByName('flIcmsDebCreLivros').AsString      := 'N';
  qyNatureza.FieldByName('flMovFinanceiro').AsString         := 'N';
  qyNatureza.FieldByName('flMovFiscal').AsString             := 'N';
  qyNatureza.FieldByName('flFaturamento').AsString           := 'N';
  qyNatureza.FieldByName('flMovEstoque').AsString            := 'N';
  qyNatureza.FieldByName('flEstoqueTerceiros').AsString      := 'N';
  qyNatureza.FieldByName('flEstoqueArmazenagem').AsString    := 'N';
  qyNatureza.FieldByName('flEntraCalcRentab').AsString       := 'N';
  qyNatureza.FieldByName('flAbateRentab').AsString           := 'N';
  qyNatureza.FieldByName('flConsideraSisDec').AsString       := 'N';
  qyNatureza.FieldByName('flMsgLeiTransp').AsString          := 'N';
  qyNatureza.FieldByName('flUtilizaControleTerc').AsString   := 'N';
  qyNatureza.FieldByName('flGeraValorCalcBonif').AsString    := 'N';
  qyNatureza.FieldByName('flMovSelos').AsString              := 'N';
  qyNatureza.FieldByName('flOperSemCredSt').AsString         := 'N';
  qyNatureza.FieldByName('flOperSemCredIpi').AsString        := 'N';
  qyNatureza.FieldByName('cdPisBase').AsInteger              := 3;
  qyNatureza.FieldByName('cdCofinsBase').AsInteger           := 3;
  qyNatureza.FieldByName('cdSimplesBase').AsInteger          := 3;
  qyNatureza.FieldByName('flIsencaoPisCofins').AsString      := 'N';
  qyNatureza.FieldByName('flRetencaoPisCofinsCsll').AsString := 'N';
  qyNatureza.FieldByName('flAbatePisCofinsTitNf').AsString   := 'N';
  qyNatureza.FieldByName('flProdMonofasSn').AsString         := 'N';
  qyNatureza.FieldByName('flDiferencaIcms').AsString         := 'N';
end;

procedure TDmERP.qyPatrimonioBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyPatrimonio, 'patrimonio', 'cdPatrimonio', qyPatrimonio.FieldByName('cdPatrimonio').AsInteger);
end;

procedure TDmERP.qyPatrimonioManutBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyPatrimonioManut, 'patrimonioManutencao', 'cdPatrimonioManutencao', qyPatrimonioManut.FieldByName('cdPatrimonioManutencao').AsInteger);
end;

procedure TDmERP.qyPatrimonioManutNewRecord(DataSet: TDataSet);
begin
  qyPatrimonioManut.FieldByName('cdSituacao').AsInteger := 1;
end;

procedure TDmERP.qyPatrimonioManutPesqAfterClose(DataSet: TDataSet);
begin
  qyPatrimonioManutPesq.MacroByName('filtro').Clear;
end;

procedure TDmERP.qyPatrimonioPesqAfterClose(DataSet: TDataSet);
begin
  qyPatrimonioPesq.MacroByName('filtro').Clear;
end;

procedure TDmERP.qyPatrimonioTipoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyPatrimonioTipo, 'patrimonioTipo', 'cdPatrimonioTipo', qyPatrimonioTipo.FieldByName('cdPatrimonioTipo').AsInteger);
end;

procedure TDmERP.qyPatrimonioTipoPesqAfterClose(DataSet: TDataSet);
begin
  qyPatrimonioTipoPesq.MacroByName('filtro').Clear;
end;

procedure TDmERP.qyPedidoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyPedido, 'pedido', 'cdPedido', qyPedido.FieldByName('cdPedido').AsInteger);
end;

procedure TDmERP.qyPedidoNewRecord(DataSet: TDataSet);
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(fdConnERP);

  qyPedido.FieldByName('cdPedidoTipo').AsInteger     := 1;
  qyPedido.FieldByName('cdPedidoSituacao').AsInteger := 1;
  qyPedido.FieldByName('dtEmissao').AsDateTime       := Trunc(dthrAtual);
  qyPedido.FieldByName('flDescontoPorItem').AsString := 'N';
end;

procedure TDmERP.GravarCamposItensVarItens(const icdVar     : Integer;
                                           const sdeVarItem,
                                                 scdFieldRecNum,
                                                 scdFieldMasc : String
                                          );
var
  sFieldSeq : String;
begin
  if qyIntSupItensCfgPad.State in dsEditModes then
  begin
    sFieldSeq := AnsiReplaceStr(scdFieldRecNum, 'RecNum', 'Seq');

    try
      DmIntegracao.fdConnInteg.Connected := True;
      DmIntegracao.qyItensVarItens.Open();

      DmIntegracao.qyItensVarItens.First;

      if DmIntegracao.qyItensVarItens.Locate('codigo_variavel;valor',
                                             VarArrayOf([icdVar, sdeVarItem]),
                                             []
                                            ) then
      begin
         qyIntSupItensCfgPad.FieldByName(scdFieldRecNum).AsInteger := DmIntegracao.qyItensVarItens.FieldByName('recNum').AsInteger;
         qyIntSupItensCfgPad.FieldByName(scdFieldMasc).AsInteger   := DmIntegracao.qyItensVarItens.FieldByName('mascara').AsInteger;
         qyIntSupItensCfgPad.FieldByName(sFieldSeq).AsInteger      := DmIntegracao.qyItensVarItens.FieldByName('seq').AsInteger;
      end
      else
      begin
        qyIntSupItensCfgPad.FieldByName(scdFieldRecNum).Clear;
        qyIntSupItensCfgPad.FieldByName(scdFieldMasc).Clear;
        qyIntSupItensCfgPad.FieldByName(sFieldSeq).Clear;
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyItensVarItens.Active then
      DmIntegracao.qyItensVarItens.Close;

    DmIntegracao.fdConnInteg.Connected := False;
  end;
end;

function TDmERP.CobrancaValida : String;
begin
  Result := '';

  if qyCobranca.FieldByName('cdCliente').IsNull then
    AdicionaLinha(Result, ' - Cliente deve ser informado');

  if qyCobranca.FieldByName('vlCobranca').IsNull then
    AdicionaLinha(Result, ' - Valor da cobrança deve ser informado');

  if (Trim(qyCobranca.FieldByName('deTextoCobranca').AsString) = '') then
    AdicionaLinha(Result, ' - Texto da cobrança deve ser informado');
end;

procedure TDmERP.GravarCobranca;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := CobrancaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyCobranca.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyCobranca);
      qyCobranca.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Cobrança inserida com sucesso.')
      else
        Informacao('Cobrança alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCobranca;
begin
  if (qyCobranca.Active) then
  begin
    if (qyCobranca.FieldByName('cdSituacao').AsInteger = 2) then
      Aviso('Cobrança já finalizada.')
    else if Pergunta('Confirma a exclusão deste registro?') then
    begin
      if not qyCobrancaContato.Active then
        qyCobrancaContato.Open();

      qyCobrancaContato.First;

      while not qyCobrancaContato.Eof do
        qyCobrancaContato.Delete;

      qyCobranca.Delete;
      Informacao('Cobrança excluída com sucesso.');
    end;
  end;
end;

function TDmERP.CobrancaContatoValido : String;
begin
  Result := '';

  if qyCobrancaContato.FieldByName('dtContato').IsNull then
    AdicionaLinha(Result, ' - Data do contato deve ser informada');

  if (Trim(qyCobrancaContato.FieldByName('nmContato').AsString) = '') then
    AdicionaLinha(Result, ' - Pessoa do contato deve ser informada');

  if (qyCobrancaContato.FieldByName('flRetornar').AsString = 'S') and
     (qyCobrancaContato.FieldByName('dtRetorno').IsNull) then
    AdicionaLinha(Result, ' - Data de retorno deve ser informada');

  if (not qyCobrancaContato.FieldByName('dtContato').IsNull) and
     (not qyCobrancaContato.FieldByName('dtRetorno').IsNull) and
     (qyCobrancaContato.FieldByName('dtContato').AsDateTime > qyCobrancaContato.FieldByName('dtRetorno').AsDateTime) then
    AdicionaLinha(Result, ' - Data de contato não pode ser maior que a de retorno');
end;

procedure TDmERP.GravarCobrancaContato;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := CobrancaContatoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyCobrancaContato.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyCobrancaContato);
      qyCobrancaContato.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Contato de cobrança inserido com sucesso.')
      else
        Informacao('Contato de cobrança alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCobrancaContato;
begin
  if (qyCobrancaContato.Active) then
  begin
    if (qyCobranca.FieldByName('cdSituacao').AsInteger = 2) then
      Aviso('Este contato não pode ser excluído.' + #13 + 'Cobrança já finalizada.')
    else if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyCobrancaContato.Delete;
      Informacao('Contato de cobranca excluído com sucesso.');
    end;
  end;
end;

function TDmERP.FatDiarioValido : String;
begin
  Result := '';

  if qyFatDiario.FieldByName('cdEmpresa').IsNull then
    AdicionaLinha(Result, ' - Empresa deve ser informada');

  if qyFatDiario.FieldByName('vlFaturado').IsNull then
    AdicionaLinha(Result, ' - Valor faturado deve ser informado');

  if qyFatDiario.FieldByName('dtMovimento').IsNull then
    AdicionaLinha(Result, ' - Data do movimento deve ser informada');
end;

procedure TDmERP.GravarFatDiario;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := FatDiarioValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyFatDiario.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyFatDiario);
      qyFatDiario.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Faturamento Diário inserido com sucesso.')
      else
        Informacao('Faturamento Diário alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirFatDiario;
begin
  if (qyFatDiario.Active) then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyFatDiario.Delete;
      Informacao('Faturamento Diário excluído com sucesso.');
    end;
  end;
end;

function TDmERP.NaturezaValida : String;
begin
  Result := '';

  if qyNatureza.FieldByName('cdNatureza').IsNull then
    AdicionaLinha(Result, ' - Código da Natureza deve ser informada');

  if Trim(qyNatureza.FieldByName('deNatureza').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição da Natureza deve ser informada');

  if Trim(qyNatureza.FieldByName('deNaturezaFiscal').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição Fiscal da Natureza deve ser informada');

  if qyNatureza.FieldByName('flNaturezaTipo').IsNull then
    AdicionaLinha(Result, ' - Tipo da Natureza deve ser informada');
end;

procedure TDmERP.GravarNatureza;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := NaturezaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyNatureza.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyNatureza);
      qyNatureza.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Natureza inserida com sucesso.')
      else
        Informacao('Natureza alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirNatureza;
begin
  if (qyNatureza.Active) then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyNatureza.Delete;
      Informacao('Natureza excluída com sucesso.');
    end;
  end;
end;

function TDmERP.TipoPatrimonioValido : String;
begin
  Result := '';

  if (Trim(qyPatrimonioTipo.FieldByName('dePatrimonioTipo').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição do tipo de patrimônio deve ser informada');
end;

procedure TDmERP.GravarTipoPatrimonio;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := TipoPatrimonioValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyPatrimonioTipo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyPatrimonioTipo);
      qyPatrimonioTipo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Tipo de Patrimônio inserido com sucesso.')
      else
        Informacao('Tipo de Patrimônio alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirTipoPatrimonio;
begin
  if qyPatrimonioTipo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyPatrimonioTipo.Delete;
      Informacao('Tipo de Patrimônio excluído com sucesso.');
    end;
  end;
end;

function TDmERP.PatrimonioValido : String;
begin
  Result := '';

  if (qyPatrimonio.FieldByName('cdPatrimonioTipo').IsNull) then
    AdicionaLinha(Result, ' - Tipo de patrimônio deve ser informado');

  if (Trim(qyPatrimonio.FieldByName('nuPatrimonio').AsString) = '') then
    AdicionaLinha(Result, ' - Nº de patrimônio deve ser informado');

  if (Trim(qyPatrimonio.FieldByName('dePatrimonio').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição do patrimônio deve ser informada');

  if (qyPatrimonio.FieldByName('cdSetor').IsNull) then
    AdicionaLinha(Result, ' - Setor do patrimônio deve ser informado');
end;

procedure TDmERP.GravarPatrimonio;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := PatrimonioValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyPatrimonio.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyPatrimonio);
      qyPatrimonio.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Patrimônio inserido com sucesso.')
      else
        Informacao('Patrimônio alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirPatrimonio;
begin
  if qyPatrimonio.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyPatrimonio.Delete;
      Informacao('Patrimônio excluído com sucesso.');
    end;
  end;
end;

function TDmERP.ClassifFiscalValida : String;
begin
  Result := '';

  if (Trim(qyClassifFiscal.FieldByName('nuClassifFiscal').AsString) = '') then
    AdicionaLinha(Result, ' - Nº da classificação fiscal deve ser informado');
end;

procedure TDmERP.GravarClassifFiscal;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ClassifFiscalValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyClassifFiscal.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyClassifFiscal);
      qyClassifFiscal.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Classificação Fiscal inserida com sucesso.')
      else
        Informacao('Classificação Fiscal alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirClassifFiscal;
begin
  if qyClassifFiscal.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyClassifFiscal.Delete;
      Informacao('Classificação Fiscal excluída com sucesso.');
    end;
  end;
end;

function TDmERP.DocumentoTipoValido : String;
begin
  Result := '';

  if (Trim(qyDocumentoTipo.FieldByName('deDocumentoTipo').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição do tipo de documento deve ser informada');
end;

procedure TDmERP.GravarDocumentoTipo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := DocumentoTipoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyDocumentoTipo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyDocumentoTipo);
      qyDocumentoTipo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Tipo de Documento inserido com sucesso.')
      else
        Informacao('Tipo de Documento alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirDocumentoTipo;
begin
  if qyDocumentoTipo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyDocumentoTipo.Delete;
      Informacao('Tipo de Documento excluído com sucesso.');
    end;
  end;
end;

function TDmERP.DespesaTipoValido : String;
begin
  Result := '';

  if (Trim(qyDespesaTipo.FieldByName('deDespesaTipo').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição do tipo de despesa deve ser informada');
end;

procedure TDmERP.GravarDespesaTipo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := DespesaTipoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyDespesaTipo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyDespesaTipo);
      qyDespesaTipo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Tipo de Despesa inserido com sucesso.')
      else
        Informacao('Tipo de Despesa alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirDespesaTipo;
begin
  if qyDespesaTipo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyDespesaTipo.Delete;
      Informacao('Tipo de Despesa excluído com sucesso.');
    end;
  end;
end;

function TDmERP.VariavelValida : String;
begin
  Result := '';

  if (Trim(qyVariavel.FieldByName('deVariavel').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição da variável deve ser informada');
end;

procedure TDmERP.GravarVariavel;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := VariavelValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyVariavel.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyVariavel);
      qyVariavel.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Variável inserida com sucesso.')
      else
        Informacao('Variável alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirVariavel;
begin
  if qyVariavel.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyVariavel.Delete;
      Informacao('Variável excluída com sucesso.');
    end;
  end;
end;

function TDmERP.VariavelItemValido : String;
begin
  Result := '';

  if (Trim(qyVariavelItens.FieldByName('deValor').AsString) = '') then
    AdicionaLinha(Result, ' - Valor do item da variável deve ser informado');

  if (Trim(qyVariavelItens.FieldByName('deMascara').AsString) = '') then
    AdicionaLinha(Result, ' - Valor máscara do item da variável deve ser informado');
end;

procedure TDmERP.GravarVariavelItem;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := VariavelItemValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyVariavelItens.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyVariavelItens);
      qyVariavelItens.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Item de variável inserido com sucesso.')
      else
        Informacao('Item de variável alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirVariavelItem;
begin
  if qyVariavelItens.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyVariavelItens.Delete;
      Informacao('Item de variável de excluído com sucesso.');
    end;
  end;
end;

function TDmERP.ItemVinculoVariavelValido : String;
var
  stDados : TStringList;
begin
  Result  := '';
  stDados := TStringList.Create;

  if (Trim(qyItemVinculoVariavel.FieldByName('cdItem').AsString) = '') and (Trim(FscdItemVinculo) = '') then
    AdicionaLinha(Result, ' - Item deve ser informado');

  if (qyItemVinculoVariavel.FieldByName('cdVariavel').IsNull) then
    AdicionaLinha(Result, ' - Variável deve ser informada');

  if (Trim(Result) = '') and (qyItemVinculoVariavel.State = dsInsert) then
  begin
    stDados.Clear;

    ExecuteSimplesSql(fdConnERP,
                      'SELECT a.cdItem ' +
                      '  FROM erp.itemVinculoVariavel a ' +
                      ' WHERE a.cdItem = ' + QuotedStr(qyItemVinculoVariavel.FieldByName('cdItem').AsString) +
                      '   AND a.cdVariavel = ' + qyItemVinculoVariavel.FieldByName('cdVariavel').AsString,
                      'cdItem',
                      stDados
                     );

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
      AdicionaLinha(Result, ' - Variável já vinculada ao item ' + qyItemVinculoVariavel.FieldByName('cdItem').AsString);
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarItemVinculoVariavel;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ItemVinculoVariavelValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyItemVinculoVariavel.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyItemVinculoVariavel);
      qyItemVinculoVariavel.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Vínculo de variável ao item inserido com sucesso.')
      else
        Informacao('Vínculo de variável ao item alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirItemVinculoVariavel;
begin
  if (qyItemVinculoVariavel.Active) and (not qyItemVinculoVariavel.IsEmpty) then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      if qyItemVariavelItensBloq.Active then
        qyItemVariavelItensBloq.Close;

      qyItemVariavelItensBloq.MacroByName('filtro').Value := ' WHERE cdItem = ' + QuotedStr(qyItemVinculoVariavel.FieldByName('cdItem').AsString) +
                                                             '   AND cdVariavel = ' + qyItemVinculoVariavel.FieldByName('cdVariavel').AsString;
      qyItemVariavelItensBloq.Open();

      qyItemVariavelItensBloq.First;

      while not qyItemVariavelItensBloq.Eof do
        qyItemVariavelItensBloq.Delete;

      qyItemVinculoVariavel.Delete;
      Informacao('Vínculo de variável ao item excluído com sucesso.');
    end;
  end;
end;

function TDmERP.PatrimonioManutencaoValida : String;
var
  stDados : TStringList;
  sAux    : String;
begin
  Result := '';

  if (qyPatrimonioManut.FieldByName('cdPatrimonio').IsNull) then
    AdicionaLinha(Result, ' - Patrimônio deve ser informado')
  else
  begin
    sAux := '';

    if qyPatrimonioManut.State <> dsInsert then
      sAux := ' AND cdPatrimonioManutencao <> ' + qyPatrimonioManut.FieldByName('cdPatrimonioManutencao').AsString;

    stDados := TStringList.Create;

    ExecuteSimplesSql(fdConnERP,
                      'SELECT cdPatrimonioManutencao ' +
                      '  FROM erp.patrimonioManutencao ' +
                      ' WHERE cdPatrimonio = ' + qyPatrimonioManut.FieldByName('cdPatrimonio').AsString +
                      '   AND cdSituacao IN (1,2) ' + //Em aberto | Em Progresso
                      sAux,
                      'cdPatrimonioManutencao',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      AdicionaLinha(Result, ' - Já existe uma manutenção cadastrada para este patrimônio que se encontra em aberto ou em progresso');

    if Assigned(stDados) then
      FreeAndNil(stDados);
  end;

  if (qyPatrimonioManut.FieldByName('dtManutencao').IsNull) then
    AdicionaLinha(Result, ' - Data de manutenção deve ser informada');

  if (qyPatrimonioManut.FieldByName('dtAvisarEm').IsNull) then
    AdicionaLinha(Result, ' - Data de aviso deve ser informada');

  if (not qyPatrimonioManut.FieldByName('dtManutencao').IsNull) and
     (not qyPatrimonioManut.FieldByName('dtAvisarEm').IsNull) and
     (
      qyPatrimonioManut.FieldByName('dtAvisarEm').AsDateTime >
      qyPatrimonioManut.FieldByName('dtManutencao').AsDateTime
     ) then
    AdicionaLinha(Result, ' - Data de aviso não pode ser maior que a de manutenção');

  if (Trim(qyPatrimonioManut.FieldByName('deResponsavel').AsString) = '') then
    AdicionaLinha(Result, ' - Responsável deve ser informado');

  if (Trim(qyPatrimonioManut.FieldByName('deManutencao').AsString) = '') then
    AdicionaLinha(Result, ' - Descrição da manutenção deve ser informada');
end;

procedure TDmERP.GravarPatrimonioManutencao;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := PatrimonioManutencaoValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyPatrimonioManut.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyPatrimonioManut);
      qyPatrimonioManut.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Manutenção de patrimônio inserida com sucesso.')
      else
        Informacao('Manutenção de patrimônio alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirPatrimonioManutencao;
begin
  if qyPatrimonioManut.Active then
  begin
    if qyPatrimonioManut.FieldByName('cdSituacao').AsInteger <> 1 then
      Aviso('Manutenção de patrimônio não pode ser excluída. Situação diferente de "Em Aberto".')
    else if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyPatrimonioManut.Delete;
      Informacao('Manutenção de patrimônio excluída com sucesso.');
    end;
  end;
end;

function TDmERP.BorderoValido : String;
var
  stDados : TStringList;
  sAux    : String;
begin
  Result := '';

  if (qyBordero.FieldByName('cdMotorista').IsNull) then
    AdicionaLinha(Result, ' - Motorista deve ser informado');

  if (qyBordero.FieldByName('cdVeiculo').IsNull) then
    AdicionaLinha(Result, ' - Veículo deve ser informado');

  if (qyBordero.FieldByName('dtSaida').IsNull) then
    AdicionaLinha(Result, ' - Data de saída deve ser informada');

  if (qyBordero.FieldByName('dtRetorno').IsNull) then
    AdicionaLinha(Result, ' - Data de retorno deve ser informada');

  if (not qyBordero.FieldByName('dtSaida').IsNull) and
     (not qyBordero.FieldByName('dtRetorno').IsNull) and
     (
      qyBordero.FieldByName('dtSaida').AsDateTime >
      qyBordero.FieldByName('dtRetorno').AsDateTime
     ) then
    AdicionaLinha(Result, ' - Data de retorno não pode ser maior que a de saída');

  if (qyBordero.FieldByName('nuKmInicial').AsInteger > 0) and
     (qyBordero.FieldByName('nuKmFinal').AsInteger > 0) and
     (
      qyBordero.FieldByName('nuKmInicial').AsInteger >
      qyBordero.FieldByName('nuKmFinal').AsInteger
     ) then
    AdicionaLinha(Result, ' - Km inicial não pode ser maior que a final');

  sAux := '';

  if qyBordero.State <> dsInsert then
    sAux := ' AND cdBordero <> ' + qyBordero.FieldByName('cdBordero').AsString;

  stDados := TStringList.Create;

  if (not qyBordero.FieldByName('dtSaida').IsNull) then
  begin
    if (qyBordero.FieldByName('cdMotorista').AsInteger > 0) then
    begin
      stDados.Clear;
      ExecuteSimplesSql(fdConnERP,
                        'SELECT cdBordero ' +
                        '  FROM erp.bordero ' +
                        ' WHERE cdMotorista = ' + qyBordero.FieldByName('cdMotorista').AsString +
                        '   AND dtSaida = ' + QuotedStr(qyBordero.FieldByName('dtSaida').AsString) +
                        sAux,
                        'cdBordero',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        AdicionaLinha(Result,
                      ' - Já existe um bordero cadastrado para este motorista com data de saída em ' +
                      qyBordero.FieldByName('dtSaida').AsString
                     );
    end;

    if (qyBordero.FieldByName('cdVeiculo').AsInteger > 0) then
    begin
      stDados.Clear;
      ExecuteSimplesSql(fdConnERP,
                        'SELECT cdBordero ' +
                        '  FROM erp.bordero ' +
                        ' WHERE cdVeiculo = ' + qyBordero.FieldByName('cdVeiculo').AsString +
                        '   AND dtSaida = ' + QuotedStr(qyBordero.FieldByName('dtSaida').AsString) +
                        sAux,
                        'cdBordero',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        AdicionaLinha(Result,
                      ' - Já existe um bordero cadastrado para este veículo com data de saída em ' +
                      qyBordero.FieldByName('dtSaida').AsString
                     );
    end;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarBordero;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := BorderoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyBordero.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyBordero);
      qyBordero.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Bordero inserido com sucesso.')
      else
        Informacao('Bordero alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirBordero;
begin
  if qyBordero.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyBordero.Delete;
      Informacao('Bordero excluído com sucesso.');
    end;
  end;
end;

function TDmERP.DocumentoValido : String;
begin
  Result := '';

  if (qyDocumento.FieldByName('cdEmpresa').IsNull) then
    AdicionaLinha(Result, ' - Empresa deve ser informada');

  if (qyDocumento.FieldByName('cdDocumentoTipo').IsNull) then
    AdicionaLinha(Result, ' - Tipo de documento deve ser informado');

  if (qyDocumento.FieldByName('dtCompetencia').IsNull) then
    AdicionaLinha(Result, ' - Competência deve ser informada');
end;

procedure TDmERP.GravarDocumento;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := DocumentoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyDocumento.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyDocumento);
      qyDocumento.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Documento inserido com sucesso.')
      else
        Informacao('Documento alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirDocumento;
begin
  if qyDocumento.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyDocumento.Delete;
      Informacao('Documento excluído com sucesso.');
    end;
  end;
end;

function TDmERP.RepresentanteValido : String;
begin
  Result := '';

  if (Trim(qyRepresentante.FieldByName('deCpfCnpj').AsString) <> '') and
     (not (ValidaCpfCnpj(qyRepresentante.FieldByName('deCpfCnpj').AsString))) then
  begin
    if (qyRepresentante.FieldByName('flFisJur').AsString = 'J') then
      AdicionaLinha(Result, ' - CNPJ inválido')
    else
      AdicionaLinha(Result, ' - CPF inválido');
  end;  

  if (qyRepresentante.FieldByName('flFisJur').AsString = 'J') then
  begin
    if (Trim(qyRepresentante.FieldByName('deCpfCnpj').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, o CNPJ deve ser informado');

    if (Trim(qyRepresentante.FieldByName('deRazaoSocial').AsString) = '') then
      AdicionaLinha(Result, ' - Para pessoa jurídica, a razão social deve ser informada');
  end;
end;

procedure TDmERP.GravarRepresentante;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := RepresentanteValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyRepresentante.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyRepresentante);
      qyRepresentante.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Representante inserido com sucesso.')
      else
        Informacao('Representante alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirRepresentante;
begin
  if qyRepresentante.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyRepresentante.Delete;
      Informacao('Representante excluído com sucesso.');
    end;
  end;
end;

function TDmERP.BancoValido : String;
begin
  Result := '';

  if Trim(qyBanco.FieldByName('cdBanco').AsString) = '' then
    AdicionaLinha(Result, ' - Código do banco deve ser informado')
  else if Length(qyBanco.FieldByName('cdBanco').AsString) <> 3 then
    AdicionaLinha(Result, ' - Código do banco deve ter 3 dígitos');

  if Trim(qyBanco.FieldByName('deBanco').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição do banco deve ser informada');
end;

procedure TDmERP.GravarBanco;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := BancoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyBanco.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyBanco);
      qyBanco.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Banco inserido com sucesso.')
      else
        Informacao('Banco alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirBanco;
begin
  if qyBanco.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyBanco.Delete;
      Informacao('Banco excluído com sucesso.');
    end;
  end;
end;

function TDmERP.AgenciaValida : String;
var
  stDados : TStringList;
  sSql    : String;
begin
  stDados := TStringList.Create;
  Result  := '';

  if Trim(qyAgencia.FieldByName('cdBanco').AsString) = '' then
    AdicionaLinha(Result, ' - Código do banco deve ser informado');

  if qyAgencia.FieldByName('nuAgencia').IsNull then
    AdicionaLinha(Result, ' - Nº da agência deve ser informado');

  if (Trim(Result) = '') then
  begin
    sSql := 'SELECT deAgencia ' +
            '  FROM erp.agencia ' +
            ' WHERE nuAgencia = ' + QuotedStr(qyAgencia.FieldByName('nuAgencia').AsString) +
            '   AND cdBanco = ' + QuotedStr(qyAgencia.FieldByName('cdBanco').AsString);

    if (qyAgencia.FieldByName('cdAgencia').AsInteger > 0) then
      sSql := sSql + ' AND cdAgencia <> ' + qyAgencia.FieldByName('cdAgencia').AsString;

    stDados.Clear;
    ExecuteSimplesSql(fdConnERP, sSql, 'deAgencia', stDados);

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
      AdicionaLinha(Result, ' - Agência já cadastrada para o banco informado');
  end;

  if Trim(qyAgencia.FieldByName('deAgencia').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição da agência deve ser informada');

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarAgencia;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := AgenciaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyAgencia.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyAgencia);
      qyAgencia.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Agência inserida com sucesso.')
      else
        Informacao('Agência alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirAgencia;
begin
  if qyAgencia.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyAgencia.Delete;
      Informacao('Agência excluída com sucesso.');
    end;
  end;
end;

function TDmERP.ContaValida : String;
var
  stDados : TStringList;
  sSql    : String;
begin
  stDados := TStringList.Create;
  Result  := '';

  if qyConta.FieldByName('cdAgencia').IsNull then
    AdicionaLinha(Result, ' - Código da agência deve ser informado');

  if qyConta.FieldByName('nuConta').IsNull then
    AdicionaLinha(Result, ' - Código da conta deve ser informado');

  if (Trim(Result) = '') then
  begin
    sSql := 'SELECT deConta ' +
            '  FROM erp.conta ' +
            ' WHERE nuConta = ' + qyConta.FieldByName('nuConta').AsString +
            '   AND cdAgencia = ' + QuotedStr(qyConta.FieldByName('cdAgencia').AsString);

    if (qyConta.FieldByName('cdConta').AsInteger > 0) then
      sSql := sSql + ' AND cdConta <> ' + qyConta.FieldByName('cdConta').AsString;

    stDados.Clear;
    ExecuteSimplesSql(fdConnERP, sSql, 'deConta', stDados);

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
      AdicionaLinha(Result, ' - Conta já cadastrada para a agência informada');
  end;

  if Trim(qyConta.FieldByName('deConta').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição da conta deve ser informada');

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarConta;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ContaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyConta.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyConta);
      qyConta.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Conta inserida com sucesso.')
      else
        Informacao('Conta alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirConta;
begin
  if qyConta.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyConta.Delete;
      Informacao('Conta excluída com sucesso.');
    end;
  end;
end;

function TDmERP.CobrancaTipoValida : String;
begin
  Result := '';

  if Trim(qyCobrancaTipo.FieldByName('deCobrancaTipo').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição do tipo de cobrança deve ser informada');

  if Trim(qyCobrancaTipo.FieldByName('deCobrancaTipoSigla').AsString) = '' then
    AdicionaLinha(Result, ' - Sigla do tipo de cobrança deve ser informada');
end;

procedure TDmERP.GravarCobrancaTipo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := CobrancaTipoValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyCobrancaTipo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyCobrancaTipo);
      qyCobrancaTipo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Tipo de Cobrança inserido com sucesso.')
      else
        Informacao('Tipo de Cobrança alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCobrancaTipo;
begin
  if qyCobrancaTipo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyCobrancaTipo.Delete;
      Informacao('Tipo de Cobrança excluído com sucesso.');
    end;
  end;
end;

function TDmERP.ReciboAvulsoValido : String;
begin
  Result := '';

  if qyReciboAvulso.FieldByName('cdEmpresa').IsNull then
    AdicionaLinha(Result, ' - Empresa deve ser informada');

  if (qyReciboAvulso.FieldByName('vlReciboAvulso').IsNull) or
     (qyReciboAvulso.FieldByName('vlReciboAvulso').AsFloat = 0) then
    AdicionaLinha(Result, ' - Valor do recibo deve ser informado');

  if Trim(qyReciboAvulso.FieldByName('nmRecebedor').AsString) = '' then
    AdicionaLinha(Result, ' - Nome do recebedor deve ser informado');
end;

procedure TDmERP.GravarReciboAvulso;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ''; //ReciboAvulsoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyReciboAvulso.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyReciboAvulso);
      qyReciboAvulso.Post;
      fdConnERP.Commit;
              {
      if bInserindo then
        Informacao('Recibo avulso inserido com sucesso.')
      else
        Informacao('Recibo avulso alterado com sucesso.');
        }
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirReciboAvulso;
begin
  if qyReciboAvulso.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyReciboAvulso.Delete;
      Informacao('Recibo avulso excluído com sucesso.');
    end;
  end;
end;

function TDmERP.EscalaValida : String;
begin
  Result := '';

  if Trim(qyEscala.FieldByName('deEscala').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição da escala deve ser informada');
end;

procedure TDmERP.GravarEscala;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := EscalaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyEscala.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyEscala);
      qyEscala.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Escala inserida com sucesso.')
      else
        Informacao('Escala alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirEscala;
begin
  if qyEscala.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyEscalaItem.First;

      while not qyEscalaItem.Eof do
        qyEscalaItem.Delete;

      qyEscala.Delete;
      Informacao('Escala excluída com sucesso.');
    end;
  end;
end;

function TDmERP.EscalaItemValido : String;
begin
  Result := '';

  if Trim(qyEscalaItem.FieldByName('deEscalaItem').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição do item da escala deve ser informado');
end;

procedure TDmERP.GravarEscalaItem;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := EscalaItemValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyEscalaItem.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyEscalaItem);
      qyEscalaItem.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Item da escala inserido com sucesso.')
      else
        Informacao('Item da escala alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirEscalaItem;
begin
  if qyEscalaItem.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyEscalaItem.Delete;
      Informacao('Item da escala excluído com sucesso.');
    end;
  end;
end;

function TDmERP.CargoValido : String;
begin
  Result := '';

  if Trim(qyCargo.FieldByName('deCargo').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição do cargo deve ser informada');
end;

procedure TDmERP.GravarCargo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := CargoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyCargo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyCargo);
      qyCargo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Cargo inserido com sucesso.')
      else
        Informacao('Cargo alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCargo;
begin
  if qyCargo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyCargo.Delete;
      Informacao('Cargo excluído com sucesso.');
    end;
  end;
end;

function TDmERP.ColaboradorValido : String;
var
  stDados : TStringList;
  sSql    : String;
begin
  Result := '';

  stDados := TStringList.Create;

//  if qyColaborador.FieldByName('cdCodigoFolha').IsNull then
//    AdicionaLinha(Result, ' - Código da folha deve ser informado');

  if (qyColaborador.FieldByName('cdEmpresa').AsInteger > 0) and
     (qyColaborador.FieldByName('cdCodigoFolha').AsInteger > 0) then
  begin
    sSql := 'SELECT cdCodigoFolha ' +
            '  FROM erp.colaborador ' +
            ' WHERE cdEmpresa = ' + qyColaborador.FieldByName('cdEmpresa').AsString +
            '   AND cdCodigoFolha = ' + qyColaborador.FieldByName('cdCodigoFolha').AsString;

    if (qyColaborador.State = dsEdit) then
      sSql := sSql + ' AND cdColaborador <> ' + qyColaborador.FieldByName('cdColaborador').AsString;

    ExecuteSimplesSql(fdConnERP, sSql, 'cdCodigoFolha', stDados);

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      AdicionaLinha(Result, ' - Código da folha já informado para outro cadastro');
  end;

  if Trim(qyColaborador.FieldByName('nmColaborador').AsString) = '' then
    AdicionaLinha(Result, ' - Nome do colaborador deve ser informado');

  if qyColaborador.FieldByName('cdEmpresa').IsNull then
    AdicionaLinha(Result, ' - Empresa deve ser informada');

  if qyColaborador.FieldByName('cdColabSituacao').IsNull then
    AdicionaLinha(Result, ' - Situação deve ser informada');

  if (qyColaborador.FieldByName('flUsaValeTransp').AsString = 'S') and
     ((qyColaborador.FieldByName('vlValeTransp').IsNull) or (qyColaborador.FieldByName('vlValeTransp').AsCurrency = 0)) then
    AdicionaLinha(Result, ' - Valor do vale transporte deve ser informado');

  if (Trim(qyColaborador.FieldByName('deCpf').AsString) <> '') and
     (not (ValidaCpfCnpj(qyColaborador.FieldByName('deCpf').AsString))) then
    AdicionaLinha(Result, ' - CPF inválido');

  if (Trim(qyColaborador.FieldByName('nuTituloEleitor').AsString) <> '') and
     (not (ValidaTituloEleitor(qyColaborador.FieldByName('nuTituloEleitor').AsString))) then
    AdicionaLinha(Result, ' - Título de eleitor inválido');

  if (Trim(qyColaborador.FieldByName('nuPis').AsString) <> '') and
     (not (ValidaPIS(qyColaborador.FieldByName('nuPis').AsString))) then
    AdicionaLinha(Result, ' - PIS inválido');

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarColaborador;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ColaboradorValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyColaborador.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyColaborador);
      qyColaborador.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Colaborador inserido com sucesso.')
      else
        Informacao('Colaborador alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirColaborador;
var
  sMsg : String;

  function ExisteHistorico(const qyDados : TFDQuery) : Boolean;
  begin
    if qyDados.Active then
      qyDados.Close;

    qyDados.MacroByName('filtro').Value := ' WHERE cdColaborador = ' + qyColaborador.FieldByName('cdColaborador').AsString;
    qyDados.Open();

    Result := not qyDados.IsEmpty;
  end;
begin
  if qyColaborador.Active then
  begin
    sMsg := '';

    if ExisteHistorico(qyColabSituacaoHst) then
      AdicionaLinha(sMsg, ' - Situação');

    if ExisteHistorico(qyColabSetorHst) then
      AdicionaLinha(sMsg, ' - Setor');

    if ExisteHistorico(qyColabEscalaHst) then
      AdicionaLinha(sMsg, ' - Escala');

    if ExisteHistorico(qyColabCargoHst) then
      AdicionaLinha(sMsg, ' - Cargo');

    if ExisteHistorico(qyColabSalarioHst) then
      AdicionaLinha(sMsg, ' - Salário');

    if Trim(sMsg) <> '' then
    begin
      sMsg := 'Colaborador não pode ser excluído, pois possui os seguintes históricos: ' +
              #13#13 + sMsg;

      Aviso(sMsg);
    end
    else if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyColaborador.Delete;
      Informacao('Colaborador excluído com sucesso.');
    end;
  end;
end;

function TDmERP.ColabDependenteValido : String;
begin
  Result := '';

  if Trim(qyColabDependentes.FieldByName('nmDependente').AsString) = '' then
    AdicionaLinha(Result, ' - Nome do dependente deve ser informado');

  if qyColabDependentes.FieldByName('cdGrauParentesco').IsNull then
    AdicionaLinha(Result, ' - Grau de parentesco deve ser informado');
end;

procedure TDmERP.GravarColabDependente;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ColabDependenteValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyColabDependentes.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyColabDependentes);
      qyColabDependentes.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Dependente inserido com sucesso.')
      else
        Informacao('Dependente alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirColabDependente;
begin
  if qyColabDependentes.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyColabDependentes.Delete;
      Informacao('Dependente excluído com sucesso.');
    end;
  end;
end;

function TDmERP.PedidoValido : String;
var
  stDados : TStringList;
begin
  Result := '';

  stDados := TStringList.Create;

  if StrToIntDef(qyPedido.FieldByName('cdPedidoTipo').AsString, 0) = 0 then
    AdicionaLinha(Result, ' - Tipo do Pedido deve ser informado');

  if StrToIntDef(qyPedido.FieldByName('cdPedidoSituacao').AsString, 0) = 0 then
    AdicionaLinha(Result, ' - Situação do Pedido deve ser informada');

  if qyPedido.FieldByName('dtEmissao').IsNull then
    AdicionaLinha(Result, ' - Data de emissão deve ser informada');

  if StrToIntDef(qyPedido.FieldByName('cdCliente').AsString, 0) = 0 then
    AdicionaLinha(Result, ' - Cliente deve ser informado');

  if StrToIntDef(qyPedido.FieldByName('cdEmpresa').AsString, 0) = 0 then
    AdicionaLinha(Result, ' - Empresa deve ser informada');

  if qyPedido.FieldByName('dtEntrega').IsNull then
    AdicionaLinha(Result, ' - Data de entrega deve ser informada');

  if StrToIntDef(qyPedido.FieldByName('cdNatureza').AsString, 0) = 0 then
    AdicionaLinha(Result, ' - Natureza deve ser informada');

  if Trim(qyPedido.FieldByName('cdTipoFrete').AsString) = '' then
    AdicionaLinha(Result, ' - Tipo de frete deve ser informado');

  if (not qyPedido.FieldByName('dtEmissao').IsNull) and
     (not qyPedido.FieldByName('dtEntrega').IsNull) and
     (qyPedido.FieldByName('dtEmissao').AsDateTime > qyPedido.FieldByName('dtEntrega').AsDateTime)then
    AdicionaLinha(Result, ' - Data de emissão não pode ser maior que a data de entrega');
{
  if qyUnidadeMedida.State = dsInsert then
  begin
    ExecuteSimplesSql(fdConnERP,
                      'SELECT a.cdUnidadeMedida ' +
                      '  FROM erp.unidadeMedida a ' +
                      ' WHERE a.cdUnidadeMedida = ' + QuotedStr(qyUnidadeMedida.FieldByName('cdUnidadeMedida').AsString),
                      'cdUnidadeMedida',
                      stDados
                     );

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
      AdicionaLinha(Result, ' - Código já informado para outro cadastro');
  end;

  if Trim(qyUnidadeMedida.FieldByName('deUnidadeMedida').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição deve ser informada');
}
  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarPedido;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := PedidoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyPedido.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyPedido);
      qyPedido.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Pedido inserido com sucesso.')
      else
        Informacao('Pedido alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirPedido;
begin
  if qyPedido.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyPedido.Delete;
      Informacao('Pedido excluído com sucesso.');
    end;
  end;
end;

function TDmERP.UnidadeMedidaValida : String;
var
  stDados : TStringList;
begin
  Result := '';

  stDados := TStringList.Create;

  if Trim(qyUnidadeMedida.FieldByName('cdUnidadeMedida').AsString) = '' then
    AdicionaLinha(Result, ' - Código deve ser informado')
  else if qyUnidadeMedida.State = dsInsert then
  begin
    ExecuteSimplesSql(fdConnERP,
                      'SELECT a.cdUnidadeMedida ' +
                      '  FROM erp.unidadeMedida a ' +
                      ' WHERE a.cdUnidadeMedida = ' + QuotedStr(qyUnidadeMedida.FieldByName('cdUnidadeMedida').AsString),
                      'cdUnidadeMedida',
                      stDados
                     );

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
      AdicionaLinha(Result, ' - Código já informado para outro cadastro');
  end;

  if Trim(qyUnidadeMedida.FieldByName('deUnidadeMedida').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição deve ser informada');

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarUnidadeMedida;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := UnidadeMedidaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyUnidadeMedida.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyUnidadeMedida);
      qyUnidadeMedida.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Unidade de medida inserida com sucesso.')
      else
        Informacao('Unidade de medida alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirUnidadeMedida;
begin
  if qyUnidadeMedida.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyUnidadeMedida.Delete;
      Informacao('Unidade de Medida excluída com sucesso.');
    end;
  end;
end;

function TDmERP.ItemGrupoValido : String;
begin
  Result := '';

  if Trim(qyItemGrupo.FieldByName('deItemGrupo').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição deve ser informada');
end;

procedure TDmERP.GravarItemGrupo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ItemGrupoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyItemGrupo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyItemGrupo);
      qyItemGrupo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Grupo de item inserido com sucesso.')
      else
        Informacao('Grupo de item alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirItemGrupo;
var
  stDados : TStringList;
begin
  if qyItemGrupo.Active then
  begin
    stDados := TStringList.Create;

    ExecuteSimplesSql(fdConnERP,
                      'SELECT a.cdItemSubGrupo ' +
                      '  FROM erp.itemSubGrupo a ' +
                      ' WHERE a.cdItemGrupo = ' + qyItemGrupo.FieldByName('cdItemGrupo').AsString,
                      'cdItemSubGrupo',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      Aviso('Este grupo possui subgrupos cadastrados e não pode ser excluído.')
    else  if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyItemGrupo.Delete;
      Informacao('Grupo de item excluído com sucesso.');
    end;

    if Assigned(stDados) then
      FreeAndNil(stDados);
  end;
end;

function TDmERP.ItemSubGrupoValido : String;
begin
  Result := '';

  if qyItemSubGrupo.FieldByName('cdItemGrupo').IsNull then
    AdicionaLinha(Result, ' - Código do grupo deve ser informado');

  if qyItemSubGrupo.FieldByName('cdItemSubGrupo').IsNull then
    AdicionaLinha(Result, ' - Código do subgrupo deve ser informado');

  if Trim(qyItemSubGrupo.FieldByName('deItemSubGrupo').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição deve ser informada');
end;

procedure TDmERP.GravarItemSubGrupo;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ItemSubGrupoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyItemSubGrupo.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyItemSubGrupo);
      qyItemSubGrupo.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Subgrupo de item inserido com sucesso.')
      else
        Informacao('Subgrupo de item alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirItemSubGrupo;
begin
  if qyItemSubGrupo.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyItemSubGrupo.Delete;
      Informacao('Subgrupo de item excluído com sucesso.');
    end;
  end;
end;

function TDmERP.ItemFamiliaValida : String;
begin
  Result := '';

  if Trim(qyItemFamilia.FieldByName('deItemFamilia').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição deve ser informada');
end;

procedure TDmERP.GravarItemFamilia;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ItemFamiliaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyItemFamilia.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyItemFamilia);
      qyItemFamilia.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Família de item inserida com sucesso.')
      else
        Informacao('Família de item alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirItemFamilia;
begin
  if qyItemFamilia.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyItemFamilia.Delete;
      Informacao('Família de item excluída com sucesso.');
    end;
  end;
end;

function TDmERP.ItemValido : String;
var
  stDados : TStringList;
begin
  Result := '';

  stDados := TStringList.Create;

  if Trim(qyItem.FieldByName('cdItem').AsString) = '' then
    AdicionaLinha(Result, ' - Código do item deve ser informado')
  else if qyItem.State = dsInsert then
  begin
    ExecuteSimplesSql(fdConnERP,
                      'SELECT a.cdItem ' +
                      '  FROM erp.item a ' +
                      ' WHERE a.cdItem = ' + QuotedStr(qyItem.FieldByName('cdItem').AsString),
                      'cdItem',
                      stDados
                     );

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
      AdicionaLinha(Result, ' - Código do item já informado para outro cadastro');
  end;

  if Trim(qyItem.FieldByName('deItem').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição do item deve ser informado');

  if qyItem.FieldByName('cdItemTipo').IsNull then
    AdicionaLinha(Result, ' - Tipo de item deve ser informado');

  if (qyItem.FieldByName('cdItemOrigem').IsNull) then
    AdicionaLinha(Result, ' - Origem de item deve ser informado');

  if (qyItem.FieldByName('cdIcmsTipo').IsNull) then
    AdicionaLinha(Result, ' - Tipo de ICMS deve ser informado');

  if (qyItem.FieldByName('cdIpiTipo').IsNull) then
    AdicionaLinha(Result, ' - Tipo de IPI deve ser informado');

  if (qyItem.FieldByName('cdPisTipo').IsNull) then
    AdicionaLinha(Result, ' - Tipo de Pis deve ser informado');

  if (qyItem.FieldByName('cdCofinsTipo').IsNull) then
    AdicionaLinha(Result, ' - Tipo de Cofins deve ser informado');

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarItem;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ItemValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyItem.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyItem);
      qyItem.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Item inserido com sucesso.')
      else
        Informacao('Item alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirItem;
begin
  if qyItem.Active then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyItem.Delete;
      Informacao('Item excluído com sucesso.');
    end;
  end;
end;

procedure TDmERP.qyReciboAvulsoAfterScroll(DataSet: TDataSet);
begin
  if (qyReciboAvulso.Active) and (not qyReciboAvulso.IsEmpty) then
  begin
    if Length(qyReciboAvulso.FieldByName('deCpfCnpj').AsString) = 14 then
      qyReciboAvulso.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
    else
      qyReciboAvulso.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';
  end;
end;

procedure TDmERP.qyReciboAvulsoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyReciboAvulso, 'reciboAvulso', 'cdReciboAvulso', qyReciboAvulso.FieldByName('cdReciboAvulso').AsInteger);
end;

procedure TDmERP.qyReciboAvulsoNewRecord(DataSet: TDataSet);
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(fdConnERP);

  qyReciboAvulso.FieldByName('dtReciboAvulso').AsDateTime := Trunc(dthrAtual);
end;

procedure TDmERP.qyRepresentanteAfterScroll(DataSet: TDataSet);
begin
  if qyRepresentante.FieldByName('flFisJur').AsString = 'J' then
    qyRepresentante.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    qyRepresentante.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';

  qyRepresentante.FieldByName('nuFone1').EditMask   := '(99) 9999-99999;0;_';
  qyRepresentante.FieldByName('nuFone2').EditMask   := '(99) 9999-99999;0;_';
  qyRepresentante.FieldByName('nuCelular').EditMask := '(99) 99999-9999;0;_';
  qyRepresentante.FieldByName('nuFax').EditMask     := '(99) 9999-99999;0;_';
  qyRepresentante.FieldByName('nuCep').EditMask     := '99999-999;0;_';
end;

procedure TDmERP.qyRepresentanteBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyRepresentante, 'representante', 'cdRepresentante', qyRepresentante.FieldByName('cdRepresentante').AsInteger);
end;

procedure TDmERP.qyRepresentanteNewRecord(DataSet: TDataSet);
begin
  qyRepresentante.FieldByName('flAtivo').AsString := 'S';
end;

procedure TDmERP.qySetorBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qySetor, 'setor', 'cdSetor', qySetor.FieldByName('cdSetor').AsInteger);
end;

procedure TDmERP.qySetorNewRecord(DataSet: TDataSet);
begin
  qySetor.FieldByName('flControlaBaixa').AsString    := 'N';
  qySetor.FieldByName('flEhSetorMontagem').AsString  := 'N';
  qySetor.FieldByName('flEhSetorEmbalagem').AsString := 'N';
  qySetor.FieldByName('flEhSetorExpedicao').AsString := 'N';
end;

procedure TDmERP.qyTelaBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyTela, 'tela', 'cdTela', qyTela.FieldByName('cdTela').AsInteger);
end;

procedure TDmERP.qyTelaNewRecord(DataSet: TDataSet);
begin
  qyTela.FieldByName('flAtivo').AsString := 'S';
end;

procedure TDmERP.qyTelasDisponiveisBeforeOpen(DataSet: TDataSet);
begin
  qyTelasDisponiveis.ParamByName('cdUsuario').AsInteger := qyUsuario.FieldByName('cdUsuario').AsInteger;
end;

procedure TDmERP.qyTempoDWBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyTempoDW, 'dw_tempo', 'cdTempo', qyTempoDW.FieldByName('cdTempo').AsInteger);
end;

procedure TDmERP.qyTransportadoraAfterScroll(DataSet: TDataSet);
begin
  if qyTransportadora.FieldByName('flFisJur').AsString = 'J' then
    qyTransportadora.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    qyTransportadora.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';

  qyTransportadora.FieldByName('nuFone1').EditMask   := '(99) 9999-99999;0;_';
  qyTransportadora.FieldByName('nuFone2').EditMask   := '(99) 9999-99999;0;_';
  qyTransportadora.FieldByName('nuFax').EditMask     := '(99) 9999-99999;0;_';
  qyTransportadora.FieldByName('nuCep').EditMask     := '99999-999;0;_';
end;

procedure TDmERP.qyTransportadoraBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyTransportadora, 'transportadora', 'cdTransportadora', qyTransportadora.FieldByName('cdTransportadora').AsInteger);
end;

procedure TDmERP.qyTransportadoraNewRecord(DataSet: TDataSet);
begin
  qyTransportadora.FieldByName('flAtivo').AsString         := 'S';
  qyTransportadora.FieldByName('flIsentoInscEst').AsString := 'S';
end;

procedure TDmERP.qyUsuarioAfterScroll(DataSet: TDataSet);
begin
  if qyUsuarioTela.Active then
    qyUsuarioTela.Close;

  qyUsuarioTela.Open();

  if qyTelasDisponiveis.Active then
    qyTelasDisponiveis.Close;

  qyTelasDisponiveis.Open();
end;

procedure TDmERP.qyUsuarioBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyUsuario, 'usuario', 'cdUsuario', qyUsuario.FieldByName('cdUsuario').AsInteger);
end;

procedure TDmERP.qyUsuarioMensagemBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyUsuarioMensagem, 'usuarioMensagem', 'cdUsuarioMensagem', qyUsuarioMensagem.FieldByName('cdUsuarioMensagem').AsInteger);
end;

procedure TDmERP.qyUsuarioNewRecord(DataSet: TDataSet);
begin
  qyUsuario.FieldByName('flAtivo').AsString := 'S';
  qyUsuario.FieldByName('deSenha').AsString := 'erp123';
end;

procedure TDmERP.qyUsuarioPesqAfterClose(DataSet: TDataSet);
begin
  qyUsuarioPesq.MacroByName('filtro').Clear;
end;

procedure TDmERP.qyUsuarioTelaBeforeOpen(DataSet: TDataSet);
begin
  qyUsuarioTela.ParamByName('cdUsuario').AsInteger := qyUsuario.FieldByName('cdUsuario').AsInteger;
end;

procedure TDmERP.qyUsuarioTelaBeforePost(DataSet: TDataSet);
begin
  GravarCamposAutomaticos(qyUsuarioTela);
end;

procedure TDmERP.qyVariavelAfterScroll(DataSet: TDataSet);
begin
  if qyVariavelItens.Active then
    qyVariavelItens.Close;

  qyVariavelItens.Open();
end;

procedure TDmERP.qyVariavelBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyVariavel, 'variavel', 'cdVariavel', qyVariavel.FieldByName('cdVariavel').AsInteger);
end;

procedure TDmERP.qyVariavelItensBeforeOpen(DataSet: TDataSet);
begin
  if qyVariavel.Active then
    qyVariavelItens.ParamByName('cdVariavel').AsInteger := qyVariavel.FieldByName('cdVariavel').AsInteger;
end;

procedure TDmERP.qyVariavelItensBeforePost(DataSet: TDataSet);
var
  stDados : TStringList;
begin
  if (qyVariavelItens.State = dsInsert) and (qyVariavel.Active) then
  begin
    qyVariavelItens.FieldByName('cdVariavel').AsInteger := qyVariavel.FieldByName('cdVariavel').AsInteger;

    stDados := TStringList.Create;

    try
      ExecuteSimplesSql(fdConnERP,
                        'SELECT MAX(cdVariavelItem) AS ultCod ' +
                        '  FROM erp.variavelItens ' +
                        ' WHERE cdVariavel = ' + qyVariavel.FieldByName('cdVariavel').AsString,
                        'ultCod',
                        stDados
                       );
      qyVariavelItens.FieldByName('cdVariavelItem').AsInteger := StrToIntDef(stDados.Strings[0], 0) + 1
    finally
      if Assigned(stDados) then
        FreeAndNil(stDados);
    end;
  end;
end;

procedure TDmERP.qyVeiculoAfterScroll(DataSet: TDataSet);
begin
  qyVeiculo.FieldByName('dePlaca').EditMask := 'LLL-9999;0;_';
end;

procedure TDmERP.qyVeiculoBeforePost(DataSet: TDataSet);
begin
  GerarCodigo(fdConnERP, qyVeiculo, 'veiculo', 'cdVeiculo', qyVeiculo.FieldByName('cdVeiculo').AsInteger);
end;

procedure TDmERP.DataModuleCreate(Sender: TObject);
var
  stConfig : TStringList;
begin
  if not (FileExists(ExtractFilePath(Application.ExeName) + 'ERP.ini')) then
  begin
    Erro('Arquivo de configuração não encontrado.');
    Application.Terminate;
  end
  else
  begin
    stConfig := TStringList.Create;
    stConfig.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ERP.ini');

    if stConfig.Count <> FiNumLinhasConfigERP then
    begin
      Erro('Arquivo de configuração incorreto.');
      Application.Terminate;
    end
    else
    begin
      fdConnERP.Connected   := False;
      fdConnERP.Params.Clear;
      fdConnERP.LoginPrompt := False;
      fdConnERP.DriverName  := stConfig.Values['DriverName'];

      fdConnERP.Params.Add(stConfig.Strings[1]); //DriverID
      fdConnERP.Params.Add(stConfig.Strings[2]); //Database
      fdConnERP.Params.Add(stConfig.Strings[3]); //Server
      fdConnERP.Params.Add(stConfig.Strings[4]); //Port
      fdConnERP.Params.Add(stConfig.Strings[5]); //User_Name
      fdConnERP.Params.Add(stConfig.Strings[6]); //Password

      try
        fdConnERP.Connected      := True;
        FTelaInicial.FsEndServer := stConfig.Values['Server'];
        //Chamar form de login

          {
        for i := 0 to tvMenu.Items.Count - 1 do
          if tvMenu.Items.Item[i].Parent = nil then
            tvMenu.Items.Item[i].Expanded := True;   }
      except
        on E: EFDDBEngineException do
        begin
          Erro(E.message);
          Application.Terminate;
        end;
      end;
    end;

    if Assigned(stConfig) then
      FreeAndNil(stConfig);
  end;
end;

procedure TDmERP.fdConnERPError(ASender, AInitiator: TObject;
  var AException: Exception);
var
  oExc: EFDDBEngineException;
begin
  if AException is EFDDBEngineException then
  begin
    oExc := EFDDBEngineException(AException);

    if oExc.Kind = ekRecordLocked then
      oExc.Message := 'O registro está ocupado. Tente novamente mais tarde.'
    else if (oExc.Kind = ekUKViolated) {and SameText(oExc[0].ObjName, 'UniqueKey_Orders')} then
      oExc.Message := 'Erro de chave primária. O código informado já existe';
  end;
end;

procedure TDmERP.qyTelaPesqAfterClose(DataSet: TDataSet);
begin
  qyTelaPesq.MacroByName('filtro').Clear;
end;

function TDmERP.ItemRelacionadoValido : String;
var
  stDados : TStringList;
  sSql    : String;
begin
  sSql    := '';
  stDados := TStringList.Create;
  Result  := '';

  if Trim(qyIntIndItemRelacionado.FieldByName('cdItem').AsString) = '' then
    AdicionaLinha(Result, ' - Código do item');

  if qyIntIndItemRelacionado.FieldByName('cdTamanho').IsNull then
    AdicionaLinha(Result, ' - Tamanho do item');

  if (Trim(Result) = '') then
  begin
    stDados.Clear;

    sSql := 'SELECT cdItemRelacionado, cdItemBase, deTamanhoBase ' +
            '  FROM erp.intIndItemRelacionado ' +
            ' WHERE cdItem = ' + QuotedStr(Trim(qyIntIndItemRelacionado.FieldByName('cdItem').AsString)) +
            '   AND cdTamanho = ' + qyIntIndItemRelacionado.FieldByName('cdTamanho').AsString;

    if qyIntIndItemRelacionado.FieldByName('cdItemRelacionado').AsInteger > 0 then
      sSql := sSql + ' AND cdItemRelacionado <> ' + qyIntIndItemRelacionado.FieldByName('cdItemRelacionado').AsString;

    ExecuteSimplesSql(fdConnERP, sSql, 'cdItemRelacionado,cdItemBase,deTamanhoBase', stDados);

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      AdicionaLinha(Result,
                    ' - Item e tamanho já relacionados ao item base ' + stDados.Strings[1] +
                    ', com tamanho base ' + stDados.Strings[2] +
                    ' no cadastro de código ' + stDados.Strings[0]
                   );
  end;

  if Trim(qyIntIndItemRelacionado.FieldByName('cdItemBase').AsString) = '' then
    AdicionaLinha(Result, ' - Código do item base');

  if qyIntIndItemRelacionado.FieldByName('cdTamanhoBase').IsNull then
    AdicionaLinha(Result, ' - Tamanho do item base');

  if (Trim(Result) = '') then
  begin
    stDados.Clear;

    sSql := 'SELECT cdItemRelacionado ' +
            '  FROM erp.intIndItemRelacionado ' +
            ' WHERE cdItem = ' + QuotedStr(Trim(qyIntIndItemRelacionado.FieldByName('cdItem').AsString)) +
            '   AND cdTamanho = ' + qyIntIndItemRelacionado.FieldByName('cdTamanho').AsString +
            '   AND cdItemBase = ' + QuotedStr(Trim(qyIntIndItemRelacionado.FieldByName('cdItemBase').AsString)) +
            '   AND cdTamanhoBase = ' + qyIntIndItemRelacionado.FieldByName('cdTamanhoBase').AsString;

    if qyIntIndItemRelacionado.FieldByName('cdItemRelacionado').AsInteger > 0 then
      sSql := sSql + ' AND cdItemRelacionado <> ' + qyIntIndItemRelacionado.FieldByName('cdItemRelacionado').AsString;

    ExecuteSimplesSql(fdConnERP, sSql, 'cdItemRelacionado', stDados);

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      AdicionaLinha(Result,
                    ' - Item e tamanho já relacionados ao item e tamanho base ' +
                    'informados no cadastro de código ' + stDados.Strings[0]
                   );
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarItemRelacionado;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := ItemRelacionadoValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyIntIndItemRelacionado.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyIntIndItemRelacionado);
      qyIntIndItemRelacionado.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Relacionamento de item  inserido com sucesso.')
      else
        Informacao('Relacionamento de item alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirItemRelacionado;
begin
  if (qyIntIndItemRelacionado.Active) then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyIntIndItemRelacionado.Delete;
      Informacao('Relacionamento de item excluído com sucesso.');
    end;
  end;
end;

function TDmERP.CargaValida : String;
begin
  Result := '';

  if qyIntComCarga.FieldByName('cdCarga').IsNull then
    AdicionaLinha(Result, ' - Código da carga')
  else
  begin
    try
      DmIntegracao.fdConnInteg.Connected := True;
      DmIntegracao.qyCargaPesq.Open();

      DmIntegracao.qyCargaPesq.First;

      if not DmIntegracao.qyCargaPesq.Locate('cdCarga',
                                             VarArrayOf([qyIntComCarga.FieldByName('cdCarga').AsInteger]),
                                             []
                                            ) then
        AdicionaLinha(Result, ' - Código da carga inválido')
      else
        qyIntComCarga.FieldByName('deCarga').AsString := DmIntegracao.qyCargaPesq.FieldByName('deCarga').AsString;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyCargaPesq.Active then
      DmIntegracao.qyCargaPesq.Close;

    DmIntegracao.fdConnInteg.Connected := False;
  end;
end;

procedure TDmERP.GravarCarga;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := CargaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyIntComCarga.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyIntComCarga);
      qyIntComCarga.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Carga inserida com sucesso.')
      else
        Informacao('Carga alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCarga;
begin
  if (qyIntComCarga.Active) then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyIntComCarga.Delete;
      Informacao('Carga excluída com sucesso.');
    end;
  end;
end;

function TDmERP.CargaAlertaValida : String;
begin
  Result := '';

  if Trim(qyIntComCargaAlerta.FieldByName('deCargaAlerta').AsString) = '' then
    AdicionaLinha(Result, ' - Descrição do alerta da carga');
end;

procedure TDmERP.GravarCargaAlerta;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := CargaAlertaValida;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyIntComCargaAlerta.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyIntComCargaAlerta);
      qyIntComCargaAlerta.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Alerta de carga inserido com sucesso.')
      else
        Informacao('Alerta de carga alterado com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirCargaAlerta;
begin
  if (qyIntComCargaAlerta.Active) then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      qyIntComCargaAlerta.Delete;
      Informacao('Alerta de carga excluído com sucesso.');
    end;
  end;
end;

function TDmERP.BaixaProducaoValida : TStringList;
var
  sSql,
  sdeSetorAnt,
  scdSetorAnt,
  sEhSetAntMont : String;
  stDados       : TStringList;

  function QtdeItemEstSetorAnt(const scdItem, scdTamanho : String; const bComEtiq : Boolean) : Integer;
  begin
    Result := 0;
    sSql   := 'SELECT COUNT(cdIdQtde) AS qtdBaixa ' +
              '  FROM erp.intIndBaixaProducao ' +
              ' WHERE flEmEstoque = ''S'' ' +
              '   AND cdItem = ' + QuotedStr(scdItem) +
              '   AND cdTamanho = ' + QuotedStr(scdTamanho) +
              '   AND cdSetor = ' + scdSetorAnt;

    if (qyIntIndBaixaProducao.FieldByName('flEhSetorExpedicao').AsString = 'S') or
       (bComEtiq) then
      sSql := sSql + ' AND cdPedido IS NOT NULL';

    stDados.Clear;

    ExecuteSimplesSql(fdConnERP,
                      sSql,
                      'qtdBaixa',
                      stDados
                     );
    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      Result := StrToIntDef(stDados.Strings[0], 0);
  end;

  function PedAgrupPertenceCarga(const snuPedido, snuCarga : String) : Boolean;
  var
    snuPedNovo : String;
  begin
    snuPedNovo := snuPedido;
    Result     := False;

    while StrToIntDef(snuPedNovo, 0) > 0 do
    begin
      stDados.Clear;

      ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                        'SELECT pa.pedido_novo ' +
                        '  FROM pedAgrup pa ' +
                        ' WHERE pa.pedido_ori = ' + snuPedNovo,
                        'pedido_novo',
                        stDados
                       );

      if (stDados.Count > 0) and
         (StrToIntDef(stDados.Strings[0], 0) > 0) then
      begin
        snuPedNovo := Trim(stDados.Strings[0]);

        stDados.Clear;

        ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                          'SELECT COALESCE(gp.codigo_grupoPed, 0) AS cdCarga ' +
                          '  FROM grupoPed gp ' +
                          ' WHERE COALESCE(gp.codigo_grupoPed, 0) = ' + snuCarga +
                          '   AND gp.nro_pedido = ' + snuPedNovo,
                          'cdCarga',
                          stDados
                         );

        if (stDados.Count > 0) and
           (StrToIntDef(stDados.Strings[0], 0) > 0) and
           (Trim(stDados.Strings[0]) = snuCarga) then
        begin
          Result     := True;
          snuPedNovo := '0';
        end;
      end
      else
        snuPedNovo := '0';
    end;
  end;
begin
  stDados := TStringList.Create;
  Result  := TStringList.Create;
  Result.Clear;

  if (qyIntIndBaixaProducao.FieldByName('cdSetor').AsInteger > 0) and
     (qyIntIndBaixaProducao.FieldByName('cdPedido').AsInteger > 0) and
     (qyIntIndBaixaProducao.FieldByName('cdSeqPed').AsInteger > 0) and
     (qyIntIndBaixaProducao.FieldByName('cdIdQtdeSeqPed').AsInteger > 0) then
  begin
    stDados.Clear;

    ExecuteSimplesSql(fdConnERP,
                      'SELECT cdSetor ' +
                      '  FROM erp.intIndBaixaProducao ' +
                      ' WHERE cdSetor = ' + qyIntIndBaixaProducao.FieldByName('cdSetor').AsString +
                      '   AND cdPedido = ' + qyIntIndBaixaProducao.FieldByName('cdPedido').AsString +
                      '   AND cdSeqPed = ' + qyIntIndBaixaProducao.FieldByName('cdSeqPed').AsString +
                      '   AND cdIdQtdeSeqPed = ' + qyIntIndBaixaProducao.FieldByName('cdIdQtdeSeqPed').AsString,
                      'cdSetor',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      Result.Add(' - Etiqueta já movimentada')
  end;

  if Result.Count = 0 then
  begin
    if (qyIntIndBaixaProducao.FieldByName('cdEmpresa').IsNull) or
       (qyIntIndBaixaProducao.FieldByName('cdEmpresa').AsInteger = 0) then
      Result.Add(' - Código da empresa');

    if (qyIntIndBaixaProducao.FieldByName('cdSetor').IsNull) or
       (qyIntIndBaixaProducao.FieldByName('cdSetor').AsInteger = 0) then
      Result.Add(' - Código do setor');

    if (Trim(qyIntIndBaixaProducao.FieldByName('cdItem').AsString) = '') then
      Result.Add(' - Código do item');

    if (qyIntIndBaixaProducao.FieldByName('cdTamanho').IsNull) then
      Result.Add(' - Código do tamanho');

    if (qyIntIndBaixaProducao.FieldByName('cdIdQtde').IsNull) then
      Result.Add(' - ID da quantidade');

    if (qyIntIndBaixaProducao.FieldByName('cdSetorAnterior').AsInteger > 0) and
       (qyIntIndBaixaProducao.FieldByName('cdIdQtdeAnterior').IsNull) and
       (not(
            (qyIntIndBaixaProducao.FieldByName('flEhSetorEmbalagem').AsString = 'S') and
            (
             (qyIntIndBaixaProducao.FieldByName('flEhRevenda').AsString = 'S') or
             (qyIntIndBaixaProducao.FieldByName('flEhAcessorio').AsString = 'S')
            )
           )
       ) then
      Result.Add(' - Item ' + qyIntIndBaixaProducao.FieldByName('cdItem').AsString +
                 ' no tamanho ' + qyIntIndBaixaProducao.FieldByName('deTamanho').AsString +
                 ' não existe no estoque do setor "' + qyIntIndBaixaProducao.FieldByName('deSetorAnt').AsString + '".' +
                 #13 + 'Verifique com o responsável deste setor.'
                );

    if Result.Count = 0 then
    begin
  //------------------------------------------------------------------------------
  //Início validações campos do pedido
      if (qyIntIndBaixaProducao.FieldByName('cdPedido').AsInteger > 0) then
      begin
        if (qyIntIndBaixaProducao.FieldByName('cdPedido').IsNull) then
          Result.Add(' - Código do Pedido');

        if (qyIntIndBaixaProducao.FieldByName('cdSeqPed').IsNull) then
          Result.Add(' - Sequência do pedido');

        if (qyIntIndBaixaProducao.FieldByName('cdIdQtdeSeqPed').IsNull) then
          Result.Add(' - ID da quantidade');

        if (qyIntIndBaixaProducao.FieldByName('cdPedido').AsInteger > 0) and
           (qyIntIndBaixaProducao.FieldByName('cdSeqPed').AsInteger > 0) then
        begin
          try
            DmIntegracao.fdConnInteg.Connected := True;

            DmIntegracao.qyPedido.MacroByName('filtro').Value := ' WHERE nuPedido = ' + qyIntIndBaixaProducao.FieldByName('cdPedido').AsString +
                                                                 '   AND seq = ' + qyIntIndBaixaProducao.FieldByName('cdSeqPed').AsString;
            DmIntegracao.qyPedido.Open;

            if DmIntegracao.qyPedido.IsEmpty then
              Result.Add(' - Item de pedido inválido')
            else
            begin
              if (qyIntIndBaixaProducao.FieldByName('flEhSetorExpedicao').AsString = 'S') and
                 (qyIntIndBaixaProducao.FieldByName('cdCarga').AsInteger <>
                  DmIntegracao.qyPedido.FieldByName('cdCarga').AsInteger
                 ) then
              begin
                if not PedAgrupPertenceCarga(qyIntIndBaixaProducao.FieldByName('cdPedido').AsString,
                                             qyIntIndBaixaProducao.FieldByName('cdCarga').AsString
                                            ) then
                  Result.Add(' - Etiqueta não pertence a carga da movimentação');
              end;
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
        end;
      end;
  //Fim validações campos do pedido
  //------------------------------------------------------------------------------
      if (Result.Count = 0) and (qyIntIndBaixaProducao.FieldByName('flMovEstSetorAnt').AsString = 'S') then
      begin
        stDados.Clear;

        ExecuteSimplesSql(fdConnERP,
                          'SELECT * ' +
                          '  FROM ( ' +
                          '        SELECT a.cdSetorAnterior, b.deSetor AS deSetorAnt, b.flEhSetorMontagem AS flEhSetAntMont ' +
                          '          FROM erp.setor a ' +
                          '          LEFT JOIN erp.setor b ON(b.cdSetor = a.cdSetorAnterior) ' +
                          '         WHERE a.cdSetor = ' + qyIntIndBaixaProducao.FieldByName('cdSetor').AsString +
                          '       ) t ',
                          'cdSetorAnterior,deSetorAnt,flEhSetAntMont',
                          stDados
                         );

        if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        begin
          scdSetorAnt   := Trim(stDados.Strings[0]);
          sdeSetorAnt   := Trim(stDados.Strings[1]);
          sEhSetAntMont := Trim(stDados.Strings[2]);

          if (QtdeItemEstSetorAnt(qyIntIndBaixaProducao.FieldByName('cdItem').AsString,
                                  qyIntIndBaixaProducao.FieldByName('cdTamanho').AsString,
                                  (qyIntIndBaixaProducao.FieldByName('cdPedido').AsInteger > 0) and
                                  (sEhSetAntMont = 'N')
                                 ) = 0
             ) then
          begin
            if (sEhSetAntMont = 'S') and
               (Trim(qyIntIndBaixaProducao.FieldByName('cdItemBase').AsString) <> '') then
            begin
              if (QtdeItemEstSetorAnt(qyIntIndBaixaProducao.FieldByName('cdItemBase').AsString,
                                      qyIntIndBaixaProducao.FieldByName('cdTamanho').AsString,
                                      (qyIntIndBaixaProducao.FieldByName('cdPedido').AsInteger > 0) and
                                      (sEhSetAntMont = 'N')
                                     ) = 0
                 ) then
                Result.Add(' - Setor "' + sdeSetorAnt +
                           '" ainda não movimentou este item ou a quantidade está zerada.' + #13 +
                           '  Avise o responsável para executar a movimentação.'
                          );
            end
            else if (
                     (qyIntIndBaixaProducao.FieldByName('flEhRevenda').AsString = 'N') and
                     (qyIntIndBaixaProducao.FieldByName('flEhAcessorio').AsString = 'N')
                    ) or
                    (
                     (
                      (qyIntIndBaixaProducao.FieldByName('flEhRevenda').AsString = 'S') or
                      (qyIntIndBaixaProducao.FieldByName('flEhAcessorio').AsString = 'S')
                     ) and
                     (qyIntIndBaixaProducao.FieldByName('flEhSetorExpedicao').AsString = 'S')
                    ) then
              Result.Add(' - Setor "' + sdeSetorAnt +
                         '" ainda não movimentou este item ou a quantidade está zerada.' + #13 +
                         '  Avise o responsável para executar a movimentação.'
                        );
          end;
        end;
      end;
    end;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarBaixaProducao;
begin
  fdConnERP.StartTransaction;

  try
    qyIntIndBaixaProducao.Post;
    fdConnERP.Commit;
  except
    on E: EFDDBEngineException do
    begin
      fdConnERP.Rollback;
      // do something here
      raise;
    end;
  end;
end;

procedure TDmERP.ExcluirBaixaProducao;
var
  stDados    : TStringList;
  sSql,
  scdItem,
  scdTamanho : String;
begin
  if qyIntIndBaixaProducao.Active then
  begin
    stDados := TStringList.Create;

    sSql := 'SELECT flEmEstoque ' +
            '  FROM erp.intIndBaixaProducao ' +
            ' WHERE cdItem = ' + QuotedStr(qyIntIndBaixaProducao.FieldByName('cdItem').AsString) +
            '   AND cdTamanho = ' + qyIntIndBaixaProducao.FieldByName('cdTamanho').AsString +
            '   AND cdIdQtde = ' + qyIntIndBaixaProducao.FieldByName('cdIdQtde').AsString +
            '   AND cdSetor = ' + qyIntIndBaixaProducao.FieldByName('cdSetor').AsString;

    ExecuteSimplesSql(fdConnERP, sSql, 'flEmEstoque', stDados);

    if (stDados.Count > 0) and (Trim(stDados.Strings[0]) = 'N') and (qyIntIndBaixaProducao.FieldByName('flEhSetorExpedicao').AsString = 'N') then
      Informacao('Item já baixado para outros setores.')
    else if Pergunta('Confirma a exclusão deste registro?') then
    begin
      if (qyIntIndBaixaProducao.FieldByName('cdSetorAnterior').AsInteger > 0) and
         (qyIntIndBaixaProducao.FieldByName('cdIdQtdeAnterior').AsInteger > 0) then
      begin
        scdItem    := qyIntIndBaixaProducao.FieldByName('cdItem').AsString;
        scdTamanho := qyIntIndBaixaProducao.FieldByName('cdTamanho').AsString;

        if (qyIntIndBaixaProducao.FieldByName('cdItemBase').AsString <> '') then
        begin
          scdItem    := qyIntIndBaixaProducao.FieldByName('cdItemBase').AsString;
          scdTamanho := qyIntIndBaixaProducao.FieldByName('cdTamanhoBase').AsString;
        end;

        sSql := 'UPDATE erp.intIndBaixaProducao a ' +
                '   SET flEmEstoque = ''S'' ' +
                ' WHERE a.cdItem = ' + QuotedStr(scdItem) +
                '   AND a.cdTamanho = ' + scdTamanho +
                '   AND a.cdSetor = ' + qyIntIndBaixaProducao.FieldByName('cdSetorAnterior').AsString +
                '   AND a.cdIdQtde = ' + qyIntIndBaixaProducao.FieldByName('cdIdQtdeAnterior').AsString;

        ExecuteInstrucaoSql(DmERP.fdConnERP, sSql);
      end;

      qyIntIndBaixaProducao.Delete;
      Informacao('Movimento de produção excluído com sucesso.');
    end;

    if Assigned(stDados) then
      FreeAndNil(stDados);
  end;
end;

function TDmERP.MaterialMovValido(const qyMov : TFDQuery) : String;
var
  stDados : TStringList;
begin
  stDados := TStringList.Create;
  Result  := '';

  if (Trim(qyMov.FieldByName('flTipoMovimento').AsString) = '') then
    AdicionaLinha(Result, ' - Tipo');

  if qyMov.FieldByName('cdSituacaoMovimento').IsNull then
    AdicionaLinha(Result, ' - Situação');

  if (Trim(qyMov.FieldByName('cdMaterial').AsString) = '') then
    AdicionaLinha(Result, ' - Material');

  if Trim(qyMov.FieldByName('cdUnidadeMedida').AsString) = '' then
    AdicionaLinha(Result, ' - Unidade de Medida deve ser informada');

  if qyMov.FieldByName('nuQtde').IsNull then
    AdicionaLinha(Result, ' - Quantidade');

  if (qyMov.FieldByName('flTipoMovimento').AsString = 'E') and
     (qyMov.FieldByName('cdSituacaoMovimento').AsInteger = 2) and
     (qyMov.FieldByName('vlUnitario').IsNull) then
    AdicionaLinha(Result, ' - Valor Unitário');

  if (qyMov.FieldByName('flTipoMovimento').AsString = 'E') and
     (qyMov.FieldByName('cdFornecedor').IsNull) then
    AdicionaLinha(Result, ' - Fornecedor');

  if (qyMov.FieldByName('flTipoMovimento').AsString = 'S') and
     (qyMov.FieldByName('cdMaterialSolicitacao').IsNull) then
    AdicionaLinha(Result, ' - Nº da Solicitação');

  if (qyMov.State = dsEdit) then
  begin
    if (qyMov.FieldByName('flTipoMovimento').AsString = 'E') then
    begin
      stDados.Clear;
      ExecuteSimplesSql(fdConnERP,
                        'SELECT cdMaterial,nuQtde,cdFornecedor,cdSituacaoMovimento ' +
                        '  FROM erp.intIndMaterialMovimento ' +
                        ' WHERE cdMaterialMovimento = ' + qyMov.FieldByName('cdMaterialMovimento').AsString,
                        'cdMaterial,nuQtde,cdFornecedor,cdSituacaoMovimento',
                        stDados
                       );

      if (stDados.Count > 0) then
      begin  {
        if (qyMov.FieldByName('cdSituacaoMovimento').AsInteger <> 1) then
        begin
          if (Trim(stDados.Strings[0]) <> '') and
             (Trim(stDados.Strings[0]) <> qyMov.FieldByName('cdMaterial').AsString) then
            AdicionaLinha(Result,
                          ' - Não é permitido alterar o material de um movimento de entrada que não se encontra na ' +
                          'situação "Cadastrado"'
                         );

          if (StrToFloatDef(stDados.Strings[1], 0) > 0) and
             (StrToFloatDef(stDados.Strings[1], 0) <> qyMov.FieldByName('nuQtde').AsFloat) then
            AdicionaLinha(Result,
                          ' - Não é permitido alterar a quantidade de um movimento de entrada que não se encontra na ' +
                          'situação "Cadastrado"'
                         );

          if (StrToIntDef(stDados.Strings[2], 0) > 0) and
             (StrToIntDef(stDados.Strings[2], 0) <> qyMov.FieldByName('cdFornecedor').AsInteger) then
            AdicionaLinha(Result,
                          ' - Não é permitido alterar o fornecedor de um movimento de entrada que não se encontra na ' +
                          'situação "Cadastrado"'
                         );
        end;        }

        if {(StrToIntDef(stDados.Strings[3], 0) = 2) and}
           (qyMov.FieldByName('flTipoMovimento').AsString = 'E') then
        begin
          if qyIntIndMatEstoqueConsulta.Active then
            qyIntIndMatEstoqueConsulta.Close;

          qyIntIndMatEstoqueConsulta.MacroByName('filtro').Clear;
          qyIntIndMatEstoqueConsulta.MacroByName('filtro').Value := ' WHERE cdMaterial = ' + QuotedStr(qyMov.FieldByName('cdMaterial').AsString);
          qyIntIndMatEstoqueConsulta.ParamByName('cdMatMovEnt').AsInteger := qyMov.FieldByName('cdMaterialMovimento').AsInteger;
          qyIntIndMatEstoqueConsulta.Open();

          if (qyIntIndMatEstoqueConsulta.FieldByName('nuQtdeEst').AsFloat +
              qyMov.FieldByName('nuQtde').AsFloat < 0
             ) then
            AdicionaLinha(Result,
                          ' - Entrada de material não pode ser alterada, pois o estoque deste material irá ficar negativo.'
                         );
        end;
      end;
    end;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TDmERP.GravarMaterialMov(const qyMov : TFDQuery; const bExibirMsg : Boolean);
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := MaterialMovValido(qyMov);

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyMov.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyMov);
      qyMov.Post;
      fdConnERP.Commit;

      if bExibirMsg then
      begin
        if bInserindo then
          Informacao('Movimentação de material inserida com sucesso.')
        else
          Informacao('Movimentação alterada com sucesso.');
      end;
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirMaterialMov(const qyMov : TFDQuery);
var
  bExcluir : Boolean;
begin
  bExcluir := True;

  if (qyMov.Active) then
  begin
    if (qyMov.FieldByName('flTipoMovimento').AsString = 'E') and
       (qyMov.FieldByName('cdSituacaoMovimento').AsInteger <> 1) then
    begin
      Aviso('Esta entrada de material não pode ser excluída pois não se encontra na situação cadastrada.');
      bExcluir := False;
    end
    else if (qyMov.FieldByName('flTipoMovimento').AsString = 'E') then
    begin
      if qyIntIndMatEstoqueConsulta.Active then
        qyIntIndMatEstoqueConsulta.Close;

      qyIntIndMatEstoqueConsulta.MacroByName('filtro').Clear;
      qyIntIndMatEstoqueConsulta.MacroByName('filtro').Value := ' WHERE cdMaterial = ' + QuotedStr(qyMov.FieldByName('cdMaterial').AsString);
      qyIntIndMatEstoqueConsulta.ParamByName('cdMatMovEnt').AsInteger := qyMov.FieldByName('cdMaterialMovimento').AsInteger;
      qyIntIndMatEstoqueConsulta.Open();

      if qyIntIndMatEstoqueConsulta.FieldByName('nuQtdeEst').AsFloat < 0 then
      begin
        Aviso('Esta entrada de material não pode ser excluída, pois o estoque deste material irá ficar negativo.');
        bExcluir := False;
      end;
    end;

    if (bExcluir) and (Pergunta('Confirma a exclusão deste registro?')) then
    begin
      qyMov.Delete;
      Informacao('Movimentação de material excluída com sucesso.');
    end;
  end;
end;

function TDmERP.MaterialSolicValido : String;
begin
  Result := '';

  if (qyIntIndMaterialSolic.FieldByName('flTipoSolicitacao').AsString = 'I') and
     (qyIntIndMaterialSolic.FieldByName('cdSolicitante').IsNull) then
    AdicionaLinha(Result, ' - Solicitante');

  if (qyIntIndMaterialSolic.FieldByName('flTipoSolicitacao').AsString = 'E') and
     (Trim(qyIntIndMaterialSolic.FieldByName('nmSolicitante').AsString) = '') then
    AdicionaLinha(Result, ' - Nome Solicitante');
end;

procedure TDmERP.GravarMaterialSolic;
var
  strValidacao : String;
  bInserindo   : Boolean;
begin
  strValidacao := MaterialSolicValido;

  if Trim(strValidacao) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + strValidacao)
  else
  begin
    bInserindo := qyIntIndMaterialSolic.State = dsInsert;
    fdConnERP.StartTransaction;

    try
      GravarCamposAutomaticos(qyIntIndMaterialSolic);
      qyIntIndMaterialSolic.Post;
      fdConnERP.Commit;

      if bInserindo then
        Informacao('Solicitação de material inserida com sucesso.')
      else
        Informacao('Solicitação de material alterada com sucesso.');
    except
      on E: EFDDBEngineException do
      begin
        fdConnERP.Rollback;
        // do something here
        raise;
      end;
    end;
  end;
end;

procedure TDmERP.ExcluirMaterialSolic;
begin
  if (qyIntIndMaterialSolic.Active) then
  begin
    if Pergunta('Confirma a exclusão deste registro?') then
    begin
      ExecuteInstrucaoSql(fdConnERP,
                          'DELETE FROM erp.intIndMaterialMovimento ' +
                          ' WHERE cdMaterialSolicitacao = ' + qyIntIndMaterialSolic.FieldByName('cdMaterialSolicitacao').AsString
                         );

      qyIntIndMaterialSolic.Delete;
      Informacao('Solicitação de material excluída com sucesso.');
    end;
  end;
end;

end.
