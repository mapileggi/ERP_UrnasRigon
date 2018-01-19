object FChatServer: TFChatServer
  Left = 0
  Top = 0
  Caption = 'Servidor Chat ERP'
  ClientHeight = 496
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    854
    496)
  PixelsPerInch = 96
  TextHeight = 13
  object lNomes: TLabel
    Left = 8
    Top = 5
    Width = 71
    Height = 24
    Caption = 'Nomes:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lHandles: TLabel
    Left = 256
    Top = 5
    Width = 82
    Height = 24
    Caption = 'Sockets:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbMensagem: TLabel
    Left = 504
    Top = 461
    Width = 108
    Height = 24
    Anchors = [akLeft, akBottom]
    Caption = 'Mensagem:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbChat: TLabel
    Left = 504
    Top = 5
    Width = 50
    Height = 24
    Caption = 'Chat:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbNomes: TListBox
    Left = 8
    Top = 32
    Width = 240
    Height = 460
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object lbHandles: TListBox
    Left = 256
    Top = 32
    Width = 240
    Height = 460
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object Button1: TButton
    Left = 421
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Kick'
    TabOrder = 2
    OnClick = Button1Click
  end
  object mChat: TMemo
    Left = 504
    Top = 32
    Width = 346
    Height = 393
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
  end
  object edMensagem: TEdit
    Left = 615
    Top = 459
    Width = 152
    Height = 30
    Anchors = [akLeft, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnKeyPress = edMensagemKeyPress
  end
  object btEnviar: TButton
    Left = 773
    Top = 463
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Enviar'
    TabOrder = 5
    OnClick = btEnviarClick
  end
  object skServer: TServerSocket
    Active = False
    Port = 1982
    ServerType = stNonBlocking
    OnClientConnect = skServerClientConnect
    OnClientDisconnect = skServerClientDisconnect
    OnClientRead = skServerClientRead
    OnClientError = skServerClientError
    Left = 64
    Top = 224
  end
end
