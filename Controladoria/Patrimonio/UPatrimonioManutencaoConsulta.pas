unit UPatrimonioManutencaoConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFPatrimonioManutencaoConsulta = class(TForm)
    dsDados: TDataSource;
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    gbFiltros: TGroupBox;
    lbdtManutencao: TLabel;
    eddtManutencaoIni: TDateTimePicker;
    lbdtManutencaoA: TLabel;
    eddtManutencaoFim: TDateTimePicker;
    btConsultar: TBitBtn;
    lbdePatrimonio: TLabel;
    eddePatrimonio: TEdit;
    lbcdPatrimonio: TLabel;
    edcdPatrimonio: TDBCampoCodigo;
    eddtTerminoFim: TDateTimePicker;
    lbdtTerminoA: TLabel;
    eddtTerminoIni: TDateTimePicker;
    lbdtTermino: TLabel;
    dsSetor: TDataSource;
    lbcdSituacao: TLabel;
    lcbcdSituacao: TDBLookupComboBox;
    lbcdSetor: TLabel;
    lcbcdSetor: TDBLookupComboBox;
    btFechar: TBitBtn;
    btLimparSetor: TBitBtn;
    btLimparSit: TBitBtn;
    vtDados: TVirtualTable;
    vtDadosflSelecionado: TStringField;
    vtDadoscdSituacao: TIntegerField;
    vtDadosdeSituacao: TStringField;
    vtDadoscdPatrimonioManutencao: TIntegerField;
    vtDadoscdPatrimonio: TIntegerField;
    vtDadosdePatrimonio: TStringField;
    vtDadosdtManutencao: TDateTimeField;
    vtDadosderesponsavel: TStringField;
    vtDadosdeManutencao: TStringField;
    vtDadosdtTermino: TDateTimeField;
    qySetor: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure btLimparSetorClick(Sender: TObject);
    procedure btLimparSitClick(Sender: TObject);
    procedure grDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grDadosCellClick(Column: TColumn);
    procedure vtDadosflSelecionadoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    procedure AplicarFiltro;
  public
    { Public declarations }
  end;

var
  FPatrimonioManutencaoConsulta: TFPatrimonioManutencaoConsulta;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

procedure TFPatrimonioManutencaoConsulta.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFPatrimonioManutencaoConsulta.btFecharClick(Sender: TObject);
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

procedure TFPatrimonioManutencaoConsulta.btLimparSetorClick(Sender: TObject);
begin
  lcbcdSetor.KeyValue := 0;
end;

procedure TFPatrimonioManutencaoConsulta.btLimparSitClick(Sender: TObject);
begin
  lcbcdSituacao.KeyValue := 0;
end;

procedure TFPatrimonioManutencaoConsulta.AplicarFiltro;
var
  sWhere : String;
  i      : Integer;
begin
  vtDados.Clear;

  if (DmERP.qyPatrimonioManutPesq.Active) then
    DmERP.qyPatrimonioManutPesq.Close;

  DmERP.qyPatrimonioManutPesq.MacroByName('filtro').Clear;

  sWhere := '';

  if (eddtManutencaoIni.Checked) and
     (eddtManutencaoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtManutencaoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtManutencaoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtManutencao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtManutencaoIni.DateTime)) +
                    '                  AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtManutencaoFim.DateTime))
                   );

  if (eddtTerminoIni.Checked) and
     (eddtTerminoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtTerminoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtTerminoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtTermino BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtTerminoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtTerminoFim.DateTime))
                   );

  if (lcbcdSetor.KeyValue > 0) then
    AdicionaCondSql(sWhere, ' cdSetor = ' + IntToStr(lcbcdSetor.KeyValue));

  if (lcbcdSituacao.KeyValue > 0) then
    AdicionaCondSql(sWhere, ' cdSituacao = ' + IntToStr(lcbcdSituacao.KeyValue));

  if (Trim(edcdPatrimonio.ERPEdCampoChaveText) <> '') then
    AdicionaCondSql(sWhere, ' cdPatrimonio = ' + edcdPatrimonio.ERPEdCampoChaveText);

  if (Trim(eddePatrimonio.Text) <> '') then
    AdicionaCondSql(sWhere, ' LOWER(dePatrimonio) LIKE ' + QuotedStr('%' + LowerCase(eddePatrimonio.Text) + '%'));

  if Trim(sWhere) <> '' then
    DmERP.qyPatrimonioManutPesq.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyPatrimonioManutPesq.Open();

  if DmERP.qyPatrimonioManutPesq.IsEmpty then
    Aviso('Não existem manutenções cadastradas com os filtros informados.')
  else
  begin
    try
      vtDados.DisableControls;

      DmERP.qyPatrimonioManutPesq.First;

      while not DmERP.qyPatrimonioManutPesq.Eof do
      begin
        vtDados.Insert;
        vtDados.FieldByName('flSelecionado').AsString := 'N';

        for i := 0 to DmERP.qyPatrimonioManutPesq.FieldCount - 1 do
        begin
          if Assigned(vtDados.FindField(DmERP.qyPatrimonioManutPesq.Fields.Fields[i].FieldName)) then
            vtDados.FieldByName(DmERP.qyPatrimonioManutPesq.Fields.Fields[i].FieldName).Value := DmERP.qyPatrimonioManutPesq.Fields.Fields[i].Value;
        end;

        vtDados.Post;

        DmERP.qyPatrimonioManutPesq.Next;
      end;
    finally
      vtDados.First;
      vtDados.EnableControls;
    end;
  end;
end;

procedure TFPatrimonioManutencaoConsulta.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  btConsultar.Glyph.LoadFromResourceName(HInstance,   'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,      'IMGBTFECHAR_32X32');
  btLimparSetor.Glyph.LoadFromResourceName(HInstance, 'IMGBTCANCELAR_16X16');
  btLimparSit.Glyph.LoadFromResourceName(HInstance,   'IMGBTCANCELAR_16X16');

  qySetor.Open();

  if DmERP.qyPatrimonioSituacao.Active then
    DmERP.qyPatrimonioSituacao.Close;

  DmERP.qyPatrimonioSituacao.Open();

  dtAtual                    := DataHoraAtual(DmERP.fdConnERP);

  eddtTerminoIni.DateTime    := dtAtual;
  eddtTerminoFim.DateTime    := IncMonth(dtAtual, 3);
  eddtTerminoIni.Checked     := False;
  eddtTerminoFim.Checked     := False;

  eddtManutencaoIni.DateTime := dtAtual - 10;
  eddtManutencaoFim.DateTime := dtAtual + 10;

  vtDados.Open;
end;

procedure TFPatrimonioManutencaoConsulta.grDadosCellClick(Column: TColumn);
begin
  if SameText(Column.FieldName, 'flSelecionado') then
  begin
    vtDados.Edit;

    if UpperCase(vtDados.FieldByName('flSelecionado').AsString) = 'N' then
      vtDados.FieldByName('flSelecionado').AsString := 'S'
    else
      vtDados.FieldByName('flSelecionado').AsString := 'N';

    vtDados.Post;
  end;
end;

procedure TFPatrimonioManutencaoConsulta.grDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap : TBitmap;
begin
  if SameText(Column.FieldName, 'flSelecionado') then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(vtDados.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grDados.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end;
end;

procedure TFPatrimonioManutencaoConsulta.vtDadosflSelecionadoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flSelecionado') then
    Text := '';
end;

initialization
  RegisterClass(TFPatrimonioManutencaoConsulta);

finalization
  UnRegisterClass(TFPatrimonioManutencaoConsulta);

end.
