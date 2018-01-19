object FLogin: TFLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = '..: NOME CLIENTE SISTEMA Ltda :..  | ERP NOVO |'
  ClientHeight = 233
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    329
    233)
  PixelsPerInch = 96
  TextHeight = 13
  object lbCopyright: TLabel
    Left = 25
    Top = 216
    Width = 289
    Height = 13
    Anchors = [akBottom]
    Caption = #169' Copyright 2016 ERP NOVO - Todos os direitos reservados'
    ExplicitLeft = 26
    ExplicitTop = 233
  end
  object imLogoCliente: TImage
    Left = 112
    Top = 1
    Width = 116
    Height = 65
    Stretch = True
  end
  object UniPanel1: TPanel
    Left = 63
    Top = 72
    Width = 201
    Height = 136
    Anchors = []
    TabOrder = 0
    object lbdeLogin: TLabel
      Left = 11
      Top = 31
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object lbdeSenha: TLabel
      Left = 17
      Top = 59
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object lbAcessoRestrito: TLabel
      Left = 4
      Top = 1
      Width = 72
      Height = 13
      Caption = 'Acesso restrito'
    end
    object eddeLogin: TEdit
      Left = 53
      Top = 29
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyDown = eddeLoginKeyDown
    end
    object eddeSenha: TEdit
      Left = 53
      Top = 57
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = eddeSenhaKeyDown
    end
    object btEntrar: TButton
      Left = 53
      Top = 84
      Width = 60
      Height = 25
      Caption = 'Entrar'
      TabOrder = 2
      OnClick = btEntrarClick
    end
    object btFechar: TButton
      Left = 114
      Top = 84
      Width = 60
      Height = 25
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btFecharClick
    end
  end
end
