inherited FIntIndItemRelacionadoCadastro: TFIntIndItemRelacionadoCadastro
  Caption = 'Itens Relacionados'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdItemRelacionado: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbcdItem: TLabel
      Left = 69
      Top = 33
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Item:'
    end
    object lbcdTamanho: TLabel
      Left = 47
      Top = 57
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tamanho:'
    end
    object lbcdTamanhoBase: TLabel
      Left = 21
      Top = 105
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tamanho Base:'
    end
    object lbcdItemBase: TLabel
      Left = 43
      Top = 81
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Item Base:'
    end
    object edcdIntIndItemRelacionado: TDBCampoCodigo
      Left = 97
      Top = 4
      Width = 91
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      ERPCampoCodigoPK = True
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
        'SELECT *'
        '  FROM  erp.intIndItemRelacionado '
        '  &filtro'
        ' ORDER BY cdItemRelacionado')
      ERPCamposFiltro.Strings = (
        'cdItemRelacionado'
        'cdItem'
        'deItem'
        'deTamanho'
        'cdItemBase'
        'deItemBase'
        'deTamanhoBase')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'C'#243'd. Item'
        'Desc. Item'
        'Tamanho'
        'C'#243'd. Item Base'
        'Desc. Item Base'
        'Tamanho Base')
      ERPCampoChave = 'cdItemRelacionado'
      ERPCampoDescricao = 'cdItemRelacionado'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdItem: TDBCampoCodigo
      Left = 97
      Top = 30
      Width = 343
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
      ERPOnEdCampoChaveExit = edcdItemERPOnEdCampoChaveExit
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT TRIM(a.item) AS cdItem,'
        '               TRIM(a.descricao) AS deItem'
        '          FROM item a'
        '         WHERE a.codigo_familia = 30'
        '           AND a.flag_tipo_prod <> '#39'R'#39
        '           AND a.item NOT LIKE '#39'%.12%'#39
        
          '           AND ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39#39 +
          '))'
        '         ORDER BY a.item'
        '       ) t'
        '&filtro')
      ERPCamposFiltro.Strings = (
        'cdItem'
        'deItem')
      ERPCamposFiltroTitulo.Strings = (
        'Item'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItem'
      ERPCampoDescricao = 'deItem'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmIntegracao.fdConnInteg
      ERPCampoChaveDataType = ftString
    end
    object lcbcdTamanho: TDBLookupComboBox
      Left = 97
      Top = 54
      Width = 204
      Height = 21
      DataField = 'cdtamanho'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdTamanho'
      ListField = 'deTamanho'
      ListSource = dsTamanho
      TabOrder = 2
      OnExit = lcbcdTamanhoExit
    end
    object lcbcdTamanhoBase: TDBLookupComboBox
      Left = 97
      Top = 102
      Width = 204
      Height = 21
      DataField = 'cdtamanhobase'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdTamanhoBase'
      ListField = 'deTamanhoBase'
      ListSource = dsTamanhoBase
      TabOrder = 4
      OnExit = lcbcdTamanhoBaseExit
    end
    object edcdItemBase: TDBCampoCodigo
      Left = 97
      Top = 78
      Width = 343
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 3
      ERPCampoCodigoPK = False
      ERPCharCase = ecUpperCase
      ERPEdCampoChaveWidth = 65
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPOnEdCampoChaveExit = edcdItemBaseERPOnEdCampoChaveExit
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT TRIM(a.item) AS cdItemBase,'
        '               TRIM(a.descricao) AS deItemBase'
        '          FROM item a'
        '         WHERE a.codigo_familia = 30'
        '           AND a.flag_tipo_prod <> '#39'R'#39
        '           AND a.item NOT LIKE '#39'%.12%'#39
        
          '           AND ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39#39 +
          '))'
        '         ORDER BY a.item'
        '       ) t'
        '&filtro')
      ERPCamposFiltro.Strings = (
        'cdItemBase'
        'deItemBase')
      ERPCamposFiltroTitulo.Strings = (
        'Item'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItemBase'
      ERPCampoDescricao = 'deItemBase'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmIntegracao.fdConnInteg
      ERPCampoChaveDataType = ftString
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyIntIndItemRelacionado
    end
  end
  object dsTamanho: TDataSource
    AutoEdit = False
    DataSet = vtTamanho
    Left = 504
    Top = 10
  end
  object vtTamanho: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'deTamanho'
    Left = 576
    Top = 10
    Data = {03000000000000000000}
    object vtTamanhocdTamanho: TIntegerField
      FieldName = 'cdTamanho'
    end
    object vtTamanhodeTamanho: TStringField
      FieldName = 'deTamanho'
      Size = 250
    end
  end
  object dsTamanhoBase: TDataSource
    AutoEdit = False
    DataSet = vtTamanhoBase
    Left = 504
    Top = 58
  end
  object vtTamanhoBase: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'deTamanhoBase'
    Left = 592
    Top = 58
    Data = {03000000000000000000}
    object vtTamanhoBasecdTamanhoBase: TIntegerField
      FieldName = 'cdTamanhoBase'
    end
    object vtTamanhoBasedeTamanhoBase: TStringField
      FieldName = 'deTamanhoBase'
      Size = 250
    end
  end
end
