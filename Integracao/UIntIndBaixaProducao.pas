unit UIntIndBaixaProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MemDS, VirtualTable, Vcl.Menus;

type
  TFIntIndBaixaProducao = class(TForm)
    dsDados: TDataSource;
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    lbDuploClicExcluir: TLabel;
    gbConsultar: TGroupBox;
    gbMovimentar: TGroupBox;
    lbdtBaixa: TLabel;
    eddtBaixaIni: TDateTimePicker;
    lbdtBaixaA: TLabel;
    eddtBaixaFim: TDateTimePicker;
    lbcdSetor: TLabel;
    dsSetor: TDataSource;
    lcbcdSetor: TDBLookupComboBox;
    btConsultar: TBitBtn;
    lbcdItemPesq: TLabel;
    edcdItemPesq: TEdit;
    lbcdItem: TLabel;
    edcdItem: TDBCampoCodigo;
    btMovimentar: TBitBtn;
    btFechar: TBitBtn;
    qySetor: TFDQuery;
    lbcdSetorPesq: TLabel;
    qySetorPesq: TFDQuery;
    dsSetorPesq: TDataSource;
    lbnuQtde: TLabel;
    ednuQtde: TEdit;
    edcdCarga: TDBCampoCodigo;
    lbcdCarga: TLabel;
    lbdeCodBarras: TLabel;
    edcdCodBarras: TEdit;
    lbcdPedido: TLabel;
    edcdPedido: TEdit;
    lbcdUsuarioBaixa: TLabel;
    edcdUsuarioBaixa: TDBCampoCodigo;
    lbcdCargaPesq: TLabel;
    edcdCargaPesq: TDBCampoCodigo;
    lbcdTamanho: TLabel;
    lcbcdTamanho: TDBLookupComboBox;
    vtTamanho: TVirtualTable;
    dsTamanho: TDataSource;
    vtTamanhocdTamanho: TIntegerField;
    vtTamanhodeTamanho: TStringField;
    edcdSetorPesq: TDBCampoCodigo;
    btVerificarNaoMov: TBitBtn;
    lbQtdeMov: TLabel;
    edQtdeMov: TEdit;
    btZerarContagem: TBitBtn;
    pnTotaisGrid: TPanel;
    lbnuQtdeTotal: TLabel;
    ednuQtdeTotal: TEdit;
    pmGrid: TPopupMenu;
    pmiRemoverPedido: TMenuItem;
    cbMovEstSetAnt: TCheckBox;
    cbRetEstInterno: TCheckBox;
    lbTipoEstoque: TLabel;
    cbTipoEstoque: TComboBox;
    cbSomenteEst: TCheckBox;
    btAjustaIDs: TButton;
    cbMovItemCompleto: TCheckBox;
    qyAjusteIdP4: TFDQuery;
    qyEmpresa: TFDQuery;
    dsEmpresa: TDataSource;
    lbcdEmpresa: TLabel;
    lcbcdEmpresa: TDBLookupComboBox;
    lbcdTamanhoPesq: TLabel;
    lcbcdTamanhoPesq: TDBLookupComboBox;
    dsTamanhoPesq: TDataSource;
    vtTamanhoPesq: TVirtualTable;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    cbNaoImpEnzibEnzit: TCheckBox;
    btImgItem: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btMovimentarClick(Sender: TObject);
    procedure edcdCodBarrasChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btVerificarNaoMovClick(Sender: TObject);
    procedure btZerarContagemClick(Sender: TObject);
    procedure lcbcdSetorExit(Sender: TObject);
    procedure pmiRemoverPedidoClick(Sender: TObject);
    procedure btAjustaIDsClick(Sender: TObject);
    procedure cbMovEstSetAntClick(Sender: TObject);
    procedure cbMovItemCompletoClick(Sender: TObject);
    procedure cbRetEstInternoClick(Sender: TObject);
    procedure btImgItemClick(Sender: TObject);
  private
    stMsgValid : TStringList;

  //  procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
    procedure AplicarFiltro;
    procedure FocoCampoBaixa;
    procedure GravaValorItemTamBase(const scdItem,
                                          scdTamanho : String;
                                      var scdItemRelac,
                                          scdItemBase,
                                          scdTamanhoBase : String
                                   );
    procedure CarregarDetalhamentoItemPed(var sdeCor,
                                              sdeAlca,
                                              sdeAdorno,
                                              sdeChaveta,
                                              sdeForracao,
                                              sdeImagem,
                                              scdItem,
                                              sdtCadPedido,
                                              sMsgValidacao  : String;
                                          var icdTamanho,
                                              icdCor,
                                              icdAlca,
                                              icdAdorno,
                                              icdChaveta,
                                              icdForracao,
                                              icdImagem,
                                              icdCliente,
                                              iQtdTotalItem  : Integer
                                         );
    function CamposPreenchidos : TStrings;
    function EtiquetaJaMovimentada(const scdSetor,
                                         scdPedido,
                                         sSeqPed,
                                         sIdQtdeSeqPed : String
                                  ) : Boolean;
    function RetornaIdQtde : Integer;
    function RetornaIdQtdeEstInterno(const scdItem, scdSetor, scdTamanho : String) : Integer;
    procedure RegistraInicioCarreg;
    procedure MovimentarItem(sCodBarras : String = ''; const bMovEstoque : Boolean = True);

    procedure AjustaIdsQtde;
  public
    { Public declarations }
  end;

var
  FIntIndBaixaProducao: TFIntIndBaixaProducao;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes, UMostrarImg;

{$R *.dfm}
         (*
procedure TFIntIndBaixaProducao.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
begin
   if not (
           (Screen.ActiveControl is TCustomMemo) or
           (Screen.ActiveControl is TDBLookupComboBox) or
           (Screen.ActiveControl is TBitBtn) or
          // (Screen.ActiveControl is TCustomGrid) or // se não for uma grid o controle mudara com enter
           (Screen.ActiveForm.ClassName = 'TMessageForm')
          ) then
   begin
     if Msg.message = WM_KEYDOWN then
      begin
        case Msg.wParam of
        VK_RETURN,VK_DOWN : Screen.ActiveForm.Perform(WM_NextDlgCtl,0,0);   //,VK_TAB
        VK_UP             : Screen.ActiveForm.Perform(WM_NextDlgCtl,1,0);
        end;
      end;
   end;
end;  *)

procedure TFIntIndBaixaProducao.pmiRemoverPedidoClick(Sender: TObject);
begin
  if DmERP.qyIntIndBaixaProducao.FieldByName('cdSetor').AsInteger <>
     dsSetor.DataSet.FieldByName('cdSetor').AsInteger then
    Aviso('Movimento selecionado não é do seu setor.')
  else if DmERP.qyIntIndBaixaProducao.FieldByName('flEmEstoque').AsString = 'N' then
    Aviso('Movimento selecionado não se encontra em estoque.')
  else if Pergunta('Tem certeza que deseja remover o pedido vinculado a este item?') then
  begin
    ExecuteInstrucaoSql(DmERP.fdConnERP,
                        'UPDATE erp.intIndBaixaProducao ' +
                        '   SET cdPedido = NULL, ' +
                        '       cdSeqPed = NULL, ' +
                        '       cdIdQtdeSeqPed = NULL, ' +
                        '       cdCliente = NULL, ' +
                        '       nuQtdTotalItem = NULL, ' +
                        '       dtCadPedido = NULL, ' +
   {                     '       cdCor = NULL, ' +
                        '       deCor = NULL, ' +
                        '       cdAlca = NULL, ' +
                        '       deAlca = NULL, ' +
                        '       cdAdorno = NULL, ' +
                        '       deAdorno = NULL, ' +
                        '       cdChaveta = NULL, ' +
                        '       deChaveta = NULL, ' +
                        '       cdForracao = NULL, ' +
                        '       deForracao = NULL, ' +
                        '       cdImagem = NULL, ' +
                        '       deImagem = NULL, ' +     }
                        '       cdUsuarioAlteracao = ' + IntToStr(FTelaInicial.FcdUsuario) + ', ' +
                        '       dtAlteracao = CURRENT_DATE, ' +
                        '       hrAlteracao = erp.MinutosAtual(), ' +
                        '       flEmEstoque = ''S'' ' +
                        ' WHERE cdItem = ' + QuotedStr(DmERP.qyIntIndBaixaProducao.FieldByName('cdItem').AsString) +
                        '   AND cdSetor = ' + DmERP.qyIntIndBaixaProducao.FieldByName('cdSetor').AsString +
                        '   AND cdTamanho = ' + DmERP.qyIntIndBaixaProducao.FieldByName('cdTamanho').AsString +
                        '   AND cdIdQtde = ' + DmERP.qyIntIndBaixaProducao.FieldByName('cdIdQtde').AsString
                       );

      Informacao('Vínculo removido com sucesso. Este item se encontra agora como em estoque interno.');
  end;
end;

procedure TFIntIndBaixaProducao.GravaValorItemTamBase(const scdItem,
                                                            scdTamanho : String;
                                                        var scdItemRelac,
                                                            scdItemBase,
                                                            scdTamanhoBase : String
                                                     );
var
  stDados : TStringList;
begin
  scdItemRelac   := '';
  scdItemBase    := '';
  scdTamanhoBase := '';

  try
    stDados := TStringList.Create;

    ExecuteSimplesSql(DmERP.fdConnERP,
                      'SELECT cdItemRelacionado, cdItemBase, cdTamanhoBase ' +
                      '  FROM erp.intIndItemRelacionado ' +
                      ' WHERE cdItem = ' + QuotedStr(scdItem) +
                      '   AND cdTamanho = ' + scdTamanho,
                      'cdItemRelacionado,cdItemBase,cdTamanhoBase',
                      stDados
                     );

    if (stDados.Count > 0) then
    begin
     if (Trim(stDados.Strings[0]) <> '') then
       scdItemRelac := Trim(stDados.Strings[0]);

     if (Trim(stDados.Strings[1]) <> '') then
       scdItemBase := Trim(stDados.Strings[1]);

     if (Trim(stDados.Strings[2]) <> '') then
       scdTamanhoBase := Trim(stDados.Strings[2]);
    end;
  finally
    if Assigned(stDados) then
      FreeAndNil(stDados);
  end;
end;

procedure TFIntIndBaixaProducao.CarregarDetalhamentoItemPed(var sdeCor,
                                                                sdeAlca,
                                                                sdeAdorno,
                                                                sdeChaveta,
                                                                sdeForracao,
                                                                sdeImagem,
                                                                scdItem,
                                                                sdtCadPedido,
                                                                sMsgValidacao  : String;
                                                            var icdTamanho,
                                                                icdCor,
                                                                icdAlca,
                                                                icdAdorno,
                                                                icdChaveta,
                                                                icdForracao,
                                                                icdImagem,
                                                                icdCliente,
                                                                iQtdTotalItem  : Integer
                                                           );
begin
  if not DmIntegracao.fdConnInteg.Connected then
    DmIntegracao.fdConnInteg.Connected := True;

  DmIntegracao.qyPedido.MacroByName('filtro').Value := ' WHERE nuPedido = ' + Copy(Trim(edcdCodBarras.Text), 1, 8) +
                                                       '   AND seq = ' + Copy(Trim(edcdCodBarras.Text), 9, 3);
  DmIntegracao.qyPedido.Open;

  if DmIntegracao.qyPedido.IsEmpty then
    sMsgValidacao := ' - Etiqueta com item de pedido inválido.'
  else
  begin
    scdItem := Trim(DmIntegracao.qyPedido.FieldByName('cdItem').AsString);

    if Copy(scdItem, Length(scdItem) - 2, 3) = '.12' then
      scdItem := Copy(scdItem, 1, Length(scdItem) - 3);

    icdCliente    := DmIntegracao.qyPedido.FieldByName('codigo_cliente').AsInteger;
    iQtdTotalItem := DmIntegracao.qyPedido.FieldByName('nuQtd').AsInteger;
    sdtCadPedido  := DmIntegracao.qyPedido.FieldByName('dt_reg').AsString;

    if DmIntegracao.qyVinculoItem.Active then
      DmIntegracao.qyVinculoItem.Close;

    DmIntegracao.qyVinculoItem.MacroByName('filtro').Value := ' WHERE item = ' + QuotedStr(DmIntegracao.qyPedido.FieldByName('item').AsString);
    DmIntegracao.qyVinculoItem.Open;
    DmIntegracao.qyVinculoItem.First;

    while not DmIntegracao.qyVinculoItem.Eof do
    begin
      case DmIntegracao.qyVinculoItem.FieldByName('cdVariavel').AsInteger of
        5 :icdTamanho := DmIntegracao.qyVinculoItem.FieldByName('cdVariavelSeq').AsInteger;
        10:
        begin
          icdCor := DmIntegracao.qyVinculoItem.FieldByName('cdVariavelSeq').AsInteger;
          sdeCor := DmIntegracao.qyVinculoItem.FieldByName('deVariavelSeq').AsString;
        end;
        15:
        begin
          icdAlca := DmIntegracao.qyVinculoItem.FieldByName('cdVariavelSeq').AsInteger;
          sdeAlca := DmIntegracao.qyVinculoItem.FieldByName('deVariavelSeq').AsString;
        end;
        19:
        begin
          icdAdorno := DmIntegracao.qyVinculoItem.FieldByName('cdVariavelSeq').AsInteger;
          sdeAdorno := DmIntegracao.qyVinculoItem.FieldByName('deVariavelSeq').AsString;
        end;
        20:
        begin
          icdChaveta := DmIntegracao.qyVinculoItem.FieldByName('cdVariavelSeq').AsInteger;
          sdeChaveta := DmIntegracao.qyVinculoItem.FieldByName('deVariavelSeq').AsString;
        end;
        25:
        begin
          icdForracao := DmIntegracao.qyVinculoItem.FieldByName('cdVariavelSeq').AsInteger;
          sdeForracao := DmIntegracao.qyVinculoItem.FieldByName('deVariavelSeq').AsString;
        end;
        30:
        begin
          icdImagem := DmIntegracao.qyVinculoItem.FieldByName('cdVariavelSeq').AsInteger;
          sdeImagem := DmIntegracao.qyVinculoItem.FieldByName('deVariavelSeq').AsString;
        end;
      end;

      DmIntegracao.qyVinculoItem.Next;
    end;
  end;

  if DmIntegracao.qyVinculoItem.Active then
    DmIntegracao.qyVinculoItem.Close;

  if DmIntegracao.qyPedido.Active then
    DmIntegracao.qyPedido.Close;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFIntIndBaixaProducao.cbMovEstSetAntClick(Sender: TObject);
begin
  if not cbMovEstSetAnt.Checked then
  begin
    cbRetEstInterno.Checked   := False;
    cbMovItemCompleto.Checked := False;
  end;
end;

procedure TFIntIndBaixaProducao.cbMovItemCompletoClick(Sender: TObject);
begin
  if cbMovItemCompleto.Checked then
  begin
//    cbRetEstInterno.Checked := False;
    cbMovEstSetAnt.Checked  := True;
  end;
end;

procedure TFIntIndBaixaProducao.cbRetEstInternoClick(Sender: TObject);
begin
  if cbRetEstInterno.Checked then
  begin
    cbMovEstSetAnt.Checked    := True;
//    cbMovItemCompleto.Checked := False;
  end;
end;

procedure TFIntIndBaixaProducao.btZerarContagemClick(Sender: TObject);
begin
  edQtdeMov.Text := '0';
end;

procedure TFIntIndBaixaProducao.btAjustaIDsClick(Sender: TObject);
begin
  AjustaIdsQtde;
end;

procedure TFIntIndBaixaProducao.AjustaIdsQtde;
var
  stDados    : TStringList;
  sWhere,
  scdChave   : String;
  icdIdQtde  : Integer;

  function ProxIdQtde : Integer;
 { var
    iMaxIdProx,
    iMaxIdAtual : Integer;  }
  begin
    Result := 1;

    if not qyAjusteIdP4.IsEmpty then
    begin
      stDados.Clear;
      ExecuteSimplesSql(DmERP.fdConnERP,
                        'SELECT MAX(t.maxIdQtde) AS maxIdQtde ' +
                        '  FROM ( ' +
                        '        SELECT COALESCE(MAX(cdIdQtde), 0) AS maxIdQtde ' +
                        '          FROM erp.intIndBaixaProducao a ' +
                        '         WHERE a.cdItem = ' + QuotedStr(qyAjusteIdP4.FieldByName('cdItem').AsString) +
                        '           AND a.cdTamanho = ' + qyAjusteIdP4.FieldByName('cdTamanho').AsString +
                        '           AND a.cdSetor = 3 ' +
                        '         UNION ALL ' +
                        '        SELECT COALESCE(MAX(cdIdQtde), 0) AS maxIdQtde ' +
                        '          FROM erp.intIndBaixaProducao a ' +
                        '         WHERE a.cdItem = ' + QuotedStr(qyAjusteIdP4.FieldByName('cdItem').AsString) +
                        '           AND a.cdTamanho = ' + qyAjusteIdP4.FieldByName('cdTamanho').AsString +
                        '           AND a.cdSetor = 4 ' +
                        '         UNION ALL ' +
                        '        SELECT COALESCE(MAX(cdIdQtde), 0) AS maxIdQtde ' +
                        '          FROM erp.intIndBaixaProducao a ' +
                        '         WHERE a.cdItem = ' + QuotedStr(qyAjusteIdP4.FieldByName('cdItem').AsString) +
                        '           AND a.cdTamanho = ' + qyAjusteIdP4.FieldByName('cdTamanho').AsString +
                        '           AND a.cdSetor = 8 ' +
                        '         UNION ALL ' +
                        '        SELECT COALESCE(MAX(cdIdQtde), 0) AS maxIdQtde ' +
                        '          FROM erp.intIndBaixaProducao a ' +
                        '         WHERE a.cdItem = ' + QuotedStr(qyAjusteIdP4.FieldByName('cdItem').AsString) +
                        '           AND a.cdTamanho = ' + qyAjusteIdP4.FieldByName('cdTamanho').AsString +
                        '           AND a.cdSetor = 9 ' +
                        '       ) t ',
                        'maxIdQtde',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        Result := StrToIntDef(stDados.Strings[0], 0);
  {
      iMaxIdAtual := 0;
      iMaxIdProx  := 0;

      stDados.Clear;
      ExecuteSimplesSql(DmERP.fdConnERP,
                        'SELECT COALESCE(MAX(cdIdQtde), 0) As maxIdQtde ' +
                        '  FROM erp.intIndBaixaProducao a ' +
                        ' WHERE a.cdItem = ' + QuotedStr(qyAjusteIdP4.FieldByName('cdItem').AsString) +
                        '   AND a.cdSetor = ' + qyAjusteIdP4.FieldByName('cdSetor').AsString +
                        '   AND a.cdTamanho = ' + qyAjusteIdP4.FieldByName('cdTamanho').AsString,
                        'maxIdQtde',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        iMaxIdAtual := StrToIntDef(stDados.Strings[0], 0);

      stDados.Clear;
      ExecuteSimplesSql(DmERP.fdConnERP,
                        'SELECT COALESCE(MAX(cdIdQtde), 0) As maxIdQtde ' +
                        '  FROM erp.intIndBaixaProducao a ' +
                        ' WHERE a.cdItem = ' + QuotedStr(qyAjusteIdP4.FieldByName('cdItem').AsString) +
                        '   AND a.cdSetor = ( ' +
                        '                    SELECT s.cdSetor ' +
                        '                      FROM erp.setor s ' +
                        '                     WHERE s.cdSetorAnterior = ' + qyAjusteIdP4.FieldByName('cdSetor').AsString +
                        '                   ) ' +
                        '   AND a.cdTamanho = ' + qyAjusteIdP4.FieldByName('cdTamanho').AsString,
                        'maxIdQtde',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        iMaxIdProx := StrToIntDef(stDados.Strings[0], 0);

      if iMaxIdProx >= iMaxIdAtual then
        Result := iMaxIdProx
      else
        Result := iMaxIdAtual;
  }
      Inc(Result);
    end;
  end;
begin
  try
    sWhere  := '';
    stDados := TStringList.Create;

    qyAjusteIdP4.DisableControls;

    if qyAjusteIdP4.Active then
      qyAjusteIdP4.Close;

    qyAjusteIdP4.ParamByName('cdSetor').AsInteger := dsSetor.DataSet.FieldByName('cdSetor').AsInteger;

    qyAjusteIdP4.MacroByName('filtro').Clear;

    if (Trim(edcdItem.ERPEdCampoChaveText) <> '') then
      AdicionaCondSql(sWhere, ' cdItem = ' + QuotedStr(edcdItem.ERPEdCampoChaveText));

//    if lcbcdTamanho.KeyValue <> null then
//      AdicionaCondSql(sWhere, ' cdTamanho = ' + IntToStr(lcbcdTamanho.KeyValue));

    if Trim(sWhere) <> '' then
      qyAjusteIdP4.MacroByName('filtro').Value := ' AND ' + sWhere;

    qyAjusteIdP4.Open();
    qyAjusteIdP4.First;

    icdIdQtde := 1;
    scdChave  := qyAjusteIdP4.FieldByName('cdSetor').AsString +
                 qyAjusteIdP4.FieldByName('cdItem').AsString +
                 qyAjusteIdP4.FieldByName('cdTamanho').AsString;

    icdIdQtde := ProxIdQtde;

    while not qyAjusteIdP4.Eof do
    begin
      if (scdChave <> qyAjusteIdP4.FieldByName('cdSetor').AsString +
                      qyAjusteIdP4.FieldByName('cdItem').AsString +
                      qyAjusteIdP4.FieldByName('cdTamanho').AsString
         ) then
      begin
        scdChave  := qyAjusteIdP4.FieldByName('cdSetor').AsString +
                     qyAjusteIdP4.FieldByName('cdItem').AsString +
                     qyAjusteIdP4.FieldByName('cdTamanho').AsString;
        icdIdQtde := ProxIdQtde;
      end;

      qyAjusteIdP4.Edit;
      qyAjusteIdP4.FieldByName('cdIdQtde').AsInteger := icdIdQtde;
      qyAjusteIdP4.Post;

      Inc(icdIdQtde);
      qyAjusteIdP4.Next;
    end;
  finally
    qyAjusteIdP4.EnableControls;

    if Assigned(stDados) then
      FreeAndNil(stDados);

    Aviso('Fim');
  end;
end;

procedure TFIntIndBaixaProducao.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFIntIndBaixaProducao.btFecharClick(Sender: TObject);
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

procedure TFIntIndBaixaProducao.btImgItemClick(Sender: TObject);
begin
  FMostrarImg := TFMostrarImg.Create(Application);

  try
    FMostrarImg.FsPathImg := '\\192.168.100.100\MCM\Arquivos_Promob\Item\Imagens\' + edcdItemPesq.Text + '.jpg';
    FMostrarImg.ShowModal;
  finally
    FreeAndNil(FMostrarImg);
  end;
end;

procedure TFIntIndBaixaProducao.btMovimentarClick(Sender: TObject);
begin
  MovimentarItem('', cbMovEstSetAnt.Checked);
end;

procedure TFIntIndBaixaProducao.btVerificarNaoMovClick(Sender: TObject);
begin
  stMsgValid.Insert(0, 'As seguintes informações devem ser verificadas:');
  stMsgValid.Insert(1, '');
  MensagemAviso(stMsgValid);
  stMsgValid.Clear;
  btVerificarNaoMov.Enabled    := False;
  btVerificarNaoMov.Font.Color := clWindowText;
end;

procedure TFIntIndBaixaProducao.edcdCodBarrasChange(Sender: TObject);
begin
  if Length(edcdCodBarras.Text) = 14 then
  begin
    MovimentarItem(edcdCodBarras.Text, cbMovEstSetAnt.Checked);

    edcdCodBarras.Clear;
  end;
end;

procedure TFIntIndBaixaProducao.FocoCampoBaixa;
begin
  if (dsSetor.DataSet.FieldByName('cdSetorAnterior').IsNull) then
    edcdItem.ERPEdCampoChaveSetFocus
  else if (edcdCodBarras.Visible) and (edcdCodBarras.Enabled) and (edcdCodBarras.CanFocus) then
    edcdCodBarras.SetFocus
  else
    edcdItem.ERPEdCampoChaveSetFocus;
end;

procedure TFIntIndBaixaProducao.AplicarFiltro;
var
  sAux,
  sWhere : String;
begin
  if (DmERP.qyIntIndBaixaProducao.Active) then
    DmERP.qyIntIndBaixaProducao.Close;

  DmERP.qyIntIndBaixaProducao.MacroByName('filtro').Clear;

  sWhere := '';

  if (eddtBaixaIni.Checked) and
     (eddtBaixaFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtBaixaIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtBaixaFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtBaixa BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtBaixaIni.DateTime)) +
                    '             AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtBaixaFim.DateTime))
                   );

  if (edcdSetorPesq.ERPEdCampoChaveText <> '') and (edcdSetorPesq.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdSetor = ' + edcdSetorPesq.ERPEdCampoChaveText);

  if (Trim(edcdCargaPesq.ERPEdCampoChaveText) <> '') and (edcdCargaPesq.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdCarga = ' + Trim(edcdCargaPesq.ERPEdCampoChaveText));

  if (Trim(edcdUsuarioBaixa.ERPEdCampoChaveText) <> '') and (edcdUsuarioBaixa.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdUsuarioBaixa = ' + Trim(edcdUsuarioBaixa.ERPEdCampoChaveText));

  if (Trim(edcdItemPesq.Text) <> '') then
    AdicionaCondSql(sWhere, ' cdItem LIKE ' + QuotedStr('%' + edcdItemPesq.Text + '%'));

  if (lcbcdTamanhoPesq.KeyValue <> null) and (lcbcdTamanhoPesq.KeyValue > -1) then
    AdicionaCondSql(sWhere, ' cdTamanho = ' + IntToStr(lcbcdTamanhoPesq.KeyValue));

  if (StrToIntDef(edcdPedido.Text, 0) > 0) then
  begin
    sAux := '';

    if DmIntegracao.qyPedAgrup.Active then
      DmIntegracao.qyPedAgrup.Close;

    DmIntegracao.qyPedAgrup.ParamByName('nuPed').AsInteger := StrToIntDef(edcdPedido.Text, 0);
    DmIntegracao.qyPedAgrup.Open;

    if not DmIntegracao.qyPedAgrup.IsEmpty then
    begin
      DmIntegracao.qyPedAgrup.First;

      while not DmIntegracao.qyPedAgrup.Eof do
      begin
        if Trim(sAux) = '' then
          sAux := DmIntegracao.qyPedAgrup.FieldByName('pedido_ori').AsString
        else
          sAux := sAux + ', ' + DmIntegracao.qyPedAgrup.FieldByName('pedido_ori').AsString;

        DmIntegracao.qyPedAgrup.Next;
      end;
    end;

    if Trim(sAux) <> '' then
      AdicionaCondSql(sWhere, ' cdPedido IN(' + edcdPedido.Text + ',' + sAux + ')')
    else
      AdicionaCondSql(sWhere, ' cdPedido = ' + edcdPedido.Text);
  end;

  case cbTipoEstoque.ItemIndex of
  1: AdicionaCondSql(sWhere, ' cdPedido IS NULL');
  2: AdicionaCondSql(sWhere, ' cdPedido IS NOT NULL');
  end;

  if cbSomenteEst.Checked then
    AdicionaCondSql(sWhere, ' flEmEstoque = ''S'' ');

  if cbNaoImpEnzibEnzit.Checked then
    AdicionaCondSql(sWhere, ' cdItem NOT LIKE ''ENZIBA%'' AND cdItem NOT LIKE ''ENZIT%''');

  if Trim(sWhere) <> '' then
    DmERP.qyIntIndBaixaProducao.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyIntIndBaixaProducao.Open();

  if DmERP.qyIntIndBaixaProducao.IsEmpty then
    ednuQtdeTotal.Text := '0'
  else
    ednuQtdeTotal.Text := IntToStr(DmERP.qyIntIndBaixaProducao.RecordCount);
end;

procedure TFIntIndBaixaProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(stMsgValid) then
    FreeAndNil(stMsgValid);
end;

procedure TFIntIndBaixaProducao.FormCreate(Sender: TObject);
begin
//  Application.OnMessage := MudarComEnter;

  stMsgValid := TStringList.Create;

  btConsultar.Glyph.LoadFromResourceName(HInstance,     'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,        'IMGBTFECHAR_32X32');
  btMovimentar.Glyph.LoadFromResourceName(HInstance,    'IMGBTSALVAR_32X32');
  btZerarContagem.Glyph.LoadFromResourceName(HInstance, 'IMGBTVOLTAR_16X16');
  btImgItem.Glyph.LoadFromResourceName(HInstance,       'IMGBTIMAGEM_16X16');

  qyEmpresa.Open();
  lcbcdEmpresa.KeyValue := 1;

  qySetor.Open();
  qySetor.First;

  if qySetor.Locate('cdSetor', VarArrayOf([FTelaInicial.FcdSetorUsuario]), []) then
    lcbcdSetor.KeyValue := FTelaInicial.FcdSetorUsuario;

  qySetorPesq.Open();
  qySetorPesq.First;

  if qySetorPesq.Locate('cdSetor', VarArrayOf([FTelaInicial.FcdSetorUsuario]), []) then
  begin
    edcdSetorPesq.ERPEdCampoChaveText := IntToStr(FTelaInicial.FcdSetorUsuario);
    edcdSetorPesq.ValidaCampoChave(edcdSetorPesq.ERPEdCampoChaveText);
  end;

  edcdUsuarioBaixa.ERPEdCampoChaveText := IntToStr(FTelaInicial.FcdUsuario);
  edcdUsuarioBaixa.ValidaCampoChave(IntToStr(FTelaInicial.FcdUsuario));

  eddtBaixaIni.DateTime := DataHoraAtual(DmERP.fdConnERP);
  eddtBaixaFim.DateTime := eddtBaixaIni.DateTime;
  AplicarFiltro;

  lcbcdSetor.Enabled         := (FTelaInicial.FcdUsuario in[1,2,3,13,20]);
 // cbMovEstSetAnt.Visible     := lcbcdSetor.Enabled;
  btAjustaIDs.Visible        := (FTelaInicial.FcdUsuario in[1,3]);

  edQtdeMov.Text             := '0';

  pmiRemoverPedido.Enabled   := (dsSetor.DataSet.FieldByName('flEhSetorEmbalagem').AsString = 'S') or
                                (dsSetor.DataSet.FieldByName('flEhSetAntMont').AsString = 'S');
end;

procedure TFIntIndBaixaProducao.FormShow(Sender: TObject);
begin
  vtTamanho.Open;
  vtTamanho.Clear;

  vtTamanhoPesq.Open;
  vtTamanho.Clear;

  try
    vtTamanho.DisableControls;
    vtTamanhoPesq.DisableControls;

    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyVariavelItens.MacroByName('filtro').Value := ' WHERE codigo_variavel = 5';
    DmIntegracao.qyVariavelItens.Open;
    DmIntegracao.qyVariavelItens.First;

    vtTamanho.Insert;
    vtTamanho.FieldByName('cdTamanho').AsInteger := 0;
    vtTamanho.FieldByName('deTamanho').AsString  := 'Sem Tamanho';
    vtTamanho.Post;

    vtTamanhoPesq.Insert;
    vtTamanhoPesq.FieldByName('cdTamanho').AsInteger := 0;
    vtTamanhoPesq.FieldByName('deTamanho').AsString  := 'Sem Tamanho';
    vtTamanhoPesq.Post;

    vtTamanhoPesq.Insert;
    vtTamanhoPesq.FieldByName('cdTamanho').AsInteger := -1;
    vtTamanhoPesq.FieldByName('deTamanho').AsString  := '';
    vtTamanhoPesq.Post;

    while not DmIntegracao.qyVariavelItens.Eof do
    begin
      vtTamanho.Insert;
      vtTamanho.FieldByName('cdTamanho').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
      vtTamanho.FieldByName('deTamanho').AsString  := DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString;
      vtTamanho.Post;

      vtTamanhoPesq.Insert;
      vtTamanhoPesq.FieldByName('cdTamanho').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
      vtTamanhoPesq.FieldByName('deTamanho').AsString  := DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString;
      vtTamanhoPesq.Post;

      DmIntegracao.qyVariavelItens.Next
    end;
  finally
    if DmIntegracao.qyVariavelItens.Active then
      DmIntegracao.qyVariavelItens.Close;

    DmIntegracao.fdConnInteg.Connected := False;
    vtTamanho.First;
    vtTamanho.EnableControls;

    vtTamanhoPesq.First;
    vtTamanhoPesq.EnableControls;
  end;

  FocoCampoBaixa;
end;

procedure TFIntIndBaixaProducao.grDadosDblClick(Sender: TObject);
begin
  if (DmERP.qyIntIndBaixaProducao.Active) and (not DmERP.qyIntIndBaixaProducao.IsEmpty) then
  begin
    if (FTelaInicial.FcdUsuario in[1,3]) or (FTelaInicial.FcdUsuario = DmERP.qyIntIndBaixaProducao.FieldByName('cdUsuarioBaixa').AsInteger) then
    begin
      DmERP.ExcluirBaixaProducao;

      ednuQtdeTotal.Text := IntToStr(StrToIntDef(ednuQtdeTotal.Text, 0) - 1);

      FocoCampoBaixa;
    end
    else
      Informacao('Não é premitido a exclusão de movimentos de outros usuários.');
  end;
end;

procedure TFIntIndBaixaProducao.lcbcdSetorExit(Sender: TObject);
begin
  pmiRemoverPedido.Enabled := (dsSetor.DataSet.FieldByName('flEhSetorEmbalagem').AsString = 'S') or
                              (dsSetor.DataSet.FieldByName('flEhSetAntMont').AsString = 'S');
end;

////////////////////////////////////////////////////////////////////////////////

function TFIntIndBaixaProducao.CamposPreenchidos : TStrings;
begin
  Result := TStringList.Create;

  if lcbcdSetor.KeyValue = null then
    Result.Add(' - Informe o setor antes de movimentar.');

  if (not edcdItem.ERPValorValido) and (Trim(edcdCodBarras.Text) = '') then
    Result.Add(' - Informe um item antes de movimentar.');

  if (lcbcdTamanho.KeyValue = null) and (Trim(edcdCodBarras.Text) = '') then
    Result.Add(' - Informe o tamanho antes de movimentar.');

  if (dsSetor.DataSet.FieldByName('flEhSetorExpedicao').AsString = 'S') then
  begin
    if (not edcdCarga.ERPValorValido) then
      Result.Add(' - Para movimentar esta etiqueta, o código da carga deve ser informado.');

    if (Trim(edcdCodBarras.Text) = '') then
      Result.Add(' - Para movimentar esta etiqueta, o código de barras deve ser informado.');
  end;

  if (cbRetEstInterno.Checked) and (Trim(edcdCodBarras.Text) = '') then
    Result.Add(' - Para retirar do estoque interno, o código de barras deve ser informado.');

  if Result.Count > 0 then
  begin
    Result.Insert(0, 'As seguintes informações devem ser verificadas:');
    Result.Insert(1, '');
  end;
end;

procedure TFIntIndBaixaProducao.MovimentarItem(sCodBarras : String = ''; const bMovEstoque : Boolean = True);
var
  sMsg,
  sdeCor,
  sdeAlca,
  sdeAdorno,
  sdeChaveta,
  sdeForracao,
  sdeImagem,
  scdItem,
  sdtCadPedido,
  sMsgValidItemPed : String;
  icdTamanho,
  icdCor,
  icdAlca,
  icdAdorno,
  icdChaveta,
  icdForracao,
  icdImagem,
  icdCliente,
  iQtdTotalItemPed,
  icdIdQtdeSeqPed,
  i,
  iQtdTotItem,
  icdIdQtde        : Integer;
  stAux,
  stDados,
  stMsgAviso       : TStringList;
  bEhItemRevenda,
  bEhItemAcessorio : Boolean;

  procedure AtualizaMovItem;
  var
    sUpdate : String;
  begin
    sUpdate := 'UPDATE erp.intIndBaixaProducao ' +
               '   SET cdPedido = ' + Copy(sCodBarras, 1, 8) + ', ' +
               '       cdSeqPed = ' + Copy(sCodBarras, 9, 3) + ', ' +
               '       cdIdQtdeSeqPed = ' + IntToStr(icdIdQtdeSeqPed) + ', ' +
               '       cdCliente = ' + IntToStr(icdCliente) + ', ' +
               '       nuQtdTotalItem = ' + IntToStr(iQtdTotalItemPed) + ', ' +
               '       dtCadPedido = ' + QuotedStr(sdtCadPedido);

    if icdCor > 0 then
      sUpdate := sUpdate +
                 ', cdCor = ' + IntToStr(icdCor) +
                 ', deCor = ' + QuotedStr(sdeCor);

    if icdAlca > 0 then
      sUpdate := sUpdate +
                 ', cdAlca = ' + IntToStr(icdAlca) +
                 ', deAlca = ' + QuotedStr(sdeAlca);

    if icdAdorno > 0 then
      sUpdate := sUpdate +
                 ', cdAdorno = ' + IntToStr(icdAdorno) +
                 ', deAdorno = ' + QuotedStr(sdeAdorno);

    if icdChaveta > 0 then
      sUpdate := sUpdate +
                 ', cdChaveta = ' + IntToStr(icdChaveta) +
                 ', deChaveta = ' + QuotedStr(sdeChaveta);

    if icdForracao > 0 then
      sUpdate := sUpdate +
                 ', cdForracao = ' + IntToStr(icdForracao) +
                 ', deForracao = ' + QuotedStr(sdeForracao);

    if icdImagem > 0 then
      sUpdate := sUpdate +
                 ', cdImagem = ' + IntToStr(icdImagem) +
                 ', deImagem = ' + QuotedStr(sdeImagem);

    sUpdate := sUpdate +
               ' WHERE cdItem = ' + QuotedStr(scdItem) +
               '   AND cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetor').AsString +
               '   AND cdTamanho = ' + IntToStr(icdTamanho) +
               '   AND cdIdQtde = ' + IntToStr(icdIdQtde);

    ExecuteInstrucaoSql(DmERP.fdConnERP, sUpdate);
  end;

  procedure InserirMovItem;
    procedure GravarValorVariavel(const icdVar : Integer; const sdeVar, snmVar : String);
    begin
      if icdVar > 0 then
      begin
        DmERP.qyIntIndBaixaProducao.FieldByName('cd' + snmVar).AsInteger := icdVar;
        DmERP.qyIntIndBaixaProducao.FieldByName('de' + snmVar).AsString  := sdeVar;
      end;
    end;
  var
    sSql,
    scdItemRelac,
    scdItemBase,
    scdTamanhoBase,
    sWhereExtra     : String;
    icdIdQtdeAnt,
    iUltIdQtde      : Integer;
    dthrAtual       : TDateTime;
    bBuscaIdQtdeAnt : Boolean;
  begin
    scdItemRelac   := '';
    scdItemBase    := '';
    scdTamanhoBase := '';
    dthrAtual      := DataHoraAtual(DmERP.fdConnERP);

    DmERP.qyIntIndBaixaProducao.Insert;

    if (Trim(sCodBarras) <> '') then
    begin
      DmERP.qyIntIndBaixaProducao.FieldByName('cdPedido').AsInteger       := StrToIntDef(Copy(sCodBarras, 1, 8), 0);
      DmERP.qyIntIndBaixaProducao.FieldByName('cdSeqPed').AsInteger       := StrToIntDef(Copy(sCodBarras, 9, 3), 0);
      DmERP.qyIntIndBaixaProducao.FieldByName('cdIdQtdeSeqPed').AsInteger := icdIdQtdeSeqPed;

      if (StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0) > 0) and
         (edcdCarga.ERPValorValido) and
         (dsSetor.DataSet.FieldByName('flEhSetorExpedicao').AsString = 'S') then
      begin
        DmERP.qyIntIndBaixaProducao.FieldByName('cdCarga').AsInteger      := StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0);
        DmERP.qyIntIndBaixaProducao.FieldByName('deCarga').AsString       := edcdCarga.ERPLbDescricaoCaption;
      end;

      DmERP.qyIntIndBaixaProducao.FieldByName('cdCliente').AsInteger      := icdCliente;
      DmERP.qyIntIndBaixaProducao.FieldByName('nuQtdTotalItem').AsInteger := iQtdTotalItemPed;
      DmERP.qyIntIndBaixaProducao.FieldByName('dtCadPedido').AsDateTime   := StrToDateTime(sdtCadPedido);

      GravarValorVariavel(icdCor,      sdeCor,      'Cor');
      GravarValorVariavel(icdAlca,     sdeAlca,     'Alca');
      GravarValorVariavel(icdAdorno,   sdeAdorno,   'Adorno');
      GravarValorVariavel(icdChaveta,  sdeChaveta,  'Chaveta');
      GravarValorVariavel(icdForracao, sdeForracao, 'Forracao');
      GravarValorVariavel(icdImagem,   sdeImagem,   'Imagem');
    end;

    if bEhItemRevenda then
      DmERP.qyIntIndBaixaProducao.FieldByName('flEhRevenda').AsString    := 'S'
    else
      DmERP.qyIntIndBaixaProducao.FieldByName('flEhRevenda').AsString    := 'N';

    if bEhItemAcessorio then
      DmERP.qyIntIndBaixaProducao.FieldByName('flEhAcessorio').AsString  := 'S'
    else
      DmERP.qyIntIndBaixaProducao.FieldByName('flEhAcessorio').AsString  := 'N';

    iUltIdQtde      := RetornaIdQtde;
    icdIdQtdeAnt    := 0;
    bBuscaIdQtdeAnt := True;

    if (dsSetor.DataSet.FieldByName('flEhSetorEmbalagem').AsString = 'S') and
       (
        (DmERP.qyIntIndBaixaProducao.FieldByName('flEhRevenda').AsString = 'S') or
        (DmERP.qyIntIndBaixaProducao.FieldByName('flEhAcessorio').AsString = 'S')
       ) then
      bBuscaIdQtdeAnt := False;   

    if (bMovEstoque) and
       (bBuscaIdQtdeAnt) and
       (dsSetor.DataSet.FieldByName('cdSetorAnterior').AsInteger > 0) then
    begin
      DmERP.qyIntIndBaixaProducao.FieldByName('cdSetorAnterior').AsInteger := dsSetor.DataSet.FieldByName('cdSetorAnterior').AsInteger;
      DmERP.qyIntIndBaixaProducao.FieldByName('deSetorAnt').AsString       := dsSetor.DataSet.FieldByName('deSetorAnt').AsString;

      sSql := 'SELECT MIN(cdIdQtde) AS ultIdQtde ' +
              '  FROM erp.intIndBaixaProducao ' +
              ' WHERE cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetorAnterior').AsString +
              '   AND cdItem = ' + QuotedStr(scdItem) +
              '   AND cdTamanho = ' + IntToStr(icdTamanho) +
              '   AND flEmEstoque = ''S'' ';

      if (Trim(sCodBarras) <> '') and (dsSetor.DataSet.FieldByName('flEhSetAntMont').AsString = 'N') then
        sSql := sSql + ' AND cdPedido IS NOT NULL ';
      
      stDados.Clear;
      ExecuteSimplesSql(DmERP.fdConnERP,
                        sSql,
                        'ultIdQtde',
                        stDados
                       );

      if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        icdIdQtdeAnt := StrToIntDef(stDados.Strings[0], 0);

      if (icdIdQtdeAnt = 0) and (dsSetor.DataSet.FieldByName('flEhSetAntMont').AsString = 'S') then
      begin
        GravaValorItemTamBase(edcdItem.ERPEdCampoChaveText,
                              IntToStr(icdTamanho),
                              scdItemRelac,
                              scdItemBase,
                              scdTamanhoBase
                             );

        if (Trim(scdItemRelac) <> '') and (Trim(scdItemBase) <> '') and (Trim(scdTamanhoBase) <> '') then
        begin
          DmERP.qyIntIndBaixaProducao.FieldByName('cdItemRelacionado').AsString := scdItemRelac;
          DmERP.qyIntIndBaixaProducao.FieldByName('cdItemBase').AsString        := scdItemBase;
          DmERP.qyIntIndBaixaProducao.FieldByName('cdTamanhoBase').AsString     := scdTamanhoBase;

          stDados.Clear;
          ExecuteSimplesSql(DmERP.fdConnERP,
                            'SELECT MIN(cdIdQtde) AS ultIdQtde ' +
                            '  FROM erp.intIndBaixaProducao ' +
                            ' WHERE cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetorAnterior').AsString +
                            '   AND cdItem = ' + QuotedStr(scdItemBase) +
                            '   AND cdTamanho = ' + scdTamanhoBase +
                            '   AND flEmEstoque = ''S'' ',
                            'ultIdQtde',
                            stDados
                           );

          if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
            icdIdQtdeAnt := StrToIntDef(stDados.Strings[0], 0);
        end;
      end;

      if (icdIdQtdeAnt > 0) then
        DmERP.qyIntIndBaixaProducao.FieldByName('cdIdQtdeAnterior').AsInteger := icdIdQtdeAnt;
    end;

    DmERP.qyIntIndBaixaProducao.FieldByName('cdEmpresa').AsInteger       := dsEmpresa.DataSet.FieldByName('cdEmpresa').AsInteger;
    DmERP.qyIntIndBaixaProducao.FieldByName('cdSetor').AsInteger         := dsSetor.DataSet.FieldByName('cdSetor').AsInteger;
    DmERP.qyIntIndBaixaProducao.FieldByName('cdIdQtde').AsInteger        := iUltIdQtde;
    DmERP.qyIntIndBaixaProducao.FieldByName('cdItem').AsString           := edcdItem.ERPEdCampoChaveText;
    DmERP.qyIntIndBaixaProducao.FieldByName('deItem').AsString           := edcdItem.ERPLbDescricaoCaption;
    DmERP.qyIntIndBaixaProducao.FieldByName('cdTamanho').AsInteger       := icdTamanho;
    DmERP.qyIntIndBaixaProducao.FieldByName('deTamanho').AsString        := vtTamanho.FieldByName('deTamanho').AsString;
    DmERP.qyIntIndBaixaProducao.FieldByName('flEmEstoque').AsString      := 'S';
    DmERP.qyIntIndBaixaProducao.FieldByName('dtBaixa').AsDateTime        := Trunc(dthrAtual);
    DmERP.qyIntIndBaixaProducao.FieldByName('hrBaixa').AsInteger         := HoraParaMinutos(dthrAtual);
    DmERP.qyIntIndBaixaProducao.FieldByName('cdUsuarioBaixa').AsInteger  := FTelaInicial.FcdUsuario;

    DmERP.qyIntIndBaixaProducao.FieldByName('nmEmpresa').AsString          := dsEmpresa.DataSet.FieldByName('nmEmpresa').AsString;
    DmERP.qyIntIndBaixaProducao.FieldByName('deSetor').AsString            := dsSetor.DataSet.FieldByName('deSetor').AsString;
    DmERP.qyIntIndBaixaProducao.FieldByName('nmUsuBaixa').AsString         := FTelaInicial.FnmUsuario;
    DmERP.qyIntIndBaixaProducao.FieldByName('deHrBaixa').AsString          := FormatDateTime('HH:mm', MinutosParaTime(DmERP.qyIntIndBaixaProducao.FieldByName('hrBaixa').AsInteger));
    DmERP.qyIntIndBaixaProducao.FieldByName('flEhSetorMontagem').AsString  := dsSetor.DataSet.FieldByName('flEhSetorMontagem').AsString;
    DmERP.qyIntIndBaixaProducao.FieldByName('flEhSetorEmbalagem').AsString := dsSetor.DataSet.FieldByName('flEhSetorEmbalagem').AsString;
    DmERP.qyIntIndBaixaProducao.FieldByName('flEhSetorExpedicao').AsString := dsSetor.DataSet.FieldByName('flEhSetorExpedicao').AsString;

    DmERP.qyIntIndBaixaProducao.FieldByName('flEhSetAntMont').AsString     := dsSetor.DataSet.FieldByName('flEhSetAntMont').AsString;

    if bMovEstoque then
      DmERP.qyIntIndBaixaProducao.FieldByName('flMovEstSetorAnt').AsString := 'S'
    else
      DmERP.qyIntIndBaixaProducao.FieldByName('flMovEstSetorAnt').AsString := 'N';

    stAux.Clear;
    stAux.AddStrings(DmERP.BaixaProducaoValida);

    if stAux.Count > 0 then
    begin
      DmERP.qyIntIndBaixaProducao.Cancel;
      stMsgValid.Add('');
      stMsgValid.Add(' * Validações do item ' + edcdItem.ERPEdCampoChaveText +
                     ', tamanho ' + lcbcdTamanho.Text +
         //            ', ID Qtde. ' + IntToStr(iUltIdQtde) +
                     ': ');
      stMsgValid.Add('');
      stMsgValid.AddStrings(stAux);
    end
    else
    begin
      RegistraInicioCarreg;
      DmERP.GravarBaixaProducao;

      edQtdeMov.Text     := IntToStr(StrToIntDef(edQtdeMov.Text, 0) + 1);
      ednuQtdeTotal.Text := IntToStr(StrToIntDef(ednuQtdeTotal.Text, 0) + 1);

      if bMovEstoque then
      begin
        if (dsSetor.DataSet.FieldByName('cdSetorAnterior').AsInteger > 0) and (icdIdQtdeAnt > 0) then
        begin
          if (dsSetor.DataSet.FieldByName('flEhSetAntMont').AsString = 'S') and
             (Trim(scdItemRelac) <> '') and (Trim(scdItemBase) <> '') and (Trim(scdTamanhoBase) <> '') then
            ExecuteInstrucaoSql(DmERP.fdConnERP,
                                'UPDATE erp.intIndBaixaProducao ' +
                                '   SET flEmEstoque = ''N'', ' +
                                '       cdUsuarioAlteracao = ' + IntToStr(FTelaInicial.FcdUsuario) + ', ' +
                                '       dtAlteracao = CURRENT_DATE, ' +
                                '       hrAlteracao = erp.MinutosAtual() ' +
                                ' WHERE cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetorAnterior').AsString +
                                '   AND cdItem = ' + QuotedStr(scdItemBase) +
                                '   AND cdTamanho = ' + scdTamanhoBase +
                                '   AND cdIdQtde = ' + IntToStr(icdIdQtdeAnt)
                               )
          else
            ExecuteInstrucaoSql(DmERP.fdConnERP,
                                'UPDATE erp.intIndBaixaProducao ' +
                                '   SET flEmEstoque = ''N'', ' +
                                '       cdUsuarioAlteracao = ' + IntToStr(FTelaInicial.FcdUsuario) + ', ' +
                                '       dtAlteracao = CURRENT_DATE, ' +
                                '       hrAlteracao = erp.MinutosAtual() ' +
                                ' WHERE cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetorAnterior').AsString +
                                '   AND cdItem = ' + QuotedStr(edcdItem.ERPEdCampoChaveText) +
                                '   AND cdTamanho = ' + IntToStr(icdTamanho) +
                                '   AND cdIdQtde = ' + IntToStr(icdIdQtdeAnt)
                               );
        end;

        if (dsSetor.DataSet.FieldByName('flEhSetorExpedicao').AsString = 'S') then
          ExecuteInstrucaoSql(DmERP.fdConnERP,
                              'UPDATE erp.intIndBaixaProducao ' +
                              '   SET flEmEstoque = ''N'' ' +
                              ' WHERE cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetor').AsString +
                              '   AND cdItem = ' + QuotedStr(edcdItem.ERPEdCampoChaveText) +
                              '   AND cdTamanho = ' + IntToStr(icdTamanho) +
                              '   AND cdIdQtde = ' + IntToStr(iUltIdQtde)
                             );
      end;
    end;
  end;
begin
  sdeCor           := '';
  sdeAlca          := '';
  sdeAdorno        := '';
  sdeChaveta       := '';
  sdeForracao      := '';
  sdeImagem        := '';
  icdTamanho       := 0;
  icdCor           := 0;
  icdAlca          := 0;
  icdAdorno        := 0;
  icdChaveta       := 0;
  icdForracao      := 0;
  icdImagem        := 0;
  icdCliente       := 0;
  iQtdTotalItemPed := 0;
  scdItem          := '';
  sdtCadPedido     := '';
  sMsgValidItemPed := '';
  stMsgAviso       := TStringList.Create;
  stDados          := TStringList.Create;
  stAux            := TStringList.Create;

  stAux.AddStrings(CamposPreenchidos);

  if stAux.Count > 0 then
  begin
    edcdCodBarras.Clear;
    Application.ProcessMessages;
    MensagemAviso(stAux);
  end
  else
  begin
    iQtdTotItem := StrToIntDef(ednuQtde.Text, 1);
    scdItem     := edcdItem.ERPEdCampoChaveText;
    icdTamanho  := vtTamanho.FieldByName('cdTamanho').AsInteger;

    if (Trim(sCodBarras) <> '') then
    begin
      iQtdTotItem := 1;
      scdItem     := '';
      icdTamanho  := 0;

      CarregarDetalhamentoItemPed(sdeCor,
                                  sdeAlca,
                                  sdeAdorno,
                                  sdeChaveta,
                                  sdeForracao,
                                  sdeImagem,
                                  scdItem,
                                  sdtCadPedido,
                                  sMsgValidItemPed,
                                  icdTamanho,
                                  icdCor,
                                  icdAlca,
                                  icdAdorno,
                                  icdChaveta,
                                  icdForracao,
                                  icdImagem,
                                  icdCliente,
                                  iQtdTotalItemPed
                                 );
      icdIdQtdeSeqPed := StrToInt(Copy(sCodBarras, 12, 3));

      edcdItem.ERPEdCampoChaveText := scdItem;
      edcdItem.ValidaCampoChave(edcdItem.ERPEdCampoChaveText);

      lcbcdTamanho.KeyValue := icdTamanho;

      if (cbMovItemCompleto.Checked) and (iQtdTotalItemPed > 1) then
      begin
        iQtdTotItem     := iQtdTotalItemPed;
        icdIdQtdeSeqPed := 1;
      end;
    end;

    if (Trim(sMsgValidItemPed) <> '') then
    begin
      Application.ProcessMessages;
      stMsgAviso.Add(sMsgValidItemPed);
      MensagemAviso(stMsgAviso);
      stMsgAviso.Clear;
    end
    else
    begin
      bEhItemRevenda := False;

      stDados.Clear;
      ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                        'SELECT flag_tipo_prod ' +
                        '  FROM item ' +
                        '  WHERE item = ' + QuotedStr(scdItem),
                        'flag_tipo_prod',
                        stDados
                       );

      if (stDados.Count > 0) and (Trim(stDados.Strings[0]) <> '') then
        bEhItemRevenda := Trim(stDados.Strings[0]) = 'R';

      bEhItemAcessorio := (SameText(scdItem, 'ACESS')) or
                          (SameText(scdItem, 'ZINCO')) or
                          (SameText(scdItem, 'SOBTAMP01'));

      i := 1;

      while i <= iQtdTotItem do
      begin
        if (Trim(sCodBarras) <> '') then
        begin
          if EtiquetaJaMovimentada(dsSetor.DataSet.FieldByName('cdSetor').AsString,
                                   Copy(sCodBarras, 1, 8),
                                   Copy(sCodBarras, 9, 3),
                                   IntToStr(icdIdQtdeSeqPed)
                                  ) then
            stMsgValid.Add(' - Etiqueta do pedido ' + IntToStr(StrToInt(Copy(sCodBarras, 1, 8))) +
                           ', seq. ped. ' + IntToStr(StrToInt(Copy(sCodBarras, 9, 3))) +
                           ' na seq. de qtde. ' + IntToStr(icdIdQtdeSeqPed) + ' já movimentada.')
          else
          begin
            if (cbRetEstInterno.Checked) then
            begin
              icdIdQtde := RetornaIdQtdeEstInterno(scdItem,
                                                   dsSetor.DataSet.FieldByName('cdSetor').AsString,
                                                   IntToStr(icdTamanho)
                                                  );

              if icdIdQtde > 0 then
              begin
                AtualizaMovItem;

                stMsgAviso.Add(' - Item ' + scdItem + ' no tamanho ' + vtTamanho.FieldByName('deTamanho').AsString +
                               ' atualizado conforme a etiqueta do pedido ' + IntToStr(StrToInt(Copy(sCodBarras, 1, 8))) +
                               ', seq. ped. ' + IntToStr(StrToInt(Copy(sCodBarras, 9, 3))) +
                               ' na seq. de qtde. ' + IntToStr(icdIdQtdeSeqPed));
              end
              else
              begin
                stMsgAviso.Add(' - Item ' + scdItem + ' no tamanho ' + vtTamanho.FieldByName('deTamanho').AsString +
                               ' não existe no estoque interno. Foi movimentado o estoque do setor anterior conforme disponibilidade.'
                              );

                InserirMovItem;
              end;
            end
            else
              InserirMovItem;
          end;
        end
        else
          InserirMovItem;

        Inc(i);

        if (cbMovItemCompleto.Checked) and (iQtdTotalItemPed > 1) then
          Inc(icdIdQtdeSeqPed);
      end;
    end;

    if stMsgAviso.Count > 0 then
    begin
      Application.ProcessMessages;
      MensagemAviso(stMsgAviso);
    end;

    if stMsgValid.Count > 0 then
    begin
      btVerificarNaoMov.Enabled    := True;
      btVerificarNaoMov.Font.Color := clRed;
    end;

    Application.ProcessMessages;

    FocoCampoBaixa;
  end;

  if Assigned(stMsgAviso) then
    FreeAndNil(stMsgAviso);

  if Assigned(stDados) then
    FreeAndNil(stDados);

  if Assigned(stAux) then
    FreeAndNil(stAux);
end;

procedure TFIntIndBaixaProducao.RegistraInicioCarreg;
var
  stDados : TStringList;
begin
  stDados := TStringList.Create;

  if (dsSetor.DataSet.FieldByName('flEhSetorExpedicao').AsString = 'S') and
     (edcdCarga.ERPValorValido) and
     (StrToIntDef(edcdCarga.ERPEdCampoChaveText, 0) > 0) then
  begin
    stDados.Clear;
    ExecuteSimplesSql(DmERP.fdConnERP,
                      'SELECT COUNT(cdIdQtde) AS nuQtdeCarga ' +
                      '  FROM erp.intIndBaixaProducao ' +
                      ' WHERE cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetor').AsString +
                      '   AND cdCarga = ' + Trim(edcdCarga.ERPEdCampoChaveText),
                      'nuQtdeCarga',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) = 0) then
    begin
      if DmERP.qyUsuarioMensagem.Active then
        DmERP.qyUsuarioMensagem.Close;

      DmERP.qyUsuarioMensagem.MacroByName('filtro').Value := ' WHERE cdUsuario = ' + IntToStr(FTelaInicial.FcdUsuario) +
                                                             '   AND flMensagemLida = ''N'' ';
      DmERP.qyUsuarioMensagem.Open();

      if DmERP.qyPermissaoUsuario.Active then
        DmERP.qyPermissaoUsuario.Close;

      DmERP.qyPermissaoUsuario.MacroByName('filtro').Value := ' AND ut.flAtivo = ''S'' AND ut.flExibeMensagem = ''S'' ';
      DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := 0;
      DmERP.qyPermissaoUsuario.Open();
      DmERP.qyPermissaoUsuario.First;

      while not DmERP.qyPermissaoUsuario.Eof do
      begin
        DmERP.qyUsuarioMensagem.Insert;
        DmERP.qyUsuarioMensagem.FieldByName('cdUsuario').AsInteger     := DmERP.qyPermissaoUsuario.FieldByName('cdUsuario').AsInteger;
        DmERP.qyUsuarioMensagem.FieldByName('cdTela').AsInteger        := 32; //FIntIndBaixaProducao - Baixa de Produção
        DmERP.qyUsuarioMensagem.FieldByName('flMensagemLida').AsString := 'N';
        DmERP.qyUsuarioMensagem.FieldByName('dtCadastro').AsDateTime   := DmERP.qyIntIndBaixaProducao.FieldByName('dtBaixa').AsDateTime;
        DmERP.qyUsuarioMensagem.FieldByName('hrCadastro').AsInteger    := DmERP.qyIntIndBaixaProducao.FieldByName('hrBaixa').AsInteger;
        DmERP.qyUsuarioMensagem.FieldByName('deMensagem').AsString     := 'Iniciado o carregamento da carga ' + Trim(edcdCarga.ERPEdCampoChaveText) +
                                                                          ' em ' + DmERP.qyIntIndBaixaProducao.FieldByName('dtBaixa').AsString + ' às ' +
                                                                          DmERP.qyIntIndBaixaProducao.FieldByName('deHrBaixa').AsString + '.';
        DmERP.qyUsuarioMensagem.Post;

        DmERP.qyPermissaoUsuario.Next;
      end;
    end;
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

function TFIntIndBaixaProducao.RetornaIdQtde : Integer;
var
  stDados : TStringList;
begin
  Result  := 0;
  stDados := TStringList.Create;
  stDados.Clear;

  ExecuteSimplesSql(DmERP.fdConnERP,
                    'SELECT MAX(cdIdQtde) AS cdIdQtde ' +
                    '  FROM erp.intIndBaixaProducao ' +
                    ' WHERE cdItem = ' + QuotedStr(edcdItem.ERPEdCampoChaveText) +
                    '   AND cdSetor = ' + dsSetor.DataSet.FieldByName('cdSetor').AsString +
                    '   AND cdTamanho = ' + vtTamanho.FieldByName('cdTamanho').AsString,
                    'cdIdQtde',
                    stDados
                   );

  if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
    Result := StrToIntDef(stDados.Strings[0], 0);

  Inc(Result);

  FreeAndNil(stDados);
end;

function TFIntIndBaixaProducao.RetornaIdQtdeEstInterno(const scdItem, scdSetor, scdTamanho : String) : Integer;
var
  stDados : TStringList;
begin
  Result  := 0;
  stDados := TStringList.Create;
  stDados.Clear;

  ExecuteSimplesSql(DmERP.fdConnERP,
                    'SELECT MIN(a.cdIdQtde) AS cdIdQtde ' +
                    '  FROM erp.intIndBaixaProducao a ' +
                    ' WHERE a.cdItem = ' + QuotedStr(scdItem) +
                    '   AND a.cdSetor = ' + scdSetor +
                    '   AND a.cdTamanho = ' + scdTamanho +
                    '   AND a.flEmEstoque = ''S'' ' +
                    '   AND a.cdPedido IS NULL ',
                    'cdIdQtde',
                    stDados
                   );

  if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
    Result := StrToIntDef(stDados.Strings[0], 0);

  FreeAndNil(stDados);
end;

function TFIntIndBaixaProducao.EtiquetaJaMovimentada(const scdSetor,
                                                           scdPedido,
                                                           sSeqPed,
                                                           sIdQtdeSeqPed : String
                                                    ) : Boolean;
var
  stDados : TStringList;
begin
  Result  := False;
  stDados := TStringList.Create;
  stDados.Clear;

  ExecuteSimplesSql(DmERP.fdConnERP,
                    'SELECT cdSetor ' +
                    '  FROM erp.intIndBaixaProducao ' +
                    ' WHERE cdSetor = ' + scdSetor +
                    '   AND cdPedido = ' + scdPedido +
                    '   AND cdSeqPed = ' + sSeqPed +
                    '   AND cdIdQtdeSeqPed = ' + sIdQtdeSeqPed,
                    'cdSetor',
                    stDados
                   );

  if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
    Result := True;
end;

initialization
  RegisterClass(TFIntIndBaixaProducao);

finalization
  UnRegisterClass(TFIntIndBaixaProducao);

end.
