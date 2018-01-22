unit UPatrimonioManutencaoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  UDBDateTime, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo, UBarraBotoesItens,
  Vcl.ComCtrls;

type
  TFPatrimonioManutencaoCadastro = class(TFFormCadastro)
    lbcdPatrimonioManutencao: TLabel;
    lbcdPatrimonio: TLabel;
    lbdeManutencao: TLabel;
    lbcdSituacao: TLabel;
    edcdPatrimonio: TDBCampoCodigo;
    edcdPatrimonioManutencao: TDBCampoCodigo;
    mdeManutencao: TDBMemo;
    lcbcdSituacao: TDBLookupComboBox;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbnmUsuAlt: TLabel;
    eddtManutencao: TDBDateTime;
    eddtAvisarEm: TDBDateTime;
    lbdtManutencao: TLabel;
    lbdtAvisarEm: TLabel;
    lbdeResponsavel: TLabel;
    eddtTermino: TDBDateTime;
    eddeResponsavel: TDBEdit;
    lbdtTermino: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FPatrimonioManutencaoCadastro: TFPatrimonioManutencaoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFPatrimonioManutencaoCadastro.FormCreate(Sender: TObject);
begin
  inherited;

  if DmERP.qyPatrimonioSituacao.Active then
    DmERP.qyPatrimonioSituacao.Close;

  DmERP.qyPatrimonioSituacao.Open();
end;

procedure TFPatrimonioManutencaoCadastro.GravarRegistro;
begin
  DmERP.GravarPatrimonioManutencao;
end;

procedure TFPatrimonioManutencaoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirPatrimonioManutencao;
end;

initialization
  RegisterClass(TFPatrimonioManutencaoCadastro);

finalization
  UnRegisterClass(TFPatrimonioManutencaoCadastro);

end.
