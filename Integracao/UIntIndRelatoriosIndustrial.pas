unit UIntIndRelatoriosIndustrial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet, frxCross, FireDAC.Stan.Error;

type
  TFIntIndRelatoriosIndustrial = class(TForm)
    pcRelatorios: TPageControl;
    tsEstoqueProducao: TTabSheet;
    sbREP: TScrollBox;
    gbREPFiltros: TGroupBox;
    lbREPcdItem: TLabel;
    relEstProdRel: TfrxReport;
    dbEstProdRel: TfrxDBDataset;
    pnBotoes: TPanel;
    btImprimir: TBitBtn;
    btFechar: TBitBtn;
    edREPcdItem: TDBCampoCodigo;
    frxCrossRelatorios: TfrxCrossObject;
    tsItensRelacionados: TTabSheet;
    sbRIR: TScrollBox;
    gbRIRFiltros: TGroupBox;
    lbRIRcdItemBase: TLabel;
    edRIRcdItemBase: TDBCampoCodigo;
    dbItensRelacRel: TfrxDBDataset;
    relItensRelacRel: TfrxReport;
    edRIRcdTamanhoBase: TDBCampoCodigo;
    lbRIRcdTamanhoBase: TLabel;
    vtItensRelacRel: TVirtualTable;
    vtItensRelacRelcdItemRelacionado: TIntegerField;
    vtItensRelacRelcdItem: TStringField;
    vtItensRelacRelcdTamanho: TIntegerField;
    vtItensRelacRelcdItemBase: TStringField;
    vtItensRelacRelcdTamanhoBase: TIntegerField;
    vtItensRelacReldeItem: TStringField;
    vtItensRelacReldeTamanho: TStringField;
    vtItensRelacReldeItemBase: TStringField;
    vtItensRelacReldeTamanhoBase: TStringField;
    vtItensRelacRelcdTipoRelacao: TIntegerField;
    vtItensRelacReldeTipoRelacao: TStringField;
    tsProducaoDiaria: TTabSheet;
    sbRPD: TScrollBox;
    gbRPD: TGroupBox;
    lbRPDcdItem: TLabel;
    edRPDcdItem: TDBCampoCodigo;
    relProdDiaria: TfrxReport;
    dbProdDiariaRel: TfrxDBDataset;
    lbRPDdtBaixa: TLabel;
    edRPDdtBaixaIni: TDateTimePicker;
    lbRPDcdSetor: TLabel;
    edRPDcdSetor: TDBCampoCodigo;
    lbREPcdSetor: TLabel;
    edREPcdSetor: TDBCampoCodigo;
    tsMaterialMovimento: TTabSheet;
    sbRMM: TScrollBox;
    gbRMMFiltros: TGroupBox;
    lbRMMdtMovimento: TLabel;
    edRMMdtMovimentoIni: TDateTimePicker;
    lbRMMdtMovimentoA: TLabel;
    edRMMdtMovimentoFim: TDateTimePicker;
    edRMMdtSituacaoMovFim: TDateTimePicker;
    lbRMMdtSituacaoMovA: TLabel;
    edRMMdtSituacaoMovIni: TDateTimePicker;
    lbRMMdtSituacaoMov: TLabel;
    lbRMMflTipoMovimento: TLabel;
    cbRMMflTipoMovimento: TComboBox;
    lbRMMcdSituacaoMovimento: TLabel;
    cbRMMcdSituacaoMovimento: TComboBox;
    lbRMMcdMaterial: TLabel;
    edRMMcdMaterial: TDBCampoCodigo;
    lbRMMcdFornecedor: TLabel;
    edRMMcdFornecedor: TDBCampoCodigo;
    dbMaterialMovRel: TfrxDBDataset;
    relMaterialMovRel: TfrxReport;
    lbRMMflTipoSolicitacao: TLabel;
    cbRMMflTipoSolicitacao: TComboBox;
    lbREPTipoEstoque: TLabel;
    cbREPTipoEstoque: TComboBox;
    edRPDdtBaixaFim: TDateTimePicker;
    lbRPDdtBaixaA: TLabel;
    lbRPDcdEmpresa: TLabel;
    edRPDcdEmpresa: TDBCampoCodigo;
    edREPcdEmpresa: TDBCampoCodigo;
    lbREPcdEmpresa: TLabel;
    vtMaterialMovRel: TVirtualTable;
    vtMaterialMovRelcdMaterialMovimento: TIntegerField;
    vtMaterialMovRelflTipoMovimento: TStringField;
    vtMaterialMovRelcdSituacaoMovimento: TIntegerField;
    vtMaterialMovReldtMovimento: TDateField;
    vtMaterialMovRelhrMovimento: TIntegerField;
    vtMaterialMovRelcdMaterial: TStringField;
    vtMaterialMovReldeMaterial: TStringField;
    vtMaterialMovRelcdUnidadeMedida: TStringField;
    vtMaterialMovRelnuQtde: TFloatField;
    vtMaterialMovRelvlUnitario: TFloatField;
    vtMaterialMovRelcdFornecedor: TIntegerField;
    vtMaterialMovRelcdMaterialSolicitacao: TIntegerField;
    vtMaterialMovReldeNuNotaFiscal: TStringField;
    vtMaterialMovReldtSituacaoMov: TDateField;
    vtMaterialMovRelhrSituacaoMov: TIntegerField;
    vtMaterialMovRelcdUsuarioSituacaoMov: TIntegerField;
    vtMaterialMovReldeObservacoes: TStringField;
    vtMaterialMovReldtCadastro: TDateField;
    vtMaterialMovRelhrCadastro: TIntegerField;
    vtMaterialMovRelcdUsuarioCadastro: TIntegerField;
    vtMaterialMovReldtAlteracao: TDateField;
    vtMaterialMovRelhrAlteracao: TIntegerField;
    vtMaterialMovRelcdUsuarioAlteracao: TIntegerField;
    vtMaterialMovRelvlUnitES: TFloatField;
    vtMaterialMovReldeSituacaoMovimento: TStringField;
    vtMaterialMovReldeHrCadastro: TStringField;
    vtMaterialMovReldeHrAlteracao: TStringField;
    vtMaterialMovReldeHrMovimento: TStringField;
    vtMaterialMovReldeHrSituacaoMov: TStringField;
    vtMaterialMovRelnuQtdeMov: TFloatField;
    vtMaterialMovRelnmFornecedor: TStringField;
    vtMaterialMovRelcdSolicitante: TIntegerField;
    vtMaterialMovRelnmSolicitante: TStringField;
    vtMaterialMovRelflTipoSolicitacao: TStringField;
    vtMaterialMovReldeTipoSolicitacao: TStringField;
    vtMaterialMovRelnmUsuCad: TStringField;
    vtMaterialMovRelnmUsuAlt: TStringField;
    vtMaterialMovRelnmUsuSit: TStringField;
    vtMaterialMovRelvlCusto: TFloatField;
    vtMaterialMovRelcdCentroCusto: TIntegerField;
    vtMaterialMovReldeCentroCusto: TStringField;
    lbRMMcdCentroCusto: TLabel;
    edRMMcdCentroCusto: TDBCampoCodigo;
    tsMaterialEstoque: TTabSheet;
    vtMaterialEstRel: TVirtualTable;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    IntegerField13: TIntegerField;
    StringField19: TStringField;
    dbMaterialEstRel: TfrxDBDataset;
    relMaterialEstRel: TfrxReport;
    vtMaterialEstRelcdUnidadeMedidda: TStringField;
    vtMaterialMovReldtCadSolicitacao: TDateField;
    lbRMMdtCadSolicitacaoA: TLabel;
    lbRMMdtCadSolicitacao: TLabel;
    edRMMdtCadSolicitacaoFim: TDateTimePicker;
    edRMMdtCadSolicitacaoIni: TDateTimePicker;
    sbREM: TScrollBox;
    gbREM: TGroupBox;
    lbREMcdMaterial: TLabel;
    lbREMcdCentroCusto: TLabel;
    edREMcdMaterial: TDBCampoCodigo;
    edREMcdCentroCusto: TDBCampoCodigo;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    function relEstProdRelUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function relItensRelacRelUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function relProdDiariaUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function relMaterialMovRelUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    function relMaterialEstRelUserFunction(const MethodName: string;
      var Params: Variant): Variant;
  private
    procedure ImprimirRelEstoqueProducao;
    procedure ImprimirRelProducaoDiaria;
    procedure ImprimirRelItensRelacionados;
    procedure ImprimirRelMaterialMovimento;
    procedure ImprimirRelMaterialEstoque;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
    function UsuarioDataHoraImpressao : String;
    function PeriodoProducao : String;
    function EhUsuarioEscritorio : Boolean;
  public
    { Public declarations }
  end;

var
  FIntIndRelatoriosIndustrial: TFIntIndRelatoriosIndustrial;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFIntIndRelatoriosIndustrial.EhUsuarioEscritorio : Boolean;
begin
  Result := FTelaInicial.FcdSetorUsuario = 1;
end;

function TFIntIndRelatoriosIndustrial.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

function TFIntIndRelatoriosIndustrial.PeriodoProducao : String;
begin
  Result := 'Período: ' + FormatDateTime('dd/mm/yyyy', edRPDdtBaixaIni.DateTime) +
            ' a ' + FormatDateTime('dd/mm/yyyy', edRPDdtBaixaFim.DateTime);
end;

procedure TFIntIndRelatoriosIndustrial.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
begin
   if not (
           (Screen.ActiveControl is TCustomMemo) or   // se não for um memo
           (Screen.ActiveControl is TDBLookupComboBox) or  // se não for um DbLookup
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
end;

function TFIntIndRelatoriosIndustrial.relMaterialEstRelUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFIntIndRelatoriosIndustrial.relMaterialMovRelUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;

  if SameText(MethodName, 'EhUsuarioEscritorio') then
    Result := EhUsuarioEscritorio;
end;

function TFIntIndRelatoriosIndustrial.relEstProdRelUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFIntIndRelatoriosIndustrial.relItensRelacRelUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

function TFIntIndRelatoriosIndustrial.relProdDiariaUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao
  else if SameText(MethodName, 'PeriodoProducao') then
    Result := PeriodoProducao;
end;

procedure TFIntIndRelatoriosIndustrial.btImprimirClick(Sender: TObject);
begin
  if pcRelatorios.ActivePage = tsEstoqueProducao then
    ImprimirRelEstoqueProducao
  else if pcRelatorios.ActivePage = tsProducaoDiaria then
    ImprimirRelProducaoDiaria
  else if pcRelatorios.ActivePage = tsItensRelacionados then
    ImprimirRelItensRelacionados
  else if pcRelatorios.ActivePage = tsMaterialMovimento then
    ImprimirRelMaterialMovimento
  else if pcRelatorios.ActivePage = tsMaterialEstoque then
    ImprimirRelMaterialEstoque;
end;

procedure TFIntIndRelatoriosIndustrial.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFIntIndRelatoriosIndustrial.ImprimirRelEstoqueProducao;
var
  sWhere : String;
  i      : Integer;
begin
  if DmERP.qyEstoqueProducaoRel.Active then
    DmERP.qyEstoqueProducaoRel.Close;

  DmERP.qyEstoqueProducaoRel.MacroByName('filtro').Clear;

  sWhere := '';

  if (edREPcdSetor.ERPEdCampoChaveText <> '') and (edREPcdSetor.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdSetor = ' + edREPcdSetor.ERPEdCampoChaveText);

  if (edREPcdItem.ERPEdCampoChaveText <> '') and (edREPcdItem.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdItem = ' + QuotedStr(edREPcdItem.ERPEdCampoChaveText));

  case cbREPTipoEstoque.ItemIndex of
  1: AdicionaCondSql(sWhere, ' cdPedido IS NULL');
  2: AdicionaCondSql(sWhere, ' cdPedido IS NOT NULL');
  end;

  if (edREPcdEmpresa.ERPEdCampoChaveText <> '') and (edREPcdEmpresa.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdEmpresa = ' + edREPcdEmpresa.ERPEdCampoChaveText);

  if Trim(sWhere) <> '' then
    DmERP.qyEstoqueProducaoRel.MacroByName('filtro').Value := ' AND ' + sWhere;

  DmERP.qyEstoqueProducaoRel.Open();

  if DmERP.qyEstoqueProducaoRel.IsEmpty then
    Aviso('Não existem movimentos de estoque com os filtros informados.')
  else
  begin
    relEstProdRel.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relEstProdRel.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relEstProdRel.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relEstProdRel.ShowReport();
  end;
end;

procedure TFIntIndRelatoriosIndustrial.ImprimirRelProducaoDiaria;
var
  sWhere : String;
  i      : Integer;
begin
  if DmERP.qyProducaoDiariaRel.Active then
    DmERP.qyProducaoDiariaRel.Close;

  DmERP.qyProducaoDiariaRel.MacroByName('filtro').Clear;

  sWhere := '';

  if (FormatDateTime('dd/mm/yyyy', edRPDdtBaixaIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRPDdtBaixaFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtBaixa BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRPDdtBaixaIni.DateTime)) +
                    '             AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRPDdtBaixaFim.DateTime))
                   );

  if (edRPDcdItem.ERPEdCampoChaveText <> '') and (edRPDcdItem.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdItem = ' + QuotedStr(edRPDcdItem.ERPEdCampoChaveText));

  if (edRPDcdSetor.ERPEdCampoChaveText <> '') and (edRPDcdSetor.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdSetor = ' + edRPDcdSetor.ERPEdCampoChaveText);

  if (edRPDcdEmpresa.ERPEdCampoChaveText <> '') and (edRPDcdEmpresa.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdEmpresa = ' + edRPDcdEmpresa.ERPEdCampoChaveText);

  if Trim(sWhere) <> '' then
    DmERP.qyProducaoDiariaRel.MacroByName('filtro').Value := ' AND ' + sWhere;

  DmERP.qyProducaoDiariaRel.Open();

  if DmERP.qyProducaoDiariaRel.IsEmpty then
    Aviso('Não existem movimentos de produção com os filtros informados.')
  else
  begin
    relProdDiaria.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relProdDiaria.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relProdDiaria.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relProdDiaria.ShowReport();
  end;
end;

procedure TFIntIndRelatoriosIndustrial.ImprimirRelItensRelacionados;
var
  sWhere      : String;
  i           : Integer;
  bItemExiste : Boolean;
begin
  if not vtItensRelacRel.Active then
    vtItensRelacRel.Open;

  vtItensRelacRel.Clear;

  if DmERP.qyIntIndItemRelacionadoRel.Active then
    DmERP.qyIntIndItemRelacionadoRel.Close;

  DmERP.qyIntIndItemRelacionadoRel.MacroByName('filtro').Clear;

  sWhere := '';

  if (edRIRcdItemBase.ERPEdCampoChaveText <> '') and (edRIRcdItemBase.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdItemBase = ' + QuotedStr(edRIRcdItemBase.ERPEdCampoChaveText));

  if (edRIRcdTamanhoBase.ERPEdCampoChaveText <> '') and (edRIRcdTamanhoBase.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdTamanhoBase = ' + QuotedStr(edRIRcdTamanhoBase.ERPEdCampoChaveText));

  if Trim(sWhere) <> '' then
    DmERP.qyIntIndItemRelacionadoRel.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyIntIndItemRelacionadoRel.Open();

  if DmERP.qyIntIndItemRelacionadoRel.IsEmpty then
    Aviso('Não existem itens relacionados cadastrados com os filtros informados.')
  else
  begin
    DmERP.qyIntIndItemRelacionadoRel.First;

    while not DmERP.qyIntIndItemRelacionadoRel.Eof do
    begin
      vtItensRelacRel.Insert;
      vtItensRelacRel.FieldByName('cdItemRelacionado').AsInteger := DmERP.qyIntIndItemRelacionadoRel.FieldByName('cdItemRelacionado').AsInteger;
      vtItensRelacRel.FieldByName('cdItem').AsString             := DmERP.qyIntIndItemRelacionadoRel.FieldByName('cdItem').AsString;
      vtItensRelacRel.FieldByName('cdTamanho').AsInteger         := DmERP.qyIntIndItemRelacionadoRel.FieldByName('cdTamanho').AsInteger;
      vtItensRelacRel.FieldByName('deTamanho').AsString          := DmERP.qyIntIndItemRelacionadoRel.FieldByName('deTamanho').AsString;
      vtItensRelacRel.FieldByName('deItem').AsString             := DmERP.qyIntIndItemRelacionadoRel.FieldByName('deItem').AsString;
      vtItensRelacRel.FieldByName('cdItemBase').AsString         := DmERP.qyIntIndItemRelacionadoRel.FieldByName('cdItemBase').AsString;
      vtItensRelacRel.FieldByName('cdTamanhoBase').AsInteger     := DmERP.qyIntIndItemRelacionadoRel.FieldByName('cdTamanhoBase').AsInteger;
      vtItensRelacRel.FieldByName('deItemBase').AsString         := DmERP.qyIntIndItemRelacionadoRel.FieldByName('deItemBase').AsString;
      vtItensRelacRel.FieldByName('deTamanhoBase').AsString      := DmERP.qyIntIndItemRelacionadoRel.FieldByName('deTamanhoBase').AsString;
      vtItensRelacRel.FieldByName('cdTipoRelacao').AsInteger     := 1;
      vtItensRelacRel.FieldByName('deTipoRelacao').AsString      := 'Itens Relacionados';
      vtItensRelacRel.Post;

      DmERP.qyIntIndItemRelacionadoRel.Next;
    end;

    try
      DmIntegracao.fdConnInteg.Connected := True;

      DmIntegracao.qyItem.MacroByName('filtro').Clear;
      DmIntegracao.qyItem.MacroByName('filtro').Value := ' WHERE ((a.est_item_conf = ''S'') OR (a.est_item_conf = '''')) ' +
                                                         '   AND a.item NOT LIKE ''%.12%'' ';
      DmIntegracao.qyItem.Open();
      DmIntegracao.qyItem.First;

      while not DmIntegracao.qyItem.Eof do
      begin
        if (DmIntegracao.qyItem.FieldByName('flItemRevenda').AsString = 'N') and
           (DmIntegracao.qyItem.FieldByName('cdItemTipo').AsInteger = 2) then
        begin
         vtItensRelacRel.First;
          bItemExiste := vtItensRelacRel.Locate('cdItem',
                                                VarArrayOf([DmIntegracao.qyItem.FieldByName('cdItem').AsString]),
                                                []
                                               );

          if not bItemExiste then
          begin
            vtItensRelacRel.First;
            bItemExiste := vtItensRelacRel.Locate('cdItemBase',
                                                   VarArrayOf([DmIntegracao.qyItem.FieldByName('cdItem').AsString]),
                                                   []
                                                  );
          end;

          if not bItemExiste then
          begin
            vtItensRelacRel.Insert;
            vtItensRelacRel.FieldByName('cdItemRelacionado').AsInteger := 0;
            vtItensRelacRel.FieldByName('cdItemBase').AsString         := DmIntegracao.qyItem.FieldByName('cdItem').AsString;
            vtItensRelacRel.FieldByName('cdItem').AsString             := ' ';
            vtItensRelacRel.FieldByName('cdTamanho').AsInteger         := 0;
            vtItensRelacRel.FieldByName('cdTamanhoBase').AsInteger     := 0;
            vtItensRelacRel.FieldByName('deItemBase').AsString         := DmIntegracao.qyItem.FieldByName('deItem').AsString;
            vtItensRelacRel.FieldByName('cdTipoRelacao').AsInteger     := 2;
            vtItensRelacRel.FieldByName('deTipoRelacao').AsString      := 'Itens Não Relacionados';
            vtItensRelacRel.Post;
          end;
        end;

        DmIntegracao.qyItem.Next;
      end;
    except
      on E: EFDDBEngineException do
      begin
        Erro(E.message);
      end;
    end;

    if DmIntegracao.qyItem.Active then
      DmIntegracao.qyItem.Close;

    DmIntegracao.fdConnInteg.Connected := False;

    relItensRelacRel.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relItensRelacRel.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relItensRelacRel.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relItensRelacRel.ShowReport();
  end;
end;

procedure TFIntIndRelatoriosIndustrial.ImprimirRelMaterialMovimento;
var
  sWhere : String;
  i      : Integer;
begin
  if not vtMaterialMovRel.Active then
    vtMaterialMovRel.Open;

  vtMaterialMovRel.Clear;

  if DmERP.qyIntIndMaterialMovConsulta.Active then
    DmERP.qyIntIndMaterialMovConsulta.Close;

  DmERP.qyIntIndMaterialMovConsulta.MacroByName('filtro').Clear;

  sWhere := '';

  if (edRMMdtMovimentoIni.Checked) and
     (edRMMdtMovimentoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRMMdtMovimentoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRMMdtMovimentoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtMovimento BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRMMdtMovimentoIni.DateTime)) +
                    '                 AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRMMdtMovimentoFim.DateTime))
                   );

  if (edRMMdtSituacaoMovIni.Checked) and
     (edRMMdtSituacaoMovFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRMMdtSituacaoMovIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRMMdtSituacaoMovFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtSituacaoMov BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRMMdtSituacaoMovIni.DateTime)) +
                    '                   AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRMMdtSituacaoMovFim.DateTime))
                   );

  if (edRMMdtCadSolicitacaoIni.Checked) and
     (edRMMdtCadSolicitacaoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', edRMMdtCadSolicitacaoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', edRMMdtCadSolicitacaoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtCadSolicitacao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRMMdtCadSolicitacaoIni.DateTime)) +
                    '                      AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', edRMMdtCadSolicitacaoFim.DateTime))
                   );

  if (cbRMMflTipoMovimento.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' flTipoMovimento = ' + QuotedStr(Copy(cbRMMflTipoMovimento.Text, 1, 1)));

  if (cbRMMcdSituacaoMovimento.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' cdSituacaoMovimento = ' + IntToStr(cbRMMcdSituacaoMovimento.ItemIndex));

  if (cbRMMflTipoSolicitacao.ItemIndex > 0) then
    AdicionaCondSql(sWhere, ' flTipoSolicitacao = ' + QuotedStr(Copy(cbRMMflTipoSolicitacao.Text, 1, 1)));

  if (Trim(edRMMcdMaterial.ERPEdCampoChaveText) <> '') and (edRMMcdMaterial.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdMaterial = ' + QuotedStr(edRMMcdMaterial.ERPEdCampoChaveText));

  if (Trim(edRMMcdFornecedor.ERPEdCampoChaveText) <> '') and (edRMMcdFornecedor.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdFornecedor = ' + edRMMcdFornecedor.ERPEdCampoChaveText);

  if Trim(sWhere) <> '' then
    sWhere := ' WHERE ' + sWhere;

  DmERP.qyIntIndMaterialMovConsulta.MacroByName('filtro').Value := sWhere +
                                                                   '  ORDER BY t.deMaterial, t.cdMaterialMovimento ';
  DmERP.qyIntIndMaterialMovConsulta.Open();

  if not DmIntegracao.fdConnInteg.Connected then
    DmIntegracao.fdConnInteg.Connected := True;

  if not DmERP.qyIntIndMaterialMovConsulta.IsEmpty then
  begin
    DmERP.qyIntIndMaterialMovConsulta.First;

    while not DmERP.qyIntIndMaterialMovConsulta.Eof do
    begin
      vtMaterialMovRel.Append;

      for i := 0 to DmERP.qyIntIndMaterialMovConsulta.FieldCount - 1 do
      begin
        if Assigned(vtMaterialMovRel.FindField(DmERP.qyIntIndMaterialMovConsulta.Fields.Fields[i].FieldName)) then
          vtMaterialMovRel.FieldByName(DmERP.qyIntIndMaterialMovConsulta.Fields.Fields[i].FieldName).Value := DmERP.qyIntIndMaterialMovConsulta.Fields.Fields[i].Value;
      end;

      if DmIntegracao.qyItem.Active then
        DmIntegracao.qyItem.Close;

      DmIntegracao.qyItem.MacroByName('filtro').Value := ' AND TRIM(a.item) = ' + QuotedStr(DmERP.qyIntIndMaterialMovConsulta.FieldByName('cdMaterial').AsString);
      DmIntegracao.qyItem.Open;

      if not DmIntegracao.qyItem.IsEmpty then
      begin
        vtMaterialMovRel.FieldByName('deMaterial').AsString      := DmIntegracao.qyItem.FieldByName('deItem').AsString;
        vtMaterialMovRel.FieldByName('cdUnidadeMedida').AsString := DmIntegracao.qyItem.FieldByName('cdUnidadeMedida').AsString;
        vtMaterialMovRel.FieldByName('cdCentroCusto').AsInteger  := DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsInteger;

        if vtMaterialMovRel.FieldByName('cdCentroCusto').AsInteger > 0 then
          vtMaterialMovRel.FieldByName('deCentroCusto').AsString := DmIntegracao.qyItem.FieldByName('deCentroCusto').AsString
        else
          vtMaterialMovRel.FieldByName('deCentroCusto').AsString := 'Não Informado';
      end
      else
      begin
        vtMaterialMovRel.FieldByName('cdCentroCusto').AsInteger := 0;
        vtMaterialMovRel.FieldByName('deCentroCusto').AsString  := 'Não Informado';
        vtMaterialMovRel.FieldByName('cdUnidadeMedida').Clear;
      end;

      if (edRMMcdCentroCusto.ERPValorValido) and (edRMMcdCentroCusto.ERPEdCampoChaveText <> vtMaterialMovRel.FieldByName('cdCentroCusto').AsString) then
        vtMaterialMovRel.Cancel
      else
        vtMaterialMovRel.Post;

      DmERP.qyIntIndMaterialMovConsulta.Next;
    end;
  end;

  if DmIntegracao.qyItem.Active then
    DmIntegracao.qyItem.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if vtMaterialMovRel.IsEmpty then
    Aviso('Não existem movimentos de materiais cadastrados com os filtros informados.')
  else
  begin
    relMaterialMovRel.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relMaterialMovRel.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relMaterialMovRel.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relMaterialMovRel.ShowReport();
  end;
end;

procedure TFIntIndRelatoriosIndustrial.ImprimirRelMaterialEstoque;
var
  sWhere : String;
  i      : Integer;
begin
  if not vtMaterialEstRel.Active then
    vtMaterialEstRel.Open;

  vtMaterialEstRel.Clear;

  if DmERP.qyIntIndMaterialEstoqueRel.Active then
    DmERP.qyIntIndMaterialEstoqueRel.Close;

  DmERP.qyIntIndMaterialEstoqueRel.MacroByName('filtro').Clear;

  sWhere := '';

  if (Trim(edREMcdMaterial.ERPEdCampoChaveText) <> '') and (edREMcdMaterial.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdMaterial = ' + QuotedStr(edREMcdMaterial.ERPEdCampoChaveText));

  if Trim(sWhere) <> '' then
    sWhere := ' WHERE ' + sWhere;

  DmERP.qyIntIndMaterialEstoqueRel.MacroByName('filtro').Value := sWhere;
  DmERP.qyIntIndMaterialEstoqueRel.Open();

  if not DmIntegracao.fdConnInteg.Connected then
    DmIntegracao.fdConnInteg.Connected := True;

  if not DmERP.qyIntIndMaterialEstoqueRel.IsEmpty then
  begin
    DmERP.qyIntIndMaterialEstoqueRel.First;

    while not DmERP.qyIntIndMaterialEstoqueRel.Eof do
    begin
      vtMaterialEstRel.Append;

      for i := 0 to DmERP.qyIntIndMaterialEstoqueRel.FieldCount - 1 do
      begin
        if Assigned(vtMaterialEstRel.FindField(DmERP.qyIntIndMaterialEstoqueRel.Fields.Fields[i].FieldName)) then
          vtMaterialEstRel.FieldByName(DmERP.qyIntIndMaterialEstoqueRel.Fields.Fields[i].FieldName).Value := DmERP.qyIntIndMaterialEstoqueRel.Fields.Fields[i].Value;
      end;

      if DmIntegracao.qyItem.Active then
        DmIntegracao.qyItem.Close;

      DmIntegracao.qyItem.MacroByName('filtro').Value := ' AND TRIM(a.item) = ' + QuotedStr(DmERP.qyIntIndMaterialEstoqueRel.FieldByName('cdMaterial').AsString);
      DmIntegracao.qyItem.Open;

      if not DmIntegracao.qyItem.IsEmpty then
      begin
        vtMaterialEstRel.FieldByName('deMaterial').AsString      := DmIntegracao.qyItem.FieldByName('deItem').AsString;
        vtMaterialEstRel.FieldByName('cdUnidadeMedida').AsString := DmIntegracao.qyItem.FieldByName('cdUnidadeMedida').AsString;
        vtMaterialEstRel.FieldByName('cdCentroCusto').AsInteger  := DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsInteger;

        if vtMaterialEstRel.FieldByName('cdCentroCusto').AsInteger > 0 then
          vtMaterialEstRel.FieldByName('deCentroCusto').AsString := DmIntegracao.qyItem.FieldByName('deCentroCusto').AsString
        else
          vtMaterialEstRel.FieldByName('deCentroCusto').AsString := 'Não Informado';
      end
      else
      begin
        vtMaterialEstRel.FieldByName('cdCentroCusto').AsInteger := 0;
        vtMaterialEstRel.FieldByName('deCentroCusto').AsString  := 'Não Informado';
        vtMaterialEstRel.FieldByName('cdUnidadeMedida').Clear;
      end;

      if (edREMcdCentroCusto.ERPValorValido) and (edREMcdCentroCusto.ERPEdCampoChaveText <> vtMaterialEstRel.FieldByName('cdCentroCusto').AsString) then
        vtMaterialEstRel.Cancel
      else
        vtMaterialEstRel.Post;

      DmERP.qyIntIndMaterialEstoqueRel.Next;
    end;
  end;

  if DmIntegracao.qyItem.Active then
    DmIntegracao.qyItem.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if vtMaterialEstRel.IsEmpty then
    Aviso('Não existem movimentos de materiais cadastrados com os filtros informados.')
  else
  begin
    relMaterialEstRel.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relMaterialEstRel.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relMaterialEstRel.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relMaterialEstRel.ShowReport();
  end;
end;

procedure TFIntIndRelatoriosIndustrial.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  relEstProdRel.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relProdDiaria.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relProdDiaria.AddFunction('function PeriodoProducao : String', 'Sistema');
  relItensRelacRel.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relMaterialMovRel.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relMaterialMovRel.AddFunction('function EhUsuarioEscritorio : Boolean', 'Sistema');
  relMaterialEstRel.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');

  btImprimir.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,   'IMGBTFECHAR_32X32');

  pcRelatorios.ActivePage := tsEstoqueProducao;

  dtAtual                  := DataHoraAtual(DmERP.fdConnERP);
  edRPDdtBaixaIni.DateTime       := dtAtual;
  edRPDdtBaixaFim.DateTime       := dtAtual;

  edRMMdtMovimentoIni.DateTime      := dtAtual - 5;
  edRMMdtMovimentoFim.DateTime      := dtAtual;
  edRMMdtSituacaoMovIni.DateTime    := dtAtual - 5;
  edRMMdtSituacaoMovFim.DateTime    := dtAtual;
  edRMMdtSituacaoMovIni.Checked     := False;
  edRMMdtSituacaoMovFim.Checked     := False;
  edRMMdtCadSolicitacaoIni.DateTime := dtAtual - 5;
  edRMMdtCadSolicitacaoFim.DateTime := dtAtual;
  edRMMdtCadSolicitacaoIni.Checked  := False;
  edRMMdtCadSolicitacaoFim.Checked  := False;
end;

end.
