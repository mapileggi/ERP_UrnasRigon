unit UItemVariavelVinculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet, frxExportPDF;

type
  TFItemVariavelVinculo = class(TForm)
    pnBotoes: TPanel;
    sbDados: TScrollBox;
    lbVariavelItens: TLabel;
    lbcdItem: TLabel;
    grDados: TDBGrid;
    edcdItem: TDBCampoCodigo;
    btSalvar: TBitBtn;
    btFechar: TBitBtn;
    dsDados: TDataSource;
    btExluir: TBitBtn;
    btLiberarBloquear: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure edcdItemERPOnEdCampoChaveExit(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grDadosEditButtonClick(Sender: TObject);
    procedure btExluirClick(Sender: TObject);
    procedure btLiberarBloquearClick(Sender: TObject);
  private    
    procedure SelecionaValorCodigo(const sDescLabel,
                                         sCampoChave,
                                         sCampoDescricao,
                                         sCamposFiltro,
                                         sCamposFiltroTitulo,
                                         sSqlPesq             : String;
                                   const dtDataType           : TFieldType;
                                   const ccCharCase           : TEditCharCase;
                                     var sValorCodigo,
                                         sValorDescricao      : String
                                  );
  public
    { Public declarations }
  end;

var
  FFItemVariavelVinculo: TFItemVariavelVinculo;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes, UCampoCodigoGrid, UItemVariavelItensBloq;

{$R *.dfm}

procedure TFItemVariavelVinculo.SelecionaValorCodigo(const sDescLabel,
                                                           sCampoChave,
                                                           sCampoDescricao,
                                                           sCamposFiltro,
                                                           sCamposFiltroTitulo,
                                                           sSqlPesq             : String;
                                                     const dtDataType           : TFieldType;
                                                     const ccCharCase           : TEditCharCase;
                                                       var sValorCodigo,
                                                           sValorDescricao      : String
                                                    );
begin
  if (DmERP.qyItemVinculoVariavel.Active) and (DmERP.qyItemVinculoVariavel.State in dsEditModes) then
  begin
    FCampoCodigoGrid := TFCampoCodigoGrid.Create(Application);

    try
      FCampoCodigoGrid.lbcdCampoCodigo.Caption                         := sDescLabel;
      FCampoCodigoGrid.edcdCampoCodigo.ERPCampoChave                   := sCampoChave;
      FCampoCodigoGrid.edcdCampoCodigo.ERPCampoDescricao               := sCampoDescricao;
      FCampoCodigoGrid.edcdCampoCodigo.ERPSqlPesquisa.Clear;
      FCampoCodigoGrid.edcdCampoCodigo.ERPSqlPesquisa.Add(sSqlPesq);
      FCampoCodigoGrid.edcdCampoCodigo.ERPCampoChaveDataType           := dtDataType;
      FCampoCodigoGrid.edcdCampoCodigo.ERPCharCase                     := ccCharCase;
      FCampoCodigoGrid.edcdCampoCodigo.ERPCamposFiltro.CommaText       := sCamposFiltro;
      FCampoCodigoGrid.edcdCampoCodigo.ERPCamposFiltroTitulo.CommaText := sCamposFiltroTitulo;

      if Trim(sValorCodigo) <> '' then
        FCampoCodigoGrid.edcdCampoCodigo.ERPEdCampoChaveText           := sValorCodigo;
        
      FCampoCodigoGrid.ShowModal;

      sValorCodigo    := FCampoCodigoGrid.edcdCampoCodigo.ERPEdCampoChaveText;
      sValorDescricao := FCampoCodigoGrid.edcdCampoCodigo.ERPLbDescricaoCaption;
    finally
      FreeAndNil(FCampoCodigoGrid);
    end;
  end;
end;

procedure TFItemVariavelVinculo.btExluirClick(Sender: TObject);
begin
  DmERP.ExcluirItemVinculoVariavel;
end;

procedure TFItemVariavelVinculo.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  dsDados.DataSet.Close;

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

procedure TFItemVariavelVinculo.btLiberarBloquearClick(Sender: TObject);
begin
  if not edcdItem.ERPValorValido then
    Aviso('Informe o item antes.')
  else if (DmERP.qyItemVinculoVariavel.IsEmpty) or
          (DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').IsNull) then
    Aviso('Insira uma variável antes de liberar/bloquear os valores.')
  else if DmERP.qyItemVinculoVariavel.UpdatesPending then
    Aviso('Salve a variável inserida antes de liberar/bloquear os valores.')
  else
  begin
    if DmERP.qyItemVarItensLib.Active then
      DmERP.qyItemVarItensLib.Close;

    DmERP.qyItemVarItensLib.ParamByName('cdItem').AsString      := edcdItem.ERPEdCampoChaveText;
    DmERP.qyItemVarItensLib.ParamByName('cdVariavel').AsInteger := DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').AsInteger;
    DmERP.qyItemVarItensLib.Open();

    if DmERP.qyItemVariavelItensBloq.Active then
      DmERP.qyItemVariavelItensBloq.Close;

    DmERP.qyItemVariavelItensBloq.MacroByName('filtro').Value := ' WHERE cdItem = ' + QuotedStr(edcdItem.ERPEdCampoChaveText) +
                                                                 '   AND cdVariavel = ' + DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').AsString;
    DmERP.qyItemVariavelItensBloq.Open();

    FItemVariavelItensBloq := TFItemVariavelItensBloq.Create(Application);

    try
      FItemVariavelItensBloq.FsItem := edcdItem.ERPEdCampoChaveText;
      FItemVariavelItensBloq.ShowModal;
    finally
      FreeAndNil(FItemVariavelItensBloq);
    end;
  end;
end;

procedure TFItemVariavelVinculo.btSalvarClick(Sender: TObject);
begin
  DmERP.GravarItemVinculoVariavel;
end;

procedure TFItemVariavelVinculo.edcdItemERPOnEdCampoChaveExit(Sender: TObject);
begin
  if edcdItem.ERPValorValido then
  begin
    if DmERP.qyItemVinculoVariavel.Active then
      DmERP.qyItemVinculoVariavel.Close;

    DmERP.qyItemVinculoVariavel.MacroByName('filtro').Value := ' WHERE cdItem = ' + QuotedStr(edcdItem.ERPEdCampoChaveText);
    DmERP.qyItemVinculoVariavel.Open();

    if DmERP.qyItemVinculoVariavel.IsEmpty then
    begin
      DmERP.qyItemVinculoVariavel.Insert;

      DmERP.qyItemVinculoVariavel.FieldByName('cdItem').AsString := edcdItem.ERPEdCampoChaveText;

      if (grDados.Visible) and (grDados.Enabled) and (grDados.CanFocus) then
        grDados.SetFocus;
    end;
  end
  else if Trim(edcdItem.ERPEdCampoChaveText) <> '' then
    edcdItem.ERPEdCampoChaveSetFocus;
end;

procedure TFItemVariavelVinculo.FormCreate(Sender: TObject);
begin
  btSalvar.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_32X32');
  btExluir.Glyph.LoadFromResourceName(HInstance, 'IMGBTEXCLUIR_32X32');
  btLiberarBloquear.Glyph.LoadFromResourceName(HInstance, 'IMGBTLIBBLOQ_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance, 'IMGBTFECHAR_32X32');
end;

procedure TFItemVariavelVinculo.FormShow(Sender: TObject);
begin
  edcdItem.ERPEdCampoChaveSetFocus;
end;

procedure TFItemVariavelVinculo.grDadosEditButtonClick(Sender: TObject);
var
  sValorCodigo,
  sValorDescricao : String;
begin
  sValorCodigo    := '';
  sValorDescricao := '';

  if SameText(grDados.SelectedField.FieldName , 'cdVariavel') then
  begin
    if not (DmERP.qyItemVinculoVariavel.State in dsEditModes) then
      DmERP.qyItemVinculoVariavel.Edit;
  
    DmERP.qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').Clear;

    if not DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').IsNull then
      sValorCodigo := DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').AsString;

    SelecionaValorCodigo('Variável:',
                         'cdVariavel',
                         'deVariavel',
                         'cdVariavel,deVariavel',
                         'Código,Descrição',                         
                         'SELECT t.* ' +
                         '  FROM ( ' +
                         '        SELECT cdVariavel, ' +
                         '               deVariavel ' +
                         '          FROM erp.variavel ' +
                         '       ) t ' +
                         ' &filtro',
                         ftInteger,
                         ecNormal,
                         sValorCodigo,
                         sValorDescricao
                        );

    if Trim(sValorCodigo) <> '' then
    begin
      DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').AsString := sValorCodigo;
      DmERP.qyItemVinculoVariavel.FieldByName('deVariavel').AsString := sValorDescricao;
    end;
  end
  else if (SameText(grDados.SelectedField.FieldName, 'cdVariavelItemPadrao')) then
  begin
    if DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').IsNull then
      Aviso('Informe a variável primeiro.')
    else
    begin
      if not (DmERP.qyItemVinculoVariavel.State in dsEditModes) then
        DmERP.qyItemVinculoVariavel.Edit;

      if not DmERP.qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').IsNull then
        sValorCodigo := DmERP.qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').AsString;        
          
      SelecionaValorCodigo('Item Var. Padrão:',
                           'cdVariavelItemPadrao',
                           'deVariavelItemPadrao',
                           'cdVariavelItemPadrao,deVariavelItemPadrao',
                           'Código,Descrição',                           
                           'SELECT t.* ' +
                           '  FROM ( ' +
                           '        SELECT cdVariavelItem AS cdVariavelItemPadrao, ' +
                           '               deValor        AS deVariavelItemPadrao ' +
                           '          FROM erp.variavelItens ' +
                           '         WHERE cdVariavel = ' + DmERP.qyItemVinculoVariavel.FieldByName('cdVariavel').AsString +
                           '       ) t ' +
                           ' &filtro',
                           ftInteger,
                           ecNormal,
                           sValorCodigo,
                           sValorDescricao
                          );

      if Trim(sValorCodigo) <> '' then
      begin
        DmERP.qyItemVinculoVariavel.FieldByName('cdVariavelItemPadrao').AsString := sValorCodigo;
        DmERP.qyItemVinculoVariavel.FieldByName('deVariavelItemPadrao').AsString := sValorDescricao;
      end;
    end;
  end;   
end;

initialization
  RegisterClass(TFItemVariavelVinculo);

finalization
  UnRegisterClass(TFItemVariavelVinculo);

end.
