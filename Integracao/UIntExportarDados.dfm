object FIntExportarDados: TFIntExportarDados
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Exportar Dados Promob'
  ClientHeight = 488
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    783
    488)
  PixelsPerInch = 96
  TextHeight = 13
  object btSalvar: TBitBtn
    Left = 723
    Top = 3
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = '&Salvar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 0
  end
  object btFechar: TBitBtn
    Left = 723
    Top = 105
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = '&Fechar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 1
    OnClick = btFecharClick
  end
  object mLog: TMemo
    Left = 0
    Top = 163
    Width = 782
    Height = 325
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
