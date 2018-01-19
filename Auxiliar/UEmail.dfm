object FEmail: TFEmail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Envio de E-mail'
  ClientHeight = 458
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBotao: TPanel
    Left = 0
    Top = 402
    Width = 638
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btEnviar: TBitBtn
      Left = 0
      Top = 0
      Width = 55
      Height = 56
      Align = alLeft
      Caption = '&Enviar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btEnviarClick
    end
    object btFechar: TBitBtn
      Left = 55
      Top = 0
      Width = 55
      Height = 56
      Align = alLeft
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btFecharClick
    end
  end
  object pnDadosEmail: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 402
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      638
      402)
    object lbPara: TLabel
      Left = 3
      Top = 2
      Width = 26
      Height = 13
      Caption = 'Para:'
    end
    object lbCc: TLabel
      Left = 3
      Top = 43
      Width = 16
      Height = 13
      Caption = 'Cc:'
    end
    object lbCco: TLabel
      Left = 3
      Top = 84
      Width = 22
      Height = 13
      Caption = 'Cco:'
    end
    object lbAssunto: TLabel
      Left = 3
      Top = 124
      Width = 43
      Height = 13
      Caption = 'Assunto:'
    end
    object lbTextoEmail: TLabel
      Left = 3
      Top = 238
      Width = 63
      Height = 13
      Caption = 'Texto e-mail:'
    end
    object lbAnexos: TLabel
      Left = 3
      Top = 166
      Width = 40
      Height = 13
      Caption = 'Anexos:'
    end
    object mTextoEmail: TMemo
      Left = 3
      Top = 256
      Width = 632
      Height = 145
      Anchors = [akLeft, akTop, akRight, akBottom]
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object edPara: TEdit
      Left = 3
      Top = 19
      Width = 632
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edCc: TEdit
      Left = 3
      Top = 60
      Width = 632
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edCco: TEdit
      Left = 3
      Top = 101
      Width = 632
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edAssunto: TEdit
      Left = 3
      Top = 141
      Width = 632
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object lbListaAnexo: TListBox
      Left = 3
      Top = 185
      Width = 632
      Height = 42
      TabStop = False
      ItemHeight = 13
      TabOrder = 3
    end
  end
end
