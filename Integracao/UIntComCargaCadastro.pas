unit UIntComCargaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, UDBDateTime, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UBarraBotoesItens, Vcl.Grids, Vcl.DBGrids;

type
  TFIntComCargaCadastro = class(TFFormCadastro)
    lbcdCarga: TLabel;
    edcdCarga: TDBCampoCodigo;
    lbdeObservacao: TLabel;
    mdeObservacao: TDBMemo;
    lbcdVeiculo: TLabel;
    edcdVeiculo: TDBCampoCodigo;
    lbcdMotorista: TLabel;
    edcdMotorista: TDBCampoCodigo;
    lbnmAjudante: TLabel;
    ednmAjudante: TDBEdit;
    lbdtSaida: TLabel;
    eddtSaida: TDBDateTime;
    lbnmUsuCad: TLabel;
    lbnmUsuAlt: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbdtCadastro: TLabel;
    lbdtAlteracao: TLabel;
    eddtCadastro: TDBDateTime;
    eddtAlteracao: TDBDateTime;
    lbdeHrCadastro: TLabel;
    eddeHrCadastro: TDBEdit;
    eddeHrSlteracao: TDBEdit;
    lbdeHrSlteracao: TLabel;
    lbdeObsSistema: TLabel;
    mdeObsSistema: TDBMemo;
    ednuPintura: TDBEdit;
    lbnuPintura: TLabel;
    qySituacao: TFDQuery;
    dsSituacao: TDataSource;
    qyPrioridade: TFDQuery;
    dsPrioridade: TDataSource;
    lbcdSituacao: TLabel;
    lcbcdSituacao: TDBLookupComboBox;
    lcbcdPrioridade: TDBLookupComboBox;
    lbcdPrioridade: TLabel;
    cbflSetorLixa: TDBCheckBox;
    cbflSetorFaturamento: TDBCheckBox;
    cbflSetorExpedicao: TDBCheckBox;
    gbCargasAlerta: TGroupBox;
    FrBarraBotoesItens: TFBarraBotoesItens;
    ldeCargaAlerta: TLabel;
    mdeCargaAlerta: TDBMemo;
    grDependentes: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FrBarraBotoesItensbtNovoClick(Sender: TObject);
    procedure FrBarraBotoesItensbtSalvarClick(Sender: TObject);
    procedure FrBarraBotoesItensbtExluirClick(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
    procedure FrBarraBotoesItensbtAlterarClick(Sender: TObject);
    procedure FrBarraBotoesItensbtAnteriorClick(Sender: TObject);
    procedure FrBarraBotoesItensbtProximoClick(Sender: TObject);
    procedure FrBarraBotoesItensbtCancelarClick(Sender: TObject);
    procedure FrBarraBotoesItensdsDadosItensStateChange(Sender: TObject);
  private
    FsdeCargaAlerta : String;

    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure FocoCampoDescricaoAlerta;
    procedure RegistraAlertaCarga;
  public
    { Public declarations }
  end;

var
  FIntComCargaCadastro: TFIntComCargaCadastro;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

procedure TFIntComCargaCadastro.FormCreate(Sender: TObject);
begin
  FrBarraBotoesItens.btAnterior.Glyph.LoadFromResourceName(HInstance, 'IMGBTANTERIOR_16X16');
  FrBarraBotoesItens.btProximo.Glyph.LoadFromResourceName(HInstance,  'IMGBTPROXIMO_16X16');
  FrBarraBotoesItens.btNovo.Glyph.LoadFromResourceName(HInstance,     'IMGBTNOVO_16X16');
  FrBarraBotoesItens.btAlterar.Glyph.LoadFromResourceName(HInstance,  'IMGBTALTERAR_16X16');
  FrBarraBotoesItens.btSalvar.Glyph.LoadFromResourceName(HInstance,   'IMGBTSALVAR_16X16');
  FrBarraBotoesItens.btCancelar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCANCELAR_16X16');
  FrBarraBotoesItens.btExluir.Glyph.LoadFromResourceName(HInstance,   'IMGBTEXCLUIR_16X16');

  qySituacao.Open();
  qyPrioridade.Open();

  inherited;
end;

procedure TFIntComCargaCadastro.FrBarraBotoesdsDadosStateChange(
  Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.Enabled := not (FrBarraBotoes.dsDados.DataSet.State in dsEditModes);
  mdeCargaAlerta.Enabled     := FrBarraBotoesItens.Enabled;
end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensbtAlterarClick(
  Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btAlterarClick(Sender);

  FocoCampoDescricaoAlerta;

  FsdeCargaAlerta := DmERP.qyIntComCargaAlerta.FieldByName('deCargaAlerta').AsString;
end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensbtAnteriorClick(
  Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btAnteriorClick(Sender);

end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensbtCancelarClick(
  Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btCancelarClick(Sender);

end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensbtExluirClick(
  Sender: TObject);
begin
  inherited;

  DmERP.ExcluirCargaAlerta;
end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensbtNovoClick(Sender: TObject);
begin
  inherited;

  FrBarraBotoesItens.btNovoClick(Sender);

  FocoCampoDescricaoAlerta;

  FsdeCargaAlerta := '';
end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensbtProximoClick(
  Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.btProximoClick(Sender);

end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensbtSalvarClick(
  Sender: TObject);
begin
  inherited;

  DmERP.GravarCargaAlerta;
  RegistraAlertaCarga;
end;

procedure TFIntComCargaCadastro.FrBarraBotoesItensdsDadosItensStateChange(
  Sender: TObject);
begin
  inherited;
  FrBarraBotoesItens.dsDadosItensStateChange(Sender);

end;

procedure TFIntComCargaCadastro.GravarRegistro;
begin
  DmERP.GravarCarga;
end;

procedure TFIntComCargaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirCarga;
end;

procedure TFIntComCargaCadastro.FocoCampoDescricaoAlerta;
begin
  if (mdeCargaAlerta.Visible) and (mdeCargaAlerta.Enabled) then
    mdeCargaAlerta.SetFocus;
end;

procedure TFIntComCargaCadastro.RegistraAlertaCarga;
begin
  if (DmERP.qyIntComCargaAlerta.Active) and (not DmERP.qyIntComCargaAlerta.IsEmpty) and
     (FsdeCargaAlerta <> DmERP.qyIntComCargaAlerta.FieldByName('deCargaAlerta').AsString) then
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
      DmERP.qyUsuarioMensagem.FieldByName('cdTela').AsInteger        := 56; //Cargas Em Aberto |8 = FIntComCargaCadastro - Cargas
      DmERP.qyUsuarioMensagem.FieldByName('flMensagemLida').AsString := 'N';
      DmERP.qyUsuarioMensagem.FieldByName('dtCadastro').AsDateTime   := DmERP.qyIntComCargaAlerta.FieldByName('dtCadastro').AsDateTime;
      DmERP.qyUsuarioMensagem.FieldByName('hrCadastro').AsInteger    := DmERP.qyIntComCargaAlerta.FieldByName('hrCadastro').AsInteger;
      DmERP.qyUsuarioMensagem.FieldByName('deMensagem').AsString     := 'Alerta da carga ' + DmERP.qyIntComCarga.FieldByName('cdCarga').AsString + #13#13 +
                                                                        DmERP.qyIntComCargaAlerta.FieldByName('deCargaAlerta').AsString;
      DmERP.qyUsuarioMensagem.Post;

      DmERP.qyPermissaoUsuario.Next;
    end;
  end;
end;

initialization
  RegisterClass(TFIntComCargaCadastro);

finalization
  UnRegisterClass(TFIntComCargaCadastro);

end.
