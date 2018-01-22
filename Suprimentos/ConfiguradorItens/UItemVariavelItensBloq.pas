unit UItemVariavelItensBloq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TFItemVariavelItensBloq = class(TForm)
    grLiberados: TDBGrid;
    grBloqueados: TDBGrid;
    btBloquear: TButton;
    btLiberar: TButton;
    btBloquearTodos: TButton;
    btLiberarTodos: TButton;
    dsLiberados: TDataSource;
    dsBloqueados: TDataSource;
    procedure btBloquearClick(Sender: TObject);
    procedure btLiberarClick(Sender: TObject);
    procedure btBloquearTodosClick(Sender: TObject);
    procedure btLiberarTodosClick(Sender: TObject);
  private
    FicdVariavel : Integer;

    procedure RecarregarVarItens;
    procedure BloquearVariavelItem;
    procedure LiberarVariavelItem;
  public
    FsItem : String;
  end;

var
  FItemVariavelItensBloq: TFItemVariavelItensBloq;

implementation

{$R *.dfm}

uses
  UTelaInicial, uDmERP, uFuncoes;

procedure TFItemVariavelItensBloq.btBloquearClick(Sender: TObject);
begin
  BloquearVariavelItem;
  RecarregarVarItens;
end;

procedure TFItemVariavelItensBloq.BloquearVariavelItem;
var
  dthrAtual : TDateTime;
begin
  if not DmERP.qyItemVarItensLib.IsEmpty then
  begin
    DmERP.qyItemVariavelItensBloq.Insert;
    DmERP.qyItemVariavelItensBloq.FieldByName('cdItem').AsString             := FsItem;
    DmERP.qyItemVariavelItensBloq.FieldByName('cdVariavel').AsInteger        := DmERP.qyItemVarItensLib.FieldByName('cdVariavel').AsInteger;
    DmERP.qyItemVariavelItensBloq.FieldByName('cdVariavelItem').AsInteger    := DmERP.qyItemVarItensLib.FieldByName('cdVariavelItem').AsInteger;

    dthrAtual := DataHoraAtual(DmERP.fdConnERP);

    DmERP.qyItemVariavelItensBloq.FieldByName('cdUsuarioCadastro').AsInteger := FTelaInicial.FcdUsuario;
    DmERP.qyItemVariavelItensBloq.FieldByName('dtCadastro').AsDateTime       := Trunc(dthrAtual);
    DmERP.qyItemVariavelItensBloq.FieldByName('hrCadastro').AsInteger        := HoraParaMinutos(dthrAtual);

    DmERP.qyItemVariavelItensBloq.Post;

    FicdVariavel := DmERP.qyItemVariavelItensBloq.FieldByName('cdVariavel').AsInteger;
  end;
end;

procedure TFItemVariavelItensBloq.btBloquearTodosClick(Sender: TObject);
begin
  if not DmERP.qyItemVarItensLib.IsEmpty then
  begin
    try
      DmERP.qyItemVariavelItensBloq.DisableControls;
      DmERP.qyItemVarItensLib.DisableControls;

      DmERP.qyItemVarItensLib.First;

      while not DmERP.qyItemVarItensLib.Eof do
      begin
        BloquearVariavelItem;

        DmERP.qyItemVarItensLib.Next;
      end;
    finally
      RecarregarVarItens;

      DmERP.qyItemVariavelItensBloq.EnableControls;
      DmERP.qyItemVarItensLib.EnableControls;
    end;
  end;
end;

procedure TFItemVariavelItensBloq.btLiberarClick(Sender: TObject);
begin
  LiberarVariavelItem;
  RecarregarVarItens;
end;

procedure TFItemVariavelItensBloq.btLiberarTodosClick(Sender: TObject);
begin
  if (DmERP.qyItemVariavelItensBloq.Active) and (not DmERP.qyItemVariavelItensBloq.IsEmpty) then
  begin
    try
      DmERP.qyItemVariavelItensBloq.DisableControls;
      DmERP.qyItemVarItensLib.DisableControls;

      DmERP.qyItemVariavelItensBloq.Last;

      while not DmERP.qyItemVariavelItensBloq.Bof do
      begin
        LiberarVariavelItem;

        DmERP.qyItemVariavelItensBloq.Next;
      end;
    finally
      RecarregarVarItens;
      DmERP.qyItemVariavelItensBloq.EnableControls;
      DmERP.qyItemVarItensLib.EnableControls;
    end;
  end;
end;

procedure TFItemVariavelItensBloq.LiberarVariavelItem;
begin
  if (DmERP.qyItemVariavelItensBloq.Active) and (not DmERP.qyItemVariavelItensBloq.IsEmpty) then
  begin
    FicdVariavel := DmERP.qyItemVariavelItensBloq.FieldByName('cdVariavel').AsInteger;

    DmERP.qyItemVariavelItensBloq.Delete;
  end;
end;

procedure TFItemVariavelItensBloq.RecarregarVarItens;
begin
  if DmERP.qyItemVarItensLib.Active then
    DmERP.qyItemVarItensLib.Close;

  DmERP.qyItemVarItensLib.ParamByName('cdItem').AsString      := FsItem;
  DmERP.qyItemVarItensLib.ParamByName('cdVariavel').AsInteger := FicdVariavel;
  DmERP.qyItemVarItensLib.Open();

  if DmERP.qyItemVariavelItensBloq.Active then
    DmERP.qyItemVariavelItensBloq.Close;

  DmERP.qyItemVariavelItensBloq.MacroByName('filtro').Value := ' WHERE cdItem = ' + QuotedStr(FsItem) +
                                                               '   AND cdVariavel = ' + IntToStr(FicdVariavel);
  DmERP.qyItemVariavelItensBloq.Open();
end;

end.
