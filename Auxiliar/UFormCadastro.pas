unit UFormCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client,
  Data.DB, Vcl.Buttons, UBarraBotoes, Vcl.DBCtrls, UDBCampoCodigo;

type
  TFFormCadastro = class(TForm)
    sbDados: TScrollBox;
    FrBarraBotoes: TFBarraBotoes;
    procedure FrBarraBotoesbtSalvarClick(Sender: TObject);
    procedure FrBarraBotoesbtExluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FrBarraBotoesbtNovoClick(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
    procedure FrBarraBotoesbtAlterarClick(Sender: TObject);
    procedure FrBarraBotoesbtProximoClick(Sender: TObject);
    procedure FrBarraBotoesbtFecharClick(Sender: TObject);
  private
    FiPosQuery : Integer;

    procedure PreencheCamposDinamicos;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
  public
    FPodeCadastrar,
    FPodeAlterar,
    FPodeExcluir   : Boolean;

    procedure GravarRegistro; virtual; abstract;
    procedure ExcluirRegistro; virtual; abstract;
    procedure PosicionaRegistro;
  end;

var
  FFormCadastro: TFFormCadastro;

implementation

uses
  UTelaInicial, uDmERP, uFuncoes;

{$R *.dfm}
{$R Icones.res}

procedure TFFormCadastro.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
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

procedure TFFormCadastro.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  Application.OnMessage := MudarComEnter;

  FrBarraBotoes.btAnterior.Glyph.LoadFromResourceName(HInstance, 'IMGBTANTERIOR_32X32');
  FrBarraBotoes.btProximo.Glyph.LoadFromResourceName(HInstance,  'IMGBTPROXIMO_32X32');
  FrBarraBotoes.btNovo.Glyph.LoadFromResourceName(HInstance,     'IMGBTNOVO_32X32');
  FrBarraBotoes.btAlterar.Glyph.LoadFromResourceName(HInstance,  'IMGBTALTERAR_32X32');
  FrBarraBotoes.btSalvar.Glyph.LoadFromResourceName(HInstance,   'IMGBTSALVAR_32X32');
  FrBarraBotoes.btCancelar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCANCELAR_32X32');
  FrBarraBotoes.btExluir.Glyph.LoadFromResourceName(HInstance,   'IMGBTEXCLUIR_32X32');
  FrBarraBotoes.btFechar.Glyph.LoadFromResourceName(HInstance,   'IMGBTFECHAR_32X32');
  FrBarraBotoes.btImprimir.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');
 {
  for i := 0 to DmERP.ComponentCount - 1 do
  begin
    if (DmERP.Components[i].ClassName = 'TFDQuery') and
       (DmERP.Components[i].Name = FrBarraBotoes.dsDados.DataSet.Name) then
    begin
      (DmERP.Components[i] as TFDQuery).MacroByName('filtro').Clear;

      if (Trim(FTelaInicial.FNomeCampoChave) <> '') and (Trim(FTelaInicial.FValorFiltroCampoChave) <> '') then
        (DmERP.Components[i] as TFDQuery).MacroByName('filtro').Value := ' WHERE ' +
                                                                         Trim(FTelaInicial.FNomeCampoChave) + ' = ' +
                                                                         Trim(FTelaInicial.FValorFiltroCampoChave);


      (DmERP.Components[i] as TFDQuery).Open();
 //     (DmERP.Components[i] as TFDQuery).FetchNext;
      FiPosQuery := i;
      Break;
    end;
  end;
 }

  PosicionaRegistro;

  FTelaInicial.FNomeCampoChave        := '';
  FTelaInicial.FValorFiltroCampoChave := '';

  FrBarraBotoes.HabilitaDesabilitaBotoes;

  if DmERP.qyPermissaoUsuario.Active then
    DmERP.qyPermissaoUsuario.Close;

  DmERP.qyPermissaoUsuario.MacroByName('filtro').Clear;
  DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := FTelaInicial.FcdUsuario;
  DmERP.qyPermissaoUsuario.Open();

  DmERP.qyPermissaoUsuario.First;

  if (DmERP.qyPermissaoUsuario.Locate('cdUsuario;nmForm;flAtivo',
                                      VarArrayOf(
                                                 [
                                                  FTelaInicial.FcdUsuario,
                                                  Copy(Self.ClassName, 2, Length(Self.ClassName)-1),
                                                  'S'
                                                 ]
                                                ),
                                           []
                                     )
     ) then
  begin
    FPodeCadastrar := (DmERP.qyPermissaoUsuario.FieldByName('flCadastrar').AsString = 'S');
    FPodeAlterar   := (DmERP.qyPermissaoUsuario.FieldByName('flAlterar').AsString = 'S');
    FPodeExcluir   := (DmERP.qyPermissaoUsuario.FieldByName('flExcluir').AsString = 'S');

    if not FPodeCadastrar then
      FrBarraBotoes.btNovo.Enabled := False;

    if not FPodeAlterar then
      FrBarraBotoes.btAlterar.Enabled := False;

    if not FPodeExcluir then
      FrBarraBotoes.btExluir.Enabled := False;
  end;

  PreencheCamposDinamicos;
end;

procedure TFFormCadastro.PreencheCamposDinamicos;
var
  i : Integer;
begin
  if (FPodeCadastrar) and (FTelaInicial.FCamposValoresNovoReg.Count > 0) then
  begin
    FrBarraBotoes.dsDados.DataSet.Insert;

    for i := 0 to FTelaInicial.FCamposValoresNovoReg.Count - 1 do
    begin
      if Assigned(FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i])) then
      begin
        case FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i]).DataType of
          ftInteger : FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i]).AsInteger  := StrToIntDef(FTelaInicial.FCamposValoresNovoReg.Values[FTelaInicial.FCamposValoresNovoReg.Names[i]], 0);
          ftFloat   : FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i]).AsFloat    := StrToFloatDef(FTelaInicial.FCamposValoresNovoReg.Values[FTelaInicial.FCamposValoresNovoReg.Names[i]], 0);
          ftCurrency: FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i]).AsCurrency := StrToCurrDef(FTelaInicial.FCamposValoresNovoReg.Values[FTelaInicial.FCamposValoresNovoReg.Names[i]], 0);
          ftDate,
          ftDateTime: FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i]).AsDateTime := StrToDateTimeDef(FTelaInicial.FCamposValoresNovoReg.Values[FTelaInicial.FCamposValoresNovoReg.Names[i]], 0);
          ftString,
          ftWideString: FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i]).AsString := FTelaInicial.FCamposValoresNovoReg.Values[FTelaInicial.FCamposValoresNovoReg.Names[i]];
          else
            FrBarraBotoes.dsDados.DataSet.FieldByName(FTelaInicial.FCamposValoresNovoReg.Names[i]).Value := FTelaInicial.FCamposValoresNovoReg.Values[FTelaInicial.FCamposValoresNovoReg.Names[i]];
        end;
      end;
    end;
  end;
end;

procedure TFFormCadastro.PosicionaRegistro;
begin
  if not FrBarraBotoes.dsDados.DataSet.Active then
    FrBarraBotoes.dsDados.DataSet.Open;

  if (Trim(FTelaInicial.FNomeCampoChave) <> '') and (Trim(FTelaInicial.FValorFiltroCampoChave) <> '') then
  begin
    FrBarraBotoes.dsDados.DataSet.First;
    FrBarraBotoes.dsDados.DataSet.Locate(FTelaInicial.FNomeCampoChave, Trim(FTelaInicial.FValorFiltroCampoChave), []);
  end;
end;

procedure TFFormCadastro.FrBarraBotoesbtAlterarClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i].ClassName = 'TDBCampoCodigo') then
    begin
      if (Self.Components[i] as TDBCampoCodigo).ERPCampoCodigoPK then
      begin
        (Self.Components[i] as TDBCampoCodigo).ERPEdCampoChaveDBEnabled := False;
        (Self.Components[i] as TDBCampoCodigo).ERPBtProcurarEnabled     := False;
        Break;
      end;
    end;
  end;

  FrBarraBotoes.btAlterarClick(Sender);
end;

procedure TFFormCadastro.FrBarraBotoesbtExluirClick(Sender: TObject);
begin
  ExcluirRegistro;
end;

procedure TFFormCadastro.FrBarraBotoesbtFecharClick(Sender: TObject);
begin
  FTelaInicial.FCamposValoresNovoReg.Clear;
  FrBarraBotoes.btFecharClick(Sender);
end;

procedure TFFormCadastro.FrBarraBotoesbtNovoClick(Sender: TObject);
var
  i : Integer;
begin
  FrBarraBotoes.btNovoClick(Sender);

  PreencheCamposDinamicos;

  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i].ClassName = 'TDBCampoCodigo') then
    begin
      if (Self.Components[i] as TDBCampoCodigo).ERPCampoCodigoPK then
      begin
        (Self.Components[i] as TDBCampoCodigo).ERPEdCampoChaveSetFocus;
        Break;
      end;
    end;
  end;
end;

procedure TFFormCadastro.FrBarraBotoesbtProximoClick(Sender: TObject);
begin
//  if (DmERP.Components[FiPosQuery] as TFDQuery).Eof then
//    (DmERP.Components[FiPosQuery] as TFDQuery).FetchNext;

  FrBarraBotoes.btProximoClick(Sender);
end;

procedure TFFormCadastro.FrBarraBotoesbtSalvarClick(Sender: TObject);
begin
  GravarRegistro;
end;

procedure TFFormCadastro.FrBarraBotoesdsDadosStateChange(Sender: TObject);
var
  i : Integer;
begin
  FrBarraBotoes.dsDadosStateChange(Sender);

  if FrBarraBotoes.dsDados.State = dsBrowse then
  begin
    for i := 0 to Self.ComponentCount - 1 do
    begin
      if (Self.Components[i].ClassName = 'TDBCampoCodigo') then
      begin
        if (Self.Components[i] as TDBCampoCodigo).ERPCampoCodigoPK then
        begin
          (Self.Components[i] as TDBCampoCodigo).ERPEdCampoChaveDBEnabled := True;
          (Self.Components[i] as TDBCampoCodigo).ERPBtProcurarEnabled     := True;
          Break;
        end;
      end;
    end;
  end;
end;

end.
