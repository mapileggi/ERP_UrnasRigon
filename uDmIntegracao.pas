unit uDmIntegracao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.DB2, FireDAC.Phys.DB2Def, FireDAC.Phys.ODBCBase,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TDmIntegracao = class(TDataModule)
    fdConnInteg: TFDConnection;
    dlPhysDB2: TFDPhysDB2DriverLink;
    qyCliente: TFDQuery;
    qyCidade: TFDQuery;
    qyItens: TFDQuery;
    qyItensVarItens: TFDQuery;
    qyPedido: TFDQuery;
    qyClientesSemPed: TFDQuery;
    qyPedAgrup: TFDQuery;
    qyCargaPesq: TFDQuery;
    qyListaPreco: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qyCargaPesqcdCarga: TIntegerField;
    qyCargaPesqdeCarga: TStringField;
    qyRepresentante: TFDQuery;
    qyFornecedor: TFDQuery;
    qyFornecedorTipo: TFDQuery;
    qyClassifFiscal: TFDQuery;
    qyClasFisTaxaIbpt: TFDQuery;
    qyItem: TFDQuery;
    qyVariavelItens: TFDQuery;
    qyVinculoItem: TFDQuery;
    qyTitulo: TFDQuery;
    qyTransportadora: TFDQuery;
    qyNatureza: TFDQuery;
    qyCentroCusto: TFDQuery;
    qyItemGrupo: TFDQuery;
    qyItemSubGrupo: TFDQuery;
    qyVariavel: TFDQuery;
    qyItemCombinacaoVenda: TFDQuery;
    qyVendasDW: TFDQuery;
    qyPedidoAgrup: TFDQuery;
    qyCotaFin: TFDQuery;
    qyCarga: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    qyCarganuPedido: TIntegerField;
    procedure fdConnIntegError(ASender, AInitiator: TObject;
      var AException: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
    function RetornaRefPadrao(const sRefOriginal : String) : String;
  end;

var
  DmIntegracao: TDmIntegracao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDmIntegracao.RetornaRefPadrao(const sRefOriginal : String) : String;
begin
  Result := sRefOriginal;
end;

procedure TDmIntegracao.fdConnIntegError(ASender, AInitiator: TObject;
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

end.
