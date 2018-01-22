unit USincronizarDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Error,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, DateUtils;

type
  TFSincronizarDados = class(TForm)
    btSalvar: TBitBtn;
    btFechar: TBitBtn;
    mLog: TMemo;
    gbDwVendas: TGroupBox;
    lbdtEmissaoNfs: TLabel;
    eddtEmissaoNfsIni: TDateTimePicker;
    lbdtEmissaoNfsA: TLabel;
    eddtEmissaoNfsFim: TDateTimePicker;
    cbDwCidades: TCheckBox;
    cbDwClientes: TCheckBox;
    cbDwRep: TCheckBox;
    cbDwVariaveis: TCheckBox;
    cbDwVariavelItens: TCheckBox;
    cbDwGrupoItens: TCheckBox;
    cbDwSubgrupoItens: TCheckBox;
    cbDwItens: TCheckBox;
    cbDwItensCombinacao: TCheckBox;
    cbDwTempo: TCheckBox;
    cbDwVendas: TCheckBox;
    gbDadosERP: TGroupBox;
    cbCidade: TCheckBox;
    cbFornecedorTipo: TCheckBox;
    cbRepresentantes: TCheckBox;
    cbFornecedores: TCheckBox;
    cbClientes: TCheckBox;
    cbClassifFiscal: TCheckBox;
    cbTransportadora: TCheckBox;
    cbItens: TCheckBox;
    cbItensVariaveis: TCheckBox;
    cbNaturezaOper: TCheckBox;
    btAtualizarDwVendas: TButton;
    procedure btSalvarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbClientesClick(Sender: TObject);
    procedure cbRepresentantesClick(Sender: TObject);
    procedure cbFornecedoresClick(Sender: TObject);
    procedure cbTransportadoraClick(Sender: TObject);
    procedure btAtualizarDwVendasClick(Sender: TObject);
  private
    procedure SincronizarCidades;
    procedure SincronizarFornecTipo;
    procedure SincronizarClientes;
    procedure SincronizarTransportadoras;
    procedure SincronizarRep;
    procedure SincronizarFornec;
    procedure SincronizarClassifFiscal;
    procedure SincronizarItens;
    procedure SincronizarItensVariaveis;
    procedure SincronizarNaturezas;

    procedure SincronizarDWCidades;
    procedure SincronizarDWClientes;
    procedure SincronizarDWRep;
    procedure SincronizarDWVariaveis;
    procedure SincronizarDWItensVariaveis;
    procedure SincronizarDWItemGrupo;
    procedure SincronizarDWItemSubGrupo;
    procedure SincronizarDWItens;
    procedure SincronizarDWItemCombinacoes;
    procedure SincronizarDWTempo;
    procedure SincronizarDWVendas;
  public
    { Public declarations }
  end;

var
  FSincronizarDados: TFSincronizarDados;

implementation

{$R *.dfm}
{$R Icones.res}

uses
  uDmIntegracao, uDmERP, UTelaInicial, uFuncoes;

procedure TFSincronizarDados.btAtualizarDwVendasClick(Sender: TObject);
var
  dtDataAtual : TDateTime;
begin
  mLog.Clear;

  if cbDwCidades.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_cidade ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWCidades;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_cidade ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwClientes.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_cliente ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWClientes;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_cliente ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwRep.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_representante ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWRep;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_representante ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwVariaveis.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_variavel ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWVariaveis;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_variavel ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwVariavelItens.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_variavelItens ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWItensVariaveis;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_variavelItens ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwGrupoItens.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_itemGrupo ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWItemGrupo;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_itemGrupo ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwSubgrupoItens.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_itemSubGrupo ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWItemSubGrupo;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_itemSubGrupo ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwItens.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_item ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWItens;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_item ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwItensCombinacao.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_itemCombinacao ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWItemCombinacoes;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_itemCombinacao ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbDwTempo.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_tempo ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWTempo;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_tempo ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

if cbDwVendas.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização da tabela dw_vendas ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarDWVendas;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização da tabela dw_vendas ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;
end;

procedure TFSincronizarDados.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  if DmIntegracao.qyCidade.Active then
    DmIntegracao.qyCidade.Close;

  if DmERP.qyCliente.Active then
    DmERP.qyCliente.Close;

  if DmIntegracao.qyCliente.Active then
    DmIntegracao.qyCliente.Close;

  DmIntegracao.qyCliente.MacroByName('filtro').Clear;

  DmIntegracao.fdConnInteg.Connected := False;

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

procedure TFSincronizarDados.btSalvarClick(Sender: TObject);
var
  dtDataAtual : TDateTime;
begin
  mLog.Clear;
  btSalvar.Enabled   := False;
  btFechar.Enabled   := False;
  cbCidade.Enabled   := False;
  cbClientes.Enabled := False;
  cbFornecedorTipo.Enabled := False;
  cbRepresentantes.Enabled := False;
  cbFornecedores.Enabled   := False;
  cbClassifFiscal.Enabled  := False;
  cbItens.Enabled          := False;
  cbItensVariaveis.Enabled := False;
  cbTransportadora.Enabled := False;
  cbNaturezaOper.Enabled   := False;

  if cbCidade.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Cidades em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarCidades;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Cidades em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbNaturezaOper.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Naturezaa em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarNaturezas;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Naturezas em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbFornecedorTipo.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Tipos de Fornecedores em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarFornecTipo;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Tipos de Fornecedores em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbRepresentantes.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Representantes em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarRep;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Representantes em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbFornecedores.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Fornecedores em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarFornec;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Fornecedores em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbClientes.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Clientes em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarClientes;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Clientes em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbTransportadora.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Transportadora em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarTransportadoras;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Transportadora em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbClassifFiscal.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização de Classificaçao Fiscal em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarClassifFiscal;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização de Classificaçao Fiscal em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbItens.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização dos Itens em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarItens;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização dos Itens em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  if cbItensVariaveis.Checked then
  begin
    dtDataAtual    := DataHoraAtual(DmERP.fdConnERP);
    mLog.Lines.Add('Inicío da sincronização dos Itens das Variáveis em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
    mLog.Lines.Add('');
    SincronizarItensVariaveis;
    mLog.Lines.Add('');
    mLog.Lines.Add('Fim da sincronização dos Itens das Variáveis em ' + FormatDateTime('dd/mm/yyyy hh:nn', dtDataAtual));
  end;

  btSalvar.Enabled   := True;
  btFechar.Enabled   := True;
  cbCidade.Enabled   := True;
  cbClientes.Enabled := True;
  cbFornecedorTipo.Enabled := True;
  cbRepresentantes.Enabled := True;
  cbFornecedores.Enabled   := True;
  cbClassifFiscal.Enabled  := True;
  cbItens.Enabled          := True;
  cbItensVariaveis.Enabled := True;
  cbTransportadora.Enabled := True;
  cbNaturezaOper.Enabled   := True;
end;

procedure TFSincronizarDados.cbClientesClick(Sender: TObject);
begin
  cbCidade.Checked := True;
end;

procedure TFSincronizarDados.cbFornecedoresClick(Sender: TObject);
begin
  cbCidade.Checked := True;
end;

procedure TFSincronizarDados.cbRepresentantesClick(Sender: TObject);
begin
  cbCidade.Checked := True;
end;

procedure TFSincronizarDados.cbTransportadoraClick(Sender: TObject);
begin
  cbCidade.Checked := True;
end;

procedure TFSincronizarDados.SincronizarCidades;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyCidade.Open();

    if not DmIntegracao.qyCidade.IsEmpty then
    begin
      DmIntegracao.qyCidade.First;

      while not DmIntegracao.qyCidade.Eof do
      begin
        if DmERP.qyCidade.Active then
          DmERP.qyCidade.Close;

        DmERP.qyCidade.MacroByName('filtro').Value := ' WHERE cdCidade = ' +
                                                      DmIntegracao.qyCidade.FieldByName('cdCidade').AsString;

        DmERP.qyCidade.Open();

        if not DmERP.qyCidade.IsEmpty then
        begin
          DmERP.qyCidade.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyCidade.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyCidade.FieldByName('cdCidade').AsInteger    := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        end;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);

        DmERP.qyCidade.FieldByName('cdCidade').AsInteger          := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        DmERP.qyCidade.FieldByName('nmCidade').AsString           := DmIntegracao.qyCidade.FieldByName('nmCidade').AsString;
        DmERP.qyCidade.FieldByName('sgEstado').AsString           := DmIntegracao.qyCidade.FieldByName('sgEstado').AsString;
        DmERP.qyCidade.FieldByName('cdCidadeIbge').AsInteger      := DmIntegracao.qyCidade.FieldByName('cdCidadeIbge').AsInteger;
        DmERP.qyCidade.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyCidade.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyCidade.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyCidade.Post;

        mLog.Lines.Add(sAcao + ' a cidade ' +
                       FormatFloat('00000', DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger) +
                       ' - ' + DmIntegracao.qyCidade.FieldByName('nmCidade').AsString + '/' +
                       DmIntegracao.qyCidade.FieldByName('sgEstado').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyCidade.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' cidades de ' + IntToStr(DmIntegracao.qyCidade.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' cidades de ' + IntToStr(DmIntegracao.qyCidade.RecordCount));

  if DmIntegracao.qyCidade.Active then
    DmIntegracao.qyCidade.Close;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarClientes;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;


    DmIntegracao.qyCliente.MacroByName('filtro').Value := ' ORDER BY t.cdCliente';
    DmIntegracao.qyCliente.Open();

    if not DmIntegracao.qyCliente.IsEmpty then
    begin
      DmIntegracao.qyCliente.First;

      while not DmIntegracao.qyCliente.Eof do
      begin
        if DmERP.qyCliente.Active then
          DmERP.qyCliente.Close;

        DmERP.qyCliente.MacroByName('filtro').Value := ' WHERE cdCliente = ' +
                                                       DmIntegracao.qycliente.FieldByName('cdCliente').AsString;
        DmERP.qyCliente.Open();

        if not DmERP.qyCliente.IsEmpty then
        begin
          DmERP.qyCliente.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyCliente.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyCliente.FieldByName('cdCliente').AsInteger       := DmIntegracao.qyCliente.FieldByName('cdCliente').AsInteger;
        end;

        DmERP.qyCliente.FieldByName('flAtivo').AsString            := DmIntegracao.qyCliente.FieldByName('flAtivo').AsString;
        DmERP.qyCliente.FieldByName('flFisJur').AsString           := DmIntegracao.qyCliente.FieldByName('flFisJur').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyCliente.FieldByName('deCpfCnpj').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyCliente.FieldByName('deCpfCnpj').AsString        := sAux;

        DmERP.qyCliente.FieldByName('deRazaoSocial').AsString      := DmIntegracao.qyCliente.FieldByName('deRazaoSocial').AsString;
        DmERP.qyCliente.FieldByName('nmFantasia').AsString         := DmIntegracao.qyCliente.FieldByName('nmFantasia').AsString;
        DmERP.qyCliente.FieldByName('flIsentoInscEst').AsString    := DmIntegracao.qyCliente.FieldByName('flIsentoInscEst').AsString;
        DmERP.qyCliente.FieldByName('nuInscEst').AsString          := DmIntegracao.qyCliente.FieldByName('nuInscEst').AsString;
        DmERP.qyCliente.FieldByName('nuIndInscEst').AsInteger      := DmIntegracao.qyCliente.FieldByName('nuIndInscEst').AsInteger;

        sAux := SomenteNumeros(DmIntegracao.qyCliente.FieldByName('nuFone1').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyCliente.FieldByName('nuFone1').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyCliente.FieldByName('nuFone2').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyCliente.FieldByName('nuFone2').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyCliente.FieldByName('nuCelular').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyCliente.FieldByName('nuCelular').AsString        := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyCliente.FieldByName('nuFax').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyCliente.FieldByName('nuFax').AsString            := sAux;

        DmERP.qyCliente.FieldByName('deEmail').AsString            := DmIntegracao.qyCliente.FieldByName('deEmail').AsString;
        DmERP.qyCliente.FieldByName('deEmailNfe').AsString         := DmIntegracao.qyCliente.FieldByName('deEmailNfe').AsString;
        DmERP.qyCliente.FieldByName('nmPessoaContato').AsString    := DmIntegracao.qyCliente.FieldByName('nmPessoaContato').AsString;
        DmERP.qyCliente.FieldByName('deObservacoes').AsString      := DmIntegracao.qyCliente.FieldByName('deObservacoes').AsString;

        sAux := SomenteNumeros(DmERP.qyCliente.FieldByName('nuCep').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyCliente.FieldByName('nuCep').AsString            := sAux;

        DmERP.qyCliente.FieldByName('deEndereco').AsString         := DmIntegracao.qyCliente.FieldByName('deEndereco').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyCliente.FieldByName('nuEndereco').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyCliente.FieldByName('nuEndereco').AsFloat        := StrToFloatDef(sAux, 0);

        DmERP.qyCliente.FieldByName('deComplemento').AsString      := DmIntegracao.qyCliente.FieldByName('deComplemento').AsString;
        DmERP.qyCliente.FieldByName('deBairro').AsString           := DmIntegracao.qyCliente.FieldByName('deBairro').AsString;

        if (Trim(DmIntegracao.qyCliente.FieldByName('nmCidade').AsString) <> '') and
           (Trim(DmIntegracao.qyCliente.FieldByName('sgEstado').AsString) <> '') then
        begin
          if DmIntegracao.qyCidade.Active then
            DmIntegracao.qyCidade.Close;

          DmIntegracao.qyCidade.MacroByName('filtro').Value := ' WHERE nmCidade = ' + QuotedStr(Trim(DmIntegracao.qyCliente.FieldByName('nmCidade').AsString)) +
                                                               '   AND sgEstado = ' + QuotedStr(Trim(DmIntegracao.qyCliente.FieldByName('sgEstado').AsString));
          DmIntegracao.qyCidade.Open;

          if not DmIntegracao.qyCidade.IsEmpty then
            DmERP.qyCliente.FieldByName('cdCidade').AsInteger      := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        end;

        DmERP.qyCliente.FieldByName('cdRepresentante').AsInteger    := DmIntegracao.qyCliente.FieldByName('cdRepresentante').AsInteger;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyCliente.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyCliente.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyCliente.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyCliente.Post;

        mLog.Lines.Add(sAcao + ' o cliente ' +
                       FormatFloat('00000', DmIntegracao.qyCliente.FieldByName('cdCliente').AsInteger) +
                       ' - ' + DmIntegracao.qyCliente.FieldByName('deRazaoSocial').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyCliente.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' clientes de ' + IntToStr(DmIntegracao.qyCliente.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' clientes de ' + IntToStr(DmIntegracao.qyCliente.RecordCount));

  if DmIntegracao.qyCidade.Active then
    DmIntegracao.qyCidade.Close;

  DmIntegracao.qyCliente.MacroByName('filtro').Clear;

  if DmIntegracao.qyCliente.Active then
    DmIntegracao.qyCliente.Close;

  if DmERP.qyCliente.Active then
  begin
    DmERP.qyCliente.MacroByName('filtro').Clear;
    DmERP.qyCliente.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarTransportadoras;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyTransportadora.Open();

    if not DmIntegracao.qyTransportadora.IsEmpty then
    begin
      DmIntegracao.qyTransportadora.First;

      while not DmIntegracao.qyTransportadora.Eof do
      begin
        if DmERP.qyTransportadora.Active then
          DmERP.qyTransportadora.Close;

        DmERP.qyTransportadora.MacroByName('filtro').Value := ' WHERE cdTransportadora = ' +
                                                       DmIntegracao.qyTransportadora.FieldByName('cdTransportadora').AsString;
        DmERP.qyTransportadora.Open();

        if not DmERP.qyTransportadora.IsEmpty then
        begin
          DmERP.qyTransportadora.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyTransportadora.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyTransportadora.FieldByName('cdTransportadora').AsInteger := DmIntegracao.qyTransportadora.FieldByName('cdTransportadora').AsInteger;
        end;

        DmERP.qyTransportadora.FieldByName('flAtivo').AsString            := DmIntegracao.qyTransportadora.FieldByName('flAtivo').AsString;
        DmERP.qyTransportadora.FieldByName('flFisJur').AsString           := DmIntegracao.qyTransportadora.FieldByName('flFisJur').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyTransportadora.FieldByName('deCpfCnpj').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyTransportadora.FieldByName('deCpfCnpj').AsString        := sAux;

        DmERP.qyTransportadora.FieldByName('deRazaoSocial').AsString      := DmIntegracao.qyTransportadora.FieldByName('deRazaoSocial').AsString;
        DmERP.qyTransportadora.FieldByName('nmFantasia').AsString         := DmIntegracao.qyTransportadora.FieldByName('nmFantasia').AsString;
        DmERP.qyTransportadora.FieldByName('flIsentoInscEst').AsString    := DmIntegracao.qyTransportadora.FieldByName('flIsentoInscEst').AsString;
        DmERP.qyTransportadora.FieldByName('nuInscEst').AsString          := DmIntegracao.qyTransportadora.FieldByName('nuInscEst').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyTransportadora.FieldByName('nuFone1').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyTransportadora.FieldByName('nuFone1').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyTransportadora.FieldByName('nuFone2').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyTransportadora.FieldByName('nuFone2').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyTransportadora.FieldByName('nuFax').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyTransportadora.FieldByName('nuFax').AsString            := sAux;

        DmERP.qyTransportadora.FieldByName('deEmail').AsString            := DmIntegracao.qyTransportadora.FieldByName('deEmail').AsString;
        DmERP.qyTransportadora.FieldByName('deEmailNfe').AsString         := DmIntegracao.qyTransportadora.FieldByName('deEmailNfe').AsString;
        DmERP.qyTransportadora.FieldByName('nmPessoaContato').AsString    := DmIntegracao.qyTransportadora.FieldByName('nmPessoaContato').AsString;
        DmERP.qyTransportadora.FieldByName('deObservacoes').AsString      := DmIntegracao.qyTransportadora.FieldByName('deObservacoes').AsString;

        sAux := SomenteNumeros(DmERP.qyTransportadora.FieldByName('nuCep').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyTransportadora.FieldByName('nuCep').AsString            := sAux;

        DmERP.qyTransportadora.FieldByName('deEndereco').AsString         := DmIntegracao.qyTransportadora.FieldByName('deEndereco').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyTransportadora.FieldByName('nuEndereco').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyTransportadora.FieldByName('nuEndereco').AsFloat        := StrToFloatDef(sAux, 0);

        DmERP.qyTransportadora.FieldByName('deComplemento').AsString      := DmIntegracao.qyTransportadora.FieldByName('deComplemento').AsString;
        DmERP.qyTransportadora.FieldByName('deBairro').AsString           := DmIntegracao.qyTransportadora.FieldByName('deBairro').AsString;

        if (Trim(DmIntegracao.qyTransportadora.FieldByName('nmCidade').AsString) <> '') and
           (Trim(DmIntegracao.qyTransportadora.FieldByName('sgEstado').AsString) <> '') then
        begin
          if DmIntegracao.qyCidade.Active then
            DmIntegracao.qyCidade.Close;

          DmIntegracao.qyCidade.MacroByName('filtro').Value := ' WHERE nmCidade = ' + QuotedStr(Trim(DmIntegracao.qyTransportadora.FieldByName('nmCidade').AsString)) +
                                                               '   AND sgEstado = ' + QuotedStr(Trim(DmIntegracao.qyTransportadora.FieldByName('sgEstado').AsString));
          DmIntegracao.qyCidade.Open;

          if not DmIntegracao.qyCidade.IsEmpty then
            DmERP.qyTransportadora.FieldByName('cdCidade').AsInteger      := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        end;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyTransportadora.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyTransportadora.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyTransportadora.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyTransportadora.Post;

        mLog.Lines.Add(sAcao + ' a transportadora ' +
                       FormatFloat('00000', DmIntegracao.qyTransportadora.FieldByName('cdTransportadora').AsInteger) +
                       ' - ' + DmIntegracao.qyTransportadora.FieldByName('deRazaoSocial').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyTransportadora.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' transportadoras de ' + IntToStr(DmIntegracao.qyTransportadora.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' transportadoras de ' + IntToStr(DmIntegracao.qyTransportadora.RecordCount));

  if DmIntegracao.qyCidade.Active then
    DmIntegracao.qyCidade.Close;

  if DmIntegracao.qyTransportadora.Active then
    DmIntegracao.qyTransportadora.Close;

  if DmERP.qyTransportadora.Active then
  begin
    DmERP.qyTransportadora.MacroByName('filtro').Clear;
    DmERP.qyTransportadora.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarRep;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyRepresentante.Open();

    if not DmIntegracao.qyRepresentante.IsEmpty then
    begin
      DmIntegracao.qyRepresentante.First;

      while not DmIntegracao.qyRepresentante.Eof do
      begin
        if DmERP.qyRepresentante.Active then
          DmERP.qyRepresentante.Close;

        DmERP.qyRepresentante.MacroByName('filtro').Value := ' WHERE cdRepresentante = ' +
                                                             DmIntegracao.qyRepresentante.FieldByName('cdRepresentante').AsString;
        DmERP.qyRepresentante.Open();

        if not DmERP.qyRepresentante.IsEmpty then
        begin
          DmERP.qyRepresentante.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyRepresentante.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyRepresentante.FieldByName('cdRepresentante').AsInteger := DmIntegracao.qyRepresentante.FieldByName('cdRepresentante').AsInteger;
        end;

        DmERP.qyRepresentante.FieldByName('flAtivo').AsString            := DmIntegracao.qyRepresentante.FieldByName('flAtivo').AsString;
        DmERP.qyRepresentante.FieldByName('flFisJur').AsString           := DmIntegracao.qyRepresentante.FieldByName('flFisJur').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyRepresentante.FieldByName('deCpfCnpj').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyRepresentante.FieldByName('deCpfCnpj').AsString        := sAux;

        DmERP.qyRepresentante.FieldByName('deRazaoSocial').AsString      := DmIntegracao.qyRepresentante.FieldByName('deRazaoSocial').AsString;
        DmERP.qyRepresentante.FieldByName('nmFantasia').AsString         := DmIntegracao.qyRepresentante.FieldByName('nmFantasia').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyRepresentante.FieldByName('nuFone1').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyRepresentante.FieldByName('nuFone1').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyRepresentante.FieldByName('nuFone2').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyRepresentante.FieldByName('nuFone2').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyRepresentante.FieldByName('nuFax').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyRepresentante.FieldByName('nuFax').AsString            := sAux;

        DmERP.qyRepresentante.FieldByName('deEmail').AsString            := DmIntegracao.qyRepresentante.FieldByName('deEmail').AsString;
        DmERP.qyRepresentante.FieldByName('nmPessoaContato').AsString    := DmIntegracao.qyRepresentante.FieldByName('nmPessoaContato').AsString;
        DmERP.qyRepresentante.FieldByName('deObservacoes').AsString      := DmIntegracao.qyRepresentante.FieldByName('deObservacoes').AsString;

        sAux := SomenteNumeros(DmERP.qyRepresentante.FieldByName('nuCep').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyRepresentante.FieldByName('nuCep').AsString            := sAux;

        DmERP.qyRepresentante.FieldByName('deEndereco').AsString         := DmIntegracao.qyRepresentante.FieldByName('deEndereco').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyRepresentante.FieldByName('nuEndereco').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyRepresentante.FieldByName('nuEndereco').AsFloat        := StrToFloatDef(sAux, 0);

        DmERP.qyRepresentante.FieldByName('deComplemento').AsString      := DmIntegracao.qyRepresentante.FieldByName('deComplemento').AsString;
        DmERP.qyRepresentante.FieldByName('deBairro').AsString           := DmIntegracao.qyRepresentante.FieldByName('deBairro').AsString;

        if (Trim(DmIntegracao.qyRepresentante.FieldByName('nmCidade').AsString) <> '') and
           (Trim(DmIntegracao.qyRepresentante.FieldByName('sgEstado').AsString) <> '') then
        begin
          if DmIntegracao.qyCidade.Active then
            DmIntegracao.qyCidade.Close;

          DmIntegracao.qyCidade.MacroByName('filtro').Value := ' WHERE nmCidade = ' + QuotedStr(Trim(DmIntegracao.qyRepresentante.FieldByName('nmCidade').AsString)) +
                                                               '   AND sgEstado = ' + QuotedStr(Trim(DmIntegracao.qyRepresentante.FieldByName('sgEstado').AsString));
          DmIntegracao.qyCidade.Open;

          if not DmIntegracao.qyCidade.IsEmpty then
            DmERP.qyRepresentante.FieldByName('cdCidade').AsInteger      := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        end;

        DmERP.qyRepresentante.FieldByName('vlPercComissao').AsCurrency   := DmIntegracao.qyRepresentante.FieldByName('vlPercComissao').AsCurrency;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyRepresentante.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyRepresentante.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyRepresentante.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyRepresentante.Post;

        mLog.Lines.Add(sAcao + ' o representante ' +
                       FormatFloat('00000', DmIntegracao.qyRepresentante.FieldByName('cdRepresentante').AsInteger) +
                       ' - ' + DmIntegracao.qyRepresentante.FieldByName('deRazaoSocial').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyRepresentante.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' representantes de ' + IntToStr(DmIntegracao.qyRepresentante.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' representantes de ' + IntToStr(DmIntegracao.qyRepresentante.RecordCount));

  if DmIntegracao.qyCidade.Active then
    DmIntegracao.qyCidade.Close;

  if DmIntegracao.qyRepresentante.Active then
    DmIntegracao.qyRepresentante.Close;

  if DmERP.qyRepresentante.Active then
  begin
    DmERP.qyRepresentante.MacroByName('filtro').Clear;
    DmERP.qyRepresentante.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarFornecTipo;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyFornecedorTipo.Open();

    if not DmIntegracao.qyFornecedorTipo.IsEmpty then
    begin
      DmIntegracao.qyFornecedorTipo.First;

      while not DmIntegracao.qyFornecedorTipo.Eof do
      begin
        if DmERP.qyFornecedorTipo.Active then
          DmERP.qyFornecedorTipo.Close;

        DmERP.qyFornecedorTipo.MacroByName('filtro').Value := ' WHERE cdFornecedorTipo = ' +
                                                              DmIntegracao.qyFornecedorTipo.FieldByName('cdFornecedorTipo').AsString;
        DmERP.qyFornecedorTipo.Open();

        if not DmERP.qyFornecedorTipo.IsEmpty then
        begin
          DmERP.qyFornecedorTipo.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyFornecedorTipo.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyFornecedorTipo.FieldByName('cdFornecedorTipo').AsInteger := DmIntegracao.qyFornecedorTipo.FieldByName('cdFornecedorTipo').AsInteger;
        end;

        DmERP.qyFornecedorTipo.FieldByName('deFornecedorTipo').AsString := DmIntegracao.qyFornecedorTipo.FieldByName('deFornecedorTipo').AsString;

        DmERP.qyFornecedorTipo.Post;

        mLog.Lines.Add(sAcao + ' o tipo de fornecedor ' +
                       FormatFloat('00000', DmIntegracao.qyFornecedorTipo.FieldByName('cdFornecedorTipo').AsInteger) +
                       ' - ' + DmIntegracao.qyFornecedorTipo.FieldByName('deFornecedorTipo').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyFornecedorTipo.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' tipos de fornecedor de ' + IntToStr(DmIntegracao.qyFornecedorTipo.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' tipos de fornecedor de ' + IntToStr(DmIntegracao.qyFornecedorTipo.RecordCount));

  if DmERP.qyFornecedorTipo.Active then
  begin
    DmERP.qyFornecedorTipo.MacroByName('filtro').Clear;
    DmERP.qyFornecedorTipo.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarFornec;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyFornecedor.Open();

    if not DmIntegracao.qyFornecedor.IsEmpty then
    begin
      DmIntegracao.qyFornecedor.First;

      while not DmIntegracao.qyFornecedor.Eof do
      begin
        if DmERP.qyFornecedor.Active then
          DmERP.qyFornecedor.Close;

        DmERP.qyFornecedor.MacroByName('filtro').Value := ' WHERE cdFornecedor = ' +
                                                          DmIntegracao.qyFornecedor.FieldByName('cdFornecedor').AsString;
        DmERP.qyFornecedor.Open();

        if not DmERP.qyFornecedor.IsEmpty then
        begin
          DmERP.qyFornecedor.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyFornecedor.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyFornecedor.FieldByName('cdFornecedor').AsInteger    := DmIntegracao.qyFornecedor.FieldByName('cdFornecedor').AsInteger;
        end;

        DmERP.qyFornecedor.FieldByName('cdFornecedorTipo').AsInteger  := DmIntegracao.qyFornecedor.FieldByName('cdFornecedorTipo').AsInteger;
        DmERP.qyFornecedor.FieldByName('flAtivo').AsString            := DmIntegracao.qyFornecedor.FieldByName('flAtivo').AsString;
        DmERP.qyFornecedor.FieldByName('flFisJur').AsString           := DmIntegracao.qyFornecedor.FieldByName('flFisJur').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyFornecedor.FieldByName('deCpfCnpj').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('deCpfCnpj').AsString        := sAux;

        DmERP.qyFornecedor.FieldByName('deRazaoSocial').AsString      := DmIntegracao.qyFornecedor.FieldByName('deRazaoSocial').AsString;
        DmERP.qyFornecedor.FieldByName('nmFantasia').AsString         := DmIntegracao.qyFornecedor.FieldByName('nmFantasia').AsString;
        DmERP.qyFornecedor.FieldByName('flIsentoInscEst').AsString    := DmIntegracao.qyFornecedor.FieldByName('flIsentoInscEst').AsString;
        DmERP.qyFornecedor.FieldByName('nuInscEst').AsString          := DmIntegracao.qyFornecedor.FieldByName('nuInscEst').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyFornecedor.FieldByName('nuIndInscEst').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('nuIndInscEst').AsString     := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyFornecedor.FieldByName('cdMunicipio').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('cdMunicipio').AsString      := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyFornecedor.FieldByName('nuFone1').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('nuFone1').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyFornecedor.FieldByName('nuFone2').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('nuFone2').AsString          := sAux;

        sAux := SomenteNumeros(DmIntegracao.qyFornecedor.FieldByName('nuFax').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('nuFax').AsString            := sAux;

        DmERP.qyFornecedor.FieldByName('deEmail').AsString            := DmIntegracao.qyFornecedor.FieldByName('deEmail').AsString;
        DmERP.qyFornecedor.FieldByName('deEmailNfe').AsString         := DmIntegracao.qyFornecedor.FieldByName('deEmailNfe').AsString;
        DmERP.qyFornecedor.FieldByName('deHomePage').AsString         := DmIntegracao.qyFornecedor.FieldByName('deHomePage').AsString;
        DmERP.qyFornecedor.FieldByName('nmPessoaContato').AsString    := DmIntegracao.qyFornecedor.FieldByName('nmPessoaContato').AsString;
        DmERP.qyFornecedor.FieldByName('deObservacoes').AsString      := DmIntegracao.qyFornecedor.FieldByName('deObservacoes').AsString;

        sAux := SomenteNumeros(DmERP.qyFornecedor.FieldByName('nuCep').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('nuCep').AsString            := sAux;

        DmERP.qyFornecedor.FieldByName('deEndereco').AsString         := DmIntegracao.qyFornecedor.FieldByName('deEndereco').AsString;

        sAux := SomenteNumeros(DmIntegracao.qyFornecedor.FieldByName('nuEndereco').AsString);

        if StrToFloatDef(sAux, 0) > 0 then
          DmERP.qyFornecedor.FieldByName('nuEndereco').AsFloat        := StrToFloatDef(sAux, 0);

        DmERP.qyFornecedor.FieldByName('deComplemento').AsString      := DmIntegracao.qyFornecedor.FieldByName('deComplemento').AsString;
        DmERP.qyFornecedor.FieldByName('deBairro').AsString           := DmIntegracao.qyFornecedor.FieldByName('deBairro').AsString;

        if (Trim(DmIntegracao.qyFornecedor.FieldByName('nmCidade').AsString) <> '') and
           (Trim(DmIntegracao.qyFornecedor.FieldByName('sgEstado').AsString) <> '') then
        begin
          if DmIntegracao.qyCidade.Active then
            DmIntegracao.qyCidade.Close;

          DmIntegracao.qyCidade.MacroByName('filtro').Value := ' WHERE nmCidade = ' + QuotedStr(Trim(DmIntegracao.qyFornecedor.FieldByName('nmCidade').AsString)) +
                                                               '   AND sgEstado = ' + QuotedStr(Trim(DmIntegracao.qyFornecedor.FieldByName('sgEstado').AsString));
          DmIntegracao.qyCidade.Open;

          if not DmIntegracao.qyCidade.IsEmpty then
            DmERP.qyFornecedor.FieldByName('cdCidade').AsInteger      := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        end;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyFornecedor.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyFornecedor.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyFornecedor.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyFornecedor.Post;

        mLog.Lines.Add(sAcao + ' o fornecedor ' +
                       FormatFloat('00000', DmIntegracao.qyFornecedor.FieldByName('cdFornecedor').AsInteger) +
                       ' - ' + DmIntegracao.qyFornecedor.FieldByName('deRazaoSocial').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyFornecedor.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' fornecedores de ' + IntToStr(DmIntegracao.qyFornecedor.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' fornecedores de ' + IntToStr(DmIntegracao.qyFornecedor.RecordCount));

  if DmIntegracao.qyCidade.Active then
    DmIntegracao.qyCidade.Close;

  if DmIntegracao.qyFornecedor.Active then
    DmIntegracao.qyFornecedor.Close;

  if DmERP.qyFornecedor.Active then
  begin
    DmERP.qyFornecedor.MacroByName('filtro').Clear;
    DmERP.qyFornecedor.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarClassifFiscal;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    DmERP.qyClassifFiscal.AfterScroll := nil;

    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyClassifFiscal.Open();

    if not DmIntegracao.qyClassifFiscal.IsEmpty then
    begin
      DmIntegracao.qyClassifFiscal.First;

      while not DmIntegracao.qyClassifFiscal.Eof do
      begin
        if DmERP.qyClassifFiscal.Active then
          DmERP.qyClassifFiscal.Close;

        DmERP.qyClassifFiscal.MacroByName('filtro').Value := ' WHERE cdClassifFiscal = ' +
                                                             DmIntegracao.qyClassifFiscal.FieldByName('cdClassifFiscal').AsString;
        DmERP.qyClassifFiscal.Open();

        if not DmERP.qyClassifFiscal.IsEmpty then
        begin
          DmERP.qyClassifFiscal.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyClassifFiscal.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyClassifFiscal.FieldByName('cdClassifFiscal').AsInteger := DmIntegracao.qyClassifFiscal.FieldByName('cdClassifFiscal').AsInteger;
        end;

        DmERP.qyClassifFiscal.FieldByName('nuClassifFiscal').AsString        := DmIntegracao.qyClassifFiscal.FieldByName('nuClassifFiscal').AsString;
        DmERP.qyClassifFiscal.FieldByName('deClassifFiscal').AsString        := DmIntegracao.qyClassifFiscal.FieldByName('deClassifFiscal').AsString;

        if DmIntegracao.qyClassifFiscal.FieldByName('vlIpi').AsCurrency > 0 then
          DmERP.qyClassifFiscal.FieldByName('vlIpi').AsCurrency              := DmIntegracao.qyClassifFiscal.FieldByName('vlIpi').AsCurrency;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('deIpiClasse').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('deIpiClasse').AsString          := DmIntegracao.qyClassifFiscal.FieldByName('deIpiClasse').AsString;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('cdIpiTipo').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('cdIpiTipo').AsInteger           := DmIntegracao.qyClassifFiscal.FieldByName('cdIpiTipo').AsInteger;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('cdIpiCodigo').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('cdIpiCodigo').AsInteger         := DmIntegracao.qyClassifFiscal.FieldByName('cdIpiCodigo').AsInteger;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('cdIpiEnquadramento').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('cdIpiEnquadramento').AsInteger  := DmIntegracao.qyClassifFiscal.FieldByName('cdIpiEnquadramento').AsInteger;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('cdPisCodigo').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('cdPisCodigo').AsInteger         := DmIntegracao.qyClassifFiscal.FieldByName('cdPisCodigo').AsInteger;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('cdCofinsCodigo').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('cdCofinsCodigo').AsInteger      := DmIntegracao.qyClassifFiscal.FieldByName('cdCofinsCodigo').AsInteger;

        if DmIntegracao.qyClassifFiscal.FieldByName('vlPercMva').AsCurrency > 0 then
          DmERP.qyClassifFiscal.FieldByName('vlPercMva').AsCurrency          := DmIntegracao.qyClassifFiscal.FieldByName('vlPercMva').AsCurrency;

        DmERP.qyClassifFiscal.FieldByName('flCalculaStCnae').AsString        := DmIntegracao.qyClassifFiscal.FieldByName('flCalculaStCnae').AsString;

        if DmIntegracao.qyClassifFiscal.FieldByName('nuCest').AsInteger > 0 then
          DmERP.qyClassifFiscal.FieldByName('nuCest').AsInteger              := DmIntegracao.qyClassifFiscal.FieldByName('nuCest').AsInteger;

        if DmIntegracao.qyClassifFiscal.FieldByName('vlPercIpi').AsCurrency > 0 then
          DmERP.qyClassifFiscal.FieldByName('vlPercIpi').AsCurrency          := DmIntegracao.qyClassifFiscal.FieldByName('vlPercIpi').AsCurrency;

        if DmIntegracao.qyClassifFiscal.FieldByName('vlPercIcmsReducao').AsCurrency > 0 then
          DmERP.qyClassifFiscal.FieldByName('vlPercIcmsReducao').AsCurrency  := DmIntegracao.qyClassifFiscal.FieldByName('vlPercIcmsReducao').AsCurrency;

        if DmIntegracao.qyClassifFiscal.FieldByName('vlPercPis').AsCurrency > 0 then
          DmERP.qyClassifFiscal.FieldByName('vlPercPis').AsCurrency          := DmIntegracao.qyClassifFiscal.FieldByName('vlPercPis').AsCurrency;

        if DmIntegracao.qyClassifFiscal.FieldByName('vlPercCofins').AsCurrency > 0 then
          DmERP.qyClassifFiscal.FieldByName('vlPercCofins').AsCurrency       := DmIntegracao.qyClassifFiscal.FieldByName('vlPercCofins').AsCurrency;

        DmERP.qyClassifFiscal.FieldByName('flAbatePisCofins').AsString       := DmIntegracao.qyClassifFiscal.FieldByName('flAbatePisCofins').AsString;
        DmERP.qyClassifFiscal.FieldByName('flImprimeNota').AsString          := DmIntegracao.qyClassifFiscal.FieldByName('flImprimeNota').AsString;
        DmERP.qyClassifFiscal.FieldByName('flUtilizaDnf').AsString           := DmIntegracao.qyClassifFiscal.FieldByName('flUtilizaDnf').AsString;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('deExTipi').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('deExTipi').AsString             := DmIntegracao.qyClassifFiscal.FieldByName('deExTipi').AsString;

        DmERP.qyClassifFiscal.FieldByName('flIcmsReducaoPF').AsString        := DmIntegracao.qyClassifFiscal.FieldByName('flIcmsReducaoPF').AsString;
        DmERP.qyClassifFiscal.FieldByName('flIcmsReducaoIndustria').AsString := DmIntegracao.qyClassifFiscal.FieldByName('flIcmsReducaoIndustria').AsString;
        DmERP.qyClassifFiscal.FieldByName('flEntraDesoneracao').AsString     := DmIntegracao.qyClassifFiscal.FieldByName('flEntraDesoneracao').AsString;

        if DmIntegracao.qyClassifFiscal.FieldByName('vlPercDesoneracao').AsCurrency > 0 then
          DmERP.qyClassifFiscal.FieldByName('vlPercDesoneracao').AsCurrency  := DmIntegracao.qyClassifFiscal.FieldByName('vlPercDesoneracao').AsCurrency;

        DmERP.qyClassifFiscal.FieldByName('flUtilizaIbpt').AsString          := DmIntegracao.qyClassifFiscal.FieldByName('flUtilizaIbpt').AsString;

        if Trim(DmIntegracao.qyClassifFiscal.FieldByName('deObservacoes').AsString) <> '' then
          DmERP.qyClassifFiscal.FieldByName('deObservacoes').AsString        := DmIntegracao.qyClassifFiscal.FieldByName('deObservacoes').AsString;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyClassifFiscal.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyClassifFiscal.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyClassifFiscal.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyClassifFiscal.Post;

        if DmIntegracao.qyClasFisTaxaIbpt.Active then
          DmIntegracao.qyClasFisTaxaIbpt.Close;

        DmIntegracao.qyClasFisTaxaIbpt.ParamByName('cdClassifFiscal').AsString := DmIntegracao.qyClassifFiscal.FieldByName('cdClassifFiscal').AsString;

        DmIntegracao.qyClasFisTaxaIbpt.Open();

        if not DmIntegracao.qyClasFisTaxaIbpt.IsEmpty then
        begin
          DmIntegracao.qyClasFisTaxaIbpt.First;

          while not DmIntegracao.qyClasFisTaxaIbpt.Eof do
          begin
            if DmERP.qyClasFisTaxaIbpt.Active then
              DmERP.qyClasFisTaxaIbpt.Close;

            DmERP.qyClasFisTaxaIbpt.MacroByName('filtro').Value := ' AND sgEstado = ' + QuotedStr(DmIntegracao.qyClasFisTaxaIbpt.FieldByName('sgEstado').AsString);

            DmERP.qyClasFisTaxaIbpt.Open();

            if DmERP.qyClasFisTaxaIbpt.IsEmpty then
            begin
              DmERP.qyClasFisTaxaIbpt.Insert;
              DmERP.qyClasFisTaxaIbpt.FieldByName('cdClassifFiscal').AsInteger := DmIntegracao.qyClassifFiscal.FieldByName('cdClassifFiscal').AsInteger;
              DmERP.qyClasFisTaxaIbpt.FieldByName('sgEstado').AsString         := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('sgEstado').AsString;
            end
            else
              DmERP.qyClasFisTaxaIbpt.Edit;

            DmERP.qyClasFisTaxaIbpt.FieldByName('vlPercNacional').AsCurrency   := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('vlPercNacional').AsCurrency;
            DmERP.qyClasFisTaxaIbpt.FieldByName('vlPercImportacao').AsCurrency := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('vlPercImportacao').AsCurrency;
            DmERP.qyClasFisTaxaIbpt.FieldByName('vlPercEstadual').AsCurrency   := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('vlPercEstadual').AsCurrency;
            DmERP.qyClasFisTaxaIbpt.FieldByName('vlPercMunicipal').AsCurrency  := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('vlPercMunicipal').AsCurrency;
            DmERP.qyClasFisTaxaIbpt.FieldByName('dtValidade').AsDateTime       := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('dtValidade').AsDateTime;
            DmERP.qyClasFisTaxaIbpt.FieldByName('dtVigenciaIni').AsDateTime    := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('dtVigenciaIni').AsDateTime;
            DmERP.qyClasFisTaxaIbpt.FieldByName('dtVigenciaFim').AsDateTime    := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('dtVigenciaFim').AsDateTime;
            DmERP.qyClasFisTaxaIbpt.FieldByName('deVersao').AsString           := DmIntegracao.qyClasFisTaxaIbpt.FieldByName('deVersao').AsString;

            DmERP.qyClasFisTaxaIbpt.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
            DmERP.qyClasFisTaxaIbpt.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
            DmERP.qyClasFisTaxaIbpt.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

            DmERP.qyClasFisTaxaIbpt.Post;

            DmIntegracao.qyClasFisTaxaIbpt.Next;
          end;
        end;

        mLog.Lines.Add(sAcao + ' a classificação fiscal ' +
                       FormatFloat('00000', DmIntegracao.qyClassifFiscal.FieldByName('cdClassifFiscal').AsInteger) +
                       ' - ' + DmIntegracao.qyClassifFiscal.FieldByName('deClassifFiscal').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyClassifFiscal.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  DmERP.qyClassifFiscal.AfterScroll := DmERP.qyClassifFiscalAfterScroll;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' classificações fiscais de ' + IntToStr(DmIntegracao.qyClassifFiscal.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' classificações fiscais de ' + IntToStr(DmIntegracao.qyClassifFiscal.RecordCount));

  if DmIntegracao.qyClasFisTaxaIbpt.Active then
    DmIntegracao.qyClasFisTaxaIbpt.Close;

  if DmIntegracao.qyClassifFiscal.Active then
    DmIntegracao.qyClassifFiscal.Close;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarItens;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;

    DmIntegracao.qyCentroCusto.MacroByName('filtro').Clear;
    DmIntegracao.qyCentroCusto.Open();

    if not DmIntegracao.qyCentroCusto.IsEmpty then
    begin
      DmIntegracao.qyCentroCusto.First;

      while not DmIntegracao.qyCentroCusto.Eof do
      begin
        if DmERP.qyCentroCusto.Active then
          DmERP.qyCentroCusto.Close;

        DmERP.qyCentroCusto.MacroByName('filtro').Value := ' WHERE cdCentroCusto = ' +
                                                           DmIntegracao.qyCentroCusto.FieldByName('cdCentroCusto').AsString;
        DmERP.qyCentroCusto.Open();

        if not DmERP.qyCentroCusto.IsEmpty then
        begin
          DmERP.qyCentroCusto.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyCentroCusto.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyCentroCusto.FieldByName('cdCentroCusto').AsString    := DmIntegracao.qyCentroCusto.FieldByName('cdCentroCusto').AsString;
        end;

        DmERP.qyCentroCusto.FieldByName('deCentroCusto').AsString      := DmIntegracao.qyCentroCusto.FieldByName('deCentroCusto').AsString;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyCentroCusto.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyCentroCusto.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyCentroCusto.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyCentroCusto.Post;

        mLog.Lines.Add(sAcao + ' o centro de custo ' +
                       DmIntegracao.qyCentroCusto.FieldByName('cdCentroCusto').AsString +
                       ' - ' + DmIntegracao.qyCentroCusto.FieldByName('deCentroCusto').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyCentroCusto.Next;
      end;
    end;

    if DmIntegracao.qyCentroCusto.Active then
      DmIntegracao.qyCentroCusto.Close;
//--------------------------------------------------
    iTotEdit   := 0;
    iTotInsert := 0;

    DmIntegracao.qyItemGrupo.MacroByName('filtro').Clear;
    DmIntegracao.qyItemGrupo.Open();

    if not DmIntegracao.qyItemGrupo.IsEmpty then
    begin
      DmIntegracao.qyItemGrupo.First;

      while not DmIntegracao.qyItemGrupo.Eof do
      begin
        if DmERP.qyItemGrupo.Active then
          DmERP.qyItemGrupo.Close;

        DmERP.qyItemGrupo.MacroByName('filtro').Value := ' WHERE cdItemGrupo = ' +
                                                           DmIntegracao.qyItemGrupo.FieldByName('cdItemGrupo').AsString;
        DmERP.qyItemGrupo.Open();

        if not DmERP.qyItemGrupo.IsEmpty then
        begin
          DmERP.qyItemGrupo.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyItemGrupo.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyItemGrupo.FieldByName('cdItemGrupo').AsString    := DmIntegracao.qyItemGrupo.FieldByName('cdItemGrupo').AsString;
        end;

        DmERP.qyItemGrupo.FieldByName('deItemGrupo').AsString      := DmIntegracao.qyItemGrupo.FieldByName('deItemGrupo').AsString;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyItemGrupo.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyItemGrupo.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyItemGrupo.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyItemGrupo.Post;

        mLog.Lines.Add(sAcao + ' o grupo ' +
                       DmIntegracao.qyItemGrupo.FieldByName('cdItemGrupo').AsString +
                       ' - ' + DmIntegracao.qyItemGrupo.FieldByName('deItemGrupo').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyItemGrupo.Next;
      end;
    end;

    if DmIntegracao.qyItemGrupo.Active then
      DmIntegracao.qyItemGrupo.Close;
//--------------------------------------------------
    iTotEdit   := 0;
    iTotInsert := 0;

    DmIntegracao.qyItemSubGrupo.MacroByName('filtro').Clear;
    DmIntegracao.qyItemSubGrupo.Open();

    if not DmIntegracao.qyItemSubGrupo.IsEmpty then
    begin
      DmIntegracao.qyItemSubGrupo.First;

      while not DmIntegracao.qyItemSubGrupo.Eof do
      begin
        if DmERP.qyItemSubGrupo.Active then
          DmERP.qyItemSubGrupo.Close;

        DmERP.qyItemSubGrupo.MacroByName('filtro').Value := ' WHERE cdItemGrupo = ' + DmIntegracao.qyItemSubGrupo.FieldByName('cdItemGrupo').AsString +
                                                            '   AND cdItemSubGrupo = ' + DmIntegracao.qyItemSubGrupo.FieldByName('cdItemSubGrupo').AsString;
        DmERP.qyItemSubGrupo.Open();

        if not DmERP.qyItemSubGrupo.IsEmpty then
        begin
          DmERP.qyItemSubGrupo.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyItemSubGrupo.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyItemSubGrupo.FieldByName('cdItemGrupo').AsString      := DmIntegracao.qyItemSubGrupo.FieldByName('cdItemGrupo').AsString;
          DmERP.qyItemSubGrupo.FieldByName('cdItemSubGrupo').AsString   := DmIntegracao.qyItemSubGrupo.FieldByName('cdItemSubGrupo').AsString;
        end;

        DmERP.qyItemSubGrupo.FieldByName('deItemSubGrupo').AsString     := DmIntegracao.qyItemSubGrupo.FieldByName('deItemSubGrupo').AsString;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyItemSubGrupo.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyItemSubGrupo.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyItemSubGrupo.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyItemSubGrupo.Post;

        mLog.Lines.Add(sAcao + ' o subgrupo ' +
                       DmIntegracao.qyItemSubGrupo.FieldByName('cdItemSubGrupo').AsString +
                       ' - ' + DmIntegracao.qyItemSubGrupo.FieldByName('deItemSubGrupo').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyItemSubGrupo.Next;
      end;
    end;

    if DmIntegracao.qyItemSubGrupo.Active then
      DmIntegracao.qyItemSubGrupo.Close;
//--------------------------------------------------
    iTotEdit   := 0;
    iTotInsert := 0;

    DmIntegracao.qyItem.MacroByName('filtro').Clear;
    DmIntegracao.qyItem.MacroByName('filtro').Value := ' WHERE ((a.est_item_conf = ''S'') OR (a.est_item_conf = '''')) ' +
                                                       '   AND a.item NOT LIKE ''%.12%'' ';

    DmIntegracao.qyItem.Open();

    if not DmIntegracao.qyItem.IsEmpty then
    begin
      DmIntegracao.qyItem.First;

      while not DmIntegracao.qyItem.Eof do
      begin
        if DmERP.qyItem.Active then
          DmERP.qyItem.Close;

        DmERP.qyItem.MacroByName('filtro').Value := ' WHERE cdItem = ' +
                                                    QuotedStr(DmIntegracao.qyItem.FieldByName('cdItem').AsString);
        DmERP.qyItem.Open();

        if not DmERP.qyItem.IsEmpty then
        begin
          DmERP.qyItem.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyItem.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyItem.FieldByName('cdItem').AsString := DmIntegracao.qyItem.FieldByName('cdItem').AsString;
        end;

        DmERP.qyItem.FieldByName('deItem').AsString                := DmIntegracao.qyItem.FieldByName('deItem').AsString;
        DmERP.qyItem.FieldByName('flAtivo').AsString               := DmIntegracao.qyItem.FieldByName('flAtivo').AsString;
        DmERP.qyItem.FieldByName('cdItemTipo').AsInteger           := DmIntegracao.qyItem.FieldByName('cdItemTipo').AsInteger;

        if Trim(DmIntegracao.qyItem.FieldByName('cdUnidadeMedida').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdUnidadeMedida').AsString     := DmIntegracao.qyItem.FieldByName('cdUnidadeMedida').AsString;

        if (Trim(DmIntegracao.qyItem.FieldByName('cdItemGrupo').AsString) <> '') and
           (DmIntegracao.qyItem.FieldByName('cdItemGrupo').AsInteger > 0) then
          DmERP.qyItem.FieldByName('cdItemGrupo').AsInteger        := DmIntegracao.qyItem.FieldByName('cdItemGrupo').AsInteger;

        if (Trim(DmIntegracao.qyItem.FieldByName('cdItemSubGrupo').AsString) <> '') and
           (DmIntegracao.qyItem.FieldByName('cdItemSubGrupo').AsInteger > 0) then
          DmERP.qyItem.FieldByName('cdItemSubGrupo').AsInteger     := DmIntegracao.qyItem.FieldByName('cdItemSubGrupo').AsInteger;

        if (Trim(DmIntegracao.qyItem.FieldByName('cdItemFamilia').AsString) <> '') and
           (DmIntegracao.qyItem.FieldByName('cdItemFamilia').AsInteger > 0) then
          DmERP.qyItem.FieldByName('cdItemFamilia').AsInteger      := DmIntegracao.qyItem.FieldByName('cdItemFamilia').AsInteger;

        if Trim(DmIntegracao.qyItem.FieldByName('cdItemOrigem').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdItemOrigem').AsInteger       := DmIntegracao.qyItem.FieldByName('cdItemOrigem').AsInteger;

        if Trim(DmIntegracao.qyItem.FieldByName('cdClassifFiscal').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdClassifFiscal').AsInteger    := DmIntegracao.qyItem.FieldByName('cdClassifFiscal').AsInteger;

        if Trim(DmIntegracao.qyItem.FieldByName('cdEan').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdEan').AsString  := DmIntegracao.qyItem.FieldByName('cdEan').AsString;

        if Trim(DmIntegracao.qyItem.FieldByName('cdIcmsSitTrib').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdIcmsSitTrib').AsInteger      := DmIntegracao.qyItem.FieldByName('cdIcmsSitTrib').AsInteger;

        if DmIntegracao.qyItem.FieldByName('vlPercIcmsReducao').AsCurrency > 0 then
          DmERP.qyItem.FieldByName('vlPercIcmsReducao').AsCurrency := DmIntegracao.qyItem.FieldByName('vlPercIcmsReducao').AsCurrency;

        if DmIntegracao.qyItem.FieldByName('vlPercIcms').AsCurrency > 0 then
          DmERP.qyItem.FieldByName('vlPercIcms').AsCurrency        := DmIntegracao.qyItem.FieldByName('vlPercIcms').AsCurrency;

        if Trim(DmIntegracao.qyItem.FieldByName('cdIcmsSitTribCstEnt').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdIcmsSitTribCstEnt').AsInteger := DmIntegracao.qyItem.FieldByName('cdIcmsSitTribCstEnt').AsInteger;

        if Trim(DmIntegracao.qyItem.FieldByName('cdIpiTipo').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdIpiTipo').AsInteger          := DmIntegracao.qyItem.FieldByName('cdIpiTipo').AsInteger;

        if DmIntegracao.qyItem.FieldByName('vlPercIpi').AsCurrency > 0 then
          DmERP.qyItem.FieldByName('vlPercIpi').AsCurrency         := DmIntegracao.qyItem.FieldByName('vlPercIpi').AsCurrency;

        if Trim(DmIntegracao.qyItem.FieldByName('cdPisTipo').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdPisTipo').AsInteger          := DmIntegracao.qyItem.FieldByName('cdPisTipo').AsInteger;

        if Trim(DmIntegracao.qyItem.FieldByName('cdCofinsTipo').AsString) <> '' then
          DmERP.qyItem.FieldByName('cdCofinsTipo').AsInteger       := DmIntegracao.qyItem.FieldByName('cdCofinsTipo').AsInteger;

        DmERP.qyItem.FieldByName('flItemRevenda').AsString         := DmIntegracao.qyItem.FieldByName('flItemRevenda').AsString;

        if (Trim(DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsString) <> '') and
           (DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsInteger > 0) then
          DmERP.qyItem.FieldByName('cdCentroCusto').AsInteger      := DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsInteger;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyItem.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyItem.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyItem.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyItem.Post;

        mLog.Lines.Add(sAcao + ' o item ' +
                       DmIntegracao.qyItem.FieldByName('cdItem').AsString +
                       ' - ' + DmIntegracao.qyItem.FieldByName('deItem').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyItem.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' itens de ' + IntToStr(DmIntegracao.qyItem.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' itens de ' + IntToStr(DmIntegracao.qyItem.RecordCount));

  if DmIntegracao.qyItem.Active then
    DmIntegracao.qyItem.Close;
//--------------------------------------------------

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyCentroCusto.Active then
    DmERP.qyCentroCusto.Close;

  DmERP.qyCentroCusto.MacroByName('filtro').Clear;

  if DmERP.qyItemGrupo.Active then
    DmERP.qyItemGrupo.Close;

  DmERP.qyItemGrupo.MacroByName('filtro').Clear;

  if DmERP.qyItemSubGrupo.Active then
    DmERP.qyItemSubGrupo.Close;

  DmERP.qyItemSubGrupo.MacroByName('filtro').Clear;

  if DmERP.qyItem.Active then
    DmERP.qyItem.Close;

  DmERP.qyItem.MacroByName('filtro').Clear;
end;

procedure TFSincronizarDados.SincronizarItensVariaveis;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyVariavelItens.MacroByName('filtro').Clear;
    DmIntegracao.qyVariavelItens.Open();

    if not DmIntegracao.qyVariavelItens.IsEmpty then
    begin
      DmIntegracao.qyVariavelItens.First;

      while not DmIntegracao.qyVariavelItens.Eof do
      begin
        if DmERP.qyVariavelItens.Active then
          DmERP.qyVariavelItens.Close;

        DmERP.qyVariavelItens.MacroByName('filtro').Value := ' AND cdVariavelItem = ' + DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsString;

        DmERP.qyVariavelItens.ParamByName('cdVariavel').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavel').AsInteger;
        DmERP.qyVariavelItens.Open();

        if not DmERP.qyVariavelItens.IsEmpty then
        begin
          DmERP.qyVariavelItens.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyVariavelItens.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyVariavelItens.FieldByName('cdVariavel').AsInteger     := DmIntegracao.qyVariavelItens.FieldByName('cdVariavel').AsInteger;
          DmERP.qyVariavelItens.FieldByName('cdVariavelItem').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
        end;

        DmERP.qyVariavelItens.FieldByName('deValor').AsString           := DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString;
        DmERP.qyVariavelItens.FieldByName('deMascara').AsString         := DmIntegracao.qyVariavelItens.FieldByName('deMascara').AsString;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyVariavelItens.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyVariavelItens.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyVariavelItens.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyVariavelItens.Post;

        mLog.Lines.Add(sAcao + ' o item de variável ' +
                       DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsString +
                       ' - ' + DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyVariavelItens.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' itens de variáveis de ' + IntToStr(DmIntegracao.qyVariavelItens.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' itens de variáveis de ' + IntToStr(DmIntegracao.qyVariavelItens.RecordCount));

  if DmIntegracao.qyVariavelItens.Active then
    DmIntegracao.qyVariavelItens.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyVariavelItens.Active then
    DmERP.qyVariavelItens.Close;

  DmERP.qyVariavelItens.MacroByName('filtro').Clear;
end;

procedure TFSincronizarDados.SincronizarNaturezas;
var
  sAux,
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
  dtAtual    : TDateTime;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyNatureza.Open();

    if not DmIntegracao.qyNatureza.IsEmpty then
    begin
      DmIntegracao.qyNatureza.First;

      while not DmIntegracao.qyNatureza.Eof do
      begin
        if DmERP.qyNatureza.Active then
          DmERP.qyNatureza.Close;

        DmERP.qyNatureza.MacroByName('filtro').Value := ' WHERE cdNatureza = ' +
                                                        DmIntegracao.qyNatureza.FieldByName('cdNatureza').AsString;
        DmERP.qyNatureza.Open();

        if not DmERP.qyNatureza.IsEmpty then
        begin
          DmERP.qyNatureza.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyNatureza.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyNatureza.FieldByName('cdNatureza').AsInteger       := DmIntegracao.qyNatureza.FieldByName('cdNatureza').AsInteger;
        end;

        if Trim(DmIntegracao.qyNatureza.FieldByName('deNatureza').AsString) <> '' then
          DmERP.qyNatureza.FieldByName('deNatureza').AsString            := DmIntegracao.qyNatureza.FieldByName('deNatureza').AsString;

        if Trim(DmIntegracao.qyNatureza.FieldByName('deNaturezaFiscal').AsString) <> '' then
          DmERP.qyNatureza.FieldByName('deNaturezaFiscal').AsString      := DmIntegracao.qyNatureza.FieldByName('deNaturezaFiscal').AsString;

        DmERP.qyNatureza.FieldByName('flNaturezaTipo').AsString          := DmIntegracao.qyNatureza.FieldByName('flNaturezaTipo').AsString;
        DmERP.qyNatureza.FieldByName('flDentroEstado').AsString          := DmIntegracao.qyNatureza.FieldByName('flDentroEstado').AsString;
        DmERP.qyNatureza.FieldByName('flExportacao').AsString            := DmIntegracao.qyNatureza.FieldByName('flExportacao').AsString;
        DmERP.qyNatureza.FieldByName('flDrawback').AsString              := DmIntegracao.qyNatureza.FieldByName('flDrawback').AsString;
        DmERP.qyNatureza.FieldByName('flDevolucao').AsString             := DmIntegracao.qyNatureza.FieldByName('flDevolucao').AsString;
        DmERP.qyNatureza.FieldByName('flDevolucaoOutraOper').AsString    := DmIntegracao.qyNatureza.FieldByName('flDevolucaoOutraOper').AsString;
        DmERP.qyNatureza.FieldByName('flConsignacao').AsString           := DmIntegracao.qyNatureza.FieldByName('flConsignacao').AsString;
        DmERP.qyNatureza.FieldByName('flVendaFutura').AsString           := DmIntegracao.qyNatureza.FieldByName('flVendaFutura').AsString;
        DmERP.qyNatureza.FieldByName('flOperacaoTriangular').AsString    := DmIntegracao.qyNatureza.FieldByName('flOperacaoTriangular').AsString;
        DmERP.qyNatureza.FieldByName('flBonificacao').AsString           := DmIntegracao.qyNatureza.FieldByName('flBonificacao').AsString;
        DmERP.qyNatureza.FieldByName('flNaturezaServico').AsString       := DmIntegracao.qyNatureza.FieldByName('flNaturezaServico').AsString;
        DmERP.qyNatureza.FieldByName('flNaturezaTransporte').AsString    := DmIntegracao.qyNatureza.FieldByName('flNaturezaTransporte').AsString;
        DmERP.qyNatureza.FieldByName('flVendaOrdemSemValor').AsString    := DmIntegracao.qyNatureza.FieldByName('flVendaOrdemSemValor').AsString;
        DmERP.qyNatureza.FieldByName('flVendaOrgaoPublico').AsString     := DmIntegracao.qyNatureza.FieldByName('flVendaOrgaoPublico').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('cdIpiTipo').IsNull) then
          DmERP.qyNatureza.FieldByName('cdIpiTipo').AsInteger            := DmIntegracao.qyNatureza.FieldByName('cdIpiTipo').AsInteger;

        DmERP.qyNatureza.FieldByName('flIpiIncideIcms').AsString         := DmIntegracao.qyNatureza.FieldByName('flIpiIncideIcms').AsString;
        DmERP.qyNatureza.FieldByName('flIpiIncidePisCofins').AsString    := DmIntegracao.qyNatureza.FieldByName('flIpiIncidePisCofins').AsString;
        DmERP.qyNatureza.FieldByName('flIpiCred50Perc').AsString         := DmIntegracao.qyNatureza.FieldByName('flIpiCred50Perc').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('cdIcmsTipo').IsNull) then
          DmERP.qyNatureza.FieldByName('cdIcmsTipo').AsInteger           := DmIntegracao.qyNatureza.FieldByName('cdIcmsTipo').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdIcmsSitTrib').IsNull) then
          DmERP.qyNatureza.FieldByName('cdIcmsSitTrib').AsInteger        := DmIntegracao.qyNatureza.FieldByName('cdIcmsSitTrib').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdIcmsSitTribSimples').IsNull) then
          DmERP.qyNatureza.FieldByName('cdIcmsSitTribSimples').AsInteger := DmIntegracao.qyNatureza.FieldByName('cdIcmsSitTribSimples').AsInteger;

        DmERP.qyNatureza.FieldByName('flIcmsCalcPartSimples').AsString   := DmIntegracao.qyNatureza.FieldByName('flIcmsCalcPartSimples').AsString;
        DmERP.qyNatureza.FieldByName('flIcmsMsgAprovCred').AsString      := DmIntegracao.qyNatureza.FieldByName('flIcmsMsgAprovCred').AsString;
        DmERP.qyNatureza.FieldByName('flIcmsCalcSubstTrib').AsString     := DmIntegracao.qyNatureza.FieldByName('flIcmsCalcSubstTrib').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('vlIcmsPercReducaoSubst').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlIcmsPercReducaoSubst').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlIcmsPercReducaoSubst').AsFloat := DmIntegracao.qyNatureza.FieldByName('vlIcmsPercReducaoSubst').AsFloat;

        DmERP.qyNatureza.FieldByName('flIcmsReducaoTipo').AsString       := DmIntegracao.qyNatureza.FieldByName('flIcmsReducaoTipo').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('vlIcmsReducaoPerc').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlIcmsReducaoPerc').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlIcmsReducaoPerc').AsFloat      := DmIntegracao.qyNatureza.FieldByName('vlIcmsReducaoPerc').AsFloat;

        DmERP.qyNatureza.FieldByName('flIcmsReducaoCalc').AsString       := DmIntegracao.qyNatureza.FieldByName('flIcmsReducaoCalc').AsString;
        DmERP.qyNatureza.FieldByName('flIcmsCalcStUsoCon').AsString      := DmIntegracao.qyNatureza.FieldByName('flIcmsCalcStUsoCon').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('vlIcmsDesconto').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlIcmsDesconto').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlIcmsDesconto').AsFloat         := DmIntegracao.qyNatureza.FieldByName('vlIcmsDesconto').AsFloat;

        DmERP.qyNatureza.FieldByName('flIcmsDebCreLivros').AsString      := DmIntegracao.qyNatureza.FieldByName('flIcmsDebCreLivros').AsString;
        DmERP.qyNatureza.FieldByName('flMovFinanceiro').AsString         := DmIntegracao.qyNatureza.FieldByName('flMovFinanceiro').AsString;
        DmERP.qyNatureza.FieldByName('flMovFiscal').AsString             := DmIntegracao.qyNatureza.FieldByName('flMovFiscal').AsString;
        DmERP.qyNatureza.FieldByName('flFaturamento').AsString           := DmIntegracao.qyNatureza.FieldByName('flFaturamento').AsString;
        DmERP.qyNatureza.FieldByName('flMovEstoque').AsString            := DmIntegracao.qyNatureza.FieldByName('flMovEstoque').AsString;
        DmERP.qyNatureza.FieldByName('flEstoqueTerceiros').AsString      := DmIntegracao.qyNatureza.FieldByName('flEstoqueTerceiros').AsString;
        DmERP.qyNatureza.FieldByName('flEstoqueArmazenagem').AsString    := DmIntegracao.qyNatureza.FieldByName('flEstoqueArmazenagem').AsString;
        DmERP.qyNatureza.FieldByName('flEntraCalcRentab').AsString       := DmIntegracao.qyNatureza.FieldByName('flEntraCalcRentab').AsString;
        DmERP.qyNatureza.FieldByName('flAbateRentab').AsString           := DmIntegracao.qyNatureza.FieldByName('flAbateRentab').AsString;
        DmERP.qyNatureza.FieldByName('flConsideraSisDec').AsString       := DmIntegracao.qyNatureza.FieldByName('flConsideraSisDec').AsString;
        DmERP.qyNatureza.FieldByName('flMsgLeiTransp').AsString          := DmIntegracao.qyNatureza.FieldByName('flMsgLeiTransp').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('cdPisTipo').IsNull) then
          DmERP.qyNatureza.FieldByName('cdPisTipo').AsInteger            := DmIntegracao.qyNatureza.FieldByName('cdPisTipo').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdCofinsTipo').IsNull) then
          DmERP.qyNatureza.FieldByName('cdCofinsTipo').AsInteger         := DmIntegracao.qyNatureza.FieldByName('cdCofinsTipo').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdContribSocialTipo').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdContribSocialTipo').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdContribSocialTipo').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdContribSocialTipo').AsInteger  := DmIntegracao.qyNatureza.FieldByName('cdContribSocialTipo').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdImpostoRendaTipo').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdImpostoRendaTipo').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdImpostoRendaTipo').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdImpostoRendaTipo').AsInteger   := DmIntegracao.qyNatureza.FieldByName('cdImpostoRendaTipo').AsInteger;

        DmERP.qyNatureza.FieldByName('flUtilizaControleTerc').AsString   := DmIntegracao.qyNatureza.FieldByName('flUtilizaControleTerc').AsString;
        DmERP.qyNatureza.FieldByName('flGeraValorCalcBonif').AsString    := DmIntegracao.qyNatureza.FieldByName('flGeraValorCalcBonif').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('cdOperSisDeclara').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdOperSisDeclara').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdOperSisDeclara').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdOperSisDeclara').AsInteger     := DmIntegracao.qyNatureza.FieldByName('cdOperSisDeclara').AsInteger;

        DmERP.qyNatureza.FieldByName('flMovSelos').AsString              := DmIntegracao.qyNatureza.FieldByName('flMovSelos').AsString;
        DmERP.qyNatureza.FieldByName('flOperSemCredSt').AsString         := DmIntegracao.qyNatureza.FieldByName('flOperSemCredSt').AsString;
        DmERP.qyNatureza.FieldByName('flOperSemCredIpi').AsString        := DmIntegracao.qyNatureza.FieldByName('flOperSemCredIpi').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('cdPisBase').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdPisBase').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdPisBase').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdPisBase').AsInteger            := DmIntegracao.qyNatureza.FieldByName('cdPisBase').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdCofinsBase').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdCofinsBase').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdCofinsBase').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdCofinsBase').AsInteger         := DmIntegracao.qyNatureza.FieldByName('cdCofinsBase').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdSimplesBase').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdSimplesBase').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdSimplesBase').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdSimplesBase').AsInteger        := DmIntegracao.qyNatureza.FieldByName('cdSimplesBase').AsInteger;

        DmERP.qyNatureza.FieldByName('flIsencaoPisCofins').AsString      := DmIntegracao.qyNatureza.FieldByName('flIsencaoPisCofins').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('vlPercPis').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlPercPis').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlPercPis').AsFloat              := DmIntegracao.qyNatureza.FieldByName('vlPercPis').AsFloat;

        if (not DmIntegracao.qyNatureza.FieldByName('vlPercCofins').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlPercCofins').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlPercCofins').AsFloat           := DmIntegracao.qyNatureza.FieldByName('vlPercCofins').AsFloat;

        DmERP.qyNatureza.FieldByName('flRetencaoPisCofinsCsll').AsString := DmIntegracao.qyNatureza.FieldByName('flRetencaoPisCofinsCsll').AsString;
        DmERP.qyNatureza.FieldByName('flAbatePisCofinsTitNf').AsString   := DmIntegracao.qyNatureza.FieldByName('flAbatePisCofinsTitNf').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('vlPercAbatPisTitNf').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlPercAbatPisTitNf').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlPercAbatPisTitNf').AsFloat     := DmIntegracao.qyNatureza.FieldByName('vlPercAbatPisTitNf').AsFloat;

        if (not DmIntegracao.qyNatureza.FieldByName('vlPercAbatCofinsTitNf').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlPercAbatCofinsTitNf').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlPercAbatCofinsTitNf').AsFloat  := DmIntegracao.qyNatureza.FieldByName('vlPercAbatCofinsTitNf').AsFloat;

        DmERP.qyNatureza.FieldByName('flProdMonofasSn').AsString         := DmIntegracao.qyNatureza.FieldByName('flProdMonofasSn').AsString;

        if Trim(DmIntegracao.qyNatureza.FieldByName('flAbateRetencao').AsString) <> '' then
          DmERP.qyNatureza.FieldByName('flAbateRetencao').AsString       := DmIntegracao.qyNatureza.FieldByName('flAbateRetencao').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('vlPercIcms').IsNull) and
           (DmIntegracao.qyNatureza.FieldByName('vlPercIcms').AsFloat > 0) then
          DmERP.qyNatureza.FieldByName('vlPercIcms').AsFloat             := DmIntegracao.qyNatureza.FieldByName('vlPercIcms').AsFloat;

        DmERP.qyNatureza.FieldByName('flDiferencaIcms').AsString         := DmIntegracao.qyNatureza.FieldByName('flDiferencaIcms').AsString;

        if (not DmIntegracao.qyNatureza.FieldByName('cdIpiCodigo').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdIpiCodigo').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdIpiCodigo').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdIpiCodigo').AsInteger          := DmIntegracao.qyNatureza.FieldByName('cdIpiCodigo').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdIpiEnquadramento').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdIpiEnquadramento').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdIpiEnquadramento').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdIpiEnquadramento').AsInteger   := DmIntegracao.qyNatureza.FieldByName('cdIpiEnquadramento').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdPisCodigo').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdPisCodigo').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdPisCodigo').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdPisCodigo').AsInteger          := DmIntegracao.qyNatureza.FieldByName('cdPisCodigo').AsInteger;

        if (not DmIntegracao.qyNatureza.FieldByName('cdCofinsCodigo').IsNull) and
           (Trim(DmIntegracao.qyNatureza.FieldByName('cdCofinsCodigo').AsString) <> '') and
           (DmIntegracao.qyNatureza.FieldByName('cdCofinsCodigo').AsInteger >= 0) then
          DmERP.qyNatureza.FieldByName('cdCofinsCodigo').AsInteger       := DmIntegracao.qyNatureza.FieldByName('cdCofinsCodigo').AsInteger;

        dtAtual := DataHoraAtual(DmERP.fdConnERP);
        DmERP.qyNatureza.FieldByName('dtCadastro').AsDateTime       := Trunc(dtAtual);
        DmERP.qyNatureza.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dtAtual);
        DmERP.qyNatureza.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;

        DmERP.qyNatureza.Post;

        mLog.Lines.Add(sAcao + ' a natureza ' +
                       FormatFloat('00000', DmIntegracao.qyNatureza.FieldByName('cdNatureza').AsInteger) +
                       ' - ' + DmIntegracao.qyNatureza.FieldByName('deNatureza').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyNatureza.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' naturezas de ' + IntToStr(DmIntegracao.qyNatureza.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' naturezas de ' + IntToStr(DmIntegracao.qyNatureza.RecordCount));

  if DmIntegracao.qyNatureza.Active then
    DmIntegracao.qyNatureza.Close;

  if DmERP.qyNatureza.Active then
  begin
    DmERP.qyNatureza.MacroByName('filtro').Clear;
    DmERP.qyNatureza.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.FormCreate(Sender: TObject);
var
  dthrAtual : TDateTime;
begin
  btSalvar.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance, 'IMGBTFECHAR_32X32');

  dthrAtual := DataHoraAtual(DmERP.fdConnERP);
  dthrAtual := Trunc(dthrAtual);

  eddtEmissaoNfsIni.Date := StrToDateTime('01/' + FormatDateTime('mm/yyyy', dthrAtual));
  eddtEmissaoNfsFim.Date := EndOfTheMonth(eddtEmissaoNfsIni.Date);
end;

////////////////////////////////////////////////////////////////////////////////
// DW
procedure TFSincronizarDados.SincronizarDWCidades;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyCidade.Open();

    if not DmIntegracao.qyCidade.IsEmpty then
    begin
      DmIntegracao.qyCidade.First;

      while not DmIntegracao.qyCidade.Eof do
      begin
        if DmERP.qyCidadeDW.Active then
          DmERP.qyCidadeDW.Close;

        DmERP.qyCidadeDW.MacroByName('filtro').Value := ' WHERE cdCidade = ' +
                                                        DmIntegracao.qyCidade.FieldByName('cdCidade').AsString;

        DmERP.qyCidadeDW.Open();

        if not DmERP.qyCidadeDW.IsEmpty then
        begin
          DmERP.qyCidadeDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyCidadeDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyCidadeDW.FieldByName('cdCidade').AsInteger := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        end;

        DmERP.qyCidadeDW.FieldByName('cdCidade').AsInteger   := DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger;
        DmERP.qyCidadeDW.FieldByName('nmCidade').AsString    := DmIntegracao.qyCidade.FieldByName('nmCidade').AsString;
        DmERP.qyCidadeDW.FieldByName('sgEstado').AsString    := DmIntegracao.qyCidade.FieldByName('sgEstado').AsString;

        DmERP.qyCidadeDW.Post;

        mLog.Lines.Add(sAcao + ' a cidade ' +
                       FormatFloat('00000', DmIntegracao.qyCidade.FieldByName('cdCidade').AsInteger) +
                       ' - ' + DmIntegracao.qyCidade.FieldByName('nmCidade').AsString + '/' +
                       DmIntegracao.qyCidade.FieldByName('sgEstado').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyCidade.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' cidades de ' + IntToStr(DmIntegracao.qyCidade.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' cidades de ' + IntToStr(DmIntegracao.qyCidade.RecordCount));

  if DmIntegracao.qyCidade.Active then
    DmIntegracao.qyCidade.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyCidadeDW.Active then
  begin
    DmERP.qyCidadeDW.MacroByName('filtro').Clear;
    DmERP.qyCidadeDW.Close;
  end;
end;

procedure TFSincronizarDados.SincronizarDWClientes;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;

    DmIntegracao.qyCliente.MacroByName('filtro').Value := ' ORDER BY t.cdCliente';
    DmIntegracao.qyCliente.Open();

    if not DmIntegracao.qyCliente.IsEmpty then
    begin
      DmIntegracao.qyCliente.First;

      while not DmIntegracao.qyCliente.Eof do
      begin
        if DmERP.qyClienteDW.Active then
          DmERP.qyClienteDW.Close;

        DmERP.qyClienteDW.MacroByName('filtro').Value := ' WHERE cdCliente = ' +
                                                         DmIntegracao.qyCliente.FieldByName('cdCliente').AsString;
        DmERP.qyClienteDW.Open();

        if not DmERP.qyClienteDW.IsEmpty then
        begin
          DmERP.qyClienteDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyClienteDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyClienteDW.FieldByName('cdCliente').AsInteger  := DmIntegracao.qyCliente.FieldByName('cdCliente').AsInteger;
        end;

        DmERP.qyClienteDW.FieldByName('deRazaoSocial').AsString := DmIntegracao.qyCliente.FieldByName('deRazaoSocial').AsString;
        DmERP.qyClienteDW.FieldByName('nmFantasia').AsString    := DmIntegracao.qyCliente.FieldByName('nmFantasia').AsString;

        DmERP.qyClienteDW.Post;

        mLog.Lines.Add(sAcao + ' o cliente ' +
                       FormatFloat('00000', DmIntegracao.qyCliente.FieldByName('cdCliente').AsInteger) +
                       ' - ' + DmIntegracao.qyCliente.FieldByName('deRazaoSocial').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyCliente.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' clientes de ' + IntToStr(DmIntegracao.qyCliente.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' clientes de ' + IntToStr(DmIntegracao.qyCliente.RecordCount));

  DmIntegracao.qyCliente.MacroByName('filtro').Clear;

  if DmIntegracao.qyCliente.Active then
    DmIntegracao.qyCliente.Close;

  if DmERP.qyClienteDW.Active then
  begin
    DmERP.qyClienteDW.MacroByName('filtro').Clear;
    DmERP.qyClienteDW.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarDWRep;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyRepresentante.Open();

    if not DmIntegracao.qyRepresentante.IsEmpty then
    begin
      DmIntegracao.qyRepresentante.First;

      while not DmIntegracao.qyRepresentante.Eof do
      begin
        if DmERP.qyRepresentanteDW.Active then
          DmERP.qyRepresentanteDW.Close;

        DmERP.qyRepresentanteDW.MacroByName('filtro').Value := ' WHERE cdRepresentante = ' +
                                                               DmIntegracao.qyRepresentante.FieldByName('cdRepresentante').AsString;
        DmERP.qyRepresentanteDW.Open();

        if not DmERP.qyRepresentanteDW.IsEmpty then
        begin
          DmERP.qyRepresentanteDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyRepresentanteDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyRepresentanteDW.FieldByName('cdRepresentante').AsInteger := DmIntegracao.qyRepresentante.FieldByName('cdRepresentante').AsInteger;
        end;

        DmERP.qyRepresentanteDW.FieldByName('deRazaoSocial').AsString      := DmIntegracao.qyRepresentante.FieldByName('deRazaoSocial').AsString;
        DmERP.qyRepresentanteDW.FieldByName('nmFantasia').AsString         := DmIntegracao.qyRepresentante.FieldByName('nmFantasia').AsString;

        DmERP.qyRepresentanteDW.Post;

        mLog.Lines.Add(sAcao + ' o representante ' +
                       FormatFloat('00000', DmIntegracao.qyRepresentante.FieldByName('cdRepresentante').AsInteger) +
                       ' - ' + DmIntegracao.qyRepresentante.FieldByName('deRazaoSocial').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyRepresentante.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' representantes de ' + IntToStr(DmIntegracao.qyRepresentante.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' representantes de ' + IntToStr(DmIntegracao.qyRepresentante.RecordCount));

  if DmIntegracao.qyRepresentante.Active then
    DmIntegracao.qyRepresentante.Close;

  if DmERP.qyRepresentanteDW.Active then
  begin
    DmERP.qyRepresentanteDW.MacroByName('filtro').Clear;
    DmERP.qyRepresentanteDW.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarDWVariaveis;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyVariavel.Open();

    if not DmIntegracao.qyVariavel.IsEmpty then
    begin
      DmIntegracao.qyVariavel.First;

      while not DmIntegracao.qyVariavel.Eof do
      begin
        if DmERP.qyVariavelDW.Active then
          DmERP.qyVariavelDW.Close;

        DmERP.qyVariavelDW.MacroByName('filtro').Value := ' WHERE cdVariavel = ' +
                                                          DmIntegracao.qyVariavel.FieldByName('cdVariavel').AsString;
        DmERP.qyVariavelDW.Open();

        if not DmERP.qyVariavelDW.IsEmpty then
        begin
          DmERP.qyVariavelDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyVariavelDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyVariavelDW.FieldByName('cdVariavel').AsInteger := DmIntegracao.qyVariavel.FieldByName('cdVariavel').AsInteger;
        end;

        DmERP.qyVariavelDW.FieldByName('deVariavel').AsString      := DmIntegracao.qyVariavel.FieldByName('deVariavel').AsString;

        DmERP.qyVariavelDW.Post;

        mLog.Lines.Add(sAcao + ' a variável ' +
                       FormatFloat('00000', DmIntegracao.qyVariavel.FieldByName('cdVariavel').AsInteger) +
                       ' - ' + DmIntegracao.qyVariavel.FieldByName('deVariavel').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyVariavel.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' variáveis de ' + IntToStr(DmIntegracao.qyVariavel.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' variáveis de ' + IntToStr(DmIntegracao.qyVariavel.RecordCount));

  if DmIntegracao.qyVariavel.Active then
    DmIntegracao.qyVariavel.Close;

  if DmERP.qyVariavelDW.Active then
  begin
    DmERP.qyVariavelDW.MacroByName('filtro').Clear;
    DmERP.qyVariavelDW.Close;
  end;

  DmIntegracao.fdConnInteg.Connected := False;
end;

procedure TFSincronizarDados.SincronizarDWItensVariaveis;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyVariavelItens.MacroByName('filtro').Clear;
    DmIntegracao.qyVariavelItens.Open();

    if not DmIntegracao.qyVariavelItens.IsEmpty then
    begin
      DmIntegracao.qyVariavelItens.First;

      while not DmIntegracao.qyVariavelItens.Eof do
      begin
        if DmERP.qyVariavelItensDW.Active then
          DmERP.qyVariavelItensDW.Close;

        DmERP.qyVariavelItensDW.MacroByName('filtro').Value := ' AND cdVariavelItem = ' + DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsString;

        DmERP.qyVariavelItensDW.ParamByName('cdVariavel').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavel').AsInteger;
        DmERP.qyVariavelItensDW.Open();

        if not DmERP.qyVariavelItensDW.IsEmpty then
        begin
          DmERP.qyVariavelItensDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyVariavelItensDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyVariavelItensDW.FieldByName('cdVariavel').AsInteger     := DmIntegracao.qyVariavelItens.FieldByName('cdVariavel').AsInteger;
          DmERP.qyVariavelItensDW.FieldByName('cdVariavelItem').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
        end;

        DmERP.qyVariavelItensDW.FieldByName('deVariavelItem').AsString    := DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString;

        DmERP.qyVariavelItensDW.Post;

        mLog.Lines.Add(sAcao + ' o item de variável ' +
                       DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsString +
                       ' - ' + DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyVariavelItens.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' itens de variáveis de ' + IntToStr(DmIntegracao.qyVariavelItens.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' itens de variáveis de ' + IntToStr(DmIntegracao.qyVariavelItens.RecordCount));

  if DmIntegracao.qyVariavelItens.Active then
    DmIntegracao.qyVariavelItens.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyVariavelItensDW.Active then
  begin
    DmERP.qyVariavelItensDW.MacroByName('filtro').Clear;
    DmERP.qyVariavelItensDW.Close;
  end;
end;

procedure TFSincronizarDados.SincronizarDWItemGrupo;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  iTotEdit   := 0;
  iTotInsert := 0;

  try
    DmIntegracao.qyItemGrupo.MacroByName('filtro').Clear;
    DmIntegracao.qyItemGrupo.Open();

    if not DmIntegracao.qyItemGrupo.IsEmpty then
    begin
      DmIntegracao.qyItemGrupo.First;

      while not DmIntegracao.qyItemGrupo.Eof do
      begin
        if DmERP.qyItemGrupoDW.Active then
          DmERP.qyItemGrupoDW.Close;

        DmERP.qyItemGrupoDW.MacroByName('filtro').Value := ' WHERE cdItemGrupo = ' +
                                                           DmIntegracao.qyItemGrupo.FieldByName('cdItemGrupo').AsString;
        DmERP.qyItemGrupoDW.Open();

        if not DmERP.qyItemGrupoDW.IsEmpty then
        begin
          DmERP.qyItemGrupoDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyItemGrupoDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyItemGrupoDW.FieldByName('cdItemGrupo').AsString := DmIntegracao.qyItemGrupo.FieldByName('cdItemGrupo').AsString;
        end;

        DmERP.qyItemGrupoDW.FieldByName('deItemGrupo').AsString   := DmIntegracao.qyItemGrupo.FieldByName('deItemGrupo').AsString;

        DmERP.qyItemGrupoDW.Post;

        mLog.Lines.Add(sAcao + ' o grupo ' +
                       DmIntegracao.qyItemGrupo.FieldByName('cdItemGrupo').AsString +
                       ' - ' + DmIntegracao.qyItemGrupo.FieldByName('deItemGrupo').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyItemGrupo.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' subgrupos de ' + IntToStr(DmIntegracao.qyItemGrupo.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' subgrupos de ' + IntToStr(DmIntegracao.qyItemGrupo.RecordCount));

  if DmIntegracao.qyItemGrupo.Active then
    DmIntegracao.qyItemGrupo.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyItemGrupoDW.Active then
  begin
    DmERP.qyItemGrupoDW.MacroByName('filtro').Clear;
    DmERP.qyItemGrupoDW.Close;
  end;
end;

procedure TFSincronizarDados.SincronizarDWItemSubGrupo;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  iTotEdit   := 0;
  iTotInsert := 0;

  try
    DmIntegracao.qyItemSubGrupo.MacroByName('filtro').Clear;
    DmIntegracao.qyItemSubGrupo.Open();

    if not DmIntegracao.qyItemSubGrupo.IsEmpty then
    begin
      DmIntegracao.qyItemSubGrupo.First;

      while not DmIntegracao.qyItemSubGrupo.Eof do
      begin
        if DmERP.qyItemSubGrupoDW.Active then
          DmERP.qyItemSubGrupoDW.Close;

        DmERP.qyItemSubGrupoDW.MacroByName('filtro').Value := ' WHERE cdItemGrupo = ' + DmIntegracao.qyItemSubGrupo.FieldByName('cdItemGrupo').AsString +
                                                              '   AND cdItemSubGrupo = ' + DmIntegracao.qyItemSubGrupo.FieldByName('cdItemSubGrupo').AsString;
        DmERP.qyItemSubGrupoDW.Open();

        if not DmERP.qyItemSubGrupoDW.IsEmpty then
        begin
          DmERP.qyItemSubGrupoDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyItemSubGrupoDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyItemSubGrupoDW.FieldByName('cdItemGrupo').AsString      := DmIntegracao.qyItemSubGrupo.FieldByName('cdItemGrupo').AsString;
          DmERP.qyItemSubGrupoDW.FieldByName('cdItemSubGrupo').AsString   := DmIntegracao.qyItemSubGrupo.FieldByName('cdItemSubGrupo').AsString;
        end;

        DmERP.qyItemSubGrupoDW.FieldByName('deItemSubGrupo').AsString     := DmIntegracao.qyItemSubGrupo.FieldByName('deItemSubGrupo').AsString;

        DmERP.qyItemSubGrupoDW.Post;

        mLog.Lines.Add(sAcao + ' o subgrupo ' +
                       DmIntegracao.qyItemSubGrupo.FieldByName('cdItemSubGrupo').AsString +
                       ' - ' + DmIntegracao.qyItemSubGrupo.FieldByName('deItemSubGrupo').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyItemSubGrupo.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' subgrupos de ' + IntToStr(DmIntegracao.qyItemSubGrupo.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' subgrupos de ' + IntToStr(DmIntegracao.qyItemSubGrupo.RecordCount));

  if DmIntegracao.qyItemSubGrupo.Active then
    DmIntegracao.qyItemSubGrupo.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyItemSubGrupoDW.Active then
  begin
    DmERP.qyItemSubGrupoDW.MacroByName('filtro').Clear;
    DmERP.qyItemSubGrupoDW.Close;
  end;
end;

procedure TFSincronizarDados.SincronizarDWItens;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;

    DmIntegracao.qyItem.MacroByName('filtro').Clear;
    DmIntegracao.qyItem.Open();

    if not DmIntegracao.qyItem.IsEmpty then
    begin
      DmIntegracao.qyItem.First;

      while not DmIntegracao.qyItem.Eof do
      begin
        if DmERP.qyItemDW.Active then
          DmERP.qyItemDW.Close;

        DmERP.qyItemDW.MacroByName('filtro').Value := ' WHERE cdItem = ' +
                                                    QuotedStr(DmIntegracao.qyItem.FieldByName('cdItem').AsString);
        DmERP.qyItemDW.Open();

        if not DmERP.qyItemDW.IsEmpty then
        begin
          DmERP.qyItemDW.Edit;
          sAcao := 'Editado';
          Inc(iTotEdit);
        end
        else
        begin
          DmERP.qyItemDW.Insert;
          sAcao := 'Inserido';
          Inc(iTotInsert);
          DmERP.qyItemDW.FieldByName('cdItem').AsString := DmIntegracao.qyItem.FieldByName('cdItem').AsString;
        end;

        DmERP.qyItemDW.FieldByName('deItem').AsString            := DmIntegracao.qyItem.FieldByName('deItem').AsString;
        DmERP.qyItemDW.FieldByName('cdItemComercial').AsString   := DmIntegracao.qyItem.FieldByName('cdItemComercial').AsString;

        if (Trim(DmIntegracao.qyItem.FieldByName('cdItemGrupo').AsString) <> '') and
           (DmIntegracao.qyItem.FieldByName('cdItemGrupo').AsInteger > 0) then
          DmERP.qyItemDW.FieldByName('cdItemGrupo').AsInteger    := DmIntegracao.qyItem.FieldByName('cdItemGrupo').AsInteger;

        if (Trim(DmIntegracao.qyItem.FieldByName('cdItemSubGrupo').AsString) <> '') and
           (DmIntegracao.qyItem.FieldByName('cdItemSubGrupo').AsInteger > 0) then
          DmERP.qyItemDW.FieldByName('cdItemSubGrupo').AsInteger := DmIntegracao.qyItem.FieldByName('cdItemSubGrupo').AsInteger;

        DmERP.qyItemDW.FieldByName('flItemRevenda').AsString     := DmIntegracao.qyItem.FieldByName('flItemRevenda').AsString;

        DmERP.qyItemDW.Post;

        mLog.Lines.Add(sAcao + ' o item ' +
                       DmIntegracao.qyItem.FieldByName('cdItem').AsString +
                       ' - ' + DmIntegracao.qyItem.FieldByName('deItem').AsString
                      );
        Application.ProcessMessages;

        DmIntegracao.qyItem.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' itens de ' + IntToStr(DmIntegracao.qyItem.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' itens de ' + IntToStr(DmIntegracao.qyItem.RecordCount));

  if DmIntegracao.qyItem.Active then
    DmIntegracao.qyItem.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyItemDW.Active then
  begin
    DmERP.qyItemDW.MacroByName('filtro').Clear;
    DmERP.qyItemDW.Close;
  end;
end;

procedure TFSincronizarDados.SincronizarDWItemCombinacoes;
var
  sAcao      : String;
  iTotEdit,
  iTotInsert : Integer;
begin
  try
    iTotEdit   := 0;
    iTotInsert := 0;
    DmIntegracao.fdConnInteg.Connected := True;

    DmIntegracao.qyItemCombinacaoVenda.MacroByName('filtro').Clear;
    DmIntegracao.qyItemCombinacaoVenda.Open();

    if not DmIntegracao.qyItemCombinacaoVenda.IsEmpty then
    begin
      DmIntegracao.qyItemCombinacaoVenda.First;

      while not DmIntegracao.qyItemCombinacaoVenda.Eof do
      begin
        if DmERP.qyItemCombinacaoVendaDW.Active then
          DmERP.qyItemCombinacaoVendaDW.Close;

        DmERP.qyItemCombinacaoVendaDW.MacroByName('filtro').Value := ' WHERE cdItem = ' + QuotedStr(DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdItem').AsString) +
                                                                     '   AND cdVariavel = ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavel').AsString +
                                                                     '   AND cdVariavelItem = ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavelItem').AsString;
        DmERP.qyItemCombinacaoVendaDW.Open();

        try

          if not DmERP.qyItemCombinacaoVendaDW.IsEmpty then
          begin
            DmERP.qyItemCombinacaoVendaDW.Edit;
            sAcao := 'Editado';
            Inc(iTotEdit);
          end
          else
          begin
            DmERP.qyItemCombinacaoVendaDW.Insert;
            sAcao := 'Inserido';
            Inc(iTotInsert);
            DmERP.qyItemCombinacaoVendaDW.FieldByName('cdItem').AsString := DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdItem').AsString;
            DmERP.qyItemCombinacaoVendaDW.FieldByName('cdVariavel').AsString := DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavel').AsString;
            DmERP.qyItemCombinacaoVendaDW.FieldByName('cdVariavelItem').AsString := DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavelItem').AsString;
          end;

          DmERP.qyItemCombinacaoVendaDW.FieldByName('deVariavelItem').AsString   := DmIntegracao.qyItemCombinacaoVenda.FieldByName('deVariavelItem').AsString;

          DmERP.qyItemCombinacaoVendaDW.Post;

          mLog.Lines.Add(sAcao + ' a combinação ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavelItem').AsString +
                         ' da variável ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavel').AsString +
                         ' para o item ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdItem').AsString
                        );
        except
        on e : exception do
          mLog.Lines.Add('Erro na combinação ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavelItem').AsString +
                         ' da variável ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdVariavel').AsString +
                         ' para o item ' + DmIntegracao.qyItemCombinacaoVenda.FieldByName('cdItem').AsString
                        );
        end;

        Application.ProcessMessages;

        DmIntegracao.qyItemCombinacaoVenda.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' combinações de ' + IntToStr(DmIntegracao.qyItemCombinacaoVenda.RecordCount));

  if iTotEdit > 0 then
    mLog.Lines.Add('Editado ' + IntToStr(iTotEdit) + ' combinações de ' + IntToStr(DmIntegracao.qyItemCombinacaoVenda.RecordCount));

  if DmIntegracao.qyItemCombinacaoVenda.Active then
    DmIntegracao.qyItemCombinacaoVenda.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyItemCombinacaoVendaDW.Active then
  begin
    DmERP.qyItemCombinacaoVendaDW.MacroByName('filtro').Clear;
    DmERP.qyItemCombinacaoVendaDW.Close;
  end;
end;

procedure TFSincronizarDados.SincronizarDWTempo;
var
  iTotInsert : Integer;
  dtIni      : TDateTime;
  wDia, wMes, wAno : Word;
begin
  try
    iTotInsert := 0;
    dtIni      := eddtEmissaoNfsIni.Date;
    dtIni      := Trunc(dtIni);

    while dtIni <= eddtEmissaoNfsFim.Date do
    begin
      if DmERP.qyTempoDW.Active then
        DmERP.qyTempoDW.Close;

      DmERP.qyTempoDW.MacroByName('filtro').Value := ' WHERE dtRegistro = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtIni));
      DmERP.qyTempoDW.Open();

      if DmERP.qyTempoDW.IsEmpty then
      begin
        Inc(iTotInsert);

        DecodeDate(dtIni, wAno, wMes, wDia);

        DmERP.qyTempoDW.Insert;

        DmERP.qyTempoDW.FieldByName('dtRegistro').AsDateTime := dtIni;
        DmERP.qyTempoDW.FieldByName('dia').AsInteger         := wDia;
        DmERP.qyTempoDW.FieldByName('mes').AsInteger         := wMes;
        DmERP.qyTempoDW.FieldByName('ano').AsInteger         := wAno;

        DmERP.qyTempoDW.Post;

        mLog.Lines.Add('Inserido o dia ' + FormatDateTime('dd/mm/yyyy', dtIni));
        Application.ProcessMessages;
      end;

      dtIni := IncDay(dtIni);
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if iTotInsert > 0 then
    mLog.Lines.Add('Inserido ' + IntToStr(iTotInsert) + ' dias.');

  if DmERP.qyTempoDW.Active then
  begin
    DmERP.qyTempoDW.MacroByName('filtro').Clear;
    DmERP.qyTempoDW.Close;
  end;
end;

procedure TFSincronizarDados.SincronizarDWVendas;
begin
  try
    DmIntegracao.fdConnInteg.Connected := True;

    DmIntegracao.qyVendasDW.ParamByName('dtIni').AsDateTime := eddtEmissaoNfsIni.Date;
    DmIntegracao.qyVendasDW.ParamByName('dtFim').AsDateTime := eddtEmissaoNfsFim.Date;
    DmIntegracao.qyVendasDW.Open();

    if not DmIntegracao.qyVendasDW.IsEmpty then
    begin
      DmIntegracao.qyVendasDW.First;

      while not DmIntegracao.qyVendasDW.Eof do
      begin
        try
          if DmERP.qyVendasDW.Active then
            DmERP.qyVendasDW.Close;

          DmERP.qyVendasDW.MacroByName('filtro').Clear;
          DmERP.qyVendasDW.MacroByName('filtro').Value := ' WHERE nuPedido = ' + DmIntegracao.qyVendasDW.FieldByName('nuPedido').AsString +
                                                          '   AND cdItem = ' + QuotedStr(DmIntegracao.qyVendasDW.FieldByName('cdItem').AsString);
          DmERP.qyVendasDW.Open();

          if DmERP.qyVendasDW.IsEmpty then
          begin
            DmERP.qyVendasDW.Insert;

            DmERP.qyVendasDW.FieldByName('cdCliente').AsInteger       := DmIntegracao.qyVendasDW.FieldByName('cdCliente').AsInteger;
            DmERP.qyVendasDW.FieldByName('cdRepresentante').AsInteger := DmIntegracao.qyVendasDW.FieldByName('cdRepresentante').AsInteger;
            DmERP.qyVendasDW.FieldByName('cdCidade').AsInteger        := DmIntegracao.qyVendasDW.FieldByName('cdCidade').AsInteger;

            if DmERP.qyTempoDW.Active then
              DmERP.qyTempoDW.Close;

            DmERP.qyTempoDW.MacroByName('filtro').Value := ' WHERE dtRegistro = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', DmIntegracao.qyVendasDW.FieldByName('dtEmissaoNfs').AsDateTime));
            DmERP.qyTempoDW.Open();

            if not DmERP.qyTempoDW.IsEmpty then
              DmERP.qyVendasDW.FieldByName('cdTempo').AsInteger       := DmERP.qyTempoDW.FieldByName('cdTempo').AsInteger;

            DmERP.qyVendasDW.FieldByName('nuPedido').AsInteger        := DmIntegracao.qyVendasDW.FieldByName('nuPedido').AsInteger;
            DmERP.qyVendasDW.FieldByName('tpPedido').AsString         := DmIntegracao.qyVendasDW.FieldByName('tpPedido').AsString;
            DmERP.qyVendasDW.FieldByName('cdItem').AsString           := DmIntegracao.qyVendasDW.FieldByName('cdItem').AsString;
            DmERP.qyVendasDW.FieldByName('nuQtde').AsFloat            := DmIntegracao.qyVendasDW.FieldByName('nuQtdItem').AsFloat;
            DmERP.qyVendasDW.FieldByName('vlBrutoItem').AsFloat       := DmIntegracao.qyVendasDW.FieldByName('vlBrutoItem').AsFloat;
            DmERP.qyVendasDW.FieldByName('vlFaturadoItem').AsFloat    := DmIntegracao.qyVendasDW.FieldByName('vlFaturadoItem').AsFloat;

            DmERP.qyVendasDW.Post;

            mLog.Lines.Add('Inserido o item ' + DmIntegracao.qyVendasDW.FieldByName('cdItem').AsString +
                           ' do pedido ' + DmIntegracao.qyVendasDW.FieldByName('nuPedido').AsString +
                           ' para o cliente ' + DmIntegracao.qyVendasDW.FieldByName('cdCliente').AsString +
                           ', representante ' + DmIntegracao.qyVendasDW.FieldByName('cdRepresentante').AsString +
                           ' na data de faturamento ' + FormatDateTime('dd/mm/yyyy', DmIntegracao.qyVendasDW.FieldByName('dtEmissaoNfs').AsDateTime)
                          );
          end;
        except
        on e : exception do
          mLog.Lines.Add('Erro no item ' + DmIntegracao.qyVendasDW.FieldByName('cdItem').AsString +
                         ' do pedido ' + DmIntegracao.qyVendasDW.FieldByName('nuPedido').AsString +
                         ' para o cliente ' + DmIntegracao.qyVendasDW.FieldByName('cdCliente').AsString +
                         ', representante ' + DmIntegracao.qyVendasDW.FieldByName('cdRepresentante').AsString +
                         ' na data de faturamento ' + FormatDateTime('dd/mm/yyyy', DmIntegracao.qyVendasDW.FieldByName('dtEmissaoNfs').AsDateTime)
                        );
        end;

        Application.ProcessMessages;

        DmIntegracao.qyVendasDW.Next;
      end;
    end;
  except
    on E: EFDDBEngineException do
    begin
      Erro(E.message);
    end;
  end;

  if DmIntegracao.qyVendasDW.Active then
    DmIntegracao.qyVendasDW.Close;

  DmIntegracao.fdConnInteg.Connected := False;

  if DmERP.qyVendasDW.Active then
  begin
    DmERP.qyVendasDW.MacroByName('filtro').Clear;
    DmERP.qyVendasDW.Close;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

initialization
  RegisterClass(TFSincronizarDados);

finalization
  UnRegisterClass(TFSincronizarDados);

end.
