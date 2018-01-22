unit UPatrimonioCadastro;

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
  TFPatrimonioCadastro = class(TFFormCadastro)
    lbcdPatrimonio: TLabel;
    lbdePatrimonio: TLabel;
    lbdtAquisicao: TLabel;
    lbnuPatrimonio: TLabel;
    edcdPatrimonio: TDBCampoCodigo;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbnmUsuAlt: TLabel;
    eddePatrimonio: TDBEdit;
    ednuPatrimonio: TDBEdit;
    lbdeObservacao: TLabel;
    dsSetor: TDataSource;
    lcbcdSetor: TDBLookupComboBox;
    lbcdSetor: TLabel;
    dsPatrimonioTipoPesq: TDataSource;
    lbcdPatrimonioTipo: TLabel;
    lcbcdPatrimonioTipo: TDBLookupComboBox;
    eddtAquisicao: TDBDateTime;
    mdeObservacao: TDBMemo;
    qySetor: TFDQuery;
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FPatrimonioCadastro: TFPatrimonioCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFPatrimonioCadastro.FormCreate(Sender: TObject);
begin
  inherited;

  if DmERP.qyPatrimonioTipoPesq.Active then
    DmERP.qyPatrimonioTipoPesq.Close;

  DmERP.qyPatrimonioTipoPesq.Open();

  qySetor.Open();
end;

procedure TFPatrimonioCadastro.GravarRegistro;
begin
  DmERP.GravarPatrimonio;
end;

procedure TFPatrimonioCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirPatrimonio;
end;

initialization
  RegisterClass(TFPatrimonioCadastro);

finalization
  UnRegisterClass(TFPatrimonioCadastro);

end.
