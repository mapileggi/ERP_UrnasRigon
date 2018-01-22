object FIntIndMaterialEstoqueConsulta: TFIntIndMaterialEstoqueConsulta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Materiais em Estoque'
  ClientHeight = 509
  ClientWidth = 770
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
  object pnOpcoes: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 77
    Align = alTop
    TabOrder = 0
    DesignSize = (
      770
      77)
    object lbcdMaterial: TLabel
      Left = 50
      Top = 31
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Material:'
    end
    object lbdeMaterial: TLabel
      Left = 36
      Top = 55
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desc. Mat.:'
    end
    object lbcdCentroCusto: TLabel
      Left = 9
      Top = 7
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object edcdMaterial: TDBCampoCodigo
      Left = 93
      Top = 28
      Width = 455
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 1
      ERPCampoCodigoPK = False
      ERPCharCase = ecUpperCase
      ERPEdCampoChaveWidth = 65
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '              SELECT TRIM(a.item)      AS cdMaterial,'
        '                           TRIM(a.descricao) AS deMaterial'
        '                FROM item a'
        '              WHERE a.tipo_item = '#39'C'#39
        '              ORDER BY a.item'
        '           ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdMaterial'
        'deMaterial')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdMaterial'
      ERPCampoDescricao = 'deMaterial'
      ERPConnection = DmIntegracao.fdConnInteg
      ERPCampoChaveDataType = ftString
    end
    object btLocalizar: TBitBtn
      Left = 659
      Top = 21
      Width = 55
      Height = 52
      Anchors = [akTop, akRight]
      Caption = '&Lozalizar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 3
      Visible = False
      OnClick = btLocalizarClick
    end
    object btFechar: TBitBtn
      Left = 713
      Top = 0
      Width = 55
      Height = 52
      Anchors = [akTop, akRight]
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 5
      OnClick = btFecharClick
    end
    object eddeMaterial: TEdit
      Left = 93
      Top = 52
      Width = 220
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edcdCentroCusto: TDBCampoCodigo
      Left = 93
      Top = 4
      Width = 330
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 65
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT a.codigo_cCusto       AS cdCentroCusto,'
        '               a.descricao           AS deCentroCusto'
        '          FROM cCusto a'
        '         ORDER BY a.codigo_cCusto'
        '      ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdCentroCusto'
        'deCentroCusto')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'F'#237's/Jur'
        'CPF/CNPJ'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdCentroCusto'
      ERPCampoDescricao = 'deCentroCusto'
      ERPConnection = DmIntegracao.fdConnInteg
      ERPCampoChaveDataType = ftInteger
    end
    object btFiltrar: TBitBtn
      Left = 659
      Top = 0
      Width = 55
      Height = 52
      Anchors = [akTop, akRight]
      Caption = '&Filtrar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 4
      OnClick = btFiltrarClick
    end
  end
  object pnDados: TPanel
    Left = 0
    Top = 77
    Width = 770
    Height = 432
    Align = alClient
    TabOrder = 1
    DesignSize = (
      770
      432)
    object lbMateriaisEsc: TLabel
      Left = 3
      Top = 271
      Width = 171
      Height = 19
      Anchors = [akLeft, akBottom]
      Caption = 'Materiais Escolhidos:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grDados: TDBGrid
      Left = 2
      Top = 1
      Width = 766
      Height = 263
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsMaterialEstoque
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'deCentroCusto'
          Title.Caption = 'Centro de Custo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdMaterial'
          ReadOnly = True
          Title.Caption = 'Material'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deMaterial'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuQtdeEst'
          ReadOnly = True
          Title.Caption = 'Qtde. Estoque'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuQtdeSolic'
          Title.Caption = 'Qtde. Solic'
          Width = 70
          Visible = True
        end>
    end
    object grMateriaisEsc: TDBGrid
      Left = 2
      Top = 296
      Width = 766
      Height = 134
      Anchors = [akLeft, akRight, akBottom]
      DataSource = dsMaterialEsc
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
          FieldName = 'deCentroCusto'
          Title.Caption = 'Centro de Custo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdMaterial'
          ReadOnly = True
          Title.Caption = 'Material'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deMaterial'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuQtdeSolic'
          Title.Caption = 'Qtde. Solic'
          Width = 70
          Visible = True
        end>
    end
  end
  object dsMaterialEstoque: TDataSource
    DataSet = vtMaterialEstoque
    Left = 358
    Top = 152
  end
  object vtMaterialEstoque: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 232
    Top = 159
    Data = {03000000000000000000}
    object vtMaterialEstoquecdMaterial: TStringField
      FieldName = 'cdMaterial'
      Size = 30
    end
    object vtMaterialEstoquedeMaterial: TStringField
      FieldName = 'deMaterial'
      Size = 250
    end
    object vtMaterialEstoquecdUnidadeMedida: TStringField
      FieldName = 'cdUnidadeMedida'
      Size = 3
    end
    object vtMaterialEstoquenuQtdeEst: TFloatField
      FieldName = 'nuQtdeEst'
    end
    object vtMaterialEstoquenuQtdeSolic: TFloatField
      FieldName = 'nuQtdeSolic'
      OnValidate = vtMaterialEstoquenuQtdeSolicValidate
    end
    object vtMaterialEstoquecdCentroCusto: TIntegerField
      FieldName = 'cdCentroCusto'
    end
    object vtMaterialEstoquedeCentroCusto: TStringField
      FieldName = 'deCentroCusto'
      Size = 250
    end
  end
  object vtMaterialEsc: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 232
    Top = 223
    Data = {03000000000000000000}
    object StringField1: TStringField
      FieldName = 'cdMaterial'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'deMaterial'
      Size = 250
    end
    object StringField3: TStringField
      FieldName = 'cdUnidadeMedida'
      Size = 3
    end
    object FloatField2: TFloatField
      FieldName = 'nuQtdeSolic'
    end
    object IntegerField1: TIntegerField
      FieldName = 'cdCentroCusto'
    end
    object StringField4: TStringField
      FieldName = 'deCentroCusto'
      Size = 250
    end
    object vtMaterialEscnuQtdeEst: TFloatField
      FieldName = 'nuQtdeEst'
    end
  end
  object dsMaterialEsc: TDataSource
    AutoEdit = False
    DataSet = vtMaterialEsc
    Left = 358
    Top = 216
  end
end
