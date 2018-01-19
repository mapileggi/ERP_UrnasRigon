unit URegistroPonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, frxClass, frxDBSet;

type
  TFRegistroPonto = class(TForm)
    lbnmColaborador: TLabel;
    ednmColaborador: TEdit;
    btRegistrar: TBitBtn;
    btFechar: TBitBtn;
    edDataHoraReg: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btRegistrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FRegistroPonto: TFRegistroPonto;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

procedure TFRegistroPonto.btFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFRegistroPonto.btRegistrarClick(Sender: TObject);
begin
  edDataHoraReg.Clear;

  if DmERP.RegistrarPonto then
    edDataHoraReg.Text := 'Ponto registrado às ' + DmERP.qyColabPonto.FieldByName('hrPonto').AsString;
end;

procedure TFRegistroPonto.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  btRegistrar.Glyph.LoadFromResourceName(HInstance, 'IMGBTSALVAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');

  dtAtual := DataHoraAtual(DmERP.fdConnERP);
end;

procedure TFRegistroPonto.FormShow(Sender: TObject);
begin
  ednmColaborador.Text := FTelaInicial.FnmUsuario;
end;

end.
