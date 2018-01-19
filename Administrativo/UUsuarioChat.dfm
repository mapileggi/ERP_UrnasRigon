object FUsuarioChat: TFUsuarioChat
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Chat ERP'
  ClientHeight = 476
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spChat: TSplitter
    Left = 286
    Top = 49
    Width = 8
    Height = 375
    Align = alRight
    ExplicitLeft = 374
    ExplicitTop = 0
    ExplicitHeight = 364
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 424
    Width = 479
    Height = 52
    Align = alBottom
    TabOrder = 0
    object btEnviar: TBitBtn
      Left = 368
      Top = 1
      Width = 55
      Height = 50
      Align = alRight
      Caption = '&Enviar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btEnviarClick
      ExplicitLeft = 362
      ExplicitTop = 6
    end
    object btFechar: TBitBtn
      Left = 423
      Top = 1
      Width = 55
      Height = 50
      Align = alRight
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btFecharClick
    end
    object mMsg: TMemo
      Left = 1
      Top = 1
      Width = 367
      Height = 50
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
      OnKeyDown = mMsgKeyDown
    end
  end
  object gbMensagensEntre: TGroupBox
    Left = 0
    Top = 0
    Width = 479
    Height = 49
    Align = alTop
    Caption = ' Mensagens Entre: '
    TabOrder = 1
    object lbdtMensagemA: TLabel
      Left = 109
      Top = 20
      Width = 6
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'a'
      ParentBiDiMode = False
    end
    object eddtMensagemIni: TDateTimePicker
      Left = 10
      Top = 17
      Width = 93
      Height = 21
      Date = 42342.685948726850000000
      Time = 42342.685948726850000000
      TabOrder = 0
    end
    object eddtMensagemFim: TDateTimePicker
      Left = 120
      Top = 17
      Width = 93
      Height = 21
      Date = 42342.685948726850000000
      Time = 42342.685948726850000000
      TabOrder = 1
    end
  end
  object pnNomes: TPanel
    Left = 294
    Top = 49
    Width = 185
    Height = 375
    Align = alRight
    TabOrder = 2
    ExplicitHeight = 314
    DesignSize = (
      185
      375)
    object lbUsuarios: TLabel
      Left = 3
      Top = 10
      Width = 79
      Height = 22
      Alignment = taRightJustify
      Caption = 'Usu'#225'rios:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lbNome: TLabel
      Left = 3
      Top = 179
      Width = 74
      Height = 22
      Alignment = taRightJustify
      Caption = 'Handles:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lbHandles: TListBox
      Left = 0
      Top = 203
      Width = 183
      Height = 172
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
      Visible = False
      ExplicitHeight = 111
    end
    object lbNomes: TListBox
      Left = 0
      Top = 40
      Width = 183
      Height = 335
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbNomesClick
    end
  end
  object reChat: TRichEdit
    Left = 0
    Top = 49
    Width = 286
    Height = 375
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Zoom = 100
    ExplicitWidth = 388
    ExplicitHeight = 314
  end
end
