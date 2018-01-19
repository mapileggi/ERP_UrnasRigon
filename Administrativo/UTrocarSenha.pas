unit UTrocarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Error,
  Data.DB, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask, MaskUtils;  

type
  TFTrocarSenha = class(TForm)
    lbNomeUsuario: TLabel;
    eddeLogin: TEdit;
    lbSenhaAtual: TLabel;
    edSenhaAtual: TEdit;
    btTrocarSenha: TButton;
    btSair: TButton;
    lbNovaSenha: TLabel;
    edNovaSenha: TEdit;
    lbNovaSenhaConf: TLabel;
    edNovaSenhaConf: TEdit;
    procedure btTrocarSenhaClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    { Private Declarations }
  public
    { Public Declarations }
  end;

var
  FTrocarSenha: TFTrocarSenha;

implementation

{$R *.dfm}

uses
  UFuncoes, uHashes, uDmERP, UTelaInicial;

procedure TFTrocarSenha.btSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFTrocarSenha.btTrocarSenhaClick(Sender: TObject);
var
  sMsg,
  sSenhaCrypto : String;
begin
  sMsg := '';

  if Trim(edSenhaAtual.Text) = '' then
    AdicionaLinha(sMsg, ' - Senha atual não informada.')
  else if Trim(edSenhaAtual.Text) <> 'erp123' then
  begin
    DmERP.qyUsuario.Close;
    DmERP.qyUsuario.MacroByName('filtro').Value := ' WHERE deLogin = ' + QuotedStr(eddeLogin.Text) +
                                                   '   AND deSenha = ' + QuotedStr(CalcHash2(edSenhaAtual.Text, haSHA1));
    DmERP.qyUsuario.Open;

    if DmERP.qyUsuario.IsEmpty then
      AdicionaLinha(sMsg, ' - Senha atual inválida.');
  end;

  if Trim(edNovaSenha.Text) = '' then
    AdicionaLinha(sMsg, ' - Nova senha não informada.')
  else if LowerCase(Trim(edNovaSenha.Text)) = 'erp123' then
    AdicionaLinha(sMsg, ' - Nova senha não pode ser "' + edNovaSenha.Text + '".');

  if Trim(edNovaSenhaConf.Text) = '' then
    AdicionaLinha(sMsg, ' - Confirmação da nova senha não informada.');

  if (Trim(edNovaSenha.Text)) = (Trim(eddeLogin.Text)) then
    AdicionaLinha(sMsg, ' - Nova senha não pode ser igual ao usuário.');

  if (Trim(edNovaSenha.Text)) = (Trim(edSenhaAtual.Text)) then
    AdicionaLinha(sMsg, ' - Nova senha não pode ser igual a atual.');

  if ((Length(edNovaSenha.Text))  < 6) then
    AdicionaLinha(sMsg, ' - Nova senha deve ter pelo menos 6 caracteres.');

  if (Trim(edNovaSenha.Text)) <> (Trim(edNovaSenhaConf.Text)) then
    AdicionaLinha(sMsg, ' - Nova senha e a confirmação da nova senha possuem caracteres diferentes.');

  if Trim(sMsg) <> '' then
    Aviso('As seguintes informações devem ser verificadas:' + #13#13 + sMsg)
  else
  begin
    sSenhaCrypto := CalcHash2(edNovaSenha.Text, haSHA1);

    ExecuteInstrucaoSql(DmERP.fdConnERP,
                        'UPDATE erp.usuario ' +
                        '   SET deSenha = ' + QuotedStr(sSenhaCrypto) + ', ' +
                        '       hrAlteracao = erp.MinutosAtual(), ' +
                        '       dtAlteracao = CURRENT_DATE ' +
                        ' WHERE flAtivo = ''S'' ' +
                        '   AND deLogin = ' + QuotedStr(eddeLogin.Text)
                       );

    Informacao('Senha atualizada com sucesso.');
    edSenhaAtual.Clear;
    edNovaSenha.Clear;
    edNovaSenhaConf.Clear;

    Close;
  end;
end;

end.
