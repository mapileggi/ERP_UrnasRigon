unit UIntIndMaterialSolicCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  UDBDateTime, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, UDBCampoCodigo, UBarraBotoesItens,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons;

type
  TFIntIndMaterialSolicCadastro = class(TFFormCadastro)
    lbcdMaterialSolicitacao: TLabel;
    edcdMaterialSolicitacao: TDBCampoCodigo;
    lbcdSolicitante: TLabel;
    edcdSolicitante: TDBCampoCodigo;
    btAdicionaMat: TBitBtn;
    dsMaterialMovSai: TDataSource;
    grMaterialMovSai: TDBGrid;
    lbnmUsuCad: TLabel;
    ednmUsuCad: TDBEdit;
    lbdtCadastro: TLabel;
    eddtCadastro: TDBDateTime;
    lbdeHrCadastro: TLabel;
    eddeHrCadastro: TDBEdit;
    lbDuploClicExcluir: TLabel;
    ednmSolicitante: TDBEdit;
    lbnmSolicitante: TLabel;
    rgflTipoSolicitacao: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btAdicionaMatClick(Sender: TObject);
    procedure grMaterialMovSaiDblClick(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
    procedure rgflTipoSolicitacaoExit(Sender: TObject);
    procedure edcdSolicitanteERPOnEdCampoChaveExit(Sender: TObject);
    procedure rgflTipoSolicitacaoClick(Sender: TObject);
    procedure FrBarraBotoesbtSalvarClick(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure RegraTipoSolic;
  public
    { Public declarations }
  end;

var
  FIntIndMaterialSolicCadastro: TFIntIndMaterialSolicCadastro;

implementation

uses
  uDmERP, uDmIntegracao, UTelaInicial, uFuncoes, UIntIndMaterialEstoqueConsulta;

{$R *.dfm}

procedure TFIntIndMaterialSolicCadastro.FormCreate(Sender: TObject);
begin
  inherited;

  btAdicionaMat.Glyph.LoadFromResourceName(HInstance, 'IMGBTNOVO_32X32');
end;

procedure TFIntIndMaterialSolicCadastro.FrBarraBotoesbtSalvarClick(
  Sender: TObject);
begin
  if (DmERP.qyIntIndMaterialSolic.Active) and
     (DmERP.qyIntIndMaterialSolic.State in dsEditModes) and
     (edcdSolicitante.ERPValorValido) and
     (edcdSolicitante.ERPLbDescricaoCaption <> '') then
    DmERP.qyIntIndMaterialSolic.FieldByName('nmSolicitante').AsString := edcdSolicitante.ERPLbDescricaoCaption;

  inherited;
end;

procedure TFIntIndMaterialSolicCadastro.FrBarraBotoesdsDadosStateChange(
  Sender: TObject);
begin
  inherited;

  if FrBarraBotoes.dsDados.State in dsEditModes then
  begin
    edcdSolicitante.ERPEdCampoChaveDBEnabled := (DmERP.qyIntIndMaterialSolic.FieldByName('flTipoSolicitacao').AsString <> 'E');
    ednmSolicitante.Enabled                  := not edcdSolicitante.ERPEdCampoChaveDBEnabled;
  end
  else
  begin
    edcdSolicitante.ERPEdCampoChaveDBEnabled := True;
    ednmSolicitante.Enabled                  := True;
  end;

  btAdicionaMat.Enabled := FrBarraBotoes.dsDados.State = dsBrowse;
end;

procedure TFIntIndMaterialSolicCadastro.GravarRegistro;
begin
  DmERP.GravarMaterialSolic;
end;

procedure TFIntIndMaterialSolicCadastro.grMaterialMovSaiDblClick(
  Sender: TObject);
begin
  inherited;

  DmERP.ExcluirMaterialMov(DmERP.qyIntIndMaterialMovSai);
end;

procedure TFIntIndMaterialSolicCadastro.rgflTipoSolicitacaoClick(
  Sender: TObject);
begin
  inherited;

  RegraTipoSolic;
end;

procedure TFIntIndMaterialSolicCadastro.rgflTipoSolicitacaoExit(
  Sender: TObject);
begin
  inherited;

  RegraTipoSolic;

  if (ednmSolicitante.Visible) and (ednmSolicitante.Enabled) and (ednmSolicitante.CanFocus) then
    ednmSolicitante.SetFocus
  else
    edcdSolicitante.ERPEdCampoChaveSetFocus;
end;

procedure TFIntIndMaterialSolicCadastro.RegraTipoSolic;
begin
  Application.ProcessMessages;

  if (DmERP.qyIntIndMaterialSolic.FieldByName('flTipoSolicitacao').AsString = 'E') then
  begin
    DmERP.qyIntIndMaterialSolic.FieldByName('cdSolicitante').Clear;
    edcdSolicitante.ERPEdCampoChaveDBEnabled := False;
  end
  else
    edcdSolicitante.ERPEdCampoChaveDBEnabled := True;

  ednmSolicitante.Enabled := not edcdSolicitante.ERPEdCampoChaveDBEnabled;
end;

procedure TFIntIndMaterialSolicCadastro.btAdicionaMatClick(Sender: TObject);
begin
  inherited;

  FIntIndMaterialEstoqueConsulta := TFIntIndMaterialEstoqueConsulta.Create(Application);

  try
    FIntIndMaterialEstoqueConsulta.ShowModal;
  finally
    FreeAndNil(FIntIndMaterialEstoqueConsulta);
  end;
end;

procedure TFIntIndMaterialSolicCadastro.edcdSolicitanteERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if (FrBarraBotoes.dsDados.DataSet.Active) and
     (FrBarraBotoes.dsDados.State in dsEditModes) then
  begin
    if (edcdSolicitante.ERPValorValido) then
      DmERP.qyIntIndMaterialSolic.FieldByName('nmSolicitante').AsString := edcdSolicitante.ERPLbDescricaoCaption
    else
      DmERP.qyIntIndMaterialSolic.FieldByName('nmSolicitante').Clear;
  end;
end;

procedure TFIntIndMaterialSolicCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirMaterialSolic;
end;

initialization
  RegisterClass(TFIntIndMaterialSolicCadastro);

finalization
  UnRegisterClass(TFIntIndMaterialSolicCadastro);

end.
