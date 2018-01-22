unit UIntComCotaFinanceira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Error,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, UDBCampoCodigo, MemDS, VirtualTable, StrUtils,
  Vcl.Menus;

type
  TFIntComCotaFinanceira = class(TForm)
    dsDados: TDataSource;
    vtPedidoEmCarga: TVirtualTable;
    nro_pedido: TIntegerField;
    vtPedidoEmCargarecnum: TIntegerField;
    vtPedidoEmCargacodigo_grupoPed: TIntegerField;
    vtPedidoEmCargacodigo_transp: TIntegerField;
    vtPedidoEmCargadata_emissao: TDateField;
    vtPedidoEmCargaobservacao: TStringField;
    vtPedidoEmCargaseq: TIntegerField;
    vtPedidoEmCargaflag_faturado: TStringField;
    vtPedidoEmCargadt_embarque: TDateField;
    vtPedidoEmCargahora_embarque: TStringField;
    vtPedidoEmCargacubagem: TFloatField;
    vtPedidoEmCargapeso_liquido: TFloatField;
    vtPedidoEmCargapeso_bruto: TFloatField;
    vtPedidoEmCargacod_veiculo: TIntegerField;
    vtPedidoEmCargacod_condutor: TIntegerField;
    grDados: TDBGrid;
    pnBotoes: TPanel;
    btFechar: TBitBtn;
    btSalvar: TBitBtn;
    lbdePeriodo: TLabel;
    eddePeriodo: TDBCampoCodigo;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eddePeriodoERPOnEdCampoChaveExit(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FecharConexaoIntegracao;
  public
    { Public declarations }
  end;

var
  FIntComCotaFinanceira: TFIntComCotaFinanceira;

implementation

{$R *.dfm}
{$R Icones.res}

uses
  uDmIntegracao, uDmERP, UTelaInicial, uFuncoes;

procedure TFIntComCotaFinanceira.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  FecharConexaoIntegracao;

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

procedure TFIntComCotaFinanceira.btSalvarClick(Sender: TObject);
begin
  if (DmERP.qyIntComCotaFin.Active) and (DmERP.qyIntComCotaFin.State in dsEditModes) then
    DmERP.qyIntComCotaFin.Post;
end;

procedure TFIntComCotaFinanceira.eddePeriodoERPOnEdCampoChaveExit(
  Sender: TObject);
var
  sListaRep : String;
begin
  if DmERP.qyIntComCotaFin.Active then
    DmERP.qyIntComCotaFin.Close;

  DmERP.qyIntComCotaFin.MacroByName('filtro').Clear;

  if DmIntegracao.qyCotaFin.Active then
    DmIntegracao.qyCotaFin.Close;

  DmIntegracao.qyCotaFin.MacroByName('filtro').Clear;

  if eddePeriodo.ERPValorValido then
  begin
    DmIntegracao.qyCotaFin.MacroByName('filtro').Value := ' WHERE dePeriodo = ' + QuotedStr(eddePeriodo.ERPEdCampoChaveText);
    DmIntegracao.qyCotaFin.Open();

    if DmIntegracao.qyCotaFin.IsEmpty then
      ExecuteInstrucaoSql(DmERP.fdConnERP, 'DELETE FROM erp.intComCotaFinanceira WHERE dePeriodo = ' + QuotedStr(eddePeriodo.ERPEdCampoChaveText))
    else
    begin
      sListaRep := '';
      DmIntegracao.qyCotaFin.First;

      while not DmIntegracao.qyCotaFin.Eof do
      begin
        if Trim(sListaRep) = '' then
          sListaRep := DmIntegracao.qyCotaFin.FieldByName('cdRepresentante').AsString
        else
          sListaRep := sListaRep + ', ' + DmIntegracao.qyCotaFin.FieldByName('cdRepresentante').AsString;

        if DmERP.qyIntComCotaFin.Active then
          DmERP.qyIntComCotaFin.Close;

        DmERP.qyIntComCotaFin.MacroByName('filtro').Clear;

        DmERP.qyIntComCotaFin.MacroByName('filtro').Value := ' WHERE dePeriodo = ' + QuotedStr(eddePeriodo.ERPEdCampoChaveText) +
                                                             '   AND cdRepresentante = ' + DmIntegracao.qyCotaFin.FieldByName('cdRepresentante').AsString;
        DmERP.qyIntComCotaFin.Open();

        if DmERP.qyIntComCotaFin.IsEmpty then
        begin
          DmERP.qyIntComCotaFin.Insert;

          DmERP.qyIntComCotaFin.FieldByName('cdRepresentante').AsInteger := DmIntegracao.qyCotaFin.FieldByName('cdRepresentante').AsInteger;
          DmERP.qyIntComCotaFin.FieldByName('dePeriodo').AsString        := DmIntegracao.qyCotaFin.FieldByName('dePeriodo').AsString;
        end
        else
          DmERP.qyIntComCotaFin.Edit;

        DmERP.qyIntComCotaFin.FieldByName('nmRepresentante').AsString    := DmIntegracao.qyCotaFin.FieldByName('deRep').AsString;
        DmERP.qyIntComCotaFin.FieldByName('vlFatPrevisto').AsCurrency    := DmIntegracao.qyCotaFin.FieldByName('vlPrevisto').AsCurrency;

        DmERP.qyIntComCotaFin.Post;

        DmIntegracao.qyCotaFin.Next;
      end;

      ExecuteInstrucaoSql(DmERP.fdConnERP,
                          'DELETE FROM erp.intComCotaFinanceira ' +
                          ' WHERE dePeriodo = ' + QuotedStr(eddePeriodo.ERPEdCampoChaveText) +
                          '   AND cdRepresentante NOT IN(' + sListaRep + ')'
                         );

      DmERP.qyIntComCotaFin.Refresh;
    end;

    if DmERP.qyIntComCotaFin.Active then
      DmERP.qyIntComCotaFin.Close;

    DmERP.qyIntComCotaFin.MacroByName('filtro').Clear;

    DmERP.qyIntComCotaFin.MacroByName('filtro').Value := ' WHERE dePeriodo = ' + QuotedStr(eddePeriodo.ERPEdCampoChaveText);
    DmERP.qyIntComCotaFin.Open();
  end;
end;

procedure TFIntComCotaFinanceira.FecharConexaoIntegracao;
begin
  if DmIntegracao.qyCotaFin.Active then
    DmIntegracao.qyCotaFin.Close;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFIntComCotaFinanceira.FormCreate(Sender: TObject);
begin
  btSalvar.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance, 'IMGBTFECHAR_32X32');
end;

procedure TFIntComCotaFinanceira.FormShow(Sender: TObject);
begin
  eddePeriodo.ERPEdCampoChaveSetFocus;
end;

initialization
  RegisterClass(TFIntComCotaFinanceira);

finalization
  UnRegisterClass(TFIntComCotaFinanceira);

end.
