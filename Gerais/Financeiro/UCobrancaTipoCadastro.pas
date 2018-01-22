unit UCobrancaTipoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Data.DB;

type
  TFCobrancaTipoCadastro = class(TFFormCadastro)
    lbcdCobrancaTipo: TLabel;
    lbdeCobrancaTipoSigla: TLabel;
    lbdeCobrancaTipo: TLabel;
    lbnuDiasAcrescimo: TLabel;
    eddeCobrancaTipoSigla: TDBEdit;
    eddeCobrancaTipo: TDBEdit;
    edcdCobrancaTipo: TDBCampoCodigo;
    ednuDiasAcrescimo: TDBEdit;
    cbflContabilidade: TDBCheckBox;
    cbflFluxoCaixa: TDBCheckBox;
    cbflEntraConcialiacao: TDBCheckBox;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FCobrancaTipoCadastro: TFCobrancaTipoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFCobrancaTipoCadastro.GravarRegistro;
begin
  DmERP.GravarCobrancaTipo;
end;

procedure TFCobrancaTipoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirCobrancaTipo;
end;

initialization
  RegisterClass(TFCobrancaTipoCadastro);

finalization
  UnRegisterClass(TFCobrancaTipoCadastro);

end.
