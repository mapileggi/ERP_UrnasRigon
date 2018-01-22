unit UIntIndItemRelacionadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB,
  MemDS, VirtualTable;

type
  TFIntIndItemRelacionadoCadastro = class(TFFormCadastro)
    lbcdItemRelacionado: TLabel;
    edcdIntIndItemRelacionado: TDBCampoCodigo;
    dsTamanho: TDataSource;
    vtTamanho: TVirtualTable;
    vtTamanhocdTamanho: TIntegerField;
    vtTamanhodeTamanho: TStringField;
    lbcdItem: TLabel;
    edcdItem: TDBCampoCodigo;
    lbcdTamanho: TLabel;
    lcbcdTamanho: TDBLookupComboBox;
    dsTamanhoBase: TDataSource;
    vtTamanhoBase: TVirtualTable;
    vtTamanhoBasecdTamanhoBase: TIntegerField;
    vtTamanhoBasedeTamanhoBase: TStringField;
    lcbcdTamanhoBase: TDBLookupComboBox;
    lbcdTamanhoBase: TLabel;
    lbcdItemBase: TLabel;
    edcdItemBase: TDBCampoCodigo;
    procedure edcdItemBaseERPOnEdCampoChaveExit(Sender: TObject);
    procedure edcdItemERPOnEdCampoChaveExit(Sender: TObject);
    procedure lcbcdTamanhoExit(Sender: TObject);
    procedure lcbcdTamanhoBaseExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FIntIndItemRelacionadoCadastro: TFIntIndItemRelacionadoCadastro;

implementation

uses
  uDmERP, uDmIntegracao, uFuncoes;

{$R *.dfm}

procedure TFIntIndItemRelacionadoCadastro.FormCreate(Sender: TObject);
begin
  vtTamanho.Open;
  vtTamanho.Clear;
  vtTamanhoBase.Open;
  vtTamanhoBase.Clear;

  try
    vtTamanho.DisableControls;
    vtTamanhoBase.DisableControls;

    DmIntegracao.fdConnInteg.Connected := True;
    DmIntegracao.qyVariavelItens.MacroByName('filtro').Value := ' WHERE codigo_variavel = 5';
    DmIntegracao.qyVariavelItens.Open;
    DmIntegracao.qyVariavelItens.First;

    vtTamanho.Insert;
    vtTamanho.FieldByName('cdTamanho').AsInteger := 0;
    vtTamanho.FieldByName('deTamanho').AsString  := 'Sem Tamanho';
    vtTamanho.Post;

    vtTamanhoBase.Insert;
    vtTamanhoBase.FieldByName('cdTamanhoBase').AsInteger := 0;
    vtTamanhoBase.FieldByName('deTamanhoBase').AsString  := 'Sem Tamanho';
    vtTamanhoBase.Post;

    while not DmIntegracao.qyVariavelItens.Eof do
    begin
      vtTamanho.Insert;
      vtTamanho.FieldByName('cdTamanho').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
      vtTamanho.FieldByName('deTamanho').AsString  := DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString;
      vtTamanho.Post;

      vtTamanhoBase.Insert;
      vtTamanhoBase.FieldByName('cdTamanhoBase').AsInteger := DmIntegracao.qyVariavelItens.FieldByName('cdVariavelItem').AsInteger;
      vtTamanhoBase.FieldByName('deTamanhoBase').AsString  := DmIntegracao.qyVariavelItens.FieldByName('deValor').AsString;
      vtTamanhoBase.Post;

      DmIntegracao.qyVariavelItens.Next
    end;
  finally
    if DmIntegracao.qyVariavelItens.Active then
      DmIntegracao.qyVariavelItens.Close;

    DmIntegracao.fdConnInteg.Connected := False;
    vtTamanho.First;
    vtTamanho.EnableControls;

    vtTamanhoBase.First;
    vtTamanhoBase.EnableControls;
  end;

  inherited;
end;

procedure TFIntIndItemRelacionadoCadastro.GravarRegistro;
begin
  DmERP.GravarItemRelacionado;
end;

procedure TFIntIndItemRelacionadoCadastro.lcbcdTamanhoBaseExit(Sender: TObject);
begin
  inherited;

  if (DmERP.qyIntIndItemRelacionado.Active) and (DmERP.qyIntIndItemRelacionado.State in dsEditModes) then
    DmERP.qyIntIndItemRelacionado.FieldByName('deTamanhoBase').AsString := Trim(vtTamanhoBase.FieldByName('deTamanhoBase').AsString);
end;

procedure TFIntIndItemRelacionadoCadastro.lcbcdTamanhoExit(Sender: TObject);
begin
  inherited;

  if (DmERP.qyIntIndItemRelacionado.Active) and (DmERP.qyIntIndItemRelacionado.State in dsEditModes) then
    DmERP.qyIntIndItemRelacionado.FieldByName('deTamanho').AsString := Trim(vtTamanho.FieldByName('deTamanho').AsString);
end;

procedure TFIntIndItemRelacionadoCadastro.edcdItemBaseERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if (DmERP.qyIntIndItemRelacionado.Active) and (DmERP.qyIntIndItemRelacionado.State in dsEditModes) then
  begin
    if (edcdItemBase.ERPValorValido) then
      DmERP.qyIntIndItemRelacionado.FieldByName('deItemBase').AsString := Trim(edcdItemBase.ERPLbDescricaoCaption)
    else
      DmERP.qyIntIndItemRelacionado.FieldByName('deItemBase').Clear;
  end;
end;

procedure TFIntIndItemRelacionadoCadastro.edcdItemERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if (DmERP.qyIntIndItemRelacionado.Active) and (DmERP.qyIntIndItemRelacionado.State in dsEditModes) then
  begin
    if (edcdItem.ERPValorValido) then
      DmERP.qyIntIndItemRelacionado.FieldByName('deItem').AsString := Trim(edcdItem.ERPLbDescricaoCaption)
    else
      DmERP.qyIntIndItemRelacionado.FieldByName('deItem').Clear;
  end;
end;

procedure TFIntIndItemRelacionadoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirItemRelacionado;
end;

initialization
  RegisterClass(TFIntIndItemRelacionadoCadastro);

finalization
  UnRegisterClass(TFIntIndItemRelacionadoCadastro);

end.
