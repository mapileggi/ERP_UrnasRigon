object FTrocarSenha: TFTrocarSenha
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Troca de Senha'
  ClientHeight = 142
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbNomeUsuario: TLabel
    Left = 65
    Top = 10
    Width = 85
    Height = 13
    Caption = 'Nome do Usu'#225'rio:'
  end
  object lbSenhaAtual: TLabel
    Left = 88
    Top = 35
    Width = 62
    Height = 13
    Caption = 'Senha Atual:'
  end
  object lbNovaSenha: TLabel
    Left = 88
    Top = 60
    Width = 62
    Height = 13
    Caption = 'Nova Senha:'
  end
  object lbNovaSenhaConf: TLabel
    Left = 33
    Top = 85
    Width = 117
    Height = 13
    Caption = 'Confirme a Nova Senha:'
  end
  object eddeLogin: TEdit
    Left = 156
    Top = 8
    Width = 180
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object edSenhaAtual: TEdit
    Left = 156
    Top = 33
    Width = 180
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object btTrocarSenha: TButton
    Left = 156
    Top = 111
    Width = 87
    Height = 25
    Caption = 'Trocar Senha'
    TabOrder = 3
    OnClick = btTrocarSenhaClick
  end
  object btSair: TButton
    Left = 249
    Top = 111
    Width = 87
    Height = 25
    Caption = 'Sair'
    TabOrder = 4
    OnClick = btSairClick
  end
  object edNovaSenha: TEdit
    Left = 156
    Top = 58
    Width = 180
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object edNovaSenhaConf: TEdit
    Left = 156
    Top = 83
    Width = 180
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
end
