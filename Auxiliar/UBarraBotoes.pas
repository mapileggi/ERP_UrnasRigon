unit UBarraBotoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.ComCtrls, Vcl.Menus;

type
  TFBarraBotoes = class(TFrame)
    sbBotoes: TScrollBox;
    btAnterior: TBitBtn;
    btProximo: TBitBtn;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btExluir: TBitBtn;
    btFechar: TBitBtn;
    dsDados: TDataSource;
    btImprimir: TBitBtn;
    pmImpressao: TPopupMenu;
    procedure dsDadosStateChange(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure HabilitaDesabilitaBotoes;
  end;

implementation

uses
  uDmERP, UTelaInicial;

{$R *.dfm}

procedure TFBarraBotoes.HabilitaDesabilitaBotoes;
begin
  btAnterior.Enabled := (dsDados.DataSet.Active) and
                        (not (dsDados.DataSet.IsEmpty)) and
                        (dsDados.DataSet.State = dsBrowse);
  btProximo.Enabled  := btAnterior.Enabled;
  btAlterar.Enabled  := btAnterior.Enabled;
  btExluir.Enabled   := btAnterior.Enabled;
  btNovo.Enabled     := (dsDados.DataSet.Active) and
                        (dsDados.DataSet.State = dsBrowse);
  btFechar.Enabled   := (dsDados.DataSet.State = dsBrowse) or (not dsDados.DataSet.Active);
  btSalvar.Enabled   := (dsDados.DataSet.Active) and
                        (dsDados.DataSet.State in dsEditModes);
  btCancelar.Enabled := btSalvar.Enabled;
end;

procedure TFBarraBotoes.btAlterarClick(Sender: TObject);
begin
  dsDados.DataSet.Edit;
end;

procedure TFBarraBotoes.btAnteriorClick(Sender: TObject);
begin
  dsDados.DataSet.Prior;
end;

procedure TFBarraBotoes.btCancelarClick(Sender: TObject);
begin
  dsDados.DataSet.Cancel;
end;

procedure TFBarraBotoes.btFecharClick(Sender: TObject);
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

//  Self.Parent.Free;
//  FTelaInicial.pcTelas.ActivePage.Free;

  FTelaInicial.pcTelas.Visible   := FTelaInicial.pcTelas.PageCount > 0;
  FTelaInicial.imLogoERP.Visible := not FTelaInicial.pcTelas.Visible;
end;

procedure TFBarraBotoes.btNovoClick(Sender: TObject);
begin
  dsDados.DataSet.Insert;
end;

procedure TFBarraBotoes.btProximoClick(Sender: TObject);
begin
  dsDados.DataSet.Next;
end;

procedure TFBarraBotoes.dsDadosStateChange(Sender: TObject);
begin
  HabilitaDesabilitaBotoes;
end;

end.
