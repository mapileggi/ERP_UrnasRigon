object FRegistroPonto: TFRegistroPonto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Registro Ponto'
  ClientHeight = 140
  ClientWidth = 548
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
  DesignSize = (
    548
    140)
  PixelsPerInch = 96
  TextHeight = 13
  object lbnmColaborador: TLabel
    Left = 13
    Top = 8
    Width = 120
    Height = 25
    Alignment = taRightJustify
    Caption = 'Colaborador:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ednmColaborador: TEdit
    Left = 139
    Top = 7
    Width = 406
    Height = 33
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object btRegistrar: TBitBtn
    Left = 139
    Top = 84
    Width = 55
    Height = 52
    Caption = '&Registrar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 0
    OnClick = btRegistrarClick
  end
  object btFechar: TBitBtn
    Left = 193
    Top = 84
    Width = 55
    Height = 52
    Caption = '&Fechar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 1
    OnClick = btFecharClick
  end
  object edDataHoraReg: TEdit
    Left = 139
    Top = 47
    Width = 406
    Height = 33
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end
