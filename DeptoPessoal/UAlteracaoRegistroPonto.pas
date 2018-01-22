unit UAlteracaoRegistroPonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet, frxExportPDF;

type
  TFAlteracaoRegistroPonto = class(TForm)
    pnBotoes: TPanel;
    sbDados: TScrollBox;
    lbHorariosRegistrados: TLabel;
    grDados: TDBGrid;
    btSalvar: TBitBtn;
    btFechar: TBitBtn;
    dsDados: TDataSource;
    btConsultar: TBitBtn;
    lbcdColaborador: TLabel;
    edcdColaborador: TDBCampoCodigo;
    eddtPonto: TDateTimePicker;
    lbdtPonto: TLabel;
    lbInserirHorario: TLabel;
    lbApagarHorario: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure dsDadosStateChange(Sender: TObject);
    procedure grDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFAlteracaoRegistroPonto: TFAlteracaoRegistroPonto;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes, UCampoCodigoGrid, UItemVariavelItensBloq;

{$R *.dfm}

procedure TFAlteracaoRegistroPonto.btFecharClick(Sender: TObject);
var
  Tab : TTabSheet;
begin
  dsDados.DataSet.Close;

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

procedure TFAlteracaoRegistroPonto.btConsultarClick(Sender: TObject);
begin
  if not edcdColaborador.ERPValorValido then
    Aviso('Informe um colaborador antes.')
  else if (FormatDateTime('dd/mm/yyyy', eddtPonto.Date) = '30/12/1899') then
    Aviso('Informe a data do ponto antes.')
  else
  begin
    if DmERP.qyColabPonto.Active then
      DmERP.qyColabPonto.Close;

    DmERP.qyColabPonto.MacroByName('filtro').Value := ' WHERE cdColaborador = ' + edcdColaborador.ERPEdCampoChaveText +
                                                      '   AND dtPonto = ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtPonto.DateTime));
    DmERP.qyColabPonto.Open();

    if DmERP.qyColabPonto.IsEmpty then
      Aviso('Não existem horários registrados para o colaborador informado na data especificada.');
  end;
end;

procedure TFAlteracaoRegistroPonto.btSalvarClick(Sender: TObject);
begin
  if (DmERP.qyColabPonto.Active) and (not DmERP.qyColabPonto.IsEmpty) and (DmERP.qyColabPonto.State in dsEditModes) then
    DmERP.qyColabPonto.Post;
end;

procedure TFAlteracaoRegistroPonto.dsDadosStateChange(Sender: TObject);
begin
  if (dsDados.State = dsInsert) and (edcdColaborador.ERPValorValido) then
    dsDados.DataSet.FieldByName('cdColaborador').AsInteger := StrToInt(edcdColaborador.ERPEdCampoChaveText);
end;

procedure TFAlteracaoRegistroPonto.FormCreate(Sender: TObject);
begin
  btSalvar.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_32X32');
  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance, 'IMGBTFECHAR_32X32');

  if DmERP.qyColabPonto.Active then
    DmERP.qyColabPonto.Close;
end;

procedure TFAlteracaoRegistroPonto.FormShow(Sender: TObject);
begin
  eddtPonto.DateTime := Trunc(DataHoraAtual(DmERP.fdConnERP));
  edcdColaborador.ERPEdCampoChaveSetFocus;
end;

procedure TFAlteracaoRegistroPonto.grDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if not dsDados.DataSet.IsEmpty then
    begin
      if Pergunta('Confirmar a exclusão do registro selecionado?') then
        dsDados.DataSet.Delete;
    end;
  end;
end;

initialization
  RegisterClass(TFAlteracaoRegistroPonto);

finalization
  UnRegisterClass(TFAlteracaoRegistroPonto);

end.
