unit UUsuarioCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  UDBDateTime, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo, UBarraBotoesItens,
  Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFUsuarioCadastro = class(TFFormCadastro)
    lbcdUsuario: TLabel;
    lbnmUsuario: TLabel;
    lbdeSenha: TLabel;
    lbdeLogin: TLabel;
    edcdUsuario: TDBCampoCodigo;
    cbflAtivo: TDBCheckBox;
    ednmUsuario: TDBEdit;
    eddeLogin: TDBEdit;
    eddeSenha: TDBEdit;
    lbdeEmail: TLabel;
    eddeEmail: TDBEdit;
    dsSetor: TDataSource;
    lcbcdSetor: TDBLookupComboBox;
    lbcdSetor: TLabel;
    dsTelasDisponiveis: TDataSource;
    dsUsuarioTela: TDataSource;
    Label1: TLabel;
    gbTelasDisponiveis: TGroupBox;
    gbUsuarioTela: TGroupBox;
    grTelasDisponiveis: TDBGrid;
    grUsuarioTela: TDBGrid;
    btAdicionar: TBitBtn;
    btRemover: TBitBtn;
    qySetor: TFDQuery;
    edcdColaborador: TDBCampoCodigo;
    lbcdColaborador: TLabel;
    eddeHrCadastro: TDBEdit;
    lbdeHrCadastro: TLabel;
    eddtCadastro: TDBDateTime;
    lbdtCadastro: TLabel;
    ednmUsuCad: TDBEdit;
    lbnmUsuCad: TLabel;
    lbdeHrSlteracao: TLabel;
    eddeHrSlteracao: TDBEdit;
    eddtAlteracao: TDBDateTime;
    lbdtAlteracao: TLabel;
    lbnmUsuAlt: TLabel;
    ednmUsuAlt: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
    procedure btAdicionarClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FUsuarioCadastro: TFUsuarioCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFUsuarioCadastro.FormCreate(Sender: TObject);
begin
  btRemover.Glyph.LoadFromResourceName(HInstance,   'IMGBTANTERIOR_32X32');
  btAdicionar.Glyph.LoadFromResourceName(HInstance, 'IMGBTPROXIMO_32X32');

  inherited;

  if not dsUsuarioTela.DataSet.Active then
    dsUsuarioTela.DataSet.Open;

  if not dsTelasDisponiveis.DataSet.Active then
    dsTelasDisponiveis.DataSet.Open;

  qySetor.Open();
end;

procedure TFUsuarioCadastro.FrBarraBotoesdsDadosStateChange(Sender: TObject);
begin
  inherited;

  eddeLogin.Enabled   := (FrBarraBotoes.dsDados.State = dsInsert);
  btAdicionar.Enabled := (FrBarraBotoes.dsDados.State = dsBrowse);
  btRemover.Enabled   := btAdicionar.Enabled;
end;

procedure TFUsuarioCadastro.GravarRegistro;
begin
  DmERP.GravarUsuario;
end;

procedure TFUsuarioCadastro.btAdicionarClick(Sender: TObject);
begin
  inherited;

  DmERP.qyUsuarioTela.Insert;
  DmERP.qyUsuarioTela.FieldByName('cdUsuario').AsInteger         := DmERP.qyUsuario.FieldByName('cdUsuario').AsInteger;
  DmERP.qyUsuarioTela.FieldByName('cdTela').AsInteger            := DmERP.qyTelasDisponiveis.FieldByName('cdTela').AsInteger;
  DmERP.qyUsuarioTela.FieldByName('flAtivo').AsString            := 'S';
  DmERP.qyUsuarioTela.FieldByName('flCadastrar').AsString        := 'N';
  DmERP.qyUsuarioTela.FieldByName('flAlterar').AsString          := 'N';
  DmERP.qyUsuarioTela.FieldByName('flExcluir').AsString          := 'N';
  DmERP.qyUsuarioTela.FieldByName('flExibeQuadroAviso').AsString := 'N';
  DmERP.qyUsuarioTela.FieldByName('flExibeMensagem').AsString    := 'N';
  DmERP.qyUsuarioTela.FieldByName('deTituloPai').AsString        := DmERP.qyTelasDisponiveis.FieldByName('deTituloPai').AsString;
  DmERP.qyUsuarioTela.FieldByName('deTituloTela').AsString       := DmERP.qyTelasDisponiveis.FieldByName('deTituloTela').AsString;
  DmERP.qyUsuarioTela.Post;

  DmERP.qyTelasDisponiveis.Close;
  DmERP.qyTelasDisponiveis.Open();
end;

procedure TFUsuarioCadastro.btRemoverClick(Sender: TObject);
begin
  inherited;

  if (DmERP.qyUsuarioTela.Active) and (not DmERP.qyUsuarioTela.IsEmpty) then
  begin
    DmERP.qyUsuarioTela.Delete;

    DmERP.qyTelasDisponiveis.Close;
    DmERP.qyTelasDisponiveis.Open();
  end;
end;

procedure TFUsuarioCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirUsuario;
end;

initialization
  RegisterClass(TFUsuarioCadastro);

finalization
  UnRegisterClass(TFUsuarioCadastro);

end.
