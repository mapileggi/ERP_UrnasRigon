unit UFatDiarioCadastro;

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
  TFFatDiarioCadastro = class(TFFormCadastro)
    lbcdFatDiario: TLabel;
    lbcdEmpresa: TLabel;
    lbdtMovimento: TLabel;
    lbvlFaturado: TLabel;
    edcdEmpresa: TDBCampoCodigo;
    edcdFatDiario: TDBCampoCodigo;
    edvlFaturado: TDBEdit;
    eddtMovimento: TDBDateTime;
    dbRelFatDiario: TfrxDBDataset;
    relFatDiario: TfrxReport;
    qyFatDiarioRel: TFDQuery;
    gbRelatorio: TGroupBox;
    btImprimir: TBitBtn;
    eddtMovIni: TDateTimePicker;
    lbdtMovIni: TLabel;
    eddtMovFim: TDateTimePicker;
    lbdtMovA: TLabel;
    procedure btImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
  public
    { Public declarations }
  end;

var
  FFatDiarioCadastro: TFFatDiarioCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFFatDiarioCadastro.GravarRegistro;
begin
  DmERP.GravarFatDiario;
end;

procedure TFFatDiarioCadastro.btImprimirClick(Sender: TObject);
begin
  inherited;

  if qyFatDiarioRel.Active then
    qyFatDiarioRel.Close;

  qyFatDiarioRel.MacroByName('filtro').Value := ' WHERE dtMovimento BETWEEN ' + QuotedStr(DateTimeToStr(eddtMovIni.DateTime)) +
                                                ' AND ' + QuotedStr(DateTimeToStr(eddtMovFim.DateTime));
  qyFatDiarioRel.Open();

  if not qyFatDiarioRel.IsEmpty then
  begin
    relFatDiario.PrepareReport();

    if (FileExists(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg') and (relFatDiario.FindComponent('picLogoEmp') <> nil)) then
      TfrxPictureView(relFatDiario.FindComponent('picLogoEmp')).Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\LogoLogin.jpg');

    relFatDiario.ShowReport();
  end;
end;

procedure TFFatDiarioCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirFatDiario;
end;

procedure TFFatDiarioCadastro.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  inherited;

  btImprimir.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');

  dtAtual         := DataHoraAtual(DmERP.fdConnERP);
  dtAtual         := Trunc(dtAtual);
  eddtMovIni.Date := StrToDate('01/01/' + IntToStr(YearOf(dtAtual)));
  eddtMovFim.Date := StrToDate('31/12/' + IntToStr(YearOf(dtAtual)));
end;

initialization
  RegisterClass(TFFatDiarioCadastro);

finalization
  UnRegisterClass(TFFatDiarioCadastro);

end.
