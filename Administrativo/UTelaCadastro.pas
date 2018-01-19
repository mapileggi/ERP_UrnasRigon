unit UTelaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB, UDBDateTime,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TFTelaCadastro = class(TFFormCadastro)
    lbcdTela: TLabel;
    lbdeTituloPai: TLabel;
    lbdeTituloTela: TLabel;
    edcdTela: TDBCampoCodigo;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbnmUsuAlt: TLabel;
    cbflAtivo: TDBCheckBox;
    eddeTituloPai: TDBEdit;
    eddeTituloTela: TDBEdit;
    lbnmForm: TLabel;
    ednmForm: TDBEdit;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FTelaCadastro: TFTelaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFTelaCadastro.GravarRegistro;
begin
  DmERP.GravarTela;
end;

procedure TFTelaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirTela;
end;

initialization
  RegisterClass(TFTelaCadastro);

finalization
  UnRegisterClass(TFTelaCadastro);

end.
