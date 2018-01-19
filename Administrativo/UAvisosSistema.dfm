object FAvisosSistema: TFAvisosSistema
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Quadro de Avisos'
  ClientHeight = 548
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcQuadroAvisos: TPageControl
    Left = 0
    Top = 0
    Width = 737
    Height = 548
    ActivePage = tsAviso1
    Align = alClient
    TabOrder = 0
    object tsAviso1: TTabSheet
      Caption = 'Aqui vai o t'#237'tulo do aviso'
      object grAviso1: TDBGrid
        Left = 0
        Top = 45
        Width = 729
        Height = 475
        Align = alClient
        DataSource = dsAviso1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grAviso1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'deAviso'
            ImeName = 'deAviso'
            Title.Caption = 'Cobran'#231'as'
            Width = 709
            Visible = True
          end>
      end
      object pnAviso1: TPanel
        Left = 0
        Top = 0
        Width = 729
        Height = 45
        Align = alTop
        TabOrder = 1
        object lbAviso1: TLabel
          Left = 1
          Top = 1
          Width = 727
          Height = 43
          Align = alClient
          Caption = 'Aqui vai o texto padr'#227'o do aviso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 301
          ExplicitHeight = 25
        end
      end
    end
    object tsAviso2: TTabSheet
      Caption = 'Aqui vai o t'#237'tulo do aviso'
      ImageIndex = 1
      object pnAviso2: TPanel
        Left = 0
        Top = 0
        Width = 729
        Height = 45
        Align = alTop
        TabOrder = 0
        object lbAviso2: TLabel
          Left = 1
          Top = 1
          Width = 727
          Height = 43
          Align = alClient
          Caption = 'Aqui vai o texto padr'#227'o do aviso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 301
          ExplicitHeight = 25
        end
      end
      object grAviso2: TDBGrid
        Left = 0
        Top = 45
        Width = 729
        Height = 475
        Align = alClient
        DataSource = dsAviso2
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grAviso2DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'deAviso'
            ImeName = 'deAviso'
            Title.Caption = 'Manuten'#231#245'es de Patrim'#244'nios'
            Width = 709
            Visible = True
          end>
      end
    end
    object tsAviso3: TTabSheet
      Caption = 'Aqui vai o t'#237'tulo do aviso'
      ImageIndex = 2
      object pnAviso3: TPanel
        Left = 0
        Top = 0
        Width = 729
        Height = 45
        Align = alTop
        TabOrder = 0
        object lbAviso3: TLabel
          Left = 1
          Top = 1
          Width = 727
          Height = 43
          Align = alClient
          Caption = 'Aqui vai o texto padr'#227'o do aviso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 301
          ExplicitHeight = 25
        end
      end
      object grAviso3: TDBGrid
        Left = 0
        Top = 45
        Width = 729
        Height = 475
        Align = alClient
        DataSource = dsAviso3
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grAviso3DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'deAviso'
            ImeName = 'deAviso'
            Title.Caption = 'Aniversariantes'
            Width = 709
            Visible = True
          end>
      end
    end
    object tsAviso4: TTabSheet
      Caption = 'Aqui vai o t'#237'tulo do aviso'
      ImageIndex = 3
      object pnAviso4: TPanel
        Left = 0
        Top = 0
        Width = 729
        Height = 45
        Align = alTop
        TabOrder = 0
        object lbAviso4: TLabel
          Left = 1
          Top = 1
          Width = 727
          Height = 43
          Align = alClient
          Caption = 'Aqui vai o texto padr'#227'o do aviso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 301
          ExplicitHeight = 25
        end
      end
      object grAviso4: TDBGrid
        Left = 0
        Top = 45
        Width = 729
        Height = 475
        Align = alClient
        DataSource = dsAviso4
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grAviso4DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'deAviso'
            ImeName = 'deAviso'
            Title.Caption = 'Entradas de Materiais para Aprova'#231#227'o/Rejei'#231#227'o'
            Width = 709
            Visible = True
          end>
      end
    end
    object tsAviso5: TTabSheet
      Caption = 'Aqui vai o t'#237'tulo do aviso'
      ImageIndex = 4
      object pnAviso5: TPanel
        Left = 0
        Top = 0
        Width = 729
        Height = 45
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
        object lbAviso5: TLabel
          Left = 1
          Top = 1
          Width = 727
          Height = 43
          Align = alClient
          Caption = 'Aqui vai o texto padr'#227'o do aviso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
          ExplicitWidth = 301
          ExplicitHeight = 25
        end
      end
      object grAviso5: TDBGrid
        Left = 0
        Top = 45
        Width = 729
        Height = 475
        Align = alClient
        DataSource = dsAviso5
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grAviso5DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'deAviso'
            ImeName = 'deAviso'
            Title.Caption = 'Aniversariantes'
            Width = 709
            Visible = True
          end>
      end
    end
  end
  object dsAviso1: TDataSource
    AutoEdit = False
    DataSet = qyAviso1
    Left = 52
    Top = 112
  end
  object qyAviso1: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      '')
    Left = 118
    Top = 112
  end
  object dsAviso2: TDataSource
    AutoEdit = False
    DataSet = qyAviso2
    Left = 52
    Top = 168
  end
  object qyAviso2: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      '')
    Left = 118
    Top = 168
  end
  object dsAviso3: TDataSource
    AutoEdit = False
    DataSet = qyAviso3
    Left = 52
    Top = 216
  end
  object qyAviso3: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      '')
    Left = 118
    Top = 216
  end
  object dsAviso4: TDataSource
    AutoEdit = False
    DataSet = qyAviso4
    Left = 52
    Top = 264
  end
  object qyAviso4: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      '')
    Left = 118
    Top = 264
  end
  object dsAviso5: TDataSource
    AutoEdit = False
    DataSet = qyAviso5
    Left = 52
    Top = 312
  end
  object qyAviso5: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      '')
    Left = 118
    Top = 312
  end
end
