unit UIntIndMaterialEstoqueConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, VirtualTable, Vcl.Grids, Vcl.ComCtrls,
  Vcl.DBGrids, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.StdCtrls, Vcl.Buttons;

type
  TFIntIndMaterialEstoqueConsulta = class(TForm)
    dsMaterialEstoque: TDataSource;
    pnOpcoes: TPanel;
    pnDados: TPanel;
    grDados: TDBGrid;
    vtMaterialEstoque: TVirtualTable;
    lbcdMaterial: TLabel;
    edcdMaterial: TDBCampoCodigo;
    vtMaterialEstoquecdMaterial: TStringField;
    vtMaterialEstoquedeMaterial: TStringField;
    btLocalizar: TBitBtn;
    btFechar: TBitBtn;
    lbdeMaterial: TLabel;
    eddeMaterial: TEdit;
    vtMaterialEstoquecdUnidadeMedida: TStringField;
    vtMaterialEstoquenuQtdeEst: TFloatField;
    vtMaterialEstoquenuQtdeSolic: TFloatField;
    vtMaterialEstoquecdCentroCusto: TIntegerField;
    vtMaterialEstoquedeCentroCusto: TStringField;
    lbcdCentroCusto: TLabel;
    edcdCentroCusto: TDBCampoCodigo;
    btFiltrar: TBitBtn;
    grMateriaisEsc: TDBGrid;
    lbMateriaisEsc: TLabel;
    vtMaterialEsc: TVirtualTable;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    IntegerField1: TIntegerField;
    StringField4: TStringField;
    dsMaterialEsc: TDataSource;
    vtMaterialEscnuQtdeEst: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btFiltrarClick(Sender: TObject);
    procedure vtMaterialEstoquenuQtdeSolicValidate(Sender: TField);
  private
    FbClicouFiltrar : Boolean;

    procedure GravarMaterialEscolhido;
    procedure FiltrarMateriais;
    procedure LocalizarMateriais;
  public
    { Public declarations }
  end;

var
  FIntIndMaterialEstoqueConsulta: TFIntIndMaterialEstoqueConsulta;

implementation

{$R *.dfm}

uses
  uFuncoes, UTelaInicial, uDmERP, uDmIntegracao, StrUtils;

procedure TFIntIndMaterialEstoqueConsulta.btFiltrarClick(Sender: TObject);
begin
  FiltrarMateriais;
end;

procedure TFIntIndMaterialEstoqueConsulta.btLocalizarClick(Sender: TObject);
begin
  LocalizarMateriais;
end;

procedure TFIntIndMaterialEstoqueConsulta.btFecharClick(Sender: TObject);
var
  sAux,
  sMsgValidacao : String;

  function RetornaUnidMedidaMaterial(const cdMaterial : String) : String;
  var
    stDados : TStringList;
  begin
    Result := '';

    try
      stDados := TStringList.Create;

      ExecuteSimplesSql(DmIntegracao.fdConnInteg,
                        'SELECT sigla_unidade FROM item WHERE item = ' + QuotedStr(cdMaterial),
                        'sigla_unidade',
                        stDados
                       );

      if (stDados.Count > 0) and (Trim(stDados[0]) <> '') then
        Result := Trim(stDados[0]);
    finally
      if Assigned(stDados) then
        FreeAndNil(stDados);
    end;
  end;
begin
  sMsgValidacao := '';

  if not DmERP.qyIntIndMaterialMovSai.Active then
    DmERP.qyIntIndMaterialMovSai.Open();

  if vtMaterialEstoque.UpdatesPending then
    vtMaterialEstoque.Post;

  try
    vtMaterialEsc.DisableControls;
    DmERP.qyIntIndMaterialMovSai.DisableControls;

    vtMaterialEsc.First;

    while not vtMaterialEsc.Eof do
    begin
      if vtMaterialEsc.FieldByName('nuQtdeSolic').AsFloat > 0 then
      begin
        if vtMaterialEsc.FieldByName('nuQtdeSolic').AsFloat > vtMaterialEsc.FieldByName('nuQtdeEst').AsFloat then
          AdicionaLinha(sMsgValidacao,
                        ' - Quantidade solicitada do material (' + vtMaterialEsc.FieldByName('cdMaterial').AsString +
                        ') ' + vtMaterialEsc.FieldByName('deMaterial').AsString +
                        ' maior que o disponível em estoque.')
        else
        begin
          DmERP.qyIntIndMaterialMovSai.Insert;
          DmERP.qyIntIndMaterialMovSai.FieldByName('cdMaterialSolicitacao').AsInteger := DmERP.qyIntIndMaterialSolic.FieldByName('cdMaterialSolicitacao').AsInteger;
          DmERP.qyIntIndMaterialMovSai.FieldByName('cdMaterial').AsString             := vtMaterialEsc.FieldByName('cdMaterial').AsString;
          DmERP.qyIntIndMaterialMovSai.FieldByName('deMaterial').AsString             := vtMaterialEsc.FieldByName('deMaterial').AsString;
          DmERP.qyIntIndMaterialMovSai.FieldByName('nuQtde').AsFloat                  := vtMaterialEsc.FieldByName('nuQtdeSolic').AsFloat;
          DmERP.qyIntIndMaterialMovSai.FieldByName('cdUnidadeMedida').AsString        := RetornaUnidMedidaMaterial(vtMaterialEsc.FieldByName('cdMaterial').AsString);

          sAux := DmERP.MaterialMovValido(DmERP.qyIntIndMaterialMovSai);

          if Trim(sAux) <> '' then
          begin
            AdicionaLinha(sMsgValidacao,
                          'As seguintes informações do material (' + vtMaterialEsc.FieldByName('cdMaterial').AsString +
                          ') ' + vtMaterialEsc.FieldByName('deMaterial').AsString +
                          ' devem ser verificadas:' + #13#13 + sAux);
            DmERP.qyIntIndMaterialMovSai.Cancel;
          end
          else
            DmERP.GravarMaterialMov(DmERP.qyIntIndMaterialMovSai, False);
        end;
      end;

      vtMaterialEsc.Next;
    end;
  finally
    vtMaterialEsc.EnableControls;
    DmERP.qyIntIndMaterialMovSai.EnableControls;
  end;

  if Trim(sMsgValidacao) <> '' then
    Aviso('Os seguintes materiais não foram solicitados: ' + #13#13 + sMsgValidacao);

  dsMaterialEstoque.DataSet.Close;
  dsMaterialEsc.DataSet.Close;

  Self.Close;
end;

procedure TFIntIndMaterialEstoqueConsulta.FiltrarMateriais;
var
  sWhere : String;
begin
  FbClicouFiltrar := True;

  vtMaterialEstoque.Clear;

  if DmERP.qyIntIndMatEstoqueConsulta.Active then
    DmERP.qyIntIndMatEstoqueConsulta.Close;

  DmERP.qyIntIndMatEstoqueConsulta.MacroByName('filtro').Clear;

  sWhere := '';

  if (edcdMaterial.ERPEdCampoChaveText <> '') and (edcdMaterial.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdMaterial = ' + QuotedStr(edcdMaterial.ERPEdCampoChaveText));

  if (sWhere <> '') then
    DmERP.qyIntIndMatEstoqueConsulta.MacroByName('filtro').Value := ' WHERE ' + sWhere;

  DmERP.qyIntIndMatEstoqueConsulta.ParamByName('cdMatMovEnt').AsInteger := 0;

  DmERP.qyIntIndMatEstoqueConsulta.Open();

  if not DmERP.qyIntIndMatEstoqueConsulta.IsEmpty then
  begin
    if not DmIntegracao.fdConnInteg.Connected then
      DmIntegracao.fdConnInteg.Connected := True;

    DmERP.qyIntIndMatEstoqueConsulta.First;

    while not DmERP.qyIntIndMatEstoqueConsulta.Eof do
    begin
      vtMaterialEstoque.Append;
      vtMaterialEstoque.FieldByName('cdMaterial').AsString := DmERP.qyIntIndMatEstoqueConsulta.FieldByName('cdMaterial').AsString;
      vtMaterialEstoque.FieldByName('nuQtdeEst').AsFloat   := DmERP.qyIntIndMatEstoqueConsulta.FieldByName('nuQtdeEst').AsFloat;
      vtMaterialEstoque.FieldByName('nuQtdeSolic').AsFloat := 0;

      if DmIntegracao.qyItem.Active then
        DmIntegracao.qyItem.Close;

      DmIntegracao.qyItem.MacroByName('filtro').Value := ' AND TRIM(a.item) = ' + QuotedStr(DmERP.qyIntIndMatEstoqueConsulta.FieldByName('cdMaterial').AsString);
      DmIntegracao.qyItem.Open;

      if not DmIntegracao.qyItem.IsEmpty then
      begin
        vtMaterialEstoque.FieldByName('deMaterial').AsString      := DmIntegracao.qyItem.FieldByName('deItem').AsString;
        vtMaterialEstoque.FieldByName('cdUnidadeMedida').AsString := DmIntegracao.qyItem.FieldByName('cdUnidadeMedida').AsString;
        vtMaterialEstoque.FieldByName('cdCentroCusto').AsInteger  := DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsInteger;

        if vtMaterialEstoque.FieldByName('cdCentroCusto').AsInteger > 0 then
          vtMaterialEstoque.FieldByName('deCentroCusto').AsString := DmIntegracao.qyItem.FieldByName('deCentroCusto').AsString
        else
          vtMaterialEstoque.FieldByName('deCentroCusto').AsString := 'Não Informado';
      end
      else
      begin
        vtMaterialEstoque.FieldByName('cdCentroCusto').AsInteger := 0;
        vtMaterialEstoque.FieldByName('deCentroCusto').AsString  := 'Não Informado';
        vtMaterialEstoque.FieldByName('cdUnidadeMedida').Clear;
      end;

      if (
          (edcdCentroCusto.ERPValorValido) and
          (edcdCentroCusto.ERPEdCampoChaveText <> vtMaterialEstoque.FieldByName('cdCentroCusto').AsString)
         ) or
         (
          (Trim(eddeMaterial.Text) <> '') and
          (Pos(eddeMaterial.Text, DmIntegracao.qyItem.FieldByName('deItem').AsString) = 0)
         ) then
        vtMaterialEstoque.Cancel
      else
      begin
        if not vtMaterialEsc.IsEmpty then
        begin
          vtMaterialEsc.First;

          if vtMaterialEsc.Locate('cdMaterial', vtMaterialEstoque.FieldByName('cdMaterial').AsString, []) then
          begin
            if vtMaterialEsc.FieldByName('nuQtdeSolic').AsFloat > 0 then
              vtMaterialEstoque.FieldByName('nuQtdeSolic').AsFloat := vtMaterialEsc.FieldByName('nuQtdeSolic').AsFloat;

            vtMaterialEstoque.FieldByName('nuQtdeEst').AsFloat := vtMaterialEsc.FieldByName('nuQtdeEst').AsFloat;
          end;
        end;

        vtMaterialEstoque.Post;
      end;

      DmERP.qyIntIndMatEstoqueConsulta.Next;
    end;

    if DmIntegracao.qyItem.Active then
      DmIntegracao.qyItem.Close;

    DmIntegracao.fdConnInteg.Connected := False;

    vtMaterialEstoque.First;
  end;

  FbClicouFiltrar := False;
end;

procedure TFIntIndMaterialEstoqueConsulta.LocalizarMateriais;
begin
  try
    vtMaterialEstoque.DisableControls;
    vtMaterialEstoque.First;

    if (not vtMaterialEstoque.Locate('cdCentroCusto',
                                     edcdCentroCusto.ERPEdCampoChaveText,
                                     []
                                    )
       ) and
       (not vtMaterialEstoque.Locate('cdMaterial',
                                     edcdMaterial.ERPEdCampoChaveText,
                                     []
                                    )
       ) and
       (not vtMaterialEstoque.Locate('deMaterial',
                                     eddeMaterial.Text,
                                     [loPartialKey, loCaseInsensitive]
                                    )
       ) then
      Aviso('Material não encontrado.')
    else
      vtMaterialEstoque.IndexFieldNames := 'cdMaterial';
  finally
    vtMaterialEstoque.EnableControls;
  end;
end;

procedure TFIntIndMaterialEstoqueConsulta.vtMaterialEstoquenuQtdeSolicValidate(
  Sender: TField);
begin
  GravarMaterialEscolhido;
end;

procedure TFIntIndMaterialEstoqueConsulta.GravarMaterialEscolhido;
begin
  vtMaterialEsc.First;

  if not vtMaterialEsc.Locate('cdMaterial', vtMaterialEstoque.FieldByName('cdMaterial').AsString, []) then
  begin
    if vtMaterialEstoque.FieldByName('nuQtdeSolic').AsFloat > 0 then
    begin
      vtMaterialEsc.Insert;

      vtMaterialEsc.FieldByName('cdMaterial').AsString      := vtMaterialEstoque.FieldByName('cdMaterial').AsString;
      vtMaterialEsc.FieldByName('deMaterial').AsString      := vtMaterialEstoque.FieldByName('deMaterial').AsString;
      vtMaterialEsc.FieldByName('nuQtdeSolic').AsFloat      := vtMaterialEstoque.FieldByName('nuQtdeSolic').AsFloat;
      vtMaterialEsc.FieldByName('nuQtdeEst').AsFloat        := vtMaterialEstoque.FieldByName('nuQtdeEst').AsFloat;
      vtMaterialEsc.FieldByName('cdUnidadeMedida').AsString := vtMaterialEstoque.FieldByName('cdUnidadeMedida').AsString;
      vtMaterialEsc.FieldByName('cdCentroCusto').AsInteger  := vtMaterialEstoque.FieldByName('cdCentroCusto').AsInteger;
      vtMaterialEsc.FieldByName('deCentroCusto').AsString   := vtMaterialEstoque.FieldByName('deCentroCusto').AsString;

      vtMaterialEsc.Post;
    end;
  end
  else
  begin
    if not FbClicouFiltrar then
    begin
      vtMaterialEsc.Edit;
      vtMaterialEsc.FieldByName('nuQtdeSolic').AsFloat := vtMaterialEstoque.FieldByName('nuQtdeSolic').AsFloat;
      vtMaterialEsc.Post;
    end;
  end;
end;

procedure TFIntIndMaterialEstoqueConsulta.FormCreate(Sender: TObject);
begin
  btFiltrar.Glyph.LoadFromResourceName(HInstance,   'IMGBTCONSULTAR_32X32');
  btLocalizar.Glyph.LoadFromResourceName(HInstance, 'IMGBTPROCURAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');
end;

procedure TFIntIndMaterialEstoqueConsulta.FormShow(Sender: TObject);
begin
  if not vtMaterialEstoque.Active then
    vtMaterialEstoque.Open;

  if not vtMaterialEsc.Active then
    vtMaterialEsc.Open;

  FiltrarMateriais;
end;

end.
