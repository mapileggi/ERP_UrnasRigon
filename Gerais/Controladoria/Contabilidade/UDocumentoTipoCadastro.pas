unit UDocumentoTipoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask;

type
  TFDocumentoTipoCadastro = class(TFFormCadastro)
    lbcdDocumentoTipo: TLabel;
    lbdeDocumentoTipo: TLabel;
    eddeDocumentoTipo: TDBEdit;
    edcdDocumentoTipo: TDBCampoCodigo;
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FDocumentoTipoCadastro: TFDocumentoTipoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFDocumentoTipoCadastro.GravarRegistro;
begin
  DmERP.GravarDocumentoTipo;
end;

procedure TFDocumentoTipoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirDocumentoTipo;
end;

initialization
  RegisterClass(TFDocumentoTipoCadastro);

finalization
  UnRegisterClass(TFDocumentoTipoCadastro);

end.
