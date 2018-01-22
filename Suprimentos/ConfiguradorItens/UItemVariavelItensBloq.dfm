object FItemVariavelItensBloq: TFItemVariavelItensBloq
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Libera'#231#227'o/Bloqueio de Valores'
  ClientHeight = 537
  ClientWidth = 765
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    765
    537)
  PixelsPerInch = 96
  TextHeight = 13
  object grLiberados: TDBGrid
    Left = 8
    Top = 8
    Width = 350
    Height = 519
    Anchors = [akLeft, akTop, akBottom]
    DataSource = dsLiberados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'devalor'
        Title.Caption = 'Valores Liberados'
        Width = 350
        Visible = True
      end>
  end
  object grBloqueados: TDBGrid
    Left = 409
    Top = 8
    Width = 350
    Height = 519
    Anchors = [akLeft, akTop, akBottom]
    DataSource = dsBloqueados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'devalor'
        Title.Caption = 'Valores Bloqueados'
        Width = 350
        Visible = True
      end>
  end
  object btBloquear: TButton
    Left = 363
    Top = 72
    Width = 40
    Height = 25
    Caption = '>'
    TabOrder = 2
    OnClick = btBloquearClick
  end
  object btLiberar: TButton
    Left = 363
    Top = 96
    Width = 40
    Height = 25
    Caption = '<'
    TabOrder = 3
    OnClick = btLiberarClick
  end
  object btBloquearTodos: TButton
    Left = 363
    Top = 120
    Width = 40
    Height = 25
    Caption = '>>'
    TabOrder = 4
    OnClick = btBloquearTodosClick
  end
  object btLiberarTodos: TButton
    Left = 363
    Top = 144
    Width = 40
    Height = 25
    Caption = '<<'
    TabOrder = 5
    OnClick = btLiberarTodosClick
  end
  object dsLiberados: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyItemVarItensLib
    Left = 88
    Top = 120
  end
  object dsBloqueados: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyItemVariavelItensBloq
    Left = 560
    Top = 128
  end
end
