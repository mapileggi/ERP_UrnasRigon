object FMensagemAviso: TFMensagemAviso
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Mensagem de Aviso'
  ClientHeight = 243
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnMensagem: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 211
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object mMensagem: TMemo
      Left = 0
      Top = 0
      Width = 550
      Height = 211
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clMenu
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object pnBotao: TPanel
    Left = 0
    Top = 211
    Width = 550
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btOk: TButton
      Left = 225
      Top = 3
      Width = 60
      Height = 25
      Caption = '&Ok'
      ModalResult = 8
      TabOrder = 0
      OnClick = btOkClick
    end
  end
end
