unit UItemCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFItemCadastro = class(TFFormCadastro)
    lbcdItem: TLabel;
    lbdeItem: TLabel;
    eddeItem: TDBEdit;
    edcdItem: TDBCampoCodigo;
    cbflAtivo: TDBCheckBox;
    lbcdItemTipo: TLabel;
    edcdItemTipo: TDBCampoCodigo;
    lbcdUnidadeMedida: TLabel;
    edcdUnidadeMedida: TDBCampoCodigo;
    lbcdItemGrupo: TLabel;
    edcdItemGrupo: TDBCampoCodigo;
    lbcdItemSubGrupo: TLabel;
    edcdItemSubGrupo: TDBCampoCodigo;
    lbcdItemFamilia: TLabel;
    edcdItemFamilia: TDBCampoCodigo;
    lbcdItemOrigem: TLabel;
    edcdItemOrigem: TDBCampoCodigo;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    lbnmUsuAlt: TLabel;
    ednmUsuAlt: TDBEdit;
    gbFaturamento: TGroupBox;
    lbcdClassifFiscal: TLabel;
    edcdClassifFiscal: TDBCampoCodigo;
    gbICMS: TGroupBox;
    gbIPI: TGroupBox;
    gbPisCofins: TGroupBox;
    lbcdIcmsSitTrib: TLabel;
    edcdIcmsSitTrib: TDBCampoCodigo;
    lbvlPercIcmsReducao: TLabel;
    edvlPercIcmsReducao: TDBEdit;
    lbvlPercIcms: TLabel;
    edvlPercIcms: TDBEdit;
    lbcdIcmsCstEntrada: TLabel;
    edcdIcmsSitTribCstEnt: TDBCampoCodigo;
    lbcdIpiTipo: TLabel;
    edcdIpiTipo: TDBCampoCodigo;
    lbvlPercIpi: TLabel;
    edvlPercIpi: TDBEdit;
    lbcdPisTipo: TLabel;
    edcdPisTipo: TDBCampoCodigo;
    lbcdCofinsTipo: TLabel;
    edcdCofinsCodigo: TDBCampoCodigo;
    cbflItemRevenda: TDBCheckBox;
    edcdCentroCusto: TDBCampoCodigo;
    lbcdCentroCusto: TLabel;
    procedure edcdItemSubGrupoERPOnEdCampoChaveEnter(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FItemCadastro: TFItemCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFItemCadastro.GravarRegistro;
begin
  DmERP.GravarItem;
end;

procedure TFItemCadastro.edcdItemSubGrupoERPOnEdCampoChaveEnter(
  Sender: TObject);
begin
  inherited;

  if not edcdItemGrupo.ERPValorValido then
  begin
    Aviso('Informe um grupo válido antes.');
    edcdItemGrupo.ERPEdCampoChaveSetFocus;
  end
  else
  begin
    edcdItemSubGrupo.ERPSqlPesquisa.Clear;
    edcdItemSubGrupo.ERPSqlPesquisa.Add(
                                        'SELECT t.* ' +
                                        '  FROM ( ' +
                                        '        SELECT a.cdItemSubGrupo, ' +
                                        '               a.deItemSubGrupo ' +
                                        '          FROM erp.itemSubGrupo a ' +
                                        '         WHERE a.cdItemGrupo = ' + edcdItemGrupo.ERPEdCampoChaveDBText +
                                        '       ) t ' +
                                        ' &filtro '
                                       );
  end;
end;

procedure TFItemCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirItem;
end;

initialization
  RegisterClass(TFItemCadastro);

finalization
  UnRegisterClass(TFItemCadastro);

end.
