unit UIntComCargaEmAberto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MemDS, VirtualTable, Vcl.Menus, frxClass, frxDBSet;

type
  TFIntComCargaEmAberto = class(TForm)
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    lbDuploClicObs: TLabel;
    dsIntComCargaPesq: TDataSource;
    btFechar: TBitBtn;
    btConsultar: TBitBtn;
    vtIntComCargaPesq: TVirtualTable;
    vtIntComCargaPesqcdCarga: TIntegerField;
    vtIntComCargaPesqdeCarga: TStringField;
    vtIntComCargaPesqnupintura: TIntegerField;
    vtIntComCargaPesqnmMotorista: TStringField;
    vtIntComCargaPesqnmAjudante: TStringField;
    vtIntComCargaPesqdePlaca: TStringField;
    vtIntComCargaPesqdtSaida: TDateField;
    vtIntComCargaPesqflTemObs: TStringField;
    vtIntComCargaPesqnuQtdeCarga: TIntegerField;
    vtIntComCargaPesqdeObsSistema: TStringField;
    vtIntComCargaPesqcdPrioridade: TIntegerField;
    relCargas: TfrxReport;
    dbRelCargas: TfrxDBDataset;
    btImprimir: TBitBtn;
    vtIntComCargaPesqflSetorLixa: TStringField;
    vtIntComCargaPesqflSetorFaturamento: TStringField;
    vtIntComCargaPesqflSetorExpedicao: TStringField;
    btAlertasCarga: TBitBtn;
    vtIntComCargaPesqflTemAlerta: TStringField;
    vtIntComCargaPesqdtIniCarreg: TDateField;
    vtIntComCargaPesqhrIniCarreg: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure grDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    function relCargasUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure btImprimirClick(Sender: TObject);
    procedure vtIntComCargaPesqflSetorLixaGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure vtIntComCargaPesqflSetorFaturamentoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure vtIntComCargaPesqflSetorExpedicaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btAlertasCargaClick(Sender: TObject);
  private
    procedure AplicarFiltro;
    function UsuarioDataHoraImpressao : String;
  public
    { Public declarations }
  end;

var
  FIntComCargaEmAberto: TFIntComCargaEmAberto;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFIntComCargaEmAberto.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;


procedure TFIntComCargaEmAberto.vtIntComCargaPesqflSetorExpedicaoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flSetorExpedicao') then
    Text := '';
end;

procedure TFIntComCargaEmAberto.vtIntComCargaPesqflSetorFaturamentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flSetorFaturamento') then
    Text := '';
end;

procedure TFIntComCargaEmAberto.vtIntComCargaPesqflSetorLixaGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flSetorLixa') then
    Text := '';
end;

procedure TFIntComCargaEmAberto.btAlertasCargaClick(Sender: TObject);
var
  stAux  : TStringList;
begin
  stAux := TStringList.Create;

  if (vtIntComCargaPesq.Active) and (not vtIntComCargaPesq.IsEmpty)then
  begin
    if DmERP.qyIntComCargaAlertaPesq.Active then
      DmERP.qyIntComCargaAlertaPesq.Close;

    DmERP.qyIntComCargaAlertaPesq.MacroByName('filtro').Value := ' WHERE cdCarga = ' + vtIntComCargaPesq.FieldByName('cdCarga').AsString;
    DmERP.qyIntComCargaAlertaPesq.Open();

    DmERP.qyIntComCargaAlertaPesq.First;

    while not DmERP.qyIntComCargaAlertaPesq.Eof do
    begin
      if Trim(DmERP.qyIntComCargaAlertaPesq.FieldByName('cdCargaAlerta').AsString) <> '' then
      begin
        if Trim(stAux.Text) = '' then
          stAux.Text := 'Alerta ' + DmERP.qyIntComCargaAlertaPesq.FieldByName('cdCargaAlerta').AsString + ':' +
                        DmERP.qyIntComCargaAlertaPesq.FieldByName('deCargaAlerta').AsString
        else
          stAux.Text := stAux.Text + #13#13 +
                        'Alerta ' + DmERP.qyIntComCargaAlertaPesq.FieldByName('cdCargaAlerta').AsString + ':' +
                        DmERP.qyIntComCargaAlertaPesq.FieldByName('deCargaAlerta').AsString;
      end;

      DmERP.qyIntComCargaAlertaPesq.Next;
    end;

    if Trim(stAux.Text) <> '' then
      MensagemAviso(stAux)
    else
      Aviso('Carga não possui alertas.');
  end;
end;

procedure TFIntComCargaEmAberto.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFIntComCargaEmAberto.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  dsIntComCargaPesq.DataSet.Close;

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

procedure TFIntComCargaEmAberto.btImprimirClick(Sender: TObject);
begin
  try
    vtIntComCargaPesq.DisableControls;

    relCargas.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relCargas.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relCargas.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relCargas.ShowReport();
  finally
    vtIntComCargaPesq.EnableControls;
  end;
end;

procedure TFIntComCargaEmAberto.AplicarFiltro;
var
  sWhere  : String;
  stDados : TStringList;
begin
  stDados := TStringList.Create;
  vtIntComCargaPesq.Clear;

  if (DmERP.qyIntComCargaPesq.Active) then
    DmERP.qyIntComCargaPesq.Close;

  DmERP.qyIntComCargaPesq.MacroByName('filtro').Clear;

  sWhere := '';

  if FTelaInicial.FcdSetorUsuario = 1 then
    AdicionaCondSql(sWhere, ' cdSituacao IN(1, 2) ')
  else
    AdicionaCondSql(sWhere, ' cdSituacao = 2 ');

  if Trim(sWhere) <> '' then
    DmERP.qyIntComCargaPesq.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyIntComCargaPesq.Open();

  if DmERP.qyIntComCargaPesq.IsEmpty then
    Aviso('Não existem cargas em aberto para mostrar.')
  else
  begin
    try
      vtIntComCargaPesq.DisableControls;
      DmERP.qyIntComCargaPesq.DisableControls;

      DmERP.qyIntComCargaPesq.First;

      while not DmERP.qyIntComCargaPesq.Eof do
      begin
        vtIntComCargaPesq.Insert;
        vtIntComCargaPesq.FieldByName('cdCarga').AsInteger           := DmERP.qyIntComCargaPesq.FieldByName('cdCarga').AsInteger;
        vtIntComCargaPesq.FieldByName('deCarga').AsString            := DmERP.qyIntComCargaPesq.FieldByName('deCarga').AsString;
        vtIntComCargaPesq.FieldByName('nuPintura').AsInteger         := DmERP.qyIntComCargaPesq.FieldByName('nuPintura').AsInteger;
        vtIntComCargaPesq.FieldByName('nmMotorista').AsString        := DmERP.qyIntComCargaPesq.FieldByName('nmMotorista').AsString;
        vtIntComCargaPesq.FieldByName('nmAjudante').AsString         := DmERP.qyIntComCargaPesq.FieldByName('nmAjudante').AsString;
        vtIntComCargaPesq.FieldByName('dePlaca').AsString            := DmERP.qyIntComCargaPesq.FieldByName('dePlaca').AsString;
        vtIntComCargaPesq.FieldByName('dtSaida').AsDateTime          := DmERP.qyIntComCargaPesq.FieldByName('dtSaida').AsDateTime;
        vtIntComCargaPesq.FieldByName('flTemObs').AsString           := DmERP.qyIntComCargaPesq.FieldByName('flTemObsSis').AsString;
        vtIntComCargaPesq.FieldByName('flSetorLixa').AsString        := DmERP.qyIntComCargaPesq.FieldByName('flSetorLixa').AsString;
        vtIntComCargaPesq.FieldByName('flSetorFaturamento').AsString := DmERP.qyIntComCargaPesq.FieldByName('flSetorFaturamento').AsString;
        vtIntComCargaPesq.FieldByName('flSetorExpedicao').AsString   := DmERP.qyIntComCargaPesq.FieldByName('flSetorExpedicao').AsString;

        vtIntComCargaPesq.FieldByName('nuQtdeCarga').AsInteger  := 0;

        ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                          'SELECT SUM(ip.qtde_solicitada) AS nuQtdeCarga ' +
                          '  FROM pedido p ' +
                          ' INNER JOIN itemPed  ip  ON (ip.nro_pedido = p.nro_pedido) ' +
                          ' INNER JOIN grupoPed gp ON (gp.nro_pedido = p.nro_pedido) ' +
                          ' WHERE COALESCE(gp.codigo_grupoPed, 0) = ' + DmERP.qyIntComCargaPesq.FieldByName('cdCarga').AsString +
                          '   AND p.status_pedido <> ''C'' ',
                          'nuQtdeCarga',
                          stDados
                         );

        if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
          vtIntComCargaPesq.FieldByName('nuQtdeCarga').AsInteger := StrToIntDef(stDados.Strings[0], 0);

        vtIntComCargaPesq.FieldByName('deObsSistema').AsString  := DmERP.qyIntComCargaPesq.FieldByName('deObsSistema').AsString;
        vtIntComCargaPesq.FieldByName('cdPrioridade').AsInteger := DmERP.qyIntComCargaPesq.FieldByName('cdPrioridade').AsInteger;

        if DmERP.qyIntComCargaAlertaPesq.Active then
          DmERP.qyIntComCargaAlertaPesq.Close;

        DmERP.qyIntComCargaAlertaPesq.MacroByName('filtro').Value := ' WHERE cdCarga = ' + vtIntComCargaPesq.FieldByName('cdCarga').AsString;
        DmERP.qyIntComCargaAlertaPesq.Open();

        if not DmERP.qyIntComCargaAlertaPesq.IsEmpty then
          vtIntComCargaPesq.FieldByName('flTemAlerta').AsString := 'S'
        else
          vtIntComCargaPesq.FieldByName('flTemAlerta').AsString := 'N';

        stDados.Clear;
        ExecuteSimplesSql(DmERP.fdConnERP,
                          'SELECT dtBaixa, ' +
                          '       CAST( ' +
                          '            CASE ' +
                          '              WHEN hrBaixa > 0 THEN ' +
                          '                TRIM(TO_CHAR(TRUNC(hrBaixa/60), ''00'')) || '':'' || ' +
                          '                TRIM(TO_CHAR(MOD(hrBaixa, 60), ''00'')) ' +
                          '            END AS CHARACTER VARYING(5) ' +
                          '           ) AS hrIniCarreg ' +
                          '  FROM erp.intIndBaixaProducao ' +
                          ' WHERE cdSetor = 9 ' +
                          '   AND cdCarga = ' + vtIntComCargaPesq.FieldByName('cdCarga').AsString +
                          ' ORDER BY dtBaixa, hrBaixa',
                          'dtBaixa,hrIniCarreg',
                          stDados
                         );

        if (stDados.Count > 0) then
        begin
          if (Trim(stDados.Strings[0]) <> '') then
            vtIntComCargaPesq.FieldByName('dtIniCarreg').AsDateTime := StrToDateTime(stDados.Strings[0])
          else
            vtIntComCargaPesq.FieldByName('dtIniCarreg').Clear;

          if (Trim(stDados.Strings[1]) <> '') then
            vtIntComCargaPesq.FieldByName('hrIniCarreg').AsString := Trim(stDados.Strings[1])
          else
            vtIntComCargaPesq.FieldByName('hrIniCarreg').Clear;
        end;

        vtIntComCargaPesq.Post;

        DmERP.qyIntComCargaPesq.Next;
      end;
    finally
      vtIntComCargaPesq.First;
      vtIntComCargaPesq.EnableControls;
      DmERP.qyIntComCargaPesq.EnableControls;
    end;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TFIntComCargaEmAberto.FormCreate(Sender: TObject);
begin
  vtIntComCargaPesq.Open;
  btFechar.Glyph.LoadFromResourceName(HInstance,       'IMGBTFECHAR_32X32');
  btConsultar.Glyph.LoadFromResourceName(HInstance,    'IMGBTCONSULTAR_32X32');
  btImprimir.Glyph.LoadFromResourceName(HInstance,     'IMGBTIMPRIMIR_32X32');
  btAlertasCarga.Glyph.LoadFromResourceName(HInstance, 'IMGBTALERTA_32X32');

  AplicarFiltro;
  relCargas.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
end;

procedure TFIntComCargaEmAberto.FormShow(Sender: TObject);
begin
{  grDados.Columns.Items[9].Visible := FTelaInicial.FcdSetorUsuario = 1;
  grDados.Columns.Items[10].Visible := grDados.Columns.Items[9].Visible;
  grDados.Columns.Items[11].Visible := grDados.Columns.Items[9].Visible;}
end;

procedure TFIntComCargaEmAberto.grDadosDblClick(Sender: TObject);
var
  stAux : TStringList;
begin
  stAux := TStringList.Create;

  if (vtIntComCargaPesq.Active) and (not vtIntComCargaPesq.IsEmpty) then
  begin
    if (Trim(vtIntComCargaPesq.FieldByName('deObsSistema').AsString) <> '') then
    begin
      stAux.Text := vtIntComCargaPesq.FieldByName('deObsSistema').AsString;
      MensagemAviso(stAux);
    end
    else
      Aviso('Carga não possui observação.');
  end;

  if Assigned(stAux) then
    FreeAndNil(stAux);
end;

procedure TFIntComCargaEmAberto.grDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap : TBitmap;
begin
  if (gdSelected in State) or (gdFocused in State) then
    grDados.Canvas.Brush.Color := clGradientInactiveCaption
  else
    grDados.Canvas.Brush.Color := clWindow;

  if vtIntComCargaPesq.FieldByName('cdPrioridade').AsInteger = 2 then
  begin
    grDados.Canvas.Font.Color  := clBlue;
    grDados.Canvas.Font.Style  := grDados.Canvas.Font.Style + [fsBold];
  end
  else if vtIntComCargaPesq.FieldByName('cdPrioridade').AsInteger = 3 then
  begin
    grDados.Canvas.Font.Color  := clRed;
    grDados.Canvas.Font.Style  := grDados.Canvas.Font.Style + [fsBold];
  end
  else
  begin
    grDados.Canvas.Font.Color := clBlack;
    grDados.Canvas.Font.Style := grDados.Canvas.Font.Style - [fsBold];
  end;

  grDados.Canvas.FillRect(Rect);
  grDados.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if (SameText(Column.FieldName, 'flSetorLixa')) then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(vtIntComCargaPesq.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grDados.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end
  else if (SameText(Column.FieldName, 'flSetorFaturamento')) then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(vtIntComCargaPesq.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grDados.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end
  else if (SameText(Column.FieldName, 'flSetorExpedicao')) then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(vtIntComCargaPesq.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grDados.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end;
end;

function TFIntComCargaEmAberto.relCargasUserFunction(const MethodName: string;
  var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

initialization
  RegisterClass(TFIntComCargaEmAberto);

finalization
  UnRegisterClass(TFIntComCargaEmAberto);

end.
