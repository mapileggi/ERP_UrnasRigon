unit UUsuariosConectados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons,
  UDBCampoCodigo, MemDS, VirtualTable, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFUsuariosConectados = class(TForm)
    dsDados: TDataSource;
    pnCampos: TPanel;
    pnGrid: TPanel;
    grDados: TDBGrid;
    gbFiltros: TGroupBox;
    lbdtConexao: TLabel;
    eddtConexaoIni: TDateTimePicker;
    lbdtConexaoA: TLabel;
    eddtConexaoFim: TDateTimePicker;
    btConsultar: TBitBtn;
    btFechar: TBitBtn;
    vtUsuariosConectados: TVirtualTable;
    vtUsuariosConectadoscdUsuario: TIntegerField;
    vtUsuariosConectadosnmUsuario: TStringField;
    vtUsuariosConectadosnmComputador: TStringField;
    vtUsuariosConectadosdeIp: TStringField;
    vtUsuariosConectadosdtConexao: TDateField;
    vtUsuariosConectadoshrConexao: TStringField;
    vtUsuariosConectadoscdUsuarioConexao: TIntegerField;
    lbcdUsuario: TLabel;
    edcdUsuario: TDBCampoCodigo;
    cbSomenteUltimaConexaoDia: TCheckBox;
    cbSomenteUsuariosAtivMoment: TCheckBox;
    lbAvisoChat: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
  private
    procedure AplicarFiltro;
    procedure MudarComEnter(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  FUsuariosConectados: TFUsuariosConectados;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes, UUsuarioChat;

{$R *.dfm}

procedure TFUsuariosConectados.MudarComEnter(var Msg: TMsg; var Handled: Boolean);
begin
   if not (
           (Screen.ActiveControl is TCustomMemo) or   // se não for um memo
           (Screen.ActiveControl is TDBLookupComboBox) or  // se não for um DbLookup
          // (Screen.ActiveControl is TCustomGrid) or // se não for uma grid o controle mudara com enter
           (Screen.ActiveForm.ClassName = 'TMessageForm')
          ) then
   begin
     if Msg.message = WM_KEYDOWN then
      begin
        case Msg.wParam of
        VK_RETURN,VK_DOWN : Screen.ActiveForm.Perform(WM_NextDlgCtl,0,0);   //,VK_TAB
        VK_UP             : Screen.ActiveForm.Perform(WM_NextDlgCtl,1,0);
        end;
      end;
   end;
end;

procedure TFUsuariosConectados.btConsultarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFUsuariosConectados.btFecharClick(Sender: TObject);
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

procedure TFUsuariosConectados.AplicarFiltro;
var
  sWhere : String;
  i      : Integer;
begin
  if not vtUsuariosConectados.Active then
    vtUsuariosConectados.Open;

  vtUsuariosConectados.Clear;

  if (DmERP.qyUsuarioConexao.Active) then
    DmERP.qyUsuarioConexao.Close;

  DmERP.qyUsuarioConexao.MacroByName('filtro').Clear;

  sWhere := ' flConectado = ''S'' ';

  if cbSomenteUsuariosAtivMoment.Checked then
    AdicionaCondSql(sWhere,
                    ' u.cdUsuarioConexao > COALESCE( ' +
                    '                               ( ' +
                    '                                SELECT MAX(x.cdUsuarioConexao) ' +
                    '                                  FROM erp.usuarioConexao x ' +
                    '                                 WHERE x.flConectado = ''N'' ' +
                    '                                   AND x.cdUsuario = u.cdUsuario ' +
                    '                                   AND x.nmComputador = u.nmComputador ' +
                    '                                   AND x.dtConexao = u.dtConexao ' +
                    '                               ), 0 ' +
                    '                              ) '
                   );

  if (eddtConexaoIni.Checked) and
     (eddtConexaoFim.Checked) and
     (FormatDateTime('dd/mm/yyyy', eddtConexaoIni.Date) <> '30/12/1899') and
     (FormatDateTime('dd/mm/yyyy', eddtConexaoFim.Date) <> '30/12/1899') then
    AdicionaCondSql(sWhere,
                    ' dtConexao BETWEEN ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtConexaoIni.DateTime)) +
                    '               AND ' + QuotedStr(FormatDateTime('dd/mm/yyyy', eddtConexaoFim.DateTime))
                   );

  if (Trim(edcdUsuario.ERPEdCampoChaveText) <> '') and (edcdUsuario.ERPValorValido) then
    AdicionaCondSql(sWhere, ' cdUsuario = ' + QuotedStr(edcdUsuario.ERPEdCampoChaveText));

  if cbSomenteUltimaConexaoDia.Checked then
    AdicionaCondSql(sWhere,
                    ' u.hrConexao = ( ' +
                    '                SELECT MAX(x.hrConexao) ' +
                    '                  FROM erp.usuarioConexao x ' +
                    '                 WHERE x.cdUsuario = u.cdUsuario ' +
                    '                   AND x.dtConexao = u.dtConexao ' +
                    '               ) '
                   );

  if Trim(sWhere) <> '' then
    sWhere := ' WHERE ' + sWhere;

  DmERP.qyUsuarioConexao.MacroByName('filtro').Value := sWhere;

  DmERP.qyUsuarioConexao.Open();

  if not DmERP.qyUsuarioConexao.IsEmpty then
  begin
    vtUsuariosConectados.DisableControls;

    try
      DmERP.qyUsuarioConexao.First;

      while not DmERP.qyUsuarioConexao.Eof do
      begin
        vtUsuariosConectados.Append;

        for i := 0 to DmERP.qyUsuarioConexao.FieldCount - 1 do
        begin
          if Assigned(vtUsuariosConectados.FindField(DmERP.qyUsuarioConexao.Fields.Fields[i].FieldName)) then
            vtUsuariosConectados.FieldByName(DmERP.qyUsuarioConexao.Fields.Fields[i].FieldName).Value := DmERP.qyUsuarioConexao.Fields.Fields[i].Value;
        end;

        vtUsuariosConectados.FieldByName('hrConexao').AsString := DmERP.qyUsuarioConexao.FieldByName('dehrConexao').AsString;
        vtUsuariosConectados.FieldByName('nmUsuario').AsString := DmERP.qyUsuarioConexao.FieldByName('nmUsuCon').AsString;

        vtUsuariosConectados.Post;

        DmERP.qyUsuarioConexao.Next;
      end;
    finally
      vtUsuariosConectados.EnableControls;
      vtUsuariosConectados.First;
    end;
  end;

  DmERP.qyUsuarioConexao.Close;

  if vtUsuariosConectados.IsEmpty then
    Aviso('Não existem conexões com os filtros informados.');
end;

procedure TFUsuariosConectados.FormCreate(Sender: TObject);
var
  dtAtual : TDateTime;
begin
  Application.OnMessage := MudarComEnter;

  btConsultar.Glyph.LoadFromResourceName(HInstance, 'IMGBTCONSULTAR_32X32');
  btFechar.Glyph.LoadFromResourceName(HInstance,    'IMGBTFECHAR_32X32');

  dtAtual                    := DataHoraAtual(DmERP.fdConnERP);

  eddtConexaoIni.DateTime    := dtAtual;
  eddtConexaoFim.DateTime    := dtAtual;
end;

procedure TFUsuariosConectados.FormShow(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFUsuariosConectados.grDadosDblClick(Sender: TObject);
begin
{  FUsuarioChat := TFUsuarioChat.Create(Application);

  try
    FUsuarioChat.FiUsuarioDestino := vtUsuariosConectados.FieldByName('cdUsuario').AsInteger;
    FUsuarioChat.Caption          := 'Chat com ' + vtUsuariosConectados.FieldByName('nmUsuario').AsString;
    FUsuarioChat.ShowModal;
  finally
    FreeAndNil(FUsuarioChat);
  end;   }
end;

initialization
  RegisterClass(TFUsuariosConectados);

finalization
  UnRegisterClass(TFUsuariosConectados);

end.
