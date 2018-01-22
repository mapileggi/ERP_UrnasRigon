unit UPedidoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, UDBDateTime,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, UBarraBotoesItens, Vcl.Menus, frxClass,
  frxDBSet;

type
  TFPedidoCadastro = class(TFFormCadastro)
    lbcdPedido: TLabel;
    edcdPedido: TDBCampoCodigo;
    lbdeHrCadastro: TLabel;
    lbdtCadastro: TLabel;
    lbnmUsuCad: TLabel;
    lbdehrAlteracao: TLabel;
    lbdtAlteracao: TLabel;
    lbnmUsuAlt: TLabel;
    eddeHrCadastro: TDBEdit;
    eddtCadastro: TDBDateTime;
    ednmUsuCad: TDBEdit;
    eddehrAlteracao: TDBEdit;
    eddtAlteracao: TDBDateTime;
    ednmUsuAlt: TDBEdit;
    pcDados: TPageControl;
    tsCabecalho: TTabSheet;
    tsFaturamento: TTabSheet;
    tsTransportes: TTabSheet;
    tsItens: TTabSheet;
    pmiFichaAdm: TMenuItem;
    relColabFichaAdm: TfrxReport;
    dbPedido: TfrxDBDataset;
    dbColabDepend: TfrxDBDataset;
    sbCabecalho: TScrollBox;
    lbcdEmpresa: TLabel;
    lbdtEntrega: TLabel;
    eddtEntrega: TDBDateTime;
    edcdEmpresa: TDBCampoCodigo;
    sbTransportes: TScrollBox;
    sbFaturamento: TScrollBox;
    sbItens: TScrollBox;
    lbnmDependente: TLabel;
    lbcdGrauParentesco: TLabel;
    lbdtNascGrauParent: TLabel;
    ednmDependente: TDBEdit;
    edcdGrauParentesco: TDBCampoCodigo;
    eddtNascGrauParent: TDBDateTime;
    FrBarraBotoesItens: TFBarraBotoesItens;
    grDependentes: TDBGrid;
    lbdtEmissao: TLabel;
    eddtEmissao: TDBDateTime;
    lbcdPedidoTipo: TLabel;
    edcdPedidoTipo: TDBCampoCodigo;
    lbcdCliente: TLabel;
    edcdCliente: TDBCampoCodigo;
    edcdPedidoSituacao: TDBCampoCodigo;
    lbcdPedidoSituacao: TLabel;
    lbcdRepresentante: TLabel;
    edcdRepresentante: TDBCampoCodigo;
    lbcdNatureza: TLabel;
    edcdNatureza: TDBCampoCodigo;
    tsCobranca: TTabSheet;
    sbCobranca: TScrollBox;
    tsObservacoes: TTabSheet;
    sbObservacoes: TScrollBox;
    lbdeObservacoes1: TLabel;
    lbcdTipoFrete: TLabel;
    edcdTipoFrete: TDBCampoCodigo;
    lbcdTransportadora: TLabel;
    edcdTransportadora: TDBCampoCodigo;
    gbPrazos: TGroupBox;
    ednuPrazo1: TDBEdit;
    lbnuPrazo1: TLabel;
    lbnuPrazo2: TLabel;
    ednuPrazo2: TDBEdit;
    lbnuPrazo3: TLabel;
    ednuPrazo3: TDBEdit;
    lbnuPrazo6: TLabel;
    ednuPrazo6: TDBEdit;
    ednuPrazo5: TDBEdit;
    lbnuPrazo5: TLabel;
    ednuPrazo4: TDBEdit;
    lbnuPrazo4: TLabel;
    lbnuPrazo12: TLabel;
    ednuPrazo12: TDBEdit;
    ednuPrazo11: TDBEdit;
    lbnuPrazo11: TLabel;
    ednuPrazo10: TDBEdit;
    lbnuPrazo10: TLabel;
    ednuPrazo9: TDBEdit;
    lbnuPrazo9: TLabel;
    ednuPrazo8: TDBEdit;
    lbnuPrazo8: TLabel;
    ednuPrazo7: TDBEdit;
    lbnuPrazo7: TLabel;
    lbvlPercComissao: TLabel;
    edvlPercComissao: TDBEdit;
    cbflDescontoPorItem: TDBCheckBox;
    lbvlPercDesconto: TLabel;
    edvlPercDesconto: TDBEdit;
    lbcdConta: TLabel;
    edcdConta: TDBCampoCodigo;
    lbcdCobrancaTipo: TLabel;
    edcdCobrancaTipo: TDBCampoCodigo;
    mdeObservacoes1: TDBMemo;
    mdeObservacoes2: TDBMemo;
    lbdeObservacoes2: TLabel;
    lbdeObservacoes4: TLabel;
    mdeObservacoes4: TDBMemo;
    mdeObservacoes3: TDBMemo;
    lbdeObservacoes3: TLabel;
    lbdeObservacoes5: TLabel;
    mdeObservacoes5: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
    procedure FrBarraBotoesItensbtSalvarClick(Sender: TObject);
    procedure FrBarraBotoesItensbtExluirClick(Sender: TObject);
    procedure FrBarraBotoesItensbtNovoClick(Sender: TObject);
    procedure FrBarraBotoesItensbtAlterarClick(Sender: TObject);
    procedure pmiFichaAdmClick(Sender: TObject);
    procedure FrBarraBotoesbtImprimirClick(Sender: TObject);
    function relColabFichaAdmUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure edcdClienteERPOnEdCampoChaveExit(Sender: TObject);
    procedure edcdRepresentanteERPOnEdCampoChaveExit(Sender: TObject);
    procedure edcdNaturezaERPOnEdCampoChaveExit(Sender: TObject);
    procedure edcdTransportadoraERPOnEdCampoChaveExit(Sender: TObject);
    procedure edvlPercDescontoExit(Sender: TObject);
    procedure edcdCobrancaTipoERPOnEdCampoChaveExit(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure CarregarInfoRepresentante(const icdCliente : Integer; var icdRep : Integer);
    procedure FocoNomeDependente;
    function UsuarioDataHoraImpressao : String;
  public
    { Public declarations }
  end;

var
  FPedidoCadastro: TFPedidoCadastro;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

procedure TFPedidoCadastro.CarregarInfoRepresentante(const icdCliente : Integer; var icdRep : Integer);
var
  stDados : TStringList;
begin
  stDados := TStringList.Create;

  if icdCliente > 0 then
  begin
    ExecuteSimplesSql(DmERP.fdConnERP,
                      'SELECT cdRepresentante ' +
                      '  FROM erp.cliente ' +
                      ' WHERE cdCliente = ' + IntToStr(icdCliente),
                      'cdRepresentante',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
      icdRep := StrToIntDef(stDados.Strings[0], 0);
  end;

  if icdRep > 0 then
  begin
    DmERP.qyPedido.FieldByName('cdRepresentante').AsInteger := icdRep;

    stDados.Clear;
    ExecuteSimplesSql(DmERP.fdConnERP,
                      'SELECT vlPercComissao ' +
                      '  FROM erp.representante ' +
                      ' WHERE cdRepresentante = ' + IntToStr(icdRep),
                      'vlPercComissao',
                      stDados
                     );

    if (stDados.Count > 0) and (StrToFloatDef(stDados.Strings[0], 0) > 0) then
      DmERP.qyPedido.FieldByName('vlPercComissao').AsCurrency := StrToFloatDef(stDados.Strings[0], 0);
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

function TFPedidoCadastro.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

procedure TFPedidoCadastro.FocoNomeDependente;
begin
  if (ednmDependente.Visible) and (ednmDependente.Enabled) then
    ednmDependente.SetFocus;
end;

procedure TFPedidoCadastro.GravarRegistro;
begin
  DmERP.GravarPedido;
end;

procedure TFPedidoCadastro.pmiFichaAdmClick(Sender: TObject);
var
  imLogo : TImage;
begin
  inherited;
                   {
  if DmERP.qyPedidoRel.Active then
    DmERP.qyPedidoRel.Close;

  DmERP.qyPedidoRel.MacroByName('filtro').Clear;
  DmERP.qyPedidoRel.MacroByName('filtro').Value := ' WHERE cdPedido = ' + DmERP.qyPedido.FieldByName('cdPedido').AsString;
  DmERP.qyPedidoRel.Open();

  if not DmERP.qyPedidoRel.IsEmpty then
  begin
    relColabFichaAdm.PrepareReport();

    imLogo := TImage.Create(Self);

    CarregarImagem(imLogo, TBlobField(DmERP.qyPedidoRel.FieldByName('imLogoEmp')));

    if (relColabFichaAdm.FindComponent('picLogoEmp') <> nil) then
      TfrxPictureView(relColabFichaAdm.FindComponent('picLogoEmp')).Picture.Assign(imLogo.Picture); //LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relColabFichaAdm.ShowReport();
  end;     }
end;

function TFPedidoCadastro.relColabFichaAdmUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  inherited;

  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;
end;

procedure TFPedidoCadastro.edcdClienteERPOnEdCampoChaveExit(Sender: TObject);
var
  icdRep : Integer;
begin
  inherited;

  icdRep := 0;

  if (FrBarraBotoes.dsDados.DataSet.Active) and (FrBarraBotoes.dsDados.DataSet.State = dsInsert) and
     (DmERP.qyPedido.FieldByName('cdCliente').AsInteger > 0) then
    CarregarInfoRepresentante(DmERP.qyPedido.FieldByName('cdCliente').AsInteger, icdRep);
end;

procedure TFPedidoCadastro.edcdCobrancaTipoERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if tsObservacoes.TabVisible then
  begin
    pcDados.ActivePage := tsObservacoes;

    if (mdeObservacoes1.Visible) and (mdeObservacoes1.Enabled) and (mdeObservacoes1.CanFocus) then
      mdeObservacoes1.SetFocus;
  end;
end;

procedure TFPedidoCadastro.edcdNaturezaERPOnEdCampoChaveExit(Sender: TObject);
begin
  inherited;

  if tsTransportes.TabVisible then
  begin
    pcDados.ActivePage := tsTransportes;
    edcdTipoFrete.ERPEdCampoChaveSetFocus;
  end;
end;

procedure TFPedidoCadastro.edcdRepresentanteERPOnEdCampoChaveExit(
  Sender: TObject);
var
  icdRep : Integer;
begin
  inherited;

  icdRep := 0;

  if (FrBarraBotoes.dsDados.DataSet.Active) and (FrBarraBotoes.dsDados.DataSet.State = dsInsert) and
     (DmERP.qyPedido.FieldByName('cdRepresentante').AsInteger > 0) then
  begin
    icdRep := DmERP.qyPedido.FieldByName('cdRepresentante').AsInteger;
    CarregarInfoRepresentante(0, icdRep);
  end;
end;

procedure TFPedidoCadastro.edcdTransportadoraERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if tsFaturamento.TabVisible then
  begin
    pcDados.ActivePage := tsFaturamento;

    if (ednuPrazo1.Visible) and (ednuPrazo1.Enabled) and (ednuPrazo1.CanFocus) then
      ednuPrazo1.SetFocus;
  end;
end;

procedure TFPedidoCadastro.edvlPercDescontoExit(Sender: TObject);
begin
  inherited;

  if tsCobranca.TabVisible then
  begin
    pcDados.ActivePage := tsCobranca;
    edcdConta.ERPEdCampoChaveSetFocus;
  end;
end;

procedure TFPedidoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirPedido;
end;

procedure TFPedidoCadastro.FormCreate(Sender: TObject);
begin
  FrBarraBotoesItens.btAnterior.Glyph.LoadFromResourceName(HInstance, 'IMGBTANTERIOR_16X16');
  FrBarraBotoesItens.btProximo.Glyph.LoadFromResourceName(HInstance,  'IMGBTPROXIMO_16X16');
  FrBarraBotoesItens.btNovo.Glyph.LoadFromResourceName(HInstance,     'IMGBTNOVO_16X16');
  FrBarraBotoesItens.btAlterar.Glyph.LoadFromResourceName(HInstance,  'IMGBTALTERAR_16X16');
  FrBarraBotoesItens.btSalvar.Glyph.LoadFromResourceName(HInstance,   'IMGBTSALVAR_16X16');
  FrBarraBotoesItens.btCancelar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCANCELAR_16X16');
  FrBarraBotoesItens.btExluir.Glyph.LoadFromResourceName(HInstance,   'IMGBTEXCLUIR_16X16');

  inherited;

  pcDados.ActivePage := tsCabecalho;

  relColabFichaAdm.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
end;

procedure TFPedidoCadastro.FrBarraBotoesbtImprimirClick(Sender: TObject);
begin
  inherited;

  FrBarraBotoes.pmImpressao.Popup(FTelaInicial.pnMenu.Width +
                                 // FTelaInicial.btEscondeMostraMenu.Width +
                                  FTelaInicial.spMenu.Width +
                                  FrBarraBotoes.btImprimir.Left +
                                  7,
                                  FTelaInicial.pcTelas.ActivePage.Top +
                                  FrBarraBotoes.Height +
                                  23
                                 );
end;

procedure TFPedidoCadastro.FrBarraBotoesdsDadosStateChange(
  Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.Enabled := (not (FrBarraBotoes.dsDados.DataSet.State in dsEditModes)) and
                                (DmERP.qyPedido.FieldByName('cdPedidoSituacao').AsInteger = 1);
  ednmDependente.Enabled     := FrBarraBotoesItens.Enabled;
  edcdGrauParentesco.Enabled := FrBarraBotoesItens.Enabled;
  eddtNascGrauParent.Enabled := FrBarraBotoesItens.Enabled;

  if FrBarraBotoes.dsDados.DataSet.State in dsEditModes then
    pcDados.ActivePage := tsCabecalho;
end;

procedure TFPedidoCadastro.FrBarraBotoesItensbtAlterarClick(
  Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btAlterarClick(Sender);

  FocoNomeDependente;
end;

procedure TFPedidoCadastro.FrBarraBotoesItensbtExluirClick(
  Sender: TObject);
begin
  inherited;

  DmERP.ExcluirColabDependente;
end;

procedure TFPedidoCadastro.FrBarraBotoesItensbtNovoClick(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btNovoClick(Sender);

  FocoNomeDependente;
end;

procedure TFPedidoCadastro.FrBarraBotoesItensbtSalvarClick(
  Sender: TObject);
begin
  inherited;

  if DmERP.qyColabDependentes.State = dsInsert then
    DmERP.qyColabDependentes.FieldByName('deGrauParentesco').AsString := edcdGrauParentesco.ERPLbDescricaoCaption;

  DmERP.GravarColabDependente;
end;

initialization
  RegisterClass(TFPedidoCadastro);

finalization
  UnRegisterClass(TFPedidoCadastro);

end.
