unit UReciboAvulsoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, Data.DB,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, UDBDateTime,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, UBarraBotoesItens, Vcl.Menus, frxClass,
  frxDBSet, MemDS, VirtualTable;

type
  TFReciboAvulsoCadastro = class(TFFormCadastro)
    lbcdReciboAvulso: TLabel;
    edcdReciboAvulso: TDBCampoCodigo;
    lbdeHrCadastro: TLabel;
    lbdtCadastro: TLabel;
    lbnmUsuCad: TLabel;
    lbdeHrSlteracao: TLabel;
    lbdtAlteracao: TLabel;
    lbnmUsuAlt: TLabel;
    eddeHrCadastro: TDBEdit;
    eddtCadastro: TDBDateTime;
    ednmUsuCad: TDBEdit;
    eddeHrSlteracao: TDBEdit;
    eddtAlteracao: TDBDateTime;
    ednmUsuAlt: TDBEdit;
    pmiFichaAdm: TMenuItem;
    relReciboAvulso: TfrxReport;
    dbReciboAvulso: TfrxDBDataset;
    lbcdEmpresa: TLabel;
    edcdEmpresa: TDBCampoCodigo;
    lbvlReciboAvulso: TLabel;
    edvlReciboAvulso: TDBEdit;
    lbcdCidade: TLabel;
    edcdCidade: TDBCampoCodigo;
    lbdeEndereco: TLabel;
    dedeEndereco: TDBEdit;
    lbnmRecebedor: TLabel;
    ednmRecebedor: TDBEdit;
    lbdtReciboAvulso: TLabel;
    eddtReciboAvulso: TDBDateTime;
    edcdColaborador: TDBCampoCodigo;
    lbcdColaborador: TLabel;
    lbdeCpfCnpj: TLabel;
    eddeCpfCnpj: TDBEdit;
    lbdeReciboAvulso: TLabel;
    mdeReciboAvulso: TDBMemo;
    vtReciboAvulso: TVirtualTable;
    vtReciboAvulsocdCodigo: TIntegerField;
    vtReciboAvulsocdReciboAvulso: TIntegerField;
    vtReciboAvulsodeReciboAvulso: TStringField;
    vtReciboAvulsovlReciboAvulso: TFloatField;
    vtReciboAvulsodtReciboAvulso: TDateField;
    vtReciboAvulsonmRecebedor: TStringField;
    vtReciboAvulsodeCpfCnpjMasc: TStringField;
    vtReciboAvulsodeEndereco: TStringField;
    vtReciboAvulsocdEmpresa: TIntegerField;
    vtReciboAvulsonmEmpresa: TStringField;
    vtReciboAvulsonmCidade: TStringField;
    procedure FormCreate(Sender: TObject);
    function relReciboAvulsoUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure eddeCpfCnpjExit(Sender: TObject);
    procedure edcdColaboradorERPOnEdCampoChaveExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrBarraBotoesbtSalvarClick(Sender: TObject);
    procedure FrBarraBotoesbtFecharClick(Sender: TObject);
    procedure FrBarraBotoesdsDadosStateChange(Sender: TObject);
  private
    FsNomeRecebedor,
    FsReciboAvulso  : String;
    FdReciboAvulso  : Double;

    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    function UsuarioDataHoraImpressao : String;
    function DataExtenso : String;
    function ValorExtenso : String;
    procedure ImprimirRecibo;
    procedure NovoRegistro;
  public
    { Public declarations }
  end;

var
  FReciboAvulsoCadastro: TFReciboAvulsoCadastro;

implementation

uses
  uDmERP, UTelaInicial, uFuncoes;

{$R *.dfm}

function TFReciboAvulsoCadastro.UsuarioDataHoraImpressao : String;
var
  dthrAtual : TDateTime;
begin
  dthrAtual := DataHoraAtual(DmERP.fdConnERP);

  Result := IntToStr(FTelaInicial.FcdUsuario) + ' - ' + FTelaInicial.FnmUsuario + '. ' +
            'Data/Hora: ' + FormatDateTime('dd/mm/yyyy', dthrAtual) + ' - ' + FormatDateTime('hh:mm', dthrAtual);
end;

function TFReciboAvulsoCadastro.DataExtenso : String;
const
  arrMes : array[1..12] of string = ('Janeiro', 'Fevereiro',
  'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto',
  'Setembro', 'Outubro', 'Novembro', 'Dezembro');
var
  wDia, wMes, wAno : Word;
begin
  DecodeDate(DmERP.qyReciboAvulsoRel.FieldByName('dtReciboAvulso').AsDateTime, wAno, wMes, wDia);

  Result := IntToStr(wDia) + ' de ' + arrMes[wMes] + ' de ' + IntToStr(wAno) + '.';
end;

function TFReciboAvulsoCadastro.ValorExtenso : String;
begin
  Result := ValorPorExtenso(DmERP.qyReciboAvulsoRel.FieldByName('vlReciboAvulso').AsFloat);
  Result := UpperCase(Copy(Result, 1, 1)) + Copy(Result, 2, Length(Result));
end;

procedure TFReciboAvulsoCadastro.GravarRegistro;
begin
  DmERP.GravarReciboAvulso;
end;

function TFReciboAvulsoCadastro.relReciboAvulsoUserFunction(
  const MethodName: string; var Params: Variant): Variant;
begin
  inherited;

  if SameText(MethodName, 'UsuarioDataHoraImpressao') then
    Result := UsuarioDataHoraImpressao;

  if SameText(MethodName, 'DataExtenso') then
    Result := DataExtenso;

  if SameText(MethodName, 'ValorExtenso') then
    Result := ValorExtenso;
end;

procedure TFReciboAvulsoCadastro.edcdColaboradorERPOnEdCampoChaveExit(
  Sender: TObject);
begin
  inherited;

  if (StrToIntDef(edcdColaborador.ERPEdCampoChaveDBText, 0) > 0) and (edcdColaborador.ERPValorValido) then
  begin
    if DmERP.qyColaboradorRel.Active then
      DmERP.qyColaboradorRel.Close;

    DmERP.qyColaboradorRel.MacroByName('filtro').Clear;
    DmERP.qyColaboradorRel.MacroByName('filtro').Value := ' WHERE cdColaborador = ' + DmERP.qyReciboAvulso.FieldByName('cdColaborador').AsString;
    DmERP.qyColaboradorRel.Open();

    if not DmERP.qyColaboradorRel.IsEmpty then
    begin
      DmERP.qyReciboAvulso.FieldByName('nmRecebedor').AsString := DmERP.qyColaboradorRel.FieldByName('nmColaborador').AsString;

      if DmERP.qyColaboradorRel.FieldByName('cdEmpresa').AsInteger > 0 then
        DmERP.qyReciboAvulso.FieldByName('cdEmpresa').AsInteger := DmERP.qyColaboradorRel.FieldByName('cdEmpresa').AsInteger;

      if DmERP.qyColaboradorRel.FieldByName('cdCidadeEmp').AsInteger > 0 then
        DmERP.qyReciboAvulso.FieldByName('cdCidade').AsInteger := DmERP.qyColaboradorRel.FieldByName('cdCidadeEmp').AsInteger;

      if Trim(DmERP.qyColaboradorRel.FieldByName('deCpf').AsString) <> '' then
        DmERP.qyReciboAvulso.FieldByName('deCpfCnpj').AsString := DmERP.qyColaboradorRel.FieldByName('deCpf').AsString;

      DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString  := DmERP.qyColaboradorRel.FieldByName('deEndereco').AsString +
                                                                  ', nº ' + DmERP.qyColaboradorRel.FieldByName('nuEndereco').AsString;

      if Trim(DmERP.qyColaboradorRel.FieldByName('deComplemento').AsString) <> '' then
        DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString := DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString +
                                                                   ' ' + DmERP.qyColaboradorRel.FieldByName('deComplemento').AsString;

      if Trim(DmERP.qyColaboradorRel.FieldByName('deBairro').AsString) <> '' then
        DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString := DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString +
                                                                   ' Bairro ' + DmERP.qyColaboradorRel.FieldByName('deBairro').AsString;

      if Trim(DmERP.qyColaboradorRel.FieldByName('nmCidade').AsString) <> '' then
        DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString := DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString +
                                                                   ' ' + DmERP.qyColaboradorRel.FieldByName('nmCidade').AsString;

      if Trim(DmERP.qyColaboradorRel.FieldByName('sgEstado').AsString) <> '' then
        DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString := DmERP.qyReciboAvulso.FieldByName('deEndereco').AsString +
                                                                   '/' + DmERP.qyColaboradorRel.FieldByName('sgEstado').AsString;
    end;

    DmERP.qyColaboradorRel.Close;
  end;
end;

procedure TFReciboAvulsoCadastro.eddeCpfCnpjExit(Sender: TObject);
begin
  inherited;
       {
  if Length(DmERP.qyReciboAvulso.FieldByName('deCpfCnpj').AsString) = 14 then
    DmERP.qyReciboAvulso.FieldByName('deCpfCnpj').EditMask := '99.999.999/9999-99;0;_'
  else
    DmERP.qyReciboAvulso.FieldByName('deCpfCnpj').EditMask := '999.999.999-99;0;_';   }
end;

procedure TFReciboAvulsoCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirReciboAvulso;
end;

procedure TFReciboAvulsoCadastro.FormCreate(Sender: TObject);
begin
  inherited;

  relReciboAvulso.AddFunction('function UsuarioDataHoraImpressao : String', 'Sistema');
  relReciboAvulso.AddFunction('function DataExtenso : String', 'Sistema');
  relReciboAvulso.AddFunction('function ValorExtenso : String', 'Sistema');

  FrBarraBotoes.btSalvar.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMPRIMIR_32X32');
end;

procedure TFReciboAvulsoCadastro.FormShow(Sender: TObject);
begin
  inherited;

  FsNomeRecebedor := '';
  FdReciboAvulso  := 0;
  FsReciboAvulso  := '';

  NovoRegistro;
end;

procedure TFReciboAvulsoCadastro.NovoRegistro;
var
  stDados : TStringList;
begin
  edcdColaborador.FecharDataSet;
  edcdEmpresa.FecharDataSet;
  edcdCidade.FecharDataSet;

  DmERP.qyReciboAvulso.Close;
  DmERP.qyReciboAvulso.MacroByName('filtro').Value := ' WHERE cdReciboAvulso = 0 ';
  DmERP.qyReciboAvulso.Open();

  if (ednmRecebedor.Visible) and (ednmRecebedor.Enabled) and (ednmRecebedor.CanFocus) then
    ednmRecebedor.SetFocus;

  DmERP.qyReciboAvulso.Insert;
  DmERP.qyReciboAvulso.FieldByName('nmRecebedor').AsString    := FsNomeRecebedor;
  DmERP.qyReciboAvulso.FieldByName('vlReciboAvulso').AsFloat  := FdReciboAvulso;
  DmERP.qyReciboAvulso.FieldByName('deReciboAvulso').AsString := FsReciboAvulso;

  stDados := TStringList.Create;

  ExecuteSimplesSql(DmERP.fdConnERP,
                    'SELECT cdEmpresa, cdCidade ' +
                    '  FROM erp.empresa ' +
                    ' ORDER BY cdEmpresa ',
                    'cdEmpresa,cdCidade',
                    stDados
                   );

  if (stDados.Count > 0) then
  begin
    if (StrToIntDef(stDados.Strings[0], 0) > 0) then
       DmERP.qyReciboAvulso.FieldByName('cdEmpresa').AsInteger := StrToInt(stDados.Strings[0]);

    if (StrToIntDef(stDados.Strings[1], 0) > 0) then
       DmERP.qyReciboAvulso.FieldByName('cdCidade').AsInteger := StrToInt(stDados.Strings[1]);
  end;

  if Assigned(stDados) then
    FreeAndNil(stDados);
end;

procedure TFReciboAvulsoCadastro.FrBarraBotoesbtFecharClick(Sender: TObject);
begin
  DmERP.qyReciboAvulso.Cancel;

  inherited;
end;

procedure TFReciboAvulsoCadastro.FrBarraBotoesbtSalvarClick(Sender: TObject);
begin
  inherited;

  if DmERP.qyReciboAvulso.State = dsBrowse then
    ImprimirRecibo;

  FsNomeRecebedor := DmERP.qyReciboAvulso.FieldByName('nmRecebedor').AsString;
  FdReciboAvulso  := DmERP.qyReciboAvulso.FieldByName('vlReciboAvulso').AsFloat;
  FsReciboAvulso  := DmERP.qyReciboAvulso.FieldByName('deReciboAvulso').AsString;

  NovoRegistro;
end;

procedure TFReciboAvulsoCadastro.FrBarraBotoesdsDadosStateChange(
  Sender: TObject);
begin
  inherited;

  FrBarraBotoes.btFechar.Enabled := True;
end;

procedure TFReciboAvulsoCadastro.ImprimirRecibo;
var
//  imLogo : TImage;
  i, j : Integer;
begin
  if not vtReciboAvulso.Active then
    vtReciboAvulso.Open;

  vtReciboAvulso.Clear;

  if DmERP.qyReciboAvulsoRel.Active then
    DmERP.qyReciboAvulsoRel.Close;

  DmERP.qyReciboAvulsoRel.MacroByName('filtro').Clear;
  DmERP.qyReciboAvulsoRel.MacroByName('filtro').Value := ' WHERE cdReciboAvulso = ' + DmERP.qyReciboAvulso.FieldByName('cdReciboAvulso').AsString;
  DmERP.qyReciboAvulsoRel.Open();

  if not DmERP.qyReciboAvulsoRel.IsEmpty then
  begin
    j := 1;

    while j <= 2 do
    begin
      vtReciboAvulso.Insert;

      for i := 0 to DmERP.qyReciboAvulsoRel.FieldCount - 1 do
      begin
        if Assigned(vtReciboAvulso.FindField(DmERP.qyReciboAvulsoRel.Fields.Fields[i].FieldName)) then
          vtReciboAvulso.FieldByName(DmERP.qyReciboAvulsoRel.Fields.Fields[i].FieldName).Value := DmERP.qyReciboAvulsoRel.Fields.Fields[i].Value;
      end;

      vtReciboAvulso.FieldByName('cdCodigo').AsInteger := j;

      vtReciboAvulso.Post;

      Inc(j);
    end;

    relReciboAvulso.PrepareReport();
   {
    imLogo := TImage.Create(Self);

    CarregarImagem(imLogo, TBlobField(DmERP.qyReciboAvulsoRel.FieldByName('imLogoEmp')));

    if (relReciboAvulso.FindComponent('picLogoEmp') <> nil) then
      TfrxPictureView(relReciboAvulso.FindComponent('picLogoEmp')).Picture.Assign(imLogo.Picture);
  }
    relReciboAvulso.ShowReport();
  end;
end;

initialization
  RegisterClass(TFReciboAvulsoCadastro);

finalization
  UnRegisterClass(TFReciboAvulsoCadastro);

end.
