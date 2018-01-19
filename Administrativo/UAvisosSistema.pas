unit UAvisosSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFAvisosSistema = class(TForm)
    pcQuadroAvisos: TPageControl;
    tsAviso1: TTabSheet;
    dsAviso1: TDataSource;
    qyAviso1: TFDQuery;
    grAviso1: TDBGrid;
    pnAviso1: TPanel;
    lbAviso1: TLabel;
    tsAviso2: TTabSheet;
    pnAviso2: TPanel;
    lbAviso2: TLabel;
    grAviso2: TDBGrid;
    dsAviso2: TDataSource;
    qyAviso2: TFDQuery;
    tsAviso3: TTabSheet;
    pnAviso3: TPanel;
    lbAviso3: TLabel;
    grAviso3: TDBGrid;
    dsAviso3: TDataSource;
    qyAviso3: TFDQuery;
    tsAviso4: TTabSheet;
    pnAviso4: TPanel;
    lbAviso4: TLabel;
    grAviso4: TDBGrid;
    dsAviso4: TDataSource;
    qyAviso4: TFDQuery;
    tsAviso5: TTabSheet;
    pnAviso5: TPanel;
    lbAviso5: TLabel;
    grAviso5: TDBGrid;
    dsAviso5: TDataSource;
    qyAviso5: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure grAviso1DblClick(Sender: TObject);
    procedure grAviso2DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure grAviso3DblClick(Sender: TObject);
    procedure grAviso4DblClick(Sender: TObject);
    procedure grAviso5DblClick(Sender: TObject);
  private
    stSemCampos : TStringList;
    procedure CarregarAvisos;
    function ExibeQuadroAviso(const snmForm : String) : Boolean;
  public
    { Public declarations }
  end;

var
  FAvisosSistema: TFAvisosSistema;

implementation

uses
  uDmERP, uFuncoes, uTelaInicial;

{$R *.dfm}

procedure TFAvisosSistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(stSemCampos) then
    FreeAndNil(stSemCampos);
end;

procedure TFAvisosSistema.FormCreate(Sender: TObject);
begin
  stSemCampos := TStringList.Create;
end;

procedure TFAvisosSistema.FormShow(Sender: TObject);
begin
  CarregarAvisos;
end;

function TFAvisosSistema.ExibeQuadroAviso(const snmForm : String) : Boolean;
begin
  Result := False;

  if DmERP.qyPermissaoUsuario.Active then
    DmERP.qyPermissaoUsuario.Close;

  DmERP.qyPermissaoUsuario.MacroByName('filtro').Value := ' AND ut.flExibeQuadroAviso = ''S'' ' +
                                                          ' AND t.nmForm = ' + QuotedStr(snmForm);
  DmERP.qyPermissaoUsuario.ParamByName('cdUsuario').AsInteger := FTelaInicial.FcdUsuario;
  DmERP.qyPermissaoUsuario.Open();

  Result := not DmERP.qyPermissaoUsuario.IsEmpty;
end;

procedure TFAvisosSistema.CarregarAvisos;
begin
  DmERP.qyAviso.First;

  while not DmERP.qyAviso.Eof do
  begin
    if DmERP.qyAviso.FieldByName('cdAviso').AsInteger = 1 then
    begin
      if qyAviso1.Active then
        qyAviso1.Close;

      qyAviso1.SQL.Clear;
      qyAviso1.SQL.Text := DmERP.qyAviso.FieldByName('deSql').AsString;
      qyAviso1.Open();

      tsAviso1.Caption := DmERP.qyAviso.FieldByName('deTituloAviso').AsString;
      lbAviso1.Caption := DmERP.qyAviso.FieldByName('deAviso').AsString;

      tsAviso1.TabVisible := (not qyAviso1.IsEmpty) and (ExibeQuadroAviso(DmERP.qyAviso.FieldByName('nmForm').AsString));
    end
    else if DmERP.qyAviso.FieldByName('cdAviso').AsInteger = 2 then
    begin
      if qyAviso2.Active then
        qyAviso2.Close;

      qyAviso2.SQL.Clear;
      qyAviso2.SQL.Text := DmERP.qyAviso.FieldByName('deSql').AsString;
      qyAviso2.Open();

      tsAviso2.Caption := DmERP.qyAviso.FieldByName('deTituloAviso').AsString;
      lbAviso2.Caption := DmERP.qyAviso.FieldByName('deAviso').AsString;

      tsAviso2.TabVisible := (not qyAviso2.IsEmpty) and (ExibeQuadroAviso(DmERP.qyAviso.FieldByName('nmForm').AsString));
    end
    else if DmERP.qyAviso.FieldByName('cdAviso').AsInteger = 3 then
    begin
      if qyAviso3.Active then
        qyAviso3.Close;

      qyAviso3.SQL.Clear;
      qyAviso3.SQL.Text := DmERP.qyAviso.FieldByName('deSql').AsString;
      qyAviso3.Open();

      tsAviso3.Caption := DmERP.qyAviso.FieldByName('deTituloAviso').AsString;
      lbAviso3.Caption := DmERP.qyAviso.FieldByName('deAviso').AsString;

      tsAviso3.TabVisible := (not qyAviso3.IsEmpty) and (ExibeQuadroAviso(DmERP.qyAviso.FieldByName('nmForm').AsString));
    end
    else if DmERP.qyAviso.FieldByName('cdAviso').AsInteger = 4 then
    begin
      if qyAviso4.Active then
        qyAviso4.Close;

      qyAviso4.SQL.Clear;
      qyAviso4.SQL.Text := DmERP.qyAviso.FieldByName('deSql').AsString;
      qyAviso4.Open();

      tsAviso4.Caption := DmERP.qyAviso.FieldByName('deTituloAviso').AsString;
      lbAviso4.Caption := DmERP.qyAviso.FieldByName('deAviso').AsString;

      tsAviso4.TabVisible := (not qyAviso4.IsEmpty) and (ExibeQuadroAviso(DmERP.qyAviso.FieldByName('nmForm').AsString));
    end
    else if DmERP.qyAviso.FieldByName('cdAviso').AsInteger = 5 then
    begin
      if qyAviso5.Active then
        qyAviso5.Close;

      qyAviso5.SQL.Clear;
      qyAviso5.SQL.Text := DmERP.qyAviso.FieldByName('deSql').AsString;
      qyAviso5.Open();

      tsAviso5.Caption := DmERP.qyAviso.FieldByName('deTituloAviso').AsString;
      lbAviso5.Caption := DmERP.qyAviso.FieldByName('deAviso').AsString;

      tsAviso5.TabVisible := (not qyAviso5.IsEmpty) and (ExibeQuadroAviso(DmERP.qyAviso.FieldByName('nmForm').AsString));
    end;

    DmERP.qyAviso.Next;
  end;

  if not qyAviso1.IsEmpty then
  begin
    pcQuadroAvisos.ActivePage := tsAviso1;

    if (grAviso1.Visible) and (grAviso1.CanFocus) then
      grAviso1.SetFocus;
  end
  else if not qyAviso2.IsEmpty then
  begin
    pcQuadroAvisos.ActivePage := tsAviso2;

    if (grAviso2.Visible) and (grAviso2.CanFocus) then
      grAviso2.SetFocus;
  end
  else if not qyAviso3.IsEmpty then
  begin
    pcQuadroAvisos.ActivePage := tsAviso3;

    if (grAviso3.Visible) and (grAviso3.CanFocus) then
      grAviso3.SetFocus;
  end
  else if not qyAviso4.IsEmpty then
  begin
    pcQuadroAvisos.ActivePage := tsAviso4;

    if (grAviso4.Visible) and (grAviso4.CanFocus) then
      grAviso4.SetFocus;
  end
  else if not qyAviso5.IsEmpty then
  begin
    pcQuadroAvisos.ActivePage := tsAviso5;

    if (grAviso5.Visible) and (grAviso5.CanFocus) then
      grAviso5.SetFocus;
  end;
end;

procedure TFAvisosSistema.grAviso1DblClick(Sender: TObject);
begin
  DmERP.qyAviso.First;

  if DmERP.qyAviso.Locate('cdAviso;flAtivo',
                          VarArrayOf([1, 'S']),
                          []
                         ) then
  begin
    if (qyAviso1.FieldByName('cdAviso').AsFloat > 0) then
      FTelaInicial.AbrirTela(DmERP.qyAviso.FieldByName('nmForm').AsString,
                             DmERP.qyAviso.FieldByName('nmCampoChave').AsString,
                             qyAviso1.FieldByName('cdAviso').AsString,
                             stSemCampos
                            );
  end;
end;

procedure TFAvisosSistema.grAviso2DblClick(Sender: TObject);
begin
  DmERP.qyAviso.First;

  if DmERP.qyAviso.Locate('cdAviso;flAtivo',
                          VarArrayOf([2, 'S']),
                          []
                         ) then
  begin
    if (qyAviso2.FieldByName('cdAviso').AsFloat > 0) then
      FTelaInicial.AbrirTela(DmERP.qyAviso.FieldByName('nmForm').AsString,
                             DmERP.qyAviso.FieldByName('nmCampoChave').AsString,
                             qyAviso2.FieldByName('cdAviso').AsString,
                             stSemCampos
                            );
  end;
end;

procedure TFAvisosSistema.grAviso3DblClick(Sender: TObject);
begin
  DmERP.qyAviso.First;

  if DmERP.qyAviso.Locate('cdAviso;flAtivo',
                          VarArrayOf([3, 'S']),
                          []
                         ) then
  begin
    if (qyAviso3.FieldByName('cdAviso').AsFloat > 0) then
      FTelaInicial.AbrirTela(DmERP.qyAviso.FieldByName('nmForm').AsString,
                             DmERP.qyAviso.FieldByName('nmCampoChave').AsString,
                             qyAviso3.FieldByName('cdAviso').AsString,
                             stSemCampos
                            );
  end;
end;

procedure TFAvisosSistema.grAviso4DblClick(Sender: TObject);
begin
  DmERP.qyAviso.First;

  if DmERP.qyAviso.Locate('cdAviso;flAtivo',
                          VarArrayOf([4, 'S']),
                          []
                         ) then
  begin
    if (qyAviso4.FieldByName('cdAviso').AsFloat > 0) then
      FTelaInicial.AbrirTela(DmERP.qyAviso.FieldByName('nmForm').AsString,
                             DmERP.qyAviso.FieldByName('nmCampoChave').AsString,
                             qyAviso4.FieldByName('cdAviso').AsString,
                             stSemCampos
                            );
  end;
end;

procedure TFAvisosSistema.grAviso5DblClick(Sender: TObject);
begin
  DmERP.qyAviso.First;

  if DmERP.qyAviso.Locate('cdAviso;flAtivo',
                          VarArrayOf([5, 'S']),
                          []
                         ) then
  begin
    if (qyAviso5.FieldByName('cdAviso').AsFloat > 0) then
      FTelaInicial.AbrirTela(DmERP.qyAviso.FieldByName('nmForm').AsString,
                             DmERP.qyAviso.FieldByName('nmCampoChave').AsString,
                             qyAviso5.FieldByName('cdAviso').AsString,
                             stSemCampos
                            );
  end;
end;

initialization
  RegisterClass(TFAvisosSistema);

finalization
  UnRegisterClass(TFAvisosSistema);

end.
