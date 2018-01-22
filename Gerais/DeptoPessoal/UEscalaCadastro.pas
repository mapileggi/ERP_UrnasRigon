unit UEscalaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB,
  Vcl.Grids, Vcl.DBGrids, UBarraBotoesItens;

type
  TFEscalaCadastro = class(TFFormCadastro)
    lbcdEscala: TLabel;
    lbdeEscala: TLabel;
    eddeEscala: TDBEdit;
    edcdEscala: TDBCampoCodigo;
    gbEscalaItem: TGroupBox;
    FrBarraBotoesItens: TFBarraBotoesItens;
    lbdeEscalaItem: TLabel;
    eddeEscalaItem: TDBEdit;
    grEscalaItem: TDBGrid;
    procedure FrBarraBotoesItensbtSalvarClick(Sender: TObject);
    procedure FrBarraBotoesItensbtExluirClick(Sender: TObject);
    procedure FrBarraBotoesItensbtNovoClick(Sender: TObject);
    procedure FrBarraBotoesItensbtAlterarClick(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure FocoDescricaoItem;
  public
    { Public declarations }
  end;

var
  FEscalaCadastro: TFEscalaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFEscalaCadastro.GravarRegistro;
begin
  DmERP.GravarEscala;
end;

procedure TFEscalaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirEscala;
end;

procedure TFEscalaCadastro.FocoDescricaoItem;
begin
  if (eddeEscalaItem.Visible) and (eddeEscalaItem.Enabled) then
    eddeEscalaItem.SetFocus;
end;

procedure TFEscalaCadastro.FormCreate(Sender: TObject);
begin
  FrBarraBotoesItens.btAnterior.Glyph.LoadFromResourceName(HInstance, 'IMGBTANTERIOR_16X16');
  FrBarraBotoesItens.btProximo.Glyph.LoadFromResourceName(HInstance,  'IMGBTPROXIMO_16X16');
  FrBarraBotoesItens.btNovo.Glyph.LoadFromResourceName(HInstance,     'IMGBTNOVO_16X16');
  FrBarraBotoesItens.btAlterar.Glyph.LoadFromResourceName(HInstance,  'IMGBTALTERAR_16X16');
  FrBarraBotoesItens.btSalvar.Glyph.LoadFromResourceName(HInstance,   'IMGBTSALVAR_16X16');
  FrBarraBotoesItens.btCancelar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCANCELAR_16X16');
  FrBarraBotoesItens.btExluir.Glyph.LoadFromResourceName(HInstance,   'IMGBTEXCLUIR_16X16');

  inherited;
end;

procedure TFEscalaCadastro.FrBarraBotoesdsDadosStateChange(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.Enabled := not (FrBarraBotoes.dsDados.DataSet.State in dsEditModes);
  eddeEscalaItem.Enabled     := FrBarraBotoesItens.Enabled;
end;

procedure TFEscalaCadastro.FrBarraBotoesItensbtAlterarClick(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btAlterarClick(Sender);

  FocoDescricaoItem;
end;

procedure TFEscalaCadastro.FrBarraBotoesItensbtExluirClick(Sender: TObject);
begin
  inherited;

  DmERP.ExcluirEscalaItem;
end;

procedure TFEscalaCadastro.FrBarraBotoesItensbtNovoClick(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btNovoClick(Sender);

  FocoDescricaoItem;
end;

procedure TFEscalaCadastro.FrBarraBotoesItensbtSalvarClick(Sender: TObject);
begin
  inherited;

  DmERP.GravarEscalaItem;
end;

initialization
  RegisterClass(TFEscalaCadastro);

finalization
  UnRegisterClass(TFEscalaCadastro);

end.
