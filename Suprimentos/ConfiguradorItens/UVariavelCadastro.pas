unit UVariavelCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB,
  UBarraBotoesItens, Vcl.Grids, Vcl.DBGrids;

type
  TFVariavelCadastro = class(TFFormCadastro)
    lbcdVariavel: TLabel;
    lbdeVariavel: TLabel;
    eddeVariavel: TDBEdit;
    edcdVariavel: TDBCampoCodigo;
    gbVariavelItens: TGroupBox;
    lbdeValor: TLabel;
    eddeValor: TDBEdit;
    grVariavelItens: TDBGrid;
    FrBarraBotoesItens: TFBarraBotoesItens;
    lbdeMascara: TLabel;
    eddeMascara: TDBEdit;
    lbvlPrecoPadrao: TLabel;
    edvlPrecoPadrao: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FrBarraBotoesItensbtSalvarClick(Sender: TObject);
    procedure FrBarraBotoesItensbtExluirClick(Sender: TObject);
    procedure FrBarraBotoesItensbtNovoClick(Sender: TObject);
    procedure FrBarraBotoesItensbtAlterarClick(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;

    procedure FocoCampoValor;
  public
    { Public declarations }
  end;

var
  FVariavelCadastro: TFVariavelCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFVariavelCadastro.FormCreate(Sender: TObject);
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

procedure TFVariavelCadastro.FrBarraBotoesdsDadosStateChange(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.Enabled := not (FrBarraBotoes.dsDados.DataSet.State in dsEditModes);
  gbVariavelItens.Enabled    := FrBarraBotoesItens.Enabled;
end;

procedure TFVariavelCadastro.FrBarraBotoesItensbtAlterarClick(Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btAlterarClick(Sender);

  FocoCampoValor;
end;

procedure TFVariavelCadastro.FrBarraBotoesItensbtExluirClick(Sender: TObject);
begin
  inherited;

  DmERP.ExcluirVariavelItem;
end;

procedure TFVariavelCadastro.FrBarraBotoesItensbtNovoClick(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btNovoClick(Sender);

  FocoCampoValor;
end;

procedure TFVariavelCadastro.FocoCampoValor;
begin
  if (eddeValor.Visible) and (eddeValor.Enabled) then
    eddeValor.SetFocus;
end;

procedure TFVariavelCadastro.FrBarraBotoesItensbtSalvarClick(Sender: TObject);
begin
  inherited;

  DmERP.GravarVariavelItem;
end;

procedure TFVariavelCadastro.GravarRegistro;
begin
  DmERP.GravarVariavel;
end;

procedure TFVariavelCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirVariavel;
end;

initialization
  RegisterClass(TFVariavelCadastro);

finalization
  UnRegisterClass(TFVariavelCadastro);

end.
