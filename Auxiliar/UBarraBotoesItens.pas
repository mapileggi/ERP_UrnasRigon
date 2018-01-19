unit UBarraBotoesItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB;

type
  TFBarraBotoesItens = class(TFrame)
    sbBotoes: TScrollBox;
    btAnterior: TBitBtn;
    btProximo: TBitBtn;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    btExluir: TBitBtn;
    dsDadosItens: TDataSource;
    procedure dsDadosItensStateChange(Sender: TObject);
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

{$R *.dfm}

procedure TFBarraBotoesItens.HabilitaDesabilitaBotoes;
begin
  btAnterior.Enabled := (dsDadosItens.DataSet.Active) and
                        (not (dsDadosItens.DataSet.IsEmpty)) and
                        (dsDadosItens.DataSet.State = dsBrowse);
  btProximo.Enabled  := btAnterior.Enabled;
  btAlterar.Enabled  := btAnterior.Enabled;
  btExluir.Enabled   := btAnterior.Enabled;
  btNovo.Enabled     := (dsDadosItens.DataSet.Active) and
                        (dsDadosItens.DataSet.State = dsBrowse);
  btSalvar.Enabled   := (dsDadosItens.DataSet.Active) and
                        (dsDadosItens.DataSet.State in dsEditModes);
  btCancelar.Enabled := btSalvar.Enabled;
end;

procedure TFBarraBotoesItens.btAlterarClick(Sender: TObject);
begin
  dsDadosItens.DataSet.Edit;
end;

procedure TFBarraBotoesItens.btAnteriorClick(Sender: TObject);
begin
  dsDadosItens.DataSet.Prior;
end;

procedure TFBarraBotoesItens.btCancelarClick(Sender: TObject);
begin
  dsDadosItens.DataSet.Cancel;
end;

procedure TFBarraBotoesItens.btNovoClick(Sender: TObject);
begin
  dsDadosItens.DataSet.Insert;
end;

procedure TFBarraBotoesItens.btProximoClick(Sender: TObject);
begin
  dsDadosItens.DataSet.Next;
end;

procedure TFBarraBotoesItens.dsDadosItensStateChange(Sender: TObject);
begin
  HabilitaDesabilitaBotoes;
end;

end.
