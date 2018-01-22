unit UDocumentoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.ComCtrls, UDBCampoCodigo, UDBDateTime, frxClass, frxDBSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, DateUtils;

type
  TFDocumentoCadastro = class(TFFormCadastro)
    lbcdDocumento: TLabel;
    lbcdEmpresa: TLabel;
    lbdtEmissao: TLabel;
    lbvlDocumento: TLabel;
    edcdEmpresa: TDBCampoCodigo;
    edcdDocumento: TDBCampoCodigo;
    edvlDocumento: TDBEdit;
    eddtEmissao: TDBDateTime;
    lbcdDocumentoTipo: TLabel;
    edcdDocumentoTipo: TDBCampoCodigo;
    edcdDespesaTipo: TDBCampoCodigo;
    lbcdDespesaTipo: TLabel;
    edcdFornecedor: TDBCampoCodigo;
    lbcdFornecedor: TLabel;
    lbdtCompetencia: TLabel;
    eddtCompetencia: TDBDateTime;
    lbnmUsuCad: TLabel;
    lbnmUsuAlt: TLabel;
    ednmUsuCad: TDBEdit;
    ednmUsuAlt: TDBEdit;
    lbdeNumDocumento: TLabel;
    eddeNumDocumento: TDBEdit;
    lbcdBordero: TLabel;
    edcdBordero: TDBCampoCodigo;
    cbflContabiliza: TDBCheckBox;
    lbdeObservacoes: TLabel;
    mdeObservacoes: TDBMemo;
    ednmFornecedor: TDBEdit;
    procedure edcdFornecedorERPOnEdCampoChaveExit(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FDocumentoCadastro: TFDocumentoCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFDocumentoCadastro.GravarRegistro;
begin
  DmERP.GravarDocumento;
end;

procedure TFDocumentoCadastro.edcdFornecedorERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if DmERP.qyDocumento.FieldByName('cdFornecedor').AsInteger > 0 then
    DmERP.qyDocumento.FieldByName('nmFornecedor').AsString := edcdFornecedor.ERPLbDescricaoCaption;
end;

procedure TFDocumentoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirDocumento;
end;

initialization
  RegisterClass(TFDocumentoCadastro);

finalization
  UnRegisterClass(TFDocumentoCadastro);

end.
