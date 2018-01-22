unit UIntComAnaliseVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Error,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, DateUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, UDBCampoCodigo, MemDS, VirtualTable, StrUtils,
  Vcl.Menus;

type
  TFIntComAnaliseVendas = class(TForm)
    qyItemGrupoFil: TFDQuery;
    lbUltimos: TLabel;
    edPeriodo: TEdit;
    rbDias: TRadioButton;
    rbMeses: TRadioButton;
    dsItemGrupoFil: TDataSource;
    gbItemGrupo: TGroupBox;
    grItemGrupo: TDBGrid;
    qyItemSubGrupoFil: TFDQuery;
    dsItemSubGrupoFil: TDataSource;
    gbItemSubGrupo: TGroupBox;
    grItemSubGrupo: TDBGrid;
    gbEstadosCli: TGroupBox;
    cbAC: TCheckBox;
    cbMT: TCheckBox;
    cbAL: TCheckBox;
    cbPA: TCheckBox;
    cbPE: TCheckBox;
    cbPB: TCheckBox;
    cbAP: TCheckBox;
    cbAM: TCheckBox;
    cbPR: TCheckBox;
    cbPI: TCheckBox;
    cbCE: TCheckBox;
    cbBA: TCheckBox;
    cbRN: TCheckBox;
    cbRJ: TCheckBox;
    cbES: TCheckBox;
    cbDF: TCheckBox;
    cbGO: TCheckBox;
    cbMA: TCheckBox;
    cbRO: TCheckBox;
    cbRR: TCheckBox;
    cbMG: TCheckBox;
    cbMS: TCheckBox;
    cbRS: TCheckBox;
    cbSC: TCheckBox;
    cbSE: TCheckBox;
    cbTO: TCheckBox;
    cbSP: TCheckBox;
    sbCampos: TScrollBox;
    btFechar: TBitBtn;
    lbLimiteReg: TLabel;
    edLimiteReg: TEdit;
    btItensMaisVend: TButton;
    qyDados: TFDQuery;
    qyItemGrupoFilflselecionado: TWideStringField;
    qyItemGrupoFilcditemgrupo: TIntegerField;
    qyItemGrupoFildeitemgrupo: TWideStringField;
    qyItemSubGrupoFilflselecionado: TWideStringField;
    qyItemSubGrupoFilcditemgrupo: TIntegerField;
    qyItemSubGrupoFilcditemsubgrupo: TIntegerField;
    qyItemSubGrupoFildeitemgrupo: TWideStringField;
    qyItemSubGrupoFildeitemsubgrupo: TWideStringField;
    gbTipoPedido: TGroupBox;
    cbTpPedV: TCheckBox;
    cbTpPedA: TCheckBox;
    cbTpPedO: TCheckBox;
    procedure btFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grItemGrupoCellClick(Column: TColumn);
    procedure btItensMaisVendClick(Sender: TObject);
    procedure qyItemGrupoFilflselecionadoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qyItemSubGrupoFilflselecionadoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure grItemSubGrupoCellClick(Column: TColumn);
    procedure grItemGrupoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grItemSubGrupoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure MarcarDesmarcar(const qyInfo : TFDQuery; const sMarcarDesmarcar : String);
    procedure ImprimirItensMisVend;
  public
    { Public declarations }
  end;

var
  FIntComAnaliseVendas: TFIntComAnaliseVendas;

implementation

{$R *.dfm}
{$R Icones.res}

uses
  uDmERP, UTelaInicial, uFuncoes;

procedure TFIntComAnaliseVendas.MarcarDesmarcar(const qyInfo : TFDQuery; const sMarcarDesmarcar : String);
begin
  if (qyInfo.Active) and (not qyInfo.IsEmpty) then
  begin
    try
      qyInfo.DisableControls;

      qyInfo.First;

      while not qyInfo.Eof do
      begin
        qyInfo.Edit;
        qyInfo.FieldByName('flSelecionado').AsString := sMarcarDesmarcar;
        qyInfo.Post;

        qyInfo.Next;
      end;
    finally
      qyInfo.First;
      qyInfo.EnableControls;
    end;
  end;
end;

procedure TFIntComAnaliseVendas.ImprimirItensMisVend;
begin

end;

procedure TFIntComAnaliseVendas.qyItemGrupoFilflselecionadoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flSelecionado') then
    Text := '';
end;

procedure TFIntComAnaliseVendas.qyItemSubGrupoFilflselecionadoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if SameText(Sender.FieldName, 'flSelecionado') then
    Text := '';
end;

procedure TFIntComAnaliseVendas.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
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

procedure TFIntComAnaliseVendas.btItensMaisVendClick(Sender: TObject);
begin
  ImprimirItensMisVend;
end;

procedure TFIntComAnaliseVendas.FormCreate(Sender: TObject);
begin
  btFechar.Glyph.LoadFromResourceName(HInstance, 'IMGBTFECHAR_32X32');

  qyItemGrupoFil.Open;
  qyItemSubGrupoFil.Open;
end;

procedure TFIntComAnaliseVendas.grItemGrupoCellClick(Column: TColumn);
begin
  if (qyItemGrupoFil.Active) and (qyItemSubGrupoFil.Active) then
    qyItemSubGrupoFil.Locate('cdItemGrupo', qyItemGrupoFil.FieldByName('cdItemGrupo').AsInteger,[]);

  if SameText(Column.FieldName, 'flSelecionado') then
  begin
    qyItemGrupoFil.Edit;

    if UpperCase(qyItemGrupoFil.FieldByName('flSelecionado').AsString) = 'N' then
      qyItemGrupoFil.FieldByName('flSelecionado').AsString := 'S'
    else
      qyItemGrupoFil.FieldByName('flSelecionado').AsString := 'N';

    qyItemGrupoFil.Post;
  end;
end;

procedure TFIntComAnaliseVendas.grItemGrupoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap : TBitmap;
begin
  if SameText(Column.FieldName, 'flSelecionado') then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(qyItemGrupoFil.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grItemGrupo.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end;
end;

procedure TFIntComAnaliseVendas.grItemSubGrupoCellClick(Column: TColumn);
begin
  if SameText(Column.FieldName, 'flSelecionado') then
  begin
    qyItemSubGrupoFil.Edit;

    if UpperCase(qyItemSubGrupoFil.FieldByName('flSelecionado').AsString) = 'N' then
      qyItemSubGrupoFil.FieldByName('flSelecionado').AsString := 'S'
    else
      qyItemSubGrupoFil.FieldByName('flSelecionado').AsString := 'N';

    qyItemSubGrupoFil.Post;
  end;
end;

procedure TFIntComAnaliseVendas.grItemSubGrupoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Bitmap : TBitmap;
begin
  if SameText(Column.FieldName, 'flSelecionado') then
  begin
    Bitmap := TBitmap.Create;

    if UpperCase(qyItemSubGrupoFil.FieldByName(Column.FieldName).AsString) = 'S' then
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRMARCAR_16X16')
    else
      Bitmap.LoadFromResourceName(HInstance, 'IMGGRDESMARCAR_16X16');

    grItemSubGrupo.Canvas.Draw(Rect.Left+4, Rect.Top, Bitmap);
  end;
end;

initialization
  RegisterClass(TFIntComAnaliseVendas);

finalization
  UnRegisterClass(TFIntComAnaliseVendas);

end.
