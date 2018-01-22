unit UBorderoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  UDBDateTime, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo, UBarraBotoesItens,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TFBorderoCadastro = class(TFFormCadastro)
    lbcdBordero: TLabel;
    lbcdMotorista: TLabel;
    lbnuKmFinal: TLabel;
    edcdMotorista: TDBCampoCodigo;
    edcdBordero: TDBCampoCodigo;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbnmUsuAlt: TLabel;
    eddtSaida: TDBDateTime;
    eddtRetorno: TDBDateTime;
    lbdtSaida: TLabel;
    lbdtRetorno: TLabel;
    lbnuKmInicial: TLabel;
    lbcdVeiculo: TLabel;
    edcdVeiculo: TDBCampoCodigo;
    ednuKmInicial: TDBEdit;
    ednuKmFinal: TDBEdit;
    btDoctos: TBitBtn;
    lbnuQtdeItens: TLabel;
    ednuQtdeItens: TDBEdit;
    lbnmAjudante: TLabel;
    ednmAjudante: TDBEdit;
    lbnuLitrosCombustivel: TLabel;
    ednuLitrosCombustivel: TDBEdit;
    eddeRegiao: TDBEdit;
    lbdeRegiao: TLabel;
    lbcdCarga: TLabel;
    edcdCarga: TDBCampoCodigo;
    procedure btDoctosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FBorderoCadastro: TFBorderoCadastro;

implementation

uses
  uDmERP, uFuncoes, UTelaInicial;

{$R *.dfm}

procedure TFBorderoCadastro.GravarRegistro;
begin
  DmERP.GravarBordero;
end;

procedure TFBorderoCadastro.btDoctosClick(Sender: TObject);
var
  stCamposValores : TStringList;
begin
  inherited;

  stCamposValores := TStringList.Create;

  if (DmERP.qyBordero.Active) and
     (not DmERP.qyBordero.IsEmpty) and
     (DmERP.qyBordero.State = dsBrowse) and
     (DmERP.qyBordero.FieldByName('cdBordero').AsInteger > 0) then
  begin
    stCamposValores.Add('cdBordero=' + DmERP.qyBordero.FieldByName('cdBordero').AsString);

    FTelaInicial.AbrirTela('FDocumentoCadastro',
                           '',
                           '',
                           stCamposValores
                          );
  end;

  if Assigned(stCamposValores) then
    FreeAndNil(stCamposValores);
end;

procedure TFBorderoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirBordero;
end;

procedure TFBorderoCadastro.FormCreate(Sender: TObject);
begin
  inherited;

  btDoctos.Glyph.LoadFromResourceName(HInstance, 'IMGBTDOCUMENTO_32X32');
end;

procedure TFBorderoCadastro.FrBarraBotoesdsDadosStateChange(Sender: TObject);
begin
  inherited;

  btDoctos.Enabled := (FrBarraBotoes.dsDados.DataSet.Active) and
                      (not FrBarraBotoes.dsDados.DataSet.IsEmpty) and
                      (FrBarraBotoes.dsDados.State = dsBrowse);
end;

initialization
  RegisterClass(TFBorderoCadastro);

finalization
  UnRegisterClass(TFBorderoCadastro);

end.
