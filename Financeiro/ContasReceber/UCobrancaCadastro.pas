unit UCobrancaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  UDBDateTime, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo, UBarraBotoesItens,
  Vcl.ComCtrls;

type
  TFCobrancaCadastro = class(TFFormCadastro)
    lbcdCobranca: TLabel;
    lbcdCliente: TLabel;
    lbdeTextoCobranca: TLabel;
    lbvlCobranca: TLabel;
    lbcdSituacao: TLabel;
    edcdCliente: TDBCampoCodigo;
    edcdCobranca: TDBCampoCodigo;
    mdeTextoCobranca: TDBMemo;
    edvlCobranca: TDBEdit;
    lcbcdSituacao: TDBLookupComboBox;
    gbContatos: TGroupBox;
    lbnmPessoaContato: TLabel;
    lbdtContato: TLabel;
    lbObsContato: TLabel;
    lbdtRetorno: TLabel;
    ednmPessoaContato: TDBEdit;
    mObsContato: TDBMemo;
    cbflRetornar: TDBCheckBox;
    grCobrancaContato: TDBGrid;
    eddtContato: TDBDateTime;
    eddtRetorno: TDBDateTime;
    FrBarraBotoesItens: TFBarraBotoesItens;
    edhrRetorno: TDBEdit;
    lbhrRetorno: TLabel;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbnmUsuAlt: TLabel;
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbflRetornarClick(Sender: TObject);
    procedure FrBarraBotoesItensbtSalvarClick(Sender: TObject);
    procedure FrBarraBotoesItensbtExluirClick(Sender: TObject);
    procedure FrBarraBotoesItensbtNovoClick(Sender: TObject);
    procedure FrBarraBotoesItensbtAlterarClick(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure FocoDataContato;
  public
    { Public declarations }
  end;

var
  FCobrancaCadastro: TFCobrancaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFCobrancaCadastro.FrBarraBotoesdsDadosStateChange(Sender: TObject);
begin
  inherited;

  edcdCliente.ERPEdCampoChaveDBEnabled := (FrBarraBotoes.dsDados.State = dsInsert);
  edcdCliente.ERPBtProcurarEnabled     := edcdCliente.ERPEdCampoChaveDBEnabled;

  FrBarraBotoesItens.Enabled := not (FrBarraBotoes.dsDados.DataSet.State in dsEditModes);
  gbContatos.Enabled         := FrBarraBotoesItens.Enabled;
end;

procedure TFCobrancaCadastro.FrBarraBotoesItensbtAlterarClick(Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btAlterarClick(Sender);

  FocoDataContato;
end;

procedure TFCobrancaCadastro.FrBarraBotoesItensbtExluirClick(Sender: TObject);
begin
  inherited;

  DmERP.ExcluirCobrancaContato;
end;

procedure TFCobrancaCadastro.FrBarraBotoesItensbtNovoClick(Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btNovoClick(Sender);

  FocoDataContato;
end;

procedure TFCobrancaCadastro.FrBarraBotoesItensbtSalvarClick(Sender: TObject);
begin
  inherited;

  DmERP.GravarCobrancaContato;
end;

procedure TFCobrancaCadastro.FocoDataContato;
begin
  if (eddtContato.Visible) and (eddtContato.ERPEdCampoDataEnabled) then
    eddtContato.ERPEdCampoDataSetFocus;
end;

procedure TFCobrancaCadastro.FormCreate(Sender: TObject);
begin
  DmERP.qyCobrancaSituacao.Open();

  FrBarraBotoesItens.btAnterior.Glyph.LoadFromResourceName(HInstance, 'IMGBTANTERIOR_16X16');
  FrBarraBotoesItens.btProximo.Glyph.LoadFromResourceName(HInstance,  'IMGBTPROXIMO_16X16');
  FrBarraBotoesItens.btNovo.Glyph.LoadFromResourceName(HInstance,     'IMGBTNOVO_16X16');
  FrBarraBotoesItens.btAlterar.Glyph.LoadFromResourceName(HInstance,  'IMGBTALTERAR_16X16');
  FrBarraBotoesItens.btSalvar.Glyph.LoadFromResourceName(HInstance,   'IMGBTSALVAR_16X16');
  FrBarraBotoesItens.btCancelar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCANCELAR_16X16');
  FrBarraBotoesItens.btExluir.Glyph.LoadFromResourceName(HInstance,   'IMGBTEXCLUIR_16X16');

  inherited;
end;

procedure TFCobrancaCadastro.GravarRegistro;
begin
  DmERP.GravarCobranca;
end;

procedure TFCobrancaCadastro.cbflRetornarClick(Sender: TObject);
begin
  inherited;

  if (DmERP.qyCobrancaContato.Active) and (DmERP.qyCobrancaContato.State in dsEditModes) and
     (not DmERP.qyCobrancaContato.IsEmpty) then
  begin
    eddtRetorno.Enabled := cbflRetornar.checked;

    if not eddtRetorno.Enabled then
    begin
      eddtRetorno.ERPEdCampoDataText := '';
      DmERP.qyCobrancaContato.FieldByName('dtRetorno').Clear;
    end;
  end;
end;

procedure TFCobrancaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirCobranca;
end;

initialization
  RegisterClass(TFCobrancaCadastro);

finalization
  UnRegisterClass(TFCobrancaCadastro);

end.
