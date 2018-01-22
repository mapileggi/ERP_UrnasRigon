unit UIntComPedidosAntigos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet, frxExportPDF;

type
  TFIntComPedidosAntigos = class(TForm)
    dsDados: TDataSource;
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    gbFiltros: TGroupBox;
    lbdtPedido: TLabel;
    eddtPedidoIni: TDateTimePicker;
    lbdtPedidoA: TLabel;
    eddtPedidoFim: TDateTimePicker;
    btConsultar: TBitBtn;
    lbnmCliente: TLabel;
    ednmCliente: TEdit;
    btFechar: TBitBtn;
    ednmFantasia: TEdit;
    lbnmFantasia: TLabel;
    ednmCidadeCli: TEdit;
    lbnmCidadeCli: TLabel;
    lbnmVendedor: TLabel;
    ednmVendedor: TEdit;
    lbdeUfCli: TLabel;
    cbdeUfCli: TComboBox;
    lbdeItem: TLabel;
    eddeItem: TEdit;
    lbdeCor: TLabel;
    eddeCor: TEdit;
    dsDadosItens: TDataSource;
    grItensPed: TDBGrid;
    lbItensPedido: TLabel;
    lbPedidos: TLabel;
    lbcdCliAnt: TLabel;
    edcdCliAnt: TEdit;
    btImprimir: TBitBtn;
    dbRelPedAnt: TfrxDBDataset;
    relPedAnt: TfrxReport;
    dbRelItemPedAnt: TfrxDBDataset;
    pnTotaisPedido: TPanel;
    lbQtdTotal: TLabel;
    lbTotaisPedido: TLabel;
    edTotaisPedido: TEdit;
    edQtdTotal: TEdit;
    lbValorTotal: TLabel;
    edValorTotal: TEdit;
    pdfExport: TfrxPDFExport;
    btExportar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure grDadosCellClick(Column: TColumn);
    procedure btExportarClick(Sender: TObject);
  private
    procedure AplicarFiltro;
    procedure CalculaTotaisPedido;
    procedure GerarRelatorio(const bExportar : Boolean);
  public
    { Public declarations }
  end;

var
  FIntComPedidosAntigos: TFIntComPedidosAntigos;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

procedure TFIntComPedidosAntigos.CalculaTotaisPedido;
var
  iQtdTotal   : Integer;
  cValorTotal : Currency;
begin
  iQtdTotal   := 0;
  cValorTotal := 0;

  try
    DmErp.qyIntComItensPedAntigos.DisableControls;

    DmErp.qyIntComItensPedAntigos.First;

    while not DmErp.qyIntComItensPedAntigos.Eof do
    begin
      iQtdTotal   := iQtdTotal   + DmErp.qyIntComItensPedAntigos.FieldByName('nuQtde').AsInteger;
      cValorTotal := cValorTotal + DmErp.qyIntComItensPedAntigos.FieldByName('vlTotal').AsCurrency;
      DmErp.qyIntComItensPedAntigos.Next;
    end;
  finally
    DmErp.qyIntComItensPedAntigos.EnableControls;

    edQtdTotal.Text     := FormatFloat('###', iQtdTotal);
    edValorTotal.Text   := 'R$ ' + FormatFloat('#,##0.00', cValorTotal);
    edTotaisPedido.Text := DmErp.qyIntComPedidosAntigos.FieldByName('nuPedido').AsString;
  end;
end;

procedure TFIntComPedidosAntigos.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFIntComPedidosAntigos.btExportarClick(Sender: TObject);
begin
  GerarRelatorio(True);
end;

procedure TFIntComPedidosAntigos.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  dsDados.DataSet.Close;

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

procedure TFIntComPedidosAntigos.btImprimirClick(Sender: TObject);
begin
  GerarRelatorio(False);
end;

procedure TFIntComPedidosAntigos.GerarRelatorio(const bExportar : Boolean);
var
  sWhere : String;
begin
  if not DmErp.qyIntComPedidosAntigos.IsEmpty then
  begin
    sWhere := DmERP.qyIntComPedidosAntigos.MacroByName('filtro').Value;
    DmERP.qyIntComPedidosAntigos.MacroByName('filtro').Value := ' WHERE cdPedido = ' + DmERP.qyIntComPedidosAntigos.FieldByName('cdPedido').AsString;

    relPedAnt.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relPedAnt.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relPedAnt.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    if bExportar then
    begin
      pdfExport.Filename := ExtractFilePath(Application.ExeName) + 'Pedido_' +
                            DmERP.qyIntComPedidosAntigos.FieldByName('cdPedido').AsString + '.pdf';
      relPedAnt.Export(pdfExport);
    end
    else
      relPedAnt.ShowReport();

    DmERP.qyIntComPedidosAntigos.Close;
    DmERP.qyIntComPedidosAntigos.MacroByName('filtro').Value := sWhere;
    DmERP.qyIntComPedidosAntigos.Open;
  end;
end;

procedure TFIntComPedidosAntigos.AplicarFiltro;
var
  sWhere : String;
  i      : Integer;
begin
  if (DmERP.qyIntComPedidosAntigos.Active) then
    DmERP.qyIntComPedidosAntigos.Close;

  sWhere := '';

  if (eddtPedidoIni.Checked) and
     (eddtPedidoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtPedidoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtPedidoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtPedido BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtPedidoIni.DateTime)) +
                    '              AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtPedidoFim.DateTime))
                   );

  if (Trim(ednmCliente.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmCliente) LIKE ' + QuotedStr('%' + LowerCase(ednmCliente.Text) + '%'));

  if (Trim(ednmFantasia.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmFantasiaCliente) LIKE ' + QuotedStr('%' + LowerCase(ednmFantasia.Text) + '%'));

  if (Trim(ednmCidadeCli.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmCidadeCli) LIKE ' + QuotedStr('%' + LowerCase(ednmCidadeCli.Text) + '%'));

  if (Trim(ednmVendedor.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(nmVendedor) LIKE ' + QuotedStr('%' + LowerCase(ednmVendedor.Text) + '%'));

  if (cbdeUfCli.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' UPPER(deUfCli) LIKE ' + QuotedStr('%' + UpperCase(cbdeUfCli.Text) + '%'));

  if (Trim(eddeItem.Text) <> '') then
    AdicionaCondSql(sWhere,
                    ' EXISTS ( ' +
                    '         SELECT ip.cdItem ' +
                    '           FROM erp.intComItensPedAntigos ip ' +
                    '          WHERE ip.cdPedido = p.cdPedido ' +
                    '            AND LOWER(deItem) LIKE ' + QuotedStr('%' + LowerCase(eddeItem.Text) + '%') +
                    '        ) '
                   );

  if (Trim(eddeCor.Text) <> '') then
    AdicionaCondSql(sWhere,
                    ' EXISTS ( ' +
                    '         SELECT ip.cdItem ' +
                    '           FROM erp.intComItensPedAntigos ip ' +
                    '          WHERE ip.cdPedido = p.cdPedido ' +
                    '            AND LOWER(deCor) LIKE ' + QuotedStr('%' + LowerCase(eddeCor.Text) + '%') +
                    '        ) '
                   );

  if StrToIntDef(edcdCliAnt.Text, 0) > 0 then
    AdicionaCondSql(sWhere, ' cdCliAnt = ' + edcdCliAnt.Text);

  if Trim(sWhere) <> '' then
    DmERP.qyIntComPedidosAntigos.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyIntComPedidosAntigos.Open();

  if DmERP.qyIntComPedidosAntigos.IsEmpty then
    Aviso('Não existem pedidos antigos cadastrados com os filtros informados.')
  else
    CalculaTotaisPedido;
end;

procedure TFIntComPedidosAntigos.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');
  btImprimir.Glyph.LoadFromResourceName(HInstance,  'IMGBTIMPRIMIR_32X32');

  dtAtual                    := DataHoraAtual(DmERP.fdConnERP);

  eddtPedidoIni.DateTime    := dtAtual;
  eddtPedidoFim.DateTime    := dtAtual;
  eddtPedidoIni.Checked     := False;
  eddtPedidoFim.Checked     := False;
end;

procedure TFIntComPedidosAntigos.grDadosCellClick(Column: TColumn);
begin
  CalculaTotaisPedido;
end;

initialization
  RegisterClass(TFIntComPedidosAntigos);

finalization
  UnRegisterClass(TFIntComPedidosAntigos);

end.
