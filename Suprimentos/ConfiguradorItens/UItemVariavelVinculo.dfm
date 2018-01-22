object FItemVariavelVinculo: TFItemVariavelVinculo
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'V'#237'nculo de Vari'#225'vel ao Item'
  ClientHeight = 555
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBotoes: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 56
    Align = alTop
    TabOrder = 0
    object btSalvar: TBitBtn
      Left = 1
      Top = 1
      Width = 55
      Height = 54
      Align = alLeft
      Caption = '&Salvar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btSalvarClick
    end
    object btFechar: TBitBtn
      Left = 175
      Top = 1
      Width = 55
      Height = 54
      Align = alLeft
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btFecharClick
    end
    object btExluir: TBitBtn
      Left = 56
      Top = 1
      Width = 55
      Height = 54
      Align = alLeft
      Caption = '&Excluir'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 2
      OnClick = btExluirClick
    end
    object btLiberarBloquear: TBitBtn
      Left = 111
      Top = 1
      Width = 64
      Height = 54
      Align = alLeft
      Caption = 'Liber./Bloq.'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 3
      WordWrap = True
      OnClick = btLiberarBloquearClick
    end
  end
  object sbDados: TScrollBox
    Left = 0
    Top = 56
    Width = 939
    Height = 499
    Align = alClient
    TabOrder = 1
    DesignSize = (
      935
      495)
    object lbVariavelItens: TLabel
      Left = 3
      Top = 34
      Width = 150
      Height = 19
      Alignment = taRightJustify
      Caption = 'Vari'#225'veis do Item:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbcdItem: TLabel
      Left = 69
      Top = 8
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Item:'
    end
    object grDados: TDBGrid
      Left = 1
      Top = 59
      Width = 672
      Height = 421
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dsDados
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEditButtonClick = grDadosEditButtonClick
      Columns = <
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'cdvariavel'
          Title.Caption = 'Vari'#225'vel'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'devariavel'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 199
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'cdvariavelitempadrao'
          Title.Caption = 'C'#243'd. Item Var. Padr'#227'o'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'devariavelitempadrao'
          ReadOnly = True
          Title.Caption = 'Desc. Item Var. Padr'#227'o'
          Width = 265
          Visible = True
        end>
    end
    object edcdItem: TDBCampoCodigo
      Left = 97
      Top = 6
      Width = 810
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      ERPCampoCodigoPK = True
      ERPCharCase = ecUpperCase
      ERPEdCampoChaveWidth = 90
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPOnEdCampoChaveExit = edcdItemERPOnEdCampoChaveExit
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT b.cdItem,'
        '                     b.deItem,'
        '                     b.flAtivo,'
        '       c.deItemTipo,'
        '       b.flItemRevenda'
        '          FROM erp.item b'
        
          '         LEFT JOIN erp.itemTipo c ON (c.cdItemTipo = b.cdItemTip' +
          'o)'
        '         ORDER BY b.cdItem'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdItem'
        'deItem'
        'flAtivo'
        'deItemTipo'
        'flItemRevenda')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o'
        'Ativo'
        'Tipo Item'
        #201' Revenda')
      ERPCampoChave = 'cdItem'
      ERPCampoDescricao = 'deItem'
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftString
    end
  end
  object dsDados: TDataSource
    DataSet = DmERP.qyItemVinculoVariavel
    Left = 463
    Top = 9
  end
end
