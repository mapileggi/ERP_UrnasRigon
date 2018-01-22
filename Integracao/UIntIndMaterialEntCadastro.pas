unit UIntIndMaterialEntCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  UDBDateTime, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo, UBarraBotoesItens,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFIntIndMaterialEntCadastro = class(TFFormCadastro)
    lbcdMaterialMovimento: TLabel;
    lbcdMaterial: TLabel;
    lbnuQtde: TLabel;
    lbcdSituacaoMovimento: TLabel;
    edcdMaterial: TDBCampoCodigo;
    edcdMaterialMovimento: TDBCampoCodigo;
    ednuQtde: TDBEdit;
    lcbcdSituacaoMovimento: TDBLookupComboBox;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    lbdenuNotaFiscal: TLabel;
    eddenuNotaFiscal: TDBEdit;
    cbflTipoMovimento: TDBCheckBox;
    dsMaterialMovSit: TDataSource;
    lbdeHrCadastro: TLabel;
    eddeHrCadastro: TDBEdit;
    lbdtCadastro: TLabel;
    eddtCadastro: TDBDateTime;
    lbcdFornecedor: TLabel;
    edcdFornecedor: TDBCampoCodigo;
    lbdeObservacoes: TLabel;
    mdeObservacoes: TDBMemo;
    lbvlUnitario: TLabel;
    edvlUnitario: TDBEdit;
    lbnmUsuSit: TLabel;
    ednmUsuSit: TDBEdit;
    lbdtSituacaoMov: TLabel;
    eddtSituacaoMov: TDBDateTime;
    lbdeHrSituacaoMov: TLabel;
    eddeHrSituacaoMov: TDBEdit;
    lbcdUnidadeMedida: TLabel;
    edcdUnidadeMedida: TDBCampoCodigo;
    procedure FormCreate(Sender: TObject);
    procedure edcdMaterialERPOnEdCampoChaveExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrBarraBotoesbtSalvarClick(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    function RetornaUnidMedidaMaterial(const cdMaterial : String) : String;
  public
    { Public declarations }
  end;

var
  FIntIndMaterialEntCadastro: TFIntIndMaterialEntCadastro;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes;

{$R *.dfm}

procedure TFIntIndMaterialEntCadastro.FormCreate(Sender: TObject);
begin
  DmERP.qyMaterialMovSit.Open();

  inherited;
end;

procedure TFIntIndMaterialEntCadastro.FormShow(Sender: TObject);
begin
  inherited;

  lcbcdSituacaoMovimento.Enabled  := FTelaInicial.FcdSetorUsuario = 1;
  lcbcdSituacaoMovimento.ReadOnly := not lcbcdSituacaoMovimento.Enabled;
end;

procedure TFIntIndMaterialEntCadastro.FrBarraBotoesbtSalvarClick(
  Sender: TObject);
var
  bAborta : Boolean;
begin
  bAborta := False;

  if (DmERP.qyIntIndMaterialMovEnt.Active) and
     (DmERP.qyIntIndMaterialMovEnt.State in dsEditModes) and
     (edcdMaterial.ERPValorValido) and
     (edcdMaterial.ERPLbDescricaoCaption <> '') then
  begin
    DmERP.qyIntIndMaterialMovEnt.FieldByName('deMaterial').AsString := edcdMaterial.ERPLbDescricaoCaption;

    if not DmIntegracao.fdConnInteg.Connected then
      DmIntegracao.fdConnInteg.Connected := True;

    if DmIntegracao.qyItem.Active then
      DmIntegracao.qyItem.Close;

    DmIntegracao.qyItem.MacroByName('filtro').Value := ' AND TRIM(a.item) = ' + QuotedStr(DmERP.qyIntIndMaterialMovEnt.FieldByName('cdMaterial').AsString);
    DmIntegracao.qyItem.Open;

    if not DmIntegracao.qyItem.IsEmpty then
    begin
      if (DmIntegracao.qyItem.FieldByName('cdCentroCusto').AsInteger = 4) and (FTelaInicial.FcdSetorUsuario <> 1) then
      begin
        if (DmERP.qyIntIndMaterialMovEnt.State = dsEdit) and
           (DmERP.qyIntIndMaterialMovEnt.FieldByName('cdSituacaoMovimento').AsInteger > 1) then
        begin
          Aviso('Entrada de material do centro de custo ' +
                DmIntegracao.qyItem.FieldByName('deCentroCusto').AsString +
                ' não pode ser alterado quando estiver na situação ' + lcbcdSituacaoMovimento.Text +
                '.'
               );
          bAborta := True;
        end
        else
        begin
          DmERP.qyIntIndMaterialMovEnt.FieldByName('cdSituacaoMovimento').AsInteger := 1;
          DmERP.qyIntIndMaterialMovEnt.FieldByName('vlUnitario').Clear;
        end;
      end;
    end;

    if DmIntegracao.qyItem.Active then
      DmIntegracao.qyItem.Close;

    DmIntegracao.fdConnInteg.Connected := False;
  end;

  if bAborta then
    Abort
  else
    inherited;
end;

procedure TFIntIndMaterialEntCadastro.GravarRegistro;
begin
  DmERP.GravarMaterialMov(DmERP.qyIntIndMaterialMovEnt, True);
end;

procedure TFIntIndMaterialEntCadastro.edcdMaterialERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if (DmERP.qyIntIndMaterialMovEnt.Active) and
     (DmERP.qyIntIndMaterialMovEnt.State in dsEditModes) and
     (edcdMaterial.ERPValorValido) and
     (edcdMaterial.ERPLbDescricaoCaption <> '') then
   begin
    DmERP.qyIntIndMaterialMovEnt.FieldByName('deMaterial').AsString      := edcdMaterial.ERPLbDescricaoCaption;
    DmERP.qyIntIndMaterialMovEnt.FieldByName('cdUnidadeMedida').AsString := RetornaUnidMedidaMaterial(DmERP.qyIntIndMaterialMovEnt.FieldByName('cdMaterial').AsString);
   end;
end;

function TFIntIndMaterialEntCadastro.RetornaUnidMedidaMaterial(const cdMaterial : String) : String;
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

procedure TFIntIndMaterialEntCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirMaterialMov(DmERP.qyIntIndMaterialMovEnt);
end;

initialization
  RegisterClass(TFIntIndMaterialEntCadastro);

finalization
  UnRegisterClass(TFIntIndMaterialEntCadastro);

end.
