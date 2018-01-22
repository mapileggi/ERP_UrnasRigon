unit UEmpresaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFormCadastro, UBarraBotoes, DB,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, UDBCampoCodigo, Vcl.Mask, Vcl.Buttons;

type
  TFEmpresaCadastro = class(TFFormCadastro)
    lbcdEmpresa: TLabel;
    lbdeCnpj: TLabel;
    lbdeRazaoSocial: TLabel;
    lbnmFantasia: TLabel;
    lbcdCidade: TLabel;
    lbnuInscEst: TLabel;
    lbnuFone1: TLabel;
    lbnuFone2: TLabel;
    lbnuCelular: TLabel;
    lbnuFax: TLabel;
    lbnuCep: TLabel;
    lbdeEndereco: TLabel;
    lbnuEndereco: TLabel;
    lbdeComplemento: TLabel;
    lbdeBairro: TLabel;
    eddeCnpj: TDBEdit;
    eddeRazaoSocial: TDBEdit;
    ednmFantasia: TDBEdit;
    edcdCidade: TDBCampoCodigo;
    edcdEmpresa: TDBCampoCodigo;
    denuInscEst: TDBEdit;
    ednuFone1: TDBEdit;
    ednuFone2: TDBEdit;
    ednuCelular: TDBEdit;
    ednuFax: TDBEdit;
    ednuCep: TDBEdit;
    dedeEndereco: TDBEdit;
    ednuEndereco: TDBEdit;
    eddeComplemento: TDBEdit;
    eddeBairro: TDBEdit;
    imLogo: TImage;
    btAlterarLogo: TBitBtn;
    odCarregarLogo: TOpenDialog;
    procedure eddeCnpjExit(Sender: TObject);
    procedure btAlterarLogoClick(Sender: TObject);
    procedure FrBarraBotoesdsDadosDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    procedure GravarRegistro; override;
    procedure ExcluirRegistro; override;
    procedure CarregarLogo;
  public
    { Public declarations }
  end;

var
  FEmpresaCadastro: TFEmpresaCadastro;

implementation

uses
  uDmERP, uFuncoes;

{$R *.dfm}

procedure TFEmpresaCadastro.CarregarLogo;
begin
  if not DmERP.qyEmpresa.IsEmpty then
    CarregarImagem(imLogo, TBlobField(DmERP.qyEmpresa.FieldByName('imLogo')));
end;

procedure TFEmpresaCadastro.GravarRegistro;
begin
  DmERP.GravarEmpresa;
end;

procedure TFEmpresaCadastro.ExcluirRegistro;
begin
  DmERP.ExcluirEmpresa;
end;

procedure TFEmpresaCadastro.FormCreate(Sender: TObject);
begin
  btAlterarLogo.Glyph.LoadFromResourceName(HInstance, 'IMGBTIMAGEM_32X32');

  inherited;
end;

procedure TFEmpresaCadastro.FrBarraBotoesdsDadosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

  CarregarLogo;
end;

procedure TFEmpresaCadastro.btAlterarLogoClick(Sender: TObject);
var
  Imagem : TFileStream;
begin
  if (DmERP.qyEmpresa.Active) and (not DmERP.qyEmpresa.IsEmpty) then
  begin
    if odCarregarLogo.Execute() then
    begin
      Imagem := TFileStream.Create(odCarregarLogo.FileName, fmOpenRead or fmShareDenyWrite);

      if DmERP.qyEmpresaLogo.Active then
        DmERP.qyEmpresaLogo.Close;

      DmERP.qyEmpresaLogo.ParamByName('cdEmpresa').AsInteger := DmERP.qyEmpresa.FieldByName('cdEmpresa').AsInteger;
      DmERP.qyEmpresaLogo.ParamByName('imLogo').LoadFromStream(Imagem, ftBlob);
      DmERP.qyEmpresaLogo.ExecSQL;

      DmERP.qyEmpresa.Refresh;

      CarregarLogo;

      Aviso('Logo salva com sucesso.');
    end;
  end;
end;

procedure TFEmpresaCadastro.eddeCnpjExit(Sender: TObject);
begin
  inherited;

  if (Trim(DmERP.qyEmpresa.FieldByName('deCnpj').AsString) <> '') and
     (not (ValidaCpfCnpj(DmERP.qyEmpresa.FieldByName('deCnpj').AsString))) then
    if eddeCnpj.CanFocus then
      eddeCnpj.SetFocus;
end;

initialization
  RegisterClass(TFEmpresaCadastro);

finalization
  UnRegisterClass(TFEmpresaCadastro);

end.
