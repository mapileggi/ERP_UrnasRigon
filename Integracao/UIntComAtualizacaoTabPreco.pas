unit UIntComAtualizacaoTabPreco;

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
  TFIntComAtualizacaoTabPreco = class(TForm)
    btAtualizar: TBitBtn;
    btFechar: TBitBtn;
    qyItensVarPadrao: TFDQuery;
    qyVarItemFaltante: TFDQuery;
    lbcdVariavel: TLabel;
    edcdVariavel: TDBCampoCodigo;
    qyVariavelItens: TFDQuery;
    mLog: TMemo;
    lbcdItem: TLabel;
    edcdItem: TDBCampoCodigo;
    btSalvarItemEsc: TBitBtn;
    btExluirItemEsc: TBitBtn;
    grItensEscolhidos: TDBGrid;
    lbLog: TLabel;
    vtItensEscolhidos: TVirtualTable;
    vtItensEscolhidoscdItem: TStringField;
    vtItensEscolhidosdeItem: TStringField;
    dsItensEscolhidos: TDataSource;
    qyTamItemFaltante: TFDQuery;
    mRefsImg: TMemo;
    lbTabPreco: TLabel;
    edcdTabPreco: TDBCampoCodigo;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    procedure btSalvarItemEscClick(Sender: TObject);
    procedure btExluirItemEscClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FecharConexaoIntegracao;
    function ListaItensEsc : String;
    procedure AtualizarTabPreco;
    procedure AtualizarTabPrecoTam;
    procedure AtualizarTabPrecoCor;
    procedure AtualizarTabPrecoImagem;
  public
    { Public declarations }
  end;

var
  FIntComAtualizacaoTabPreco: TFIntComAtualizacaoTabPreco;

implementation

{$R *.dfm}
{$R Icones.res}

uses
  uDmIntegracao, uDmERP, UTelaInicial, uFuncoes;

procedure TFIntComAtualizacaoTabPreco.btFecharClick(Sender: TObject);
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

procedure TFIntComAtualizacaoTabPreco.btSalvarItemEscClick(Sender: TObject);
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

procedure TFIntComAtualizacaoTabPreco.btAtualizarClick(Sender: TObject);
begin
  if not edcdVariavel.ERPValorValido then
    Aviso('Escolha uma variável antes de atualizar os preços.')
  else if Pergunta('Confirma a atualização dos preços para a variável escolhida?') then
  begin
    if StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0) = 5 then
      AtualizarTabPrecoTam
    else if StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0) = 10 then
      AtualizarTabPrecoCor
    else if StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0) = 30 then
      AtualizarTabPrecoImagem
    else
      AtualizarTabPreco;
  end;
end;

procedure TFIntComAtualizacaoTabPreco.btExluirItemEscClick(Sender: TObject);
begin
  if not vtItensEscolhidos.IsEmpty then
    vtItensEscolhidos.Delete;
end;

procedure TFIntComAtualizacaoTabPreco.FecharConexaoIntegracao;
begin
  if qyVarItemFaltante.Active then
    qyVarItemFaltante.Close;

  if qyTamItemFaltante.Active then
    qyTamItemFaltante.Close;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFIntComAtualizacaoTabPreco.FormCreate(Sender: TObject);
begin
  btAtualizar.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');
  btSalvarItemEsc.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_16X16');
  btExluirItemEsc.Glyph.LoadFromResourceName(HInstance, 'IMGBTEXCLUIR_16X16');

  vtItensEscolhidos.Open;
end;

procedure TFIntComAtualizacaoTabPreco.FormShow(Sender: TObject);
begin
  edcdVariavel.ERPEdCampoChaveSetFocus;
end;

function TFIntComAtualizacaoTabPreco.ListaItensEsc : String;
begin
  Result := '';

  if not vtItensEscolhidos.IsEmpty then
  begin
    vtItensEscolhidos.DisableControls;

    try
      vtItensEscolhidos.First;

      while not vtItensEscolhidos.Eof do
      begin
        if Trim(Result) = '' then
          Result := QuotedStr(vtItensEscolhidos.FieldByName('cdItem').AsString)
        else
          Result := Result + ', ' + QuotedStr(vtItensEscolhidos.FieldByName('cdItem').AsString);

        vtItensEscolhidos.Next;
      end;
    finally
      vtItensEscolhidos.EnableControls;
    end;
  end;
end;

procedure TFIntComAtualizacaoTabPreco.AtualizarTabPreco;
var
  sCondTabPreco,
  sAux,
  sUsuPC,
  sSql,
  snmFieldPrecoVar,
  snmVarSeqPadrao : String;
  stDados   : TStringList;
begin
  sCondTabPreco := '';

  if (Trim(edcdTabPreco.ERPEdCampoChaveText) <> '') and (edcdTabPreco.ERPValorValido) then
    sCondTabPreco := ' AND codigo_tab = ' + QuotedStr(edcdTabPreco.ERPEdCampoChaveText);

  stDados          := TStringList.Create;
  snmVarSeqPadrao  := '';
  snmFieldPrecoVar := '';

  case StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0) of
  15: begin
        snmVarSeqPadrao  := 'cdTipoAlcaSeq';
        snmFieldPrecoVar := 'vlPrecoPadAlca';
      end;
  19: begin
        snmVarSeqPadrao  := 'cdAdornoSeq';
        snmFieldPrecoVar := 'vlPrecoPadAdorno';
      end;
  20: begin
        snmVarSeqPadrao  := 'cdChavetaSeq';
        snmFieldPrecoVar := 'vlPrecoPadChaveta';
      end;
  25: begin
        snmVarSeqPadrao  := 'cdForracaoSeq';
        snmFieldPrecoVar := 'vlPrecoPadForracao';
      end;
  end;

  DmIntegracao.fdConnInteg.Connected := True;

  if qyItensVarPadrao.Active then
    qyItensVarPadrao.Close;

  qyItensVarPadrao.MacroByName('filtro').Clear;

  sAux := ListaItensEsc;

  if Trim(sAux) <> '' then
    qyItensVarPadrao.MacroByName('filtro').Value := ' WHERE a.cdItem IN(' + sAux + ')';

  qyItensVarPadrao.Open();

  try
    qyItensVarPadrao.DisableControls;
    qyVariavelItens.DisableControls;

    qyItensVarPadrao.First;

    while not qyItensVarPadrao.Eof do
    begin
      if (qyItensVarPadrao.FieldByName(snmVarSeqPadrao).AsInteger > 0) then
      begin
        ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                            'UPDATE vlVarItb vv ' +
                            '   SET preco_agregar = 0 ' +
                            ' WHERE vv.codigo_variavel = ' + edcdVariavel.ERPEdCampoChaveText +
                            '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                   QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                            '   AND vv.valorVar = ' + qyItensVarPadrao.FieldByName(snmVarSeqPadrao).AsString +
                            sCondTabPreco
                           );

        if qyVariavelItens.Active then
            qyVariavelItens.Close;

        qyVariavelItens.ParamByName('cdVariavel').AsInteger     := StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0);
        qyVariavelItens.ParamByName('cdVariavelItem').AsInteger := qyItensVarPadrao.FieldByName(snmVarSeqPadrao).AsInteger;

        qyVariavelItens.Open();
        qyVariavelItens.First;

        while not qyVariavelItens.Eof do
        begin
          if //(qyItensVarPadrao.FieldByName(snmFieldPrecoVar).AsFloat > 0) and
             (qyVariavelItens.FieldByName('vlPrecoPadrao').AsFloat > qyItensVarPadrao.FieldByName(snmFieldPrecoVar).AsFloat) then
          begin
            if qyVarItemFaltante.Active then
              qyVarItemFaltante.Close;

            qyVarItemFaltante.ParamByName('vlPreco').AsFloat          := qyVariavelItens.FieldByName('vlPrecoPadrao').AsFloat;
            qyVarItemFaltante.ParamByName('cdVariavel').AsInteger     := StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0);
            qyVarItemFaltante.ParamByName('cdVariavelItem').AsInteger := qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
            qyVarItemFaltante.MacroByName('itens').Clear;
            qyVarItemFaltante.MacroByName('itens').Value := QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                            QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12');

            qyVarItemFaltante.MacroByName('codTab').Clear;

            if Trim(sCondTabPreco) <> '' then
              qyVarItemFaltante.MacroByName('codTab').Value := sCondTabPreco;

            qyVarItemFaltante.Open();

            if (not qyVarItemFaltante.IsEmpty) then
            begin
              sSql := qyVarItemFaltante.SQL.Text;
              sSql := AnsiReplaceStr(sSql, ':vlPreco', AnsiReplaceStr(qyVariavelItens.FieldByName('vlPrecoPadrao').AsString, ',', '.'));
              sSql := AnsiReplaceStr(sSql, ':cdVariavelItem', qyVariavelItens.FieldByName('cdVariavelItem').AsString);
              sSql := AnsiReplaceStr(sSql, ':cdVariavel', qyVariavelItens.FieldByName('cdVariavel').AsString);
              sSql := AnsiReplaceStr(sSql, '&itens', QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                     QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12')
                                    );
              sSql := AnsiReplaceStr(sSql, '&codTab', sCondTabPreco);

              sSql := 'INSERT INTO vlVarItb (recnum, codigo_tab, item, codigo_variavel, valorvar, preco_agregar) ' +
                      sSql;

              ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, sSql);

              ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                                'SELECT MAX(recnum) AS ultRec FROM vlVarItb',
                                'ultRec',
                                stDados
                               );

              ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, 'ALTER TABLE vlVarItb ALTER COLUMN recNum RESTART WITH ' + IntToStr(StrToIntDef(stDados.Strings[0], 0) + 1));
            end
            else
              ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                                  'UPDATE vlVarItb vv ' +
                                  '   SET preco_agregar = ' + AnsiReplaceStr(qyVariavelItens.FieldByName('vlPrecoPadrao').AsString, ',', '.') +
                                  ' WHERE vv.codigo_variavel = ' + qyVariavelItens.FieldByName('cdVariavel').AsString +
                                  '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                         QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                                  '   AND vv.valorVar = ' + qyVariavelItens.FieldByName('cdVariavelItem').AsString +
                                  sCondTabPreco
                                 );
          end
          else
            ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                                'UPDATE vlVarItb vv ' +
                                '   SET preco_agregar = 0 ' +
                                ' WHERE vv.codigo_variavel = ' + qyVariavelItens.FieldByName('cdVariavel').AsString +
                                '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                       QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                                '   AND vv.valorVar = ' + qyVariavelItens.FieldByName('cdVariavelItem').AsString +
                                sCondTabPreco
                               );

          qyVariavelItens.Next;
        end;
      end
      else
        mLog.Lines.Add('Opção padrão da variável ' + edcdVariavel.ERPLbDescricaoCaption + ' não definida para o item ' +
                       Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)
                      );

      qyItensVarPadrao.Next;
    end;
  finally
    qyItensVarPadrao.EnableControls;
    qyVariavelItens.EnableControls;
  end;

  sUsuPC := QuotedStr(RetornaNomeComputador);
  sUsuPC := sUsuPC + ',' + QuotedStr(RetornaIpComputador);

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM vlVarItb_log b ' +
                      ' WHERE EXISTS (SELECT a.operlog_id ' +
                      '                 FROM operlog a ' +
                      '                WHERE a.operlog_id = b.operlog_id ' +
                      '                  AND a.usuario_windows IN(' + sUsuPC + ')' +
                      '              )'
                     );

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM operlog ' +
                      ' WHERE usuario_windows IN(' + sUsuPC + ') ' +
                      '   AND UPPER(tabela) = ''VLVARITB'' '
                     );

  if Assigned(stDados) then
    FreeAndNil(stDados);

  FecharConexaoIntegracao;

  Aviso('Atualização dos preços das opções de ' + edcdVariavel.ERPLbDescricaoCaption + ' finalizado com sucesso.');
end;

procedure TFIntComAtualizacaoTabPreco.AtualizarTabPrecoTam;
var
  sCondTabPreco,
  sAux,
  sUsuPC,
  sSql    : String;
  stDados : TStringList;
begin
  sCondTabPreco := '';

  if (Trim(edcdTabPreco.ERPEdCampoChaveText) <> '') and (edcdTabPreco.ERPValorValido) then
    sCondTabPreco := ' AND codigo_tab = ' + QuotedStr(edcdTabPreco.ERPEdCampoChaveText);

  stDados := TStringList.Create;

  DmIntegracao.fdConnInteg.Connected := True;

  if qyItensVarPadrao.Active then
    qyItensVarPadrao.Close;

  qyItensVarPadrao.MacroByName('filtro').Clear;

  sAux := ListaItensEsc;

  if Trim(sAux) <> '' then
    qyItensVarPadrao.MacroByName('filtro').Value := ' WHERE a.cdItem IN(' + sAux + ')';

  qyItensVarPadrao.Open();

  try
    qyItensVarPadrao.DisableControls;
    qyTamItemFaltante.DisableControls;

    qyItensVarPadrao.First;

    while not qyItensVarPadrao.Eof do
    begin
      if qyTamItemFaltante.Active then
        qyTamItemFaltante.Close;

      qyTamItemFaltante.MacroByName('filtro').Clear;
      sAux := ' AND it.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                   QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')';

      if Trim(sCondTabPreco) <> '' then
        sAux := sAux + sCondTabPreco;

      qyTamItemFaltante.MacroByName('filtro').Value := sAux;

      qyTamItemFaltante.Open();

      if (not qyTamItemFaltante.IsEmpty) then
      begin
        sSql := qyTamItemFaltante.SQL.Text;
        sSql := AnsiReplaceStr(sSql,
                               '&filtro',
                               ' AND it.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                    QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                               sCondTabPreco
                              );
        sSql := 'INSERT INTO vlVarItb (recnum, codigo_tab, item, codigo_variavel, valorvar, preco_agregar) ' +
                sSql;

        ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, sSql);

        ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                          'SELECT MAX(recnum) AS ultRec FROM vlVarItb',
                          'ultRec',
                          stDados
                         );

        ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, 'ALTER TABLE vlVarItb ALTER COLUMN recNum RESTART WITH ' + IntToStr(StrToIntDef(stDados.Strings[0], 0) + 1));
      end
      else
        ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                            'UPDATE vlVarItb a ' +
                            '   SET preco_agregar = ( ' +
                            '                        COALESCE( ' +
                            '                                 ( ' +
                            '                                  SELECT b.vl ' +
                            '                                    FROM itemTab b ' +
                            '                                   WHERE b.codigo_tab = a.codigo_tab ' +
                            '                                     AND b.item = a.item ' +
                            '                                 ), ' +
                            '                                 0 ' +
                            '                                ) * ' +
                            '                        CAST( ' +
                            '                             CASE ' +
                            '                               WHEN CAST(a.valorVar AS INTEGER) IN(51, 52) THEN ' + // 1,90 Gordo, Semi Gordo
                            '                                 30 / 100.0000 ' +
                            '                               WHEN CAST(a.valorVar AS INTEGER) IN(53, 70) THEN ' + // 1,90 Super Gordo | 1,90 CREMACAO
                            '                                 50 / 100.0000 ' +
                            '                               WHEN CAST(a.valorVar AS INTEGER) = 54 THEN ' + // 1,90 Extra Gordo
                            '                                 90 / 100.0000 ' +
                            '                               WHEN CAST(a.valorVar AS INTEGER) IN (55, 60, 65) THEN ' + // 2,00 | 2,10 | 2,20
                            '                                 15 / 100.0000 ' +
                            '                               WHEN CAST(a.valorVar AS INTEGER) IN (56, 57, 61, 62, 66, 67) THEN ' + // 2,00 Gordo, Semi Gordo
                            '                                 45 / 100.0000 ' +
                            '                               WHEN CAST(a.valorVar AS INTEGER) IN (58, 63, 68) THEN ' + // 2,00 Super Gordo
                            '                                 65 / 100.0000 ' +
                            '                               WHEN CAST(a.valorVar AS INTEGER) IN (59, 64, 69) THEN ' + // 2,00 Extra Gordo
                            '                                 105 / 100.0000 ' +
                            '                		       WHEN CAST(a.valorVar AS INTEGER) IN(71, 72) THEN ' + // 1,90 Gordo Cremação, Semi Gordo Cremação
                            '                		         80 / 100.0000 ' +
                            '		                       WHEN CAST(a.valorVar AS INTEGER) = 73 THEN ' + // 1,90 Super Gordo Cremação
                            '		                         1 ' +
                            '		                       WHEN CAST(a.valorVar AS INTEGER) = 74 THEN ' + // 1,90 Extra Gordo Cremação
                            '		                         140 / 100.0000 ' +
                            '                               ELSE ' +
                            '                                 0.0000 ' +
                            '                             END AS NUMERIC(15, 4) ' +
                            '                            ) ' +
                            '                       ) ' +
                            ' WHERE a.codigo_variavel = 5 ' +
                            '   AND COALESCE( ' +
                            '                ( ' +
                            '                 SELECT b.vl ' +
                            '                   FROM itemTab b ' +
                            '                  WHERE b.codigo_tab = a.codigo_tab ' +
                            '                    AND b.item = a.item ' +
                            '                ), ' +
                            '                0 ' +
                            '               ) > 0 ' +
                            '   AND a.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                  QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                                sCondTabPreco
                           );

      qyItensVarPadrao.Next;
    end;
  finally
    qyItensVarPadrao.EnableControls;
    qyTamItemFaltante.EnableControls;
  end;

  sUsuPC := QuotedStr(RetornaNomeComputador);
  sUsuPC := sUsuPC + ',' + QuotedStr(RetornaIpComputador);

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM vlVarItb_log b ' +
                      ' WHERE EXISTS (SELECT a.operlog_id ' +
                      '                 FROM operlog a ' +
                      '                WHERE a.operlog_id = b.operlog_id ' +
                      '                  AND a.usuario_windows IN(' + sUsuPC + ')' +
                      '              )'
                     );

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM operlog ' +
                      ' WHERE usuario_windows IN(' + sUsuPC + ') ' +
                      '   AND UPPER(tabela) = ''VLVARITB'' '
                     );

  if Assigned(stDados) then
    FreeAndNil(stDados);

  FecharConexaoIntegracao;

  Aviso('Atualização dos preços das opções de ' + edcdVariavel.ERPLbDescricaoCaption + ' finalizado com sucesso.');
end;

procedure TFIntComAtualizacaoTabPreco.AtualizarTabPrecoCor;
var
  sCondTabPreco,
  sAux,
  sUsuPC,
  sSql    : String;
  stDados : TStringList;
begin
  sCondTabPreco := '';

  if (Trim(edcdTabPreco.ERPEdCampoChaveText) <> '') and (edcdTabPreco.ERPValorValido) then
    sCondTabPreco := ' AND codigo_tab = ' + QuotedStr(edcdTabPreco.ERPEdCampoChaveText);

  stDados := TStringList.Create;

  DmIntegracao.fdConnInteg.Connected := True;

  if qyItensVarPadrao.Active then
    qyItensVarPadrao.Close;

  qyItensVarPadrao.MacroByName('filtro').Clear;

  sAux := ListaItensEsc;

  if Trim(sAux) <> '' then
    qyItensVarPadrao.MacroByName('filtro').Value := ' WHERE a.cdItem IN(' + sAux + ')';

  qyItensVarPadrao.Open();

  try
    qyItensVarPadrao.DisableControls;
    qyTamItemFaltante.DisableControls;

    qyItensVarPadrao.First;

    while not qyItensVarPadrao.Eof do
    begin                                    {
      ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                            'UPDATE vlVarItb vv ' +
                            '   SET preco_agregar = 0 ' +
                            ' WHERE vv.codigo_variavel = ' + edcdVariavel.ERPEdCampoChaveText +
                            '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                   QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                            '   AND vv.valorVar = ' + qyItensVarPadrao.FieldByName(snmVarSeqPadrao).AsString +
                            sCondTabPreco
                           );    }

      if qyVariavelItens.Active then
        qyVariavelItens.Close;

      qyVariavelItens.ParamByName('cdVariavel').AsInteger     := StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0);
      qyVariavelItens.ParamByName('cdVariavelItem').AsInteger := 0;

      qyVariavelItens.Open();
      qyVariavelItens.First;

      while not qyVariavelItens.Eof do
      begin
        if (qyItensVarPadrao.FieldByName('flCobrarCor').AsString = 'S') and
           (qyVariavelItens.FieldByName('vlPrecoPadrao').AsFloat > 0) then
        begin
          if qyVarItemFaltante.Active then
            qyVarItemFaltante.Close;

          qyVarItemFaltante.ParamByName('vlPreco').AsFloat          := qyVariavelItens.FieldByName('vlPrecoPadrao').AsFloat;
          qyVarItemFaltante.ParamByName('cdVariavel').AsInteger     := StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0);
          qyVarItemFaltante.ParamByName('cdVariavelItem').AsInteger := qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
          qyVarItemFaltante.MacroByName('itens').Clear;
          qyVarItemFaltante.MacroByName('itens').Value := QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                          QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12');

          qyVarItemFaltante.MacroByName('codTab').Clear;

          if Trim(sCondTabPreco) <> '' then
            qyVarItemFaltante.MacroByName('codTab').Value := sCondTabPreco;

          qyVarItemFaltante.Open();

          if (not qyVarItemFaltante.IsEmpty) then
          begin
            sSql := qyVarItemFaltante.SQL.Text;
            sSql := AnsiReplaceStr(sSql, ':vlPreco', AnsiReplaceStr(qyVariavelItens.FieldByName('vlPrecoPadrao').AsString, ',', '.'));
            sSql := AnsiReplaceStr(sSql, ':cdVariavelItem', qyVariavelItens.FieldByName('cdVariavelItem').AsString);
            sSql := AnsiReplaceStr(sSql, ':cdVariavel', qyVariavelItens.FieldByName('cdVariavel').AsString);
            sSql := AnsiReplaceStr(sSql, '&itens', QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                   QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12')
                                  );
            sSql := AnsiReplaceStr(sSql, '&codTab', sCondTabPreco);
            sSql := 'INSERT INTO vlVarItb (recnum, codigo_tab, item, codigo_variavel, valorvar, preco_agregar) ' +
                    sSql;

            ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, sSql);

            ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                              'SELECT MAX(recnum) AS ultRec FROM vlVarItb',
                              'ultRec',
                              stDados
                             );

            ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, 'ALTER TABLE vlVarItb ALTER COLUMN recNum RESTART WITH ' + IntToStr(StrToIntDef(stDados.Strings[0], 0) + 1));
          end
          else
            ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                                'UPDATE vlVarItb vv ' +
                                '   SET preco_agregar = ' + AnsiReplaceStr(qyVariavelItens.FieldByName('vlPrecoPadrao').AsString, ',', '.') +
                                ' WHERE vv.codigo_variavel = ' + qyVariavelItens.FieldByName('cdVariavel').AsString +
                                '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                       QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                                '   AND vv.valorVar = ' + qyVariavelItens.FieldByName('cdVariavelItem').AsString +
                                sCondTabPreco
                               );
        end
        else
          ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                              'UPDATE vlVarItb vv ' +
                              '   SET preco_agregar = 0 ' +
                              ' WHERE vv.codigo_variavel = ' + qyVariavelItens.FieldByName('cdVariavel').AsString +
                              '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                     QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                              '   AND vv.valorVar = ' + qyVariavelItens.FieldByName('cdVariavelItem').AsString +
                              sCondTabPreco
                             );

        qyVariavelItens.Next;
      end;

      qyItensVarPadrao.Next;
    end;
  finally
    qyItensVarPadrao.EnableControls;
    qyTamItemFaltante.EnableControls;
  end;

  sUsuPC := QuotedStr(RetornaNomeComputador);
  sUsuPC := sUsuPC + ',' + QuotedStr(RetornaIpComputador);

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM vlVarItb_log b ' +
                      ' WHERE EXISTS (SELECT a.operlog_id ' +
                      '                 FROM operlog a ' +
                      '                WHERE a.operlog_id = b.operlog_id ' +
                      '                  AND a.usuario_windows IN(' + sUsuPC + ')' +
                      '              )'
                     );

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM operlog ' +
                      ' WHERE usuario_windows IN(' + sUsuPC + ') ' +
                      '   AND UPPER(tabela) = ''VLVARITB'' '
                     );

  if Assigned(stDados) then
    FreeAndNil(stDados);

  FecharConexaoIntegracao;

  Aviso('Atualização dos preços das opções de ' + edcdVariavel.ERPLbDescricaoCaption + ' finalizado com sucesso.');
end;

procedure TFIntComAtualizacaoTabPreco.AtualizarTabPrecoImagem;
var
  i : Integer;
  sCondTabPreco,
  sAux,
  sUsuPC,
  sSql    : String;
  stDados : TStringList;
begin
  sCondTabPreco := '';

  if (Trim(edcdTabPreco.ERPEdCampoChaveText) <> '') and (edcdTabPreco.ERPValorValido) then
    sCondTabPreco := ' AND codigo_tab = ' + QuotedStr(edcdTabPreco.ERPEdCampoChaveText);

  stDados := TStringList.Create;

  DmIntegracao.fdConnInteg.Connected := True;

  if qyItensVarPadrao.Active then
    qyItensVarPadrao.Close;

  qyItensVarPadrao.MacroByName('filtro').Clear;

  sAux := ListaItensEsc;

  if mRefsImg.Lines.Count > 0 then
  begin
    i := 0;

    while i < mRefsImg.Lines.Count do
    begin
      if sAux = '' then
        sAux := QuotedStr(mRefsImg.Lines.Strings[i])
      else
        sAux := sAux + ',' + QuotedStr(mRefsImg.Lines.Strings[i]);

      Inc(i);
    end;
  end;

  if Trim(sAux) <> '' then
    qyItensVarPadrao.MacroByName('filtro').Value := ' WHERE a.cdItem IN(' + sAux + ')';

  qyItensVarPadrao.Open();

  try
    qyItensVarPadrao.DisableControls;
    qyTamItemFaltante.DisableControls;

    qyItensVarPadrao.First;

    while not qyItensVarPadrao.Eof do
    begin                                    {
      ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                            'UPDATE vlVarItb vv ' +
                            '   SET preco_agregar = 0 ' +
                            ' WHERE vv.codigo_variavel = ' + edcdVariavel.ERPEdCampoChaveText +
                            '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                   QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                            '   AND vv.valorVar = ' + qyItensVarPadrao.FieldByName(snmVarSeqPadrao).AsString +
                            sCondTabPreco
                           );    }

      if qyVariavelItens.Active then
        qyVariavelItens.Close;

      qyVariavelItens.ParamByName('cdVariavel').AsInteger     := StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0);
      qyVariavelItens.ParamByName('cdVariavelItem').AsInteger := 0;

      qyVariavelItens.Open();
      qyVariavelItens.First;

      while not qyVariavelItens.Eof do
      begin
        if (qyVariavelItens.FieldByName('vlPrecoPadrao').AsFloat > 0) then
        begin
          if qyVarItemFaltante.Active then
            qyVarItemFaltante.Close;

          qyVarItemFaltante.ParamByName('vlPreco').AsFloat          := qyVariavelItens.FieldByName('vlPrecoPadrao').AsFloat;
          qyVarItemFaltante.ParamByName('cdVariavel').AsInteger     := StrToIntDef(edcdVariavel.ERPEdCampoChaveText, 0);
          qyVarItemFaltante.ParamByName('cdVariavelItem').AsInteger := qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
          qyVarItemFaltante.MacroByName('itens').Clear;
          qyVarItemFaltante.MacroByName('itens').Value := QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                          QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12');

          qyVarItemFaltante.MacroByName('codTab').Clear;

          if Trim(sCondTabPreco) <> '' then
            qyVarItemFaltante.MacroByName('codTab').Value := sCondTabPreco;

          qyVarItemFaltante.Open();

          if (not qyVarItemFaltante.IsEmpty) then
          begin
            sSql := qyVarItemFaltante.SQL.Text;
            sSql := AnsiReplaceStr(sSql, ':vlPreco', AnsiReplaceStr(qyVariavelItens.FieldByName('vlPrecoPadrao').AsString, ',', '.'));
            sSql := AnsiReplaceStr(sSql, ':cdVariavelItem', qyVariavelItens.FieldByName('cdVariavelItem').AsString);
            sSql := AnsiReplaceStr(sSql, ':cdVariavel', qyVariavelItens.FieldByName('cdVariavel').AsString);
            sSql := AnsiReplaceStr(sSql, '&itens', QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                   QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12')
                                  );
            sSql := AnsiReplaceStr(sSql, '&codTab', sCondTabPreco);
            sSql := 'INSERT INTO vlVarItb (recnum, codigo_tab, item, codigo_variavel, valorvar, preco_agregar) ' +
                    sSql;

            ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, sSql);

            ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                              'SELECT MAX(recnum) AS ultRec FROM vlVarItb',
                              'ultRec',
                              stDados
                             );

            ExecuteInstrucaoSql(DmIntegracao.fdConnInteg, 'ALTER TABLE vlVarItb ALTER COLUMN recNum RESTART WITH ' + IntToStr(StrToIntDef(stDados.Strings[0], 0) + 1));
          end
          else
            ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                                'UPDATE vlVarItb vv ' +
                                '   SET preco_agregar = ' + AnsiReplaceStr(qyVariavelItens.FieldByName('vlPrecoPadrao').AsString, ',', '.') +
                                ' WHERE vv.codigo_variavel = ' + qyVariavelItens.FieldByName('cdVariavel').AsString +
                                '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                       QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                                '   AND vv.valorVar = ' + qyVariavelItens.FieldByName('cdVariavelItem').AsString  +
                                sCondTabPreco
                               );
        end
        else
          ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                              'UPDATE vlVarItb vv ' +
                              '   SET preco_agregar = 0 ' +
                              ' WHERE vv.codigo_variavel = ' + qyVariavelItens.FieldByName('cdVariavel').AsString +
                              '   AND vv.item IN(' + QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString)) + ',' +
                                                     QuotedStr(Trim(qyItensVarPadrao.FieldByName('cdItem').AsString) + '.12') + ')' +
                              '   AND vv.valorVar = ' + qyVariavelItens.FieldByName('cdVariavelItem').AsString +
                              sCondTabPreco
                             );

        qyVariavelItens.Next;
      end;

      qyItensVarPadrao.Next;
    end;
  finally
    qyItensVarPadrao.EnableControls;
    qyTamItemFaltante.EnableControls;
  end;

  sUsuPC := QuotedStr(RetornaNomeComputador);
  sUsuPC := sUsuPC + ',' + QuotedStr(RetornaIpComputador);

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM vlVarItb_log b ' +
                      ' WHERE EXISTS (SELECT a.operlog_id ' +
                      '                 FROM operlog a ' +
                      '                WHERE a.operlog_id = b.operlog_id ' +
                      '                  AND a.usuario_windows IN(' + sUsuPC + ')' +
                      '              )'
                     );

  ExecuteInstrucaoSql(DmIntegracao.fdConnInteg,
                      'DELETE FROM operlog ' +
                      ' WHERE usuario_windows IN(' + sUsuPC + ') ' +
                      '   AND UPPER(tabela) = ''VLVARITB'' '
                     );

  if Assigned(stDados) then
    FreeAndNil(stDados);

  FecharConexaoIntegracao;

  Aviso('Atualização dos preços das opções de ' + edcdVariavel.ERPLbDescricaoCaption + ' finalizado com sucesso.');
end;

initialization
  RegisterClass(TFIntComAtualizacaoTabPreco);

finalization
  UnRegisterClass(TFIntComAtualizacaoTabPreco);

end.
