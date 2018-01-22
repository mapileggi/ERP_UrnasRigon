unit UColaboradorCadastro;

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
  TFColaboradorCadastro = class(TFFormCadastro)
    lbcdColaborador: TLabel;
    edcdColaborador: TDBCampoCodigo;
    edcdCodigoFolha: TDBEdit;
    lbcdCodigoFolha: TLabel;
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
    dsCorPele: TDataSource;
    qyCorPele: TFDQuery;
    pcDados: TPageControl;
    tsDadosPessoais: TTabSheet;
    tsDocumentos: TTabSheet;
    tsEnderecoContato: TTabSheet;
    tsDependentes: TTabSheet;
    pmiFichaAdm: TMenuItem;
    relColabFichaAdm: TfrxReport;
    dbColaborador: TfrxDBDataset;
    dbColabDepend: TfrxDBDataset;
    sbDadosPessoais: TScrollBox;
    lbnmColaborador: TLabel;
    lbnmMae: TLabel;
    lbnmPai: TLabel;
    lbdtNascimento: TLabel;
    lbflSexo: TLabel;
    lbcdEstadoCivil: TLabel;
    lbnmConjuge: TLabel;
    lbcdCidadeNatural: TLabel;
    lbdeNacionalidade: TLabel;
    lbcdCorPele: TLabel;
    lbcdGrauInstrucao: TLabel;
    lbcdEmpresa: TLabel;
    lbcdCargo: TLabel;
    lbcdColabSituacao: TLabel;
    lbdtAdmissao: TLabel;
    lbcdSetor: TLabel;
    lbvlSalario: TLabel;
    lbcdSalarioTipo: TLabel;
    lbcdEscala: TLabel;
    vlPercAdicInsalub: TLabel;
    lbvlPercAdicPeric: TLabel;
    lbnuDiasContratoExp: TLabel;
    lbnuDiasContratoExpExtra: TLabel;
    lbdtExameAdmissao: TLabel;
    lbvlValeTransp: TLabel;
    lbnuHorasJornada: TLabel;
    ednmColaborador: TDBEdit;
    ednmMae: TDBEdit;
    ednmPai: TDBEdit;
    eddtNascimento: TDBDateTime;
    cbflSexo: TDBComboBox;
    edcdEstadoCivil: TDBCampoCodigo;
    ednmConjuge: TDBEdit;
    edcdCidadeNatural: TDBCampoCodigo;
    eddeNacionalidade: TDBEdit;
    lcbcdCorPele: TDBLookupComboBox;
    edcdGrauInstrucao: TDBCampoCodigo;
    cbflEstudante: TDBCheckBox;
    edcdCargo: TDBCampoCodigo;
    edcdColabSituacao: TDBCampoCodigo;
    eddtAdmissao: TDBDateTime;
    edcdEmpresa: TDBCampoCodigo;
    edcdSetor: TDBCampoCodigo;
    edvlSalario: TDBEdit;
    edcdSalarioTipo: TDBCampoCodigo;
    edcdEscala: TDBCampoCodigo;
    edPercAdicInsalub: TDBEdit;
    edvlPercAdicPeric: TDBEdit;
    ednuDiasContratoExp: TDBEdit;
    ednuDiasContratoExpExtra: TDBEdit;
    eddtExameAdmissao: TDBDateTime;
    cbflUsaValeTransp: TDBCheckBox;
    edvlValeTransp: TDBEdit;
    ednuHorasJornada: TDBEdit;
    sbEnderecoContato: TScrollBox;
    sbDocumentos: TScrollBox;
    sbDependentes: TScrollBox;
    lbnuCep: TLabel;
    lbdeEndereco: TLabel;
    lbnuEndereco: TLabel;
    lbdeComplemento: TLabel;
    lbdeBairro: TLabel;
    lbcdCidade: TLabel;
    lbnuFone: TLabel;
    lbnuCelular: TLabel;
    lbdeEmail: TLabel;
    ednuCep: TDBEdit;
    dedeEndereco: TDBEdit;
    ednuEndereco: TDBEdit;
    eddeComplemento: TDBEdit;
    eddeBairro: TDBEdit;
    edcdCidade: TDBCampoCodigo;
    ednuFone: TDBEdit;
    ednuCelular: TDBEdit;
    eddeEmail: TDBEdit;
    lbdeCpf: TLabel;
    lbnuReservista: TLabel;
    lbnuCnh: TLabel;
    lbnuRG: TLabel;
    lbdeRgOrgaoExp: TLabel;
    lbdtRgEmissao: TLabel;
    lbnuTituloEleitor: TLabel;
    lbnuTituloEleitorZona: TLabel;
    lbnuTituloEleitorSecao: TLabel;
    lbnuPis: TLabel;
    lbnuCtps: TLabel;
    lbdeCtpsSerie: TLabel;
    lbsgCtpsEstado: TLabel;
    lbdtCtpsEmissao: TLabel;
    lbnuConta: TLabel;
    lbnuContaDigito: TLabel;
    lbcdAgencia: TLabel;
    lbsgRgEstadoEmissor: TLabel;
    lbdeCnhCategoria: TLabel;
    eddeCpf: TDBEdit;
    ednuReservista: TDBEdit;
    ednuCnh: TDBEdit;
    ednuRG: TDBEdit;
    eddeRgOrgaoExp: TDBEdit;
    eddtRgEmissao: TDBDateTime;
    ednuTituloEleitor: TDBEdit;
    ednuTituloEleitorZona: TDBEdit;
    ednuTituloEleitorSecao: TDBEdit;
    ednuPis: TDBEdit;
    ednuCtps: TDBEdit;
    eddeCtpsSerie: TDBEdit;
    cbsgCtpsEstado: TDBComboBox;
    eddtCtpsEmissao: TDBDateTime;
    ednuConta: TDBEdit;
    ednuContaDigito: TDBEdit;
    edcdAgencia: TDBCampoCodigo;
    cbsgRgEstadoEmissor: TDBComboBox;
    eddeCnhCategoria: TDBEdit;
    lbnmDependente: TLabel;
    lbcdGrauParentesco: TLabel;
    lbdtNascGrauParent: TLabel;
    ednmDependente: TDBEdit;
    edcdGrauParentesco: TDBCampoCodigo;
    eddtNascGrauParent: TDBDateTime;
    FrBarraBotoesItens: TFBarraBotoesItens;
    grDependentes: TDBGrid;
    procedure ednuCepExit(Sender: TObject);
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
    procedure FrBarraBotoesItensbtAnteriorClick(Sender: TObject);
    procedure FrBarraBotoesItensbtProximoClick(Sender: TObject);
    procedure FrBarraBotoesItensbtCancelarClick(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure FocoNomeDependente;
    function UsuarioDataHoraImpressao : String;
    function DataExtensoColab : String;
  public
    { Public declarations }
  end;

var
  FColaboradorCadastro: TFColaboradorCadastro;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFColaboradorCadastro.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := 'Usuário impressão: ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

function TFColaboradorCadastro.DataExtensoColab : String;
begin
  Result := DataExtenso(DmERP.qyColaboradorRel.FieldByName('dtAdmissao').AsDateTime) + '.';
end;

procedure TFColaboradorCadastro.FocoNomeDependente;
begin
  if (ednmDependente.Visible) and (ednmDependente.Enabled) then
    ednmDependente.SetFocus;
end;

procedure TFColaboradorCadastro.GravarRegistro;
begin
  DmERP.GravarColaborador;
end;

procedure TFColaboradorCadastro.pmiFichaAdmClick(Sender: TObject);
var
  imLogo : TImage;
begin
  inherited;

  if DmERP.qyColaboradorRel.Active then
    DmERP.qyColaboradorRel.Close;

  DmERP.qyColaboradorRel.MacroByName('filtro').Clear;
  DmERP.qyColaboradorRel.MacroByName('filtro').Value := ' WHERE cdColaborador = ' + DmERP.qyColaborador.FieldByName('cdColaborador').AsString;
  DmERP.qyColaboradorRel.Open();

  if not DmERP.qyColaboradorRel.IsEmpty then
  begin
    relColabFichaAdm.PrepareReport();

    imLogo := TImage.Create(Self);

    CarregarImagem(imLogo, TBlobField(DmERP.qyColaboradorRel.FieldByName('imLogoEmp')));

    if (relColabFichaAdm.FindComponent('picLogoEmp') <> nil) then
      TfrxPictureView(relColabFichaAdm.FindComponent('picLogoEmp')).Picture.Assign(imLogo.Picture); //LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relColabFichaAdm.ShowReport();
  end;
end;

function TFColaboradorCadastro.relColabFichaAdmUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  inherited;

  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;

  if SameText(MethodName, 'DataExtensoColab') then
    Result := DataExtenso(DmERP.qyColaboradorRel.FieldByName('dtAdmissao').AsDateTime) + '.';
end;

procedure TFColaboradorCadastro.ednuCepExit(Sender: TObject);
var
  sdeEndereco,
  sdeComplemento,
  sdeBairro : String;
  icdCidade : Integer;
begin
  inherited;

  sdeEndereco    := '';
  sdeComplemento := '';
  sdeBairro      := '';
  icdCidade      := 0;

  if DmERP.qyColaborador.State in dsEditModes then
  begin
    DmERP.CarregarInfoCep(DmERP.qyColaborador.FieldByName('nuCep').AsString,
                          sdeEndereco,
                          sdeComplemento,
                          sdeBairro,
                          icdCidade
                         );

    DmERP.qyColaborador.FieldByName('deEndereco').AsString    := sdeEndereco;
    DmERP.qyColaborador.FieldByName('deComplemento').AsString := sdeComplemento;
    DmERP.qyColaborador.FieldByName('deBairro').AsString      := sdeBairro;

    if icdCidade > 0 then
      DmERP.qyColaborador.FieldByName('cdCidade').AsInteger := icdCidade;
  end;
end;

procedure TFColaboradorCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirColaborador;
end;

procedure TFColaboradorCadastro.FormCreate(Sender: TObject);
begin
  FrBarraBotoesItens.btAnterior.Glyph.LoadFromResourceName(HInstance, 'IMGBTANTERIOR_16X16');
  FrBarraBotoesItens.btProximo.Glyph.LoadFromResourceName(HInstance,  'IMGBTPROXIMO_16X16');
  FrBarraBotoesItens.btNovo.Glyph.LoadFromResourceName(HInstance,     'IMGBTNOVO_16X16');
  FrBarraBotoesItens.btAlterar.Glyph.LoadFromResourceName(HInstance,  'IMGBTALTERAR_16X16');
  FrBarraBotoesItens.btSalvar.Glyph.LoadFromResourceName(HInstance,   'IMGBTSALVAR_16X16');
  FrBarraBotoesItens.btCancelar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCANCELAR_16X16');
  FrBarraBotoesItens.btExluir.Glyph.LoadFromResourceName(HInstance,   'IMGBTEXCLUIR_16X16');

  qyCorPele.Open();

  inherited;

  pcDados.ActivePage := tsDadosPessoais;

  relColabFichaAdm.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relColabFichaAdm.AddFunction('function DataExtensoColab : String', 'Sistema');
end;

procedure TFColaboradorCadastro.FrBarraBotoesbtImprimirClick(Sender: TObject);
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

procedure TFColaboradorCadastro.FrBarraBotoesdsDadosStateChange(
  Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.Enabled := not (FrBarraBotoes.dsDados.DataSet.State in dsEditModes);
  ednmDependente.Enabled     := FrBarraBotoesItens.Enabled;
  edcdGrauParentesco.Enabled := FrBarraBotoesItens.Enabled;
  eddtNascGrauParent.Enabled := FrBarraBotoesItens.Enabled;
end;

procedure TFColaboradorCadastro.FrBarraBotoesItensbtAlterarClick(
  Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btAlterarClick(Sender);

  FocoNomeDependente;
end;

procedure TFColaboradorCadastro.FrBarraBotoesItensbtAnteriorClick(
  Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btAnteriorClick(Sender);

end;

procedure TFColaboradorCadastro.FrBarraBotoesItensbtCancelarClick(
  Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btCancelarClick(Sender);

end;

procedure TFColaboradorCadastro.FrBarraBotoesItensbtExluirClick(
  Sender: TObject);
begin
  inherited;

  DmERP.ExcluirColabDependente;
end;

procedure TFColaboradorCadastro.FrBarraBotoesItensbtNovoClick(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btNovoClick(Sender);

  FocoNomeDependente;
end;

procedure TFColaboradorCadastro.FrBarraBotoesItensbtProximoClick(
  Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btProximoClick(Sender);

end;

procedure TFColaboradorCadastro.FrBarraBotoesItensbtSalvarClick(
  Sender: TObject);
begin
  inherited;

  if DmERP.qyColabDependentes.State = dsInsert then
    DmERP.qyColabDependentes.FieldByName('deGrauParentesco').AsString := edcdGrauParentesco.ERPLbDescricaoCaption;

  DmERP.GravarColabDependente;
end;

initialization
  RegisterClass(TFColaboradorCadastro);

finalization
  UnRegisterClass(TFColaboradorCadastro);

end.
