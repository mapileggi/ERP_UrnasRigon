unit uFuncoes;

interface

uses
  SysUtils, Dialogs, Controls, Forms, Windows, Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, ShellApi, Graphics, JPEG, Vcl.ExtCtrls,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Registry, uSock,

  UMensagemAviso;

  function RemoverAcentos(Str : String): String;
  procedure MensagemAviso(const stMsgAviso : TStringList);
  procedure AdicionaLinha(var sTexto : String; const sValor : String);
  procedure AdicionaCondSql(var sCond : String; const sValor : String);
  procedure Informacao(const sMsg : String);
  procedure Aviso(const sMsg : String);
  procedure Erro(const sMsg : String);
  function Pergunta(const sMsg : String) : Boolean;
  function SomenteNumeros(const sValor : String) : String;
  function RemoveCaracterEspecial(const sValor : String) : String;
  procedure RemoveChar(var S: String; Ch: Char);
  function SomenteCaracterNormal(aTexto : String) : String;
  function AdicionaCaracter(var sLinha : String; const sCaracter : String; const iQtd, iPos : Integer) : String;
  function DataHoraAtual(const fdConn: TFDConnection) : TDateTime;
  function HoraParaMinutos(const hrAtual : TDateTime) : Integer;
  function MinutosParaTime(const iMinAtual : Integer) : TDateTime;
  function ValidaPIS(sPIS : String) : Boolean;
  function ValidaTituloEleitor(sTitulo : String) : Boolean;
  function ValidaCpfCnpj(Dado : String) : Boolean;
  function ValidaCNPJ(Dado : String) : Boolean;
  function ValidaCPF(Dado : String) : Boolean;
  function ValidaInscEst(Inscricao, Tipo : String) : Boolean;
  function MascaraInscEst(Inscricao, Estado : String) : String;
  procedure ExecuteInstrucaoSql(const fdConn : TFDConnection; const sSql : String);
  procedure ExecuteSimplesSql(const fdConn : TFDConnection; const sSql, sNomeCampo : String; var stDados : TStringList);
  function GetBuildInfo : String;
  function RunAsAdmin(const Handle: Hwnd; const Path, Params: string): Boolean;
  procedure AddWatermark(bmp: TBitmap; alpha: single; txt: string);
  procedure CarregarImagem(AImage: TImage; ABlobField: TBlobField);
  function DiaSemanaExtenso(dtDia : TDateTime) : String;
  function DataExtenso(const dtData : TDateTime) : String;
  function ValorPorExtenso(vlr : Real) : String;
  function RetornaNomeComputador : String;
  function RetornaIpComputador : String;
  procedure GerarCodigo(const fdConn       : TFDConnection;
                        const qyDados      : TFDQuery;
                        const sTabela,
                              sCampoCodigo : String;
                        const iValorCodigo : Integer;
                        const sWhere       : String = ''
                       );
const
  FsNomeSistema        = 'ERP';
  FiNumLinhasConfigERP = 9;

implementation

function RemoverAcentos(Str : String): String;
type
  USASCIIString = type AnsiString(20127);
var
   C:Char;
begin
  Result := '';

  for C in Str do
    Result := Result + String(USASCIIString(C));
end;

procedure MensagemAviso(const stMsgAviso : TStringList);
begin
  FMensagemAviso := TFMensagemAviso.Create(Application);

  try
    FMensagemAviso.mMensagem.Lines.Clear;
    FMensagemAviso.mMensagem.Lines := stMsgAviso;
    FMensagemAviso.ShowModal;
  finally
    FreeAndNil(FMensagemAviso);
  end;
end;

procedure Informacao(const sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Informação...',
                         MB_OK + MB_SYSTEMMODAL + MB_ICONINFORMATION
                        );
end;

procedure Aviso(const sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Aviso...',
                         MB_OK + MB_SYSTEMMODAL + MB_ICONWARNING
                        );
end;

procedure Erro(const sMsg : String);
begin
  Application.MessageBox(PChar(sMsg), 'Erro...',
                         MB_OK + MB_SYSTEMMODAL + MB_ICONERROR
                        );
end;

function Pergunta(const sMsg : String) : Boolean;
begin
  Result := Application.MessageBox(PChar(sMsg), 'Pergunta...',
                                   MB_YESNO + MB_SYSTEMMODAL + MB_ICONQUESTION + MB_DEFBUTTON2
                                  ) = ID_YES;
end;

procedure AdicionaLinha(var sTexto : String; const sValor : String);
begin
  if Trim(sTexto) = '' then
    sTexto := sValor
  else
    sTexto := sTexto + #13 + sValor;
end;

procedure AdicionaCondSql(var sCond : String; const sValor : String);
begin
  if Trim(sCond) = '' then
    sCond := sValor
  else
    sCond := sCond + #13 + ' AND ' + sValor;
end;

function SomenteNumeros(const sValor : String) : String;
var
  i : Integer;
begin
  Result := '';
  for i := 1 to Length(sValor) do
  begin
    if sValor[i] in['0'..'9'] then
      Result := Result + sValor[i];
  end;
end;

function RemoveCaracterEspecial(const sValor : String) : String;
const
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := sValor;

   for i:=1 to 48 do
     xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);

   Result := xTexto;
end;

procedure RemoveChar(var S: String; Ch: Char);
begin
  if Length(S) = 0 then
    Exit;

  while Pos(Ch, s) > 0 do
    Delete(s, Pos(Ch, s), 1);
end;

function SomenteCaracterNormal(aTexto : String) : String;
var
  i : Integer;
begin
  Result := '';

  for i := 1 to Length(aTexto) do
  begin
    if (aTexto[i] in['0'..'9']) or
       (aTexto[i] in['a'..'z']) or
       (aTexto[i] in['A'..'Z']) or
       (aTexto[i] in['-', '_']) then
      Result := Result + aTexto[i];
  end;
end;

function AdicionaCaracter(var sLinha : String; const sCaracter : String; const iQtd, iPos : Integer) : String;
var
  i : Integer;
begin
  for i := 1 to iQtd do
  begin
    if iPos = 1 then //Esquerda
      sLinha := sCaracter + sLinha
    else if iPos = 2 then //EsquerdaDireita
      sLinha := sCaracter + sLinha + sCaracter
    else if iPos = 3 then //Direita
      sLinha := sLinha + sCaracter;
  end;
end;

function DataHoraAtual(const fdConn: TFDConnection) : TDateTime;
var
  qyAux : TFDQuery;
begin
  qyAux := TFDQuery.Create(nil);

  try
    qyAux.Connection := fdConn;
    qyAux.SQL.Clear;
    qyAux.SQL.Text := 'SELECT now()::timestamp AS dthrAtual';
    qyAux.Open();
    Result := qyAux.FieldByName('dthrAtual').AsDateTime;
  finally
    FreeAndNil(qyAux);
  end;
end;

function HoraParaMinutos(const hrAtual : TDateTime) : Integer;
var
  wHora, wMin, wSeg, wMili : Word;
begin
  DecodeTime(hrAtual, wHora, wMin, wSeg, wMili);

  Result := wMin + (wHora * 60);
end;

function MinutosParaTime(const iMinAtual : Integer) : TDateTime;
var
  wHora, wMin, wSeg, wMili : Word;
begin
  wHora  := Trunc(iMinAtual/60);
  wMin   := iMinAtual mod 60;
  wSeg   := 0;
  wMili  := 0;
  Result := EncodeTime(wHora, wMin, wSeg, wMili);
end;

function ValidaPIS(sPIS : String) : Boolean;
var
  iSoma: integer;
  i, iDigito, iDigVer, iMult: shortint;
begin
  Result := Length(Trim(sPIS)) = 11;

  if Result then
  begin
    iDigVer := StrToInt(sPIS[11]);
    iSoma := 0;
    iMult := 2;

    for i := 10 downto 1 do
    begin
      iSoma := iSoma + (iMult * StrToInt(sPIS[I]));

      if iMult < 9 then
        Inc(iMult)
      else
        iMult := 2;
    end;

    iDigito := 11 - (iSoma mod 11);

    if iDigito > 9 then
      iDigito := 0;

    Result := (iDigVer = iDigito);
  end;

// if not Result and MostraMsg then
 //  Application.MessageBox('Número do PIS inválido!','Atenção',mb_TaskModal + mb_IconWarning);
end;

function ValidaTituloEleitor(sTitulo : String) : Boolean;
const
  Multiplicadores : array[1..11] of ShortInt = (10,9,8,7,6,5,4,3,2,4,3);
var
  iCont, iAux, DigCalculado, DigInformado : ShortInt;
  iDigito: integer;
begin
  Result := false;

  if Length(sTitulo) = 0 then
    Exit;

  sTitulo := StringOfChar('0', 13-Length(stitulo)) + sTitulo; // 13 posições
  iAux    := StrToInt(Copy(sTitulo, 10, 2)); // valor para auxiliar o cálculo do dígito

  // dígito verificador
  DigInformado := StrToInt(Copy(sTitulo, 12, 2));
  DigCalculado := 0;

  iDigito := 0;

  for iCont := 1 to 11 do
  begin
    iDigito := iDigito + (StrToInt(stitulo[iCont]) * Multiplicadores[iCont]);

    if iCont in [9,11] then
    begin
      iDigito := iDigito mod 11;

      if iDigito > 1 then
        iDigito := 11 - iDigito
      else
      begin
        if iAux <= 2 then
          iDigito := 1 - iDigito
        else
          iDigito := 0;
      end;

      if iCont = 9 then
        Digcalculado := iDigito * 10
      else
        Digcalculado := Digcalculado + iDigito;

      iDigito := iDigito * 2;
    end;
  end;

  // verifica se o digito é verdadeiro
  Result := DigCalculado = DigInformado;

//  if not Result and MostraMsg then
//    Application.MessageBox('Número do título de eleitor inválido!','Atenção',mb_TaskModal + mb_IconWarning);
end;

function ValidaCpfCnpj(Dado : String) : Boolean;
var
  i: integer;
begin
  Result := True;

  for i:= 1 to length(Dado) do
  begin
    if not (Dado[i] in ['0'..'9']) then
      delete(Dado,i,1);
  end;

  if ((length(Dado) <> 11) and (length(Dado) <> 14)) then
  begin
    Result := False;
//    Aviso('ATENÇÃO: O número informado NÃO representa um CPF ou CNPJ válido pelas regras da Receita Federal.');
  end
  else if length(Dado) = 14 then
  begin
    if not (ValidaCNPJ(Dado)) then
    begin
      Result := False;
//      Aviso('O número informado NÃO representa um CNPJ válido pelas regras da Receita Federal.');
    end;
  end
  else if length(Dado) = 11 then
  begin
    if not (ValidaCPF(Dado)) then
    begin
      Result := False;
//      Aviso('O número informado NÃO representa um CPF válido pelas regras da Receita Federal.');
    end;
  end;
end;

{Valida dígito verificador de CNPJ}
function ValidaCNPJ(Dado : string) : Boolean;
var
  D1            : array[1..12] of byte;
  I,
  DF1,
  DF2,
  DF3,
  DF4,
  DF5,
  DF6,
  Resto1,
  Resto2,
  PrimeiroDigito,
  SegundoDigito : integer;
begin
  Result := true;

  if Length(Dado) = 14 then
  begin
    for I := 1 to 12 do
      if Dado[I] in ['0'..'9'] then
        D1[I] := StrToInt(Dado[I])
      else
        Result := false;

    if Result then
    begin
      DF1 := 0;
      DF2 := 0;
      DF3 := 0;
      DF4 := 0;
      DF5 := 0;
      DF6 := 0;
      Resto1 := 0;
      Resto2 := 0;
      PrimeiroDigito := 0;
      SegundoDigito := 0;
      DF1 := 5*D1[1] + 4*D1[2] + 3*D1[3] + 2*D1[4] + 9*D1[5] + 8*D1[6] +
             7*D1[7] + 6*D1[8] + 5*D1[9] + 4*D1[10] + 3*D1[11] + 2*D1[12];
      DF2 := DF1 div 11;
      DF3 := DF2 * 11;
      Resto1 := DF1 - DF3;

      if (Resto1 = 0) or (Resto1 = 1) then
        PrimeiroDigito := 0
      else
        PrimeiroDigito := 11 - Resto1;

      DF4 := 6*D1[1] + 5*D1[2] + 4*D1[3] + 3*D1[4] + 2*D1[5] + 9*D1[6] +
             8*D1[7] + 7*D1[8] + 6*D1[9] + 5*D1[10] + 4*D1[11] + 3*D1[12] +
             2*PrimeiroDigito;

      DF5 := DF4 div 11;
      DF6 := DF5 * 11;
      Resto2 := DF4 - DF6;

      if (Resto2 = 0) or (Resto2 = 1) then
        SegundoDigito := 0
      else
        SegundoDigito := 11 - Resto2;

      if (PrimeiroDigito <> StrToInt(Dado[13])) or
         (SegundoDigito <> StrToInt(Dado[14])) then
        Result := false;

    end;
  end
  else if Length(Dado) <> 0 then
    Result := false;
end;

{Valida dígito verificador de CPF}
function ValidaCPF(Dado : string) : boolean;
var
  D1            : array[1..9] of byte;
  I,
  DF1,
  DF2,
  DF3,
  DF4,
  DF5,
  DF6,
  Resto1,
  Resto2,
  PrimeiroDigito,
  SegundoDigito : integer;
begin
  Result := true;

  if Length(Dado) = 11 then
  begin
    for I := 1 to 9 do
      if Dado[I] in ['0'..'9'] then
        D1[I] := StrToInt(Dado[I])
      else
        Result := false;

    if Result then
    begin
      DF1 := 0;
      DF2 := 0;
      DF3 := 0;
      DF4 := 0;
      DF5 := 0;
      DF6 := 0;
      Resto1 := 0;
      Resto2 := 0;
      PrimeiroDigito := 0;
      SegundoDigito := 0;
      DF1 := 10*D1[1] + 9*D1[2] + 8*D1[3] + 7*D1[4] + 6*D1[5] + 5*D1[6] +
             4*D1[7] + 3*D1[8] + 2*D1[9];
      DF2 := DF1 div 11;
      DF3 := DF2 * 11;
      Resto1 := DF1 - DF3;

      if (Resto1 = 0) or (Resto1 = 1) then
        PrimeiroDigito := 0
      else
        PrimeiroDigito := 11 - Resto1;

      DF4 := 11*D1[1] + 10*D1[2] + 9*D1[3] + 8*D1[4] + 7*D1[5] + 6*D1[6] +
             5*D1[7] + 4*D1[8] + 3*D1[9] + 2*PrimeiroDigito;
      DF5 := DF4 div 11;
      DF6 := DF5 * 11;
      Resto2 := DF4 - DF6;

      if (Resto2 = 0) or (Resto2 = 1) then
        SegundoDigito := 0
      else
        SegundoDigito := 11 - Resto2;

      if (PrimeiroDigito <> StrToInt(Dado[10])) or
         (SegundoDigito <> StrToInt(Dado[11])) then
        Result := false;
    end;
  end
  else if Length(Dado) <> 0 then
    Result := false;
end;

function ValidaInscEst(Inscricao, Tipo : String) : Boolean;
var
  Contador  : ShortInt;
  Casos     : ShortInt;
  Digitos   : ShortInt;

  Tabela_1  : String;
  Tabela_2  : String;
  Tabela_3  : String;

  Base_1    : String;
  Base_2    : String;
  Base_3    : String;

  Valor_1   : ShortInt;

  Soma_1    : Integer;
  Soma_2    : Integer;

  Erro_1    : ShortInt;
  Erro_2    : ShortInt;
  Erro_3    : ShortInt;

  Posicao_1 : string;
  Posicao_2 : String;

  Tabela    : String;
  Rotina    : String;
  Modulo    : ShortInt;
  Peso      : String;

  Digito    : ShortInt;

  Resultado : String;
  Retorno   : Boolean;
begin
  try
    Tabela_1 := ' ';
    Tabela_2 := ' ';
    Tabela_3 := ' ';

  {                                                                               }                                                                                                                 {                                                                                                }
  {         Valores possiveis para os digitos (j)                                 }
  {                                                                               }
  { 0 a 9 = Somente o digito indicado.                                            }
  {     N = Numeros 0 1 2 3 4 5 6 7 8 ou 9                                        }
  {     A = Numeros 1 2 3 4 5 6 7 8 ou 9                                          }
  {     B = Numeros 0 3 5 7 ou 8                                                  }
  {     C = Numeros 4 ou 7                                                        }
  {     D = Numeros 3 ou 4                                                        }
  {     E = Numeros 0 ou 8                                                        }
  {     F = Numeros 0 1 ou 5                                                      }
  {     G = Numeros 1 7 8 ou 9                                                    }
  {     H = Numeros 0 1 2 ou 3                                                    }
  {     I = Numeros 0 1 2 3 ou 4                                                  }
  {     J = Numeros 0 ou 9                                                        }
  {     K = Numeros 1 2 3 ou 9                                                    }
  {                                                                               }
  { ----------------------------------------------------------------------------- }
  {                                                                               }
  {         Valores possiveis para as rotinas (d) e (g)                           }
  {                                                                               }
  { A a E = Somente a Letra indicada.                                             }
  {     0 = B e D                                                                 }
  {     1 = C e E                                                                 }
  {     2 = A e E                                                                 }
  {                                                                               }
  { ----------------------------------------------------------------------------- }
  {                                                                               }
  {                                  C T  F R M  P  R M  P                        }
  {                                  A A  A O O  E  O O  E                        }
  {                                  S M  T T D  S  T D  S                        }
  {                                                                               }
  {                                  a b  c d e  f  g h  i  jjjjjjjjjjjjjj        }
  {                                  0000000001111111111222222222233333333        }
  {                                  1234567890123456789012345678901234567        }

  if Tipo = 'AC'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     01NNNNNNX.14.00';
  if Tipo = 'AC'   then Tabela_2 := '2.13.0.E.11.02.E.11.01. 01NNNNNNNNNXY.13.14';
  if Tipo = 'AL'   then Tabela_1 := '1.09.0.0.11.01. .  .  .     24BNNNNNX.14.00';
  if Tipo = 'AP'   then Tabela_1 := '1.09.0.1.11.01. .  .  .     03NNNNNNX.14.00';
  if Tipo = 'AP'   then Tabela_2 := '2.09.1.1.11.01. .  .  .     03NNNNNNX.14.00';
  if Tipo = 'AP'   then Tabela_3 := '3.09.0.E.11.01. .  .  .     03NNNNNNX.14.00';
  if Tipo = 'AM'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     0CNNNNNNX.14.00';
  if Tipo = 'BA'   then Tabela_1 := '1.08.0.E.10.02.E.10.03.      NNNNNNYX.14.13';
  if Tipo = 'BA'   then Tabela_2 := '2.08.0.E.11.02.E.11.03.      NNNNNNYX.14.13';
  if Tipo = 'CE'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     0NNNNNNNX.14.13';
  if Tipo = 'DF'   then Tabela_1 := '1.13.0.E.11.02.E.11.01. 07DNNNNNNNNXY.13.14';
  if Tipo = 'ES'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     0ENNNNNNX.14.00';
  if Tipo = 'GO'   then Tabela_1 := '1.09.1.E.11.01. .  .  .     1FNNNNNNX.14.00';
  if Tipo = 'GO'   then Tabela_2 := '2.09.0.E.11.01. .  .  .     1FNNNNNNX.14.00';
  if Tipo = 'MA'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     12NNNNNNX.14.00';
  if Tipo = 'MT'   then Tabela_1 := '1.11.0.E.11.01. .  .  .   NNNNNNNNNNX.14.00';
  if Tipo = 'MS'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     28NNNNNNX.14.00';
  if Tipo = 'MG'   then Tabela_1 := '1.13.0.2.10.10.E.11.11. NNNNNNNNNNNXY.13.14';
  if Tipo = 'PA'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     15NNNNNNX.14.00';
  if Tipo = 'PB'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     16NNNNNNX.14.00';
  if Tipo = 'PR'   then Tabela_1 := '1.10.0.E.11.09.E.11.08.    NNNNNNNNXY.13.14';
  if Tipo = 'PE'   then Tabela_1 := '1.14.1.E.11.07. .  .  .18ANNNNNNNNNNX.14.00';
  if Tipo = 'PI'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     19NNNNNNX.14.00';
  if Tipo = 'RJ'   then Tabela_1 := '1.08.0.E.11.08. .  .  .      GNNNNNNX.14.00';
  if Tipo = 'RN'   then Tabela_1 := '1.09.0.0.11.01. .  .  .     20HNNNNNX.14.00';
  if Tipo = 'RS'   then Tabela_1 := '1.10.0.E.11.01. .  .  .    INNNNNNNNX.14.00';
  if Tipo = 'RO'   then Tabela_1 := '1.09.1.E.11.04. .  .  .     ANNNNNNNX.14.00';
  if Tipo = 'RO'   then Tabela_2 := '2.14.0.E.11.01. .  .  .NNNNNNNNNNNNNX.14.00';
  if Tipo = 'RR'   then Tabela_1 := '1.09.0.D.09.05. .  .  .     24NNNNNNX.14.00';
  if Tipo = 'SC'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     NNNNNNNNX.14.00';
  if Tipo = 'SP'   then Tabela_1 := '1.12.0.D.11.12.D.11.13.  NNNNNNNNXNNY.11.14';
  if Tipo = 'SP'   then Tabela_2 := '2.12.0.D.11.12. .  .  .  NNNNNNNNXNNN.11.00';
  if Tipo = 'SE'   then Tabela_1 := '1.09.0.E.11.01. .  .  .     NNNNNNNNX.14.00';
  if Tipo = 'TO'   then Tabela_1 := '1.11.0.E.11.06. .  .  .   29JKNNNNNNX.14.00';

  if Tipo = 'CNPJ' then Tabela_1 := '1.14.0.E.11.21.E.11.22.NNNNNNNNNNNNXY.13.14';
  if Tipo = 'CPF'  then Tabela_1 := '1.11.0.E.11.31.E.11.32.   NNNNNNNNNXY.13.14';

  { Deixa somente os numeros }

  Base_1 := '';

  for Contador := 1 tO 30 do
    if Pos(Copy(Inscricao, Contador, 1), '0123456789') <> 0 then
      Base_1 := Base_1 + Copy(Inscricao, Contador, 1);

  { Repete 3x - 1 para cada caso possivel  }

  Casos  := 0;

  Erro_1 := 0;
  Erro_2 := 0;
  Erro_3 := 0;

  while Casos < 3 do
  begin
    Casos := Casos + 1;

    if Casos = 1 then Tabela := Tabela_1;
    if Casos = 2 then Erro_1 := Erro_3  ;
    if Casos = 2 then Tabela := Tabela_2;
    if Casos = 3 then Erro_2 := Erro_3  ;
    if Casos = 3 then Tabela := Tabela_3;

    Erro_3 := 0 ;

    if Copy(Tabela, 1, 1) <> ' ' then
    begin
      { Verifica o Tamanho }
      if Length(Trim(Base_1)) <> (StrToInt(Copy(Tabela, 3, 2))) then
        Erro_3 := 1;

      if Erro_3 = 0 then
      begin
        { Ajusta o Tamanho }
        Base_2 := Copy('              ' + Base_1, Length( '              ' + Base_1 ) - 13, 14);

        { Compara com valores possivel para cada uma da 14 posições }

        Contador := 0 ;

        while (Contador < 14) and (Erro_3 = 0) do
        begin
          Contador := Contador + 1;

          Posicao_1 := Copy( Copy( Tabela, 24, 14 ), Contador, 1 );
          Posicao_2 := Copy( Base_2                , Contador, 1 );

          if ( Posicao_1  = ' '        ) and (      Posicao_2                 <> ' ' ) then Erro_3 := 1;
          if ( Posicao_1  = 'N'        ) and ( Pos( Posicao_2, '0123456789' )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'A'        ) and ( Pos( Posicao_2, '123456789'  )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'B'        ) and ( Pos( Posicao_2, '03578'      )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'C'        ) and ( Pos( Posicao_2, '47'         )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'D'        ) and ( Pos( Posicao_2, '34'         )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'E'        ) and ( Pos( Posicao_2, '08'         )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'F'        ) and ( Pos( Posicao_2, '015'        )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'G'        ) and ( Pos( Posicao_2, '1789'       )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'H'        ) and ( Pos( Posicao_2, '0123'       )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'I'        ) and ( Pos( Posicao_2, '01234'      )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'J'        ) and ( Pos( Posicao_2, '09'         )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1  = 'K'        ) and ( Pos( Posicao_2, '1239'       )  =   0 ) then Erro_3 := 1;
          if ( Posicao_1 <>  Posicao_2 ) and ( Pos( Posicao_1, '0123456789' )  >   0 ) then Erro_3 := 1;

        end;

        { Calcula os Digitos }

        Rotina  := ' ';
        Digitos := 000;
        Digito  := 000;

        While ( Digitos < 2 ) and ( Erro_3 = 0 ) Do Begin

          Digitos := Digitos + 1;

          { Carrega peso }

          Peso := Copy( Tabela, 5 + ( Digitos * 8 ), 2 );

          if Peso <> '  ' then Begin

            Rotina :=           Copy( Tabela, 0 + ( Digitos * 8 ), 1 )  ;
            Modulo := StrToInt( Copy( Tabela, 2 + ( Digitos * 8 ), 2 ) );

            if Peso = '01' then Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00';
            if Peso = '02' then Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00';
            if Peso = '03' then Peso := '06.05.04.03.02.09.08.07.06.05.04.03.00.02';
            if Peso = '04' then Peso := '00.00.00.00.00.00.00.00.06.05.04.03.02.00';
            if Peso = '05' then Peso := '00.00.00.00.00.01.02.03.04.05.06.07.08.00';
            if Peso = '06' then Peso := '00.00.00.09.08.00.00.07.06.05.04.03.02.00';
            if Peso = '07' then Peso := '05.04.03.02.01.09.08.07.06.05.04.03.02.00';
            if Peso = '08' then Peso := '08.07.06.05.04.03.02.07.06.05.04.03.02.00';
            if Peso = '09' then Peso := '07.06.05.04.03.02.07.06.05.04.03.02.00.00';
            if Peso = '10' then Peso := '00.01.02.01.01.02.01.02.01.02.01.02.00.00';
            if Peso = '11' then Peso := '00.03.02.11.10.09.08.07.06.05.04.03.02.00';
            if Peso = '12' then Peso := '00.00.01.03.04.05.06.07.08.10.00.00.00.00';
            if Peso = '13' then Peso := '00.00.03.02.10.09.08.07.06.05.04.03.02.00';
            if Peso = '21' then Peso := '05.04.03.02.09.08.07.06.05.04.03.02.00.00';
            if Peso = '22' then Peso := '06.05.04.03.02.09.08.07.06.05.04.03.02.00';
            if Peso = '31' then Peso := '00.00.00.10.09.08.07.06.05.04.03.02.00.00';
            if Peso = '32' then Peso := '00.00.00.11.10.09.08.07.06.05.04.03.02.00';

            { Multiplica }

            Base_3 := Copy( ( '0000000000000000' + Trim( Base_2 ) ), Length( ( '0000000000000000' + Trim( Base_2 ) ) ) - 13, 14 );

            Soma_1 := 0;
            Soma_2 := 0;

            For Contador := 1 To 14 Do Begin

              Valor_1 := ( StrToInt( Copy( Base_3, Contador, 01 ) ) * StrToInt( Copy( Peso, Contador * 3 - 2, 2 ) ) );

              Soma_1  := Soma_1 + Valor_1;

              if Valor_1 > 9 then Valor_1 := Valor_1 - 9;

              Soma_2  := Soma_2 + Valor_1;

            end;

            { Ajusta valor da soma }

            if Pos( Rotina, 'A2'  ) > 0 then Soma_1 := Soma_2;
            if Pos( Rotina, 'B0'  ) > 0 then Soma_1 := Soma_1 * 10;
            if Pos( Rotina, 'C1'  ) > 0 then Soma_1 := Soma_1 + ( 5 + 4 * StrToInt( Copy( Tabela, 6, 1 ) ) );

            { Calcula o Digito }
            if Pos(Rotina, 'D0') > 0 then Digito := Soma_1 Mod Modulo;
            if Pos(Rotina, 'E12') > 0 then Digito := Modulo - (Soma_1 Mod Modulo);

            if Digito < 10 then Resultado := IntToStr( Digito );
            if Digito = 10 then Resultado := '0';
            if Digito = 11 then Resultado := Copy(Tabela, 6, 1);

            { Verifica o Digito }
            if (Copy(Base_2, StrToInt(Copy(Tabela, 36 + (Digitos * 3), 2)), 1) <> Resultado) then
              Erro_3 := 1;
          end;

        end;

      end;

    end;

  end;

  { Retorna o resultado da Verificação }

  Retorno := FALSE;

  if (Trim(Tabela_1) <> '') and (ERRO_1 = 0) then Retorno := TRUE;
  if (Trim(Tabela_2) <> '') and (ERRO_2 = 0) then Retorno := TRUE;
  if (Trim(Tabela_3) <> '') and (ERRO_3 = 0) then Retorno := TRUE;

  if Trim(Inscricao) = 'ISENTO' then Retorno := TRUE;

  Result := Retorno;

  Except

  Result := False;

end;

end;

{ Mascara_Inscricao __________________________________________________________________________________ }

function MascaraInscEst(Inscricao, Estado : String) : String;
var
  Mascara     : String;
  Contador_1,
  Contador_2  : Integer;
begin
  if Estado = 'AC' then Mascara := '**.***.***/***-**' ;
  if Estado = 'AL' then Mascara := '*********'         ;
  if Estado = 'AP' then Mascara := '*********'         ;
  if Estado = 'AM' then Mascara := '**.***.***-*'      ;
  if Estado = 'BA' then Mascara := '******-**'         ;
  if Estado = 'CE' then Mascara := '********-*'        ;
  if Estado = 'DF' then Mascara := '***********-**'    ;
  if Estado = 'ES' then Mascara := '*********'         ;
  if Estado = 'GO' then Mascara := '**.***.***-*'      ;
  if Estado = 'MA' then Mascara := '*********'         ;
  if Estado = 'MT' then Mascara := '**********-*'      ;
  if Estado = 'MS' then Mascara := '*********'         ;
  if Estado = 'MG' then Mascara := '***.***.***/****'  ;
  if Estado = 'PA' then Mascara := '**-******-*'       ;
  if Estado = 'PB' then Mascara := '********-*'        ;
  if Estado = 'PR' then Mascara := '********-**'       ;
  if Estado = 'PE' then Mascara := '**.*.***.*******-*';
  if Estado = 'PI' then Mascara := '*********'         ;
  if Estado = 'RJ' then Mascara := '**.***.**-*'       ;
  if Estado = 'RN' then Mascara := '**.***.***-*'      ;
  if Estado = 'RS' then Mascara := '***/*******'       ;
  if Estado = 'RO' then Mascara := '***.*****-*'       ;
  if Estado = 'RR' then Mascara := '********-*'        ;
  if Estado = 'SC' then Mascara := '***.***.***'       ;
  if Estado = 'SP' then Mascara := '***.***.***.***'   ;
  if Estado = 'SE' then Mascara := '*********-*'       ;
  if Estado = 'TO' then Mascara := '***********'       ;

  Contador_2  := 1;
  Result      := '';
  Mascara     := Mascara + '****';

  for Contador_1 := 1 to Length(Mascara) do
  begin
    if Copy(Mascara, Contador_1, 1) =  '*' then
      Result := Result + Copy(Inscricao, Contador_2, 1);

    if Copy(Mascara, Contador_1, 1) <> '*' then
      Result := Result + Copy(Mascara  , Contador_1, 1);

    if Copy( Mascara, Contador_1, 1) =  '*' then
      Contador_2 := Contador_2 + 1;
  end;

  Result := Trim( Result );
end;

procedure ExecuteInstrucaoSql(const fdConn : TFDConnection; const sSql : String);
var
  qyGeral: TFDQuery;
begin
  qyGeral := TFDQuery.Create(Application);

  try
    qyGeral.Connection := fdConn;
    qyGeral.Sql.Clear;
    qyGeral.Sql.Add(sSql);

    qyGeral.ExecSQL;
  finally
    if Assigned(qyGeral) then
      qyGeral.Free;
  end;
end;

procedure ExecuteSimplesSql(const fdConn : TFDConnection; const sSql, sNomeCampo : String; var stDados : TStringList);
var
  qyGeral    : TFDQuery;
  intI       : Integer;
  tstrCampos : TStringList;
begin
  stDados.Clear;
  qyGeral    := TFDQuery.Create(Application);
  tstrCampos := TStringList.Create;

  try
    qyGeral.Connection := fdConn;
    qyGeral.Sql.Clear;
    qyGeral.Sql.Add(sSql);
    qyGeral.Open;

    tstrCampos.CommaText := sNomeCampo;

    if not qyGeral.IsEmpty then
    begin
      for intI := 0 to tstrCampos.Count-1 do
        stDados.Add(qyGeral.FieldByName(tstrCampos.Strings[intI]).AsString);
    end
    else
    begin
      for intI := 0 to tstrCampos.Count-1 do
        stDados.Add('');
    end;
  finally
    if Assigned(qyGeral) then
      qyGeral.Free;

    if Assigned(tstrCampos) then
      FreeAndNil(tstrCampos);
  end;
end;

function GetBuildInfo : String;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
  Prog: string;
begin
  Prog        := Application.Exename;
  VerInfoSize := GetFileVersionInfoSize(PChar(Prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(Prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;

  FreeMem(VerInfo, VerInfoSize);

  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' + IntToStr(V4);
end;

function RunAsAdmin(const Handle: Hwnd; const Path, Params: string): Boolean;
var
  sei: TShellExecuteInfoA;
begin
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.Wnd := Handle;
  sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
  sei.lpVerb := 'runas';
  sei.lpFile := PAnsiChar(Path);
  sei.lpParameters := PAnsiChar(Params);
  sei.nShow := SW_HIDE;
  Result := ShellExecuteExA(@sei);
end;

procedure AddWatermark(bmp: TBitmap; alpha: single; txt: string);
type
  TLine = array [0..1023] of TRGBTriple;
var
  wm : TBitmap;
  src_x, src_y, dst_x, dst_y : integer;
  dst, src : ^TLine;
begin
// create a watermark
  wm := TBitmap.Create;

  with wm, Canvas, Font do
  begin
    PixelFormat := pf24bit;
    Name      := 'Courier New';
    Size      := 11;
    Style     := [fsBold];
    wm.Width  := TextWidth(txt) + 20;
    wm.Height := TextHeight(txt) + 5;
    TextOut(10, 5, txt);
  end;

  // put watermark on bmp
  dst_y := bmp.Height - wm.Height - 10;

  for src_y := 0 to wm.Height - 1 do
  begin
    src   := wm.ScanLine[src_y];
    dst   := bmp.ScanLine[dst_y];
    dst_x := bmp.Width - wm.Width - 10;

    for src_x := 0 to wm.Width - 1 do
    begin
      dst[dst_x].rgbtRed   := trunc(dst[dst_x].rgbtRed   * (1 - alpha) + src[src_x].rgbtRed   * alpha);
      dst[dst_x].rgbtGreen := trunc(dst[dst_x].rgbtGreen * (1 - alpha) + src[src_x].rgbtGreen * alpha);
      dst[dst_x].rgbtBlue  := trunc(dst[dst_x].rgbtBlue  * (1 - alpha) + src[src_x].rgbtBlue  * alpha);
      inc(dst_x);
    end;

    dst_y := dst_y + 1;
  end;

  wm.Destroy;
end;

procedure CarregarImagem(AImage: TImage; ABlobField: TBlobField);
var
  JpgImg: TJPEGImage;
  StMem: TMemoryStream;
begin
  if not ABlobField.DataSet.IsEmpty then
  begin
    AImage.Picture.Assign(nil);

    if not (ABlobField.IsNull) and not (ABlobField.AsString = '') then
    begin
      jpgImg := TJPEGImage.Create;
      stMem := TMemoryStream.Create;

      try
        ABlobField.SaveToStream(StMem);
        StMem.Position := 0;
        JpgImg.LoadFromStream(StMem);
        AImage.Picture.Assign(JpgImg);
      finally
        StMem.Free;
        JpgImg.Free;
      end;
    end;
  end;
end;

function DiaSemanaExtenso(dtDia : TDateTime) : String;
var
  iDia        : Integer;
  arDiaSemana : array [1..7] of String[13];
begin
  arDiaSemana[1] := 'Domingo';
  arDiaSemana[2] := 'Segunda-feira';
  arDiaSemana[3] := 'Terça-feira';
  arDiaSemana[4] := 'Quarta-feira';
  arDiaSemana[5] := 'Quinta-feira';
  arDiaSemana[6] := 'Sexta-feira';
  arDiaSemana[7] := 'Sábado';
  iDia           := DayOfWeek(dtDia);
  Result         := arDiaSemana[iDia];
end;

function DataExtenso(const dtData : TDateTime) : String;
const
  arrMes : array[1..12] of string = ('Janeiro', 'Fevereiro',
  'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto',
  'Setembro', 'Outubro', 'Novembro', 'Dezembro');
var
  wDia, wMes, wAno : Word;
begin
  DecodeDate(dtData, wAno, wMes, wDia);

  Result := IntToStr(wDia) + ' de ' + arrMes[wMes] + ' de ' + IntToStr(wAno);
end;

function ValorPorExtenso(vlr : Real) : String;
const
  unidade: array[1..19] of string = ('um', 'dois', 'três', 'quatro', 'cinco',
             'seis', 'sete', 'oito', 'nove', 'dez', 'onze',
             'doze', 'treze', 'quatorze', 'quinze', 'dezesseis',
             'dezessete', 'dezoito', 'dezenove');
  centena: array[1..9] of string = ('cento', 'duzentos', 'trezentos',
             'quatrocentos', 'quinhentos', 'seiscentos',
             'setecentos', 'oitocentos', 'novecentos');
  dezena: array[2..9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta',
             'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array[0..4] of string = ('', 'mil', 'milhão', 'bilhão', 'trilhão');
  qualificaP: array[0..4] of string = ('', 'mil', 'milhões', 'bilhões', 'trilhões');
var
  inteiro : Int64;
  resto : Real;
  vlrS, s, saux, vlrP, centavos : String;
  n, unid, dez, cent, tam, i : Integer;
  umReal, tem : Boolean;
begin
  if (vlr = 0) then
  begin
    Result := 'zero';
    Exit;
  end;

  inteiro := trunc(vlr); // parte inteira do valor
  resto   := vlr - inteiro; // parte fracionária do valor
  vlrS    := inttostr(inteiro);

  if (length(vlrS) > 15) then
  begin
    Result := 'Erro: valor superior a 999 trilhões.';
    Exit;
  end;

  s := '';
  centavos := IntToStr(Round(resto * 100));

// definindo o extenso da parte inteira do valor
  i      := 0;
  umReal := False;
  tem    := False;

  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
// retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
// 1a. parte = 789 (centena)
// 2a. parte = 456 (mil)
// 3a. parte = 123 (milhões)
    if (tam > 3) then
    begin
      vlrP := copy(vlrS, tam-2, tam);
      vlrS := copy(vlrS, 1, tam-3);
    end
    else
    begin // última parte do valor
      vlrP := vlrS;
      vlrS := '0';
    end;

    if (vlrP <> '000') then
    begin
      saux := '';

      if (vlrP = '100') then
        saux := 'cem'
      else
      begin
        n    := strtoint(vlrP);     // para n = 371, tem-se:
        cent := n div 100;          // cent = 3 (centena trezentos)
        dez  := (n mod 100) div 10; // dez  = 7 (dezena setenta)
        unid := (n mod 100) mod 10; // unid = 1 (unidade um)

        if (cent <> 0) then
          saux := centena[cent];

        if ((dez <> 0) or (unid <> 0)) then
        begin
          if ((n mod 100) <= 19) then
          begin
            if (length(saux) <> 0) then
              saux := saux + ' e ' + unidade[n mod 100]
            else
              saux := unidade[n mod 100];
          end
          else
          begin
            if (length(saux) <> 0) then
              saux := saux + ' e ' + dezena[dez]
            else
              saux := dezena[dez];

            if (unid <> 0) then
            begin
              if (length(saux) <> 0) then
                saux := saux + ' e ' + unidade[unid]
              else
                saux := unidade[unid];
            end;
          end;
        end;
      end;

      if ((vlrP = '1') or (vlrP = '001')) then
      begin    // 1a. parte do valor (um real)
        if (i = 0) then
          umReal := true
        else
          saux := saux + ' ' + qualificaS[i];
      end
      else if (i <> 0) then
        saux := saux + ' ' + qualificaP[i];

      if (length(s) <> 0) then
        s := saux + ', ' + s
      else
        s := saux;
    end;

    if (((i = 0) or (i = 1)) and (length(s) <> 0)) then
      tem := true; // tem centena ou mil no valor

    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
  end;

  if (length(s) <> 0) then
  begin
    if (umReal) then
      s := s + ' real'
    else if (tem) then
      s := s + ' reais'
    else
      s := s + ' de reais';
  end;
// definindo o extenso dos centavos do valor
  if (centavos <> '0') then // valor com centavos
  begin
    if (Length(s) <> 0) then // se não é valor somente com centavos
      s := s + ' e ';

    if (centavos = '1') then
      s := s + 'um centavo'
    else
    begin
      n := StrToInt(centavos);

      if (n <= 19) then
        s := s + unidade[n]
      else
      begin                 // para n = 37, tem-se:
        unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
        dez  := n div 10;   // dez  = 37 / 10 = 3 (dezena trinta)
        s    := s + dezena[dez];

        if (unid <> 0) then s
          := s + ' e ' + unidade[unid];
      end;

      s := s + ' centavos';
    end;
  end;

  Result := s;
end;

function RetornaNomeComputador : String;
var
  ipbuffer : String;
  nsize : DWord;
begin
  Result := '';
  nsize  := 255;
  SetLength(ipbuffer,nsize);

  if GetComputerName(pchar(ipbuffer),nsize) then
    Result := ipbuffer.Remove(Pos(#0, ipbuffer)-1);

{
var
  aNetInterfaceList : tNetworkInterfaceList;
  i                 : Integer;
begin
  Result := '';

  if (GetNetworkInterfaces(aNetInterfaceList)) then
  begin
    for i := 0 to High(aNetInterfaceList) do
    begin
      if (not aNetInterfaceList[i].IsLoopback) and (aNetInterfaceList[i].IsInterfaceUp) then
      begin
        Result := aNetInterfaceList[i].ComputerName;
        RemoveChar(Result, #0);
        Break;
      end;
    end;
  end;
  }
end;

function RetornaIpComputador : String;
var
  i                 : Integer;
  aNetInterfaceList : tNetworkInterfaceList;
begin
  Result := '';

  if (GetNetworkInterfaces(aNetInterfaceList)) then
  begin
    for i := 0 to High(aNetInterfaceList) do
    begin
      if (not aNetInterfaceList[i].IsLoopback) and (aNetInterfaceList[i].IsInterfaceUp) then
      begin
        Result := aNetInterfaceList[i].AddrIP;
        Break;
      end;
    {
      mInfoPlacaRede.Lines.Add ('');
      mInfoPlacaRede.Lines.Add ('#                          : ' + IntToStr(i));
      mInfoPlacaRede.Lines.Add ('Name                       : ' + aNetInterfaceList[i].ComputerName);
      mInfoPlacaRede.Lines.Add ('IP-Address                 : ' + aNetInterfaceList[i].AddrIP);
      mInfoPlacaRede.Lines.Add ('Subnet mask                : ' + aNetInterfaceList[i].SubnetMask);
      mInfoPlacaRede.Lines.Add ('Net address                : ' + aNetInterfaceList[i].AddrNet);
      mInfoPlacaRede.Lines.Add ('Limited broadcast address  : ' + aNetInterfaceList[i].AddrLimitedBroadcast);
      mInfoPlacaRede.Lines.Add ('Directed Broadcast address : ' + aNetInterfaceList[i].AddrDirectedBroadcast);
      mInfoPlacaRede.Lines.Add ('Interface up               : ' + BoolToStr (aNetInterfaceList[i].IsInterfaceUp, True));
      mInfoPlacaRede.Lines.Add ('Broadcast supported        : ' + BoolToStr (aNetInterfaceList[i].BroadcastSupport, True));
      mInfoPlacaRede.Lines.Add ('Loopback interface         : ' + BoolToStr (aNetInterfaceList[i].IsLoopback, True));
      mInfoPlacaRede.Lines.Add ('');
      }
    end;
  end;
end;

procedure GerarCodigo(const fdConn       : TFDConnection;
                      const qyDados      : TFDQuery;
                      const sTabela,
                            sCampoCodigo : String;
                      const iValorCodigo : Integer;
                      const sWhere       : String = ''
                     );
var
  stDados : TStringList;

  function RetornaUltCodigo : Integer;
  begin
    stDados.Clear;
    ExecuteSimplesSql(fdConn,
                      'SELECT MAX(' + sCampoCodigo + ') AS ultCod ' +
                      '  FROM erp.' + sTabela +
                      ' ' + sWhere,
                      'ultCod',
                      stDados
                     );

    Result := StrToIntDef(stDados.Strings[0], 0) + 1;
  end;
begin
  if qyDados.State = dsInsert then
  begin
    stDados := TStringList.Create;

    try
      if iValorCodigo > 0 then
      begin
        ExecuteSimplesSql(fdConn,
                          'SELECT ' + sCampoCodigo + ' AS codigo ' +
                          '  FROM erp.' + sTabela +
                          ' WHERE ' + sCampoCodigo + ' = ' + IntToStr(iValorCodigo),
                          'codigo',
                          stDados
                         );

        if (stDados.Count > 0) and (StrToIntDef(stDados.Strings[0], 0) > 0) then
        begin
          Aviso('Código informado já existe para outro cadastro.');
          Abort;
        end
        else
          qyDados.FieldByName(sCampoCodigo).AsInteger := iValorCodigo;
      end
      else
        qyDados.FieldByName(sCampoCodigo).AsInteger := RetornaUltCodigo;
    finally
      if Assigned(stDados) then
        FreeAndNil(stDados);
    end;
  end;
end;

end.
