inherited FItemCadastro: TFItemCadastro
  Caption = 'Itens'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdItem: TLabel
      Left = 66
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeItem: TLabel
      Left = 53
      Top = 33
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbcdItemTipo: TLabel
      Left = 54
      Top = 57
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Item:'
    end
    object lbcdUnidadeMedida: TLabel
      Left = 37
      Top = 81
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unid. Medida:'
    end
    object lbcdItemGrupo: TLabel
      Left = 70
      Top = 105
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Grupo:'
    end
    object lbcdItemSubGrupo: TLabel
      Left = 49
      Top = 129
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sub Grupo:'
    end
    object lbcdItemFamilia: TLabel
      Left = 67
      Top = 153
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fam'#237'lia:'
    end
    object lbcdItemOrigem: TLabel
      Left = 65
      Top = 177
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Origem:'
    end
    object lbnmUsuCad: TLabel
      Left = 297
      Top = 7
      Width = 66
      Height = 13
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 541
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Usu'#225'rio Alt.:'
    end
    object lbcdCentroCusto: TLabel
      Left = 20
      Top = 201
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'Centro de Custo:'
    end
    object eddeItem: TDBEdit
      Left = 105
      Top = 30
      Width = 658
      Height = 21
      DataField = 'deitem'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdItem: TDBCampoCodigo
      Left = 105
      Top = 4
      Width = 115
      Height = 21
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
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT a.cdItem,'
        '                     a.deItem,'
        '                     a.flAtivo,'
        '       b.deItemTipo,'
        '       a.flItemRevenda'
        '          FROM erp.item a'
        
          '         LEFT JOIN erp.itemTipo b ON (b.cdItemTipo = a.cdItemTip' +
          'o)'
        '         ORDER BY a.cdItem'
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
      ERPCampoDescricao = 'cdItem'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftString
    end
    object cbflAtivo: TDBCheckBox
      Left = 245
      Top = 6
      Width = 46
      Height = 17
      TabStop = False
      Caption = 'Ativo'
      DataField = 'flativo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 12
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edcdItemTipo: TDBCampoCodigo
      Left = 105
      Top = 54
      Width = 200
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 2
      ERPCampoCodigoPK = False
      ERPCharCase = ecUpperCase
      ERPEdCampoChaveWidth = 30
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
        '        SELECT a.cdItemTipo,'
        '                     a.deItemTipo'
        '          FROM erp.itemTipo a'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdItemTipo'
        'deItemTipo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItemTipo'
      ERPCampoDescricao = 'deItemTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdUnidadeMedida: TDBCampoCodigo
      Left = 105
      Top = 78
      Width = 200
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 3
      ERPCampoCodigoPK = False
      ERPCharCase = ecUpperCase
      ERPEdCampoChaveWidth = 30
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
        '        SELECT a.cdUnidadeMedida,'
        '                     a.deUnidadeMedida'
        '          FROM erp.unidadeMedida a'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdUnidadeMedida'
        'deUnidadeMedida')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdUnidadeMedida'
      ERPCampoDescricao = 'deUnidadeMedida'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftString
    end
    object edcdItemGrupo: TDBCampoCodigo
      Left = 105
      Top = 102
      Width = 335
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 4
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 50
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
        '        SELECT a.cdItemGrupo,'
        '                     a.deItemGrupo'
        '          FROM erp.itemGrupo a'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdItemGrupo'
        'deItemGrupo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItemGrupo'
      ERPCampoDescricao = 'deItemGrupo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdItemSubGrupo: TDBCampoCodigo
      Left = 105
      Top = 126
      Width = 335
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 5
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 50
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPOnEdCampoChaveEnter = edcdItemSubGrupoERPOnEdCampoChaveEnter
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT a.cdItemSubGrupo,'
        '                     a.deItemSubGrupo'
        '          FROM erp.itemSubGrupo a'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdItemSubGrupo'
        'deItemSubGrupo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItemSubGrupo'
      ERPCampoDescricao = 'deItemSubGrupo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdItemFamilia: TDBCampoCodigo
      Left = 105
      Top = 150
      Width = 335
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 6
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 50
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
        '        SELECT a.cdItemFamilia,'
        '                     a.deItemFamilia'
        '          FROM erp.itemFamilia a'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdItemFamilia'
        'deItemFamilia')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItemFamilia'
      ERPCampoDescricao = 'deItemFamilia'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdItemOrigem: TDBCampoCodigo
      Left = 105
      Top = 174
      Width = 335
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 7
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 30
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
        '        SELECT a.cdItemOrigem,'
        '                     a.deItemOrigem'
        '          FROM erp.itemOrigem a'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdItemOrigem'
        'deItemOrigem')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItemOrigem'
      ERPCampoDescricao = 'deItemOrigem'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednmUsuCad: TDBEdit
      Left = 363
      Top = 4
      Width = 162
      Height = 21
      Color = clSilver
      DataField = 'nmusucad'
      DataSource = FrBarraBotoes.dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object ednmUsuAlt: TDBEdit
      Left = 601
      Top = 4
      Width = 162
      Height = 21
      Color = clSilver
      DataField = 'nmusualt'
      DataSource = FrBarraBotoes.dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object gbFaturamento: TGroupBox
      Left = 3
      Top = 249
      Width = 760
      Height = 171
      Caption = ' Faturamento '
      TabOrder = 9
      DesignSize = (
        760
        171)
      object lbcdClassifFiscal: TLabel
        Left = 32
        Top = 20
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Classif. Fiscal:'
      end
      object edcdClassifFiscal: TDBCampoCodigo
        Left = 102
        Top = 17
        Width = 654
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        ERPCampoCodigoPK = True
        ERPCharCase = ecNormal
        ERPEdCampoChaveWidth = 50
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
          '        SELECT a.cdClassifFiscal,'
          '               a.nuClassifFiscal,'
          '               a.deClassifFiscal,'
          
            '               CAST(a.nuClassifFiscal || '#39' - '#39' || a.deClassifFis' +
            'cal AS CHARACTER VARYING(1000)) AS deClasFiscal'
          '          FROM erp.classifFiscal a'
          '         ORDER BY a.cdClassifFiscal'
          '       ) t'
          ' &filtro')
        ERPCamposFiltro.Strings = (
          'cdClassifFiscal'
          'nuClassifFiscal'
          'deClassifFiscal')
        ERPCamposFiltroTitulo.Strings = (
          'C'#243'digo'
          'Classifica'#231#227'o'
          'Descri'#231#227'o')
        ERPCampoChave = 'cdClassifFiscal'
        ERPCampoDescricao = 'deClasFiscal'
        ERPDataSource = FrBarraBotoes.dsDados
        ERPConnection = DmERP.fdConnERP
        ERPCampoChaveDataType = ftInteger
      end
      object gbICMS: TGroupBox
        Left = 4
        Top = 43
        Width = 494
        Height = 122
        Anchors = [akLeft, akTop, akRight]
        Caption = ' ICMS '
        TabOrder = 1
        DesignSize = (
          494
          122)
        object lbcdIcmsSitTrib: TLabel
          Left = 26
          Top = 14
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Situa'#231#227'o Tribut'#225'ria:'
        end
        object lbvlPercIcmsReducao: TLabel
          Left = 32
          Top = 86
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = '% Redu'#231#227'o ICMS:'
        end
        object lbvlPercIcms: TLabel
          Left = 77
          Top = 62
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = '% ICMS:'
        end
        object lbcdIcmsCstEntrada: TLabel
          Left = 56
          Top = 38
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'CST Entrada:'
        end
        object edcdIcmsSitTrib: TDBCampoCodigo
          Left = 122
          Top = 11
          Width = 367
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          ERPCampoCodigoPK = False
          ERPCharCase = ecNormal
          ERPEdCampoChaveWidth = 30
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
            '        SELECT a.cdIcmsSitTrib,'
            '                     a.deIcmsSitTrib'
            '          FROM erp.icmsSitTrib a'
            '       ) t'
            ' &filtro')
          ERPCamposFiltro.Strings = (
            'cdIcmsSitTrib'
            'deIcmsSitTrib')
          ERPCamposFiltroTitulo.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
          ERPCampoChave = 'cdIcmsSitTrib'
          ERPCampoDescricao = 'deIcmsSitTrib'
          ERPDataSource = FrBarraBotoes.dsDados
          ERPConnection = DmERP.fdConnERP
          ERPCampoChaveDataType = ftInteger
        end
        object edvlPercIcmsReducao: TDBEdit
          Left = 122
          Top = 83
          Width = 68
          Height = 21
          DataField = 'vlpercicmsreducao'
          DataSource = FrBarraBotoes.dsDados
          TabOrder = 3
        end
        object edvlPercIcms: TDBEdit
          Left = 121
          Top = 59
          Width = 68
          Height = 21
          DataField = 'vlpercicms'
          DataSource = FrBarraBotoes.dsDados
          TabOrder = 2
        end
        object edcdIcmsSitTribCstEnt: TDBCampoCodigo
          Left = 122
          Top = 35
          Width = 367
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 1
          ERPCampoCodigoPK = False
          ERPCharCase = ecNormal
          ERPEdCampoChaveWidth = 30
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
            '        SELECT a.cdIcmsSitTrib,'
            '               a.deIcmsSitTrib'
            '          FROM erp.icmsSitTrib a'
            '       ) t'
            ' &filtro')
          ERPCamposFiltro.Strings = (
            'cdIcmsSitTrib'
            'deIcmsSitTrib')
          ERPCamposFiltroTitulo.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
          ERPCampoChave = 'cdIcmsSitTrib'
          ERPCampoDescricao = 'deIcmsSitTrib'
          ERPDataSource = FrBarraBotoes.dsDados
          ERPConnection = DmERP.fdConnERP
          ERPCampoChaveDataType = ftInteger
        end
      end
      object gbIPI: TGroupBox
        Left = 502
        Top = 43
        Width = 253
        Height = 61
        Anchors = [akTop, akRight]
        Caption = ' IPI '
        TabOrder = 2
        DesignSize = (
          253
          61)
        object lbcdIpiTipo: TLabel
          Left = 22
          Top = 14
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo IPI:'
        end
        object lbvlPercIpi: TLabel
          Left = 31
          Top = 38
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = '% IPI:'
        end
        object edcdIpiTipo: TDBCampoCodigo
          Left = 65
          Top = 11
          Width = 185
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          ERPCampoCodigoPK = False
          ERPCharCase = ecNormal
          ERPEdCampoChaveWidth = 30
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
            '        SELECT a.cdIpiTipo,'
            '                     a.deIpiTipo'
            '          FROM erp.ipiTipo a'
            '       ) t'
            ' &filtro')
          ERPCamposFiltro.Strings = (
            'cdIpiTipo'
            'deIpiTipo')
          ERPCamposFiltroTitulo.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
          ERPCampoChave = 'cdIpiTipo'
          ERPCampoDescricao = 'deIpiTipo'
          ERPDataSource = FrBarraBotoes.dsDados
          ERPConnection = DmERP.fdConnERP
          ERPCampoChaveDataType = ftInteger
        end
        object edvlPercIpi: TDBEdit
          Left = 65
          Top = 35
          Width = 68
          Height = 21
          DataField = 'vlpercipi'
          DataSource = FrBarraBotoes.dsDados
          TabOrder = 1
        end
      end
      object gbPisCofins: TGroupBox
        Left = 502
        Top = 104
        Width = 253
        Height = 61
        Anchors = [akTop, akRight]
        Caption = ' Pis/Cofins '
        TabOrder = 3
        DesignSize = (
          253
          61)
        object lbcdPisTipo: TLabel
          Left = 23
          Top = 14
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Pis:'
        end
        object lbcdCofinsTipo: TLabel
          Left = 6
          Top = 38
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Cofins:'
        end
        object edcdPisTipo: TDBCampoCodigo
          Left = 65
          Top = 11
          Width = 183
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 0
          ERPCampoCodigoPK = False
          ERPCharCase = ecNormal
          ERPEdCampoChaveWidth = 30
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
            '        SELECT a.cdPisTipo,'
            '                     a.dePisTipo'
            '          FROM erp.pisTipo a'
            '       ) t'
            ' &filtro')
          ERPCamposFiltro.Strings = (
            'cdPisTipo'
            'dePisTipo')
          ERPCamposFiltroTitulo.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
          ERPCampoChave = 'cdPisTipo'
          ERPCampoDescricao = 'dePisTipo'
          ERPDataSource = FrBarraBotoes.dsDados
          ERPConnection = DmERP.fdConnERP
          ERPCampoChaveDataType = ftInteger
        end
        object edcdCofinsCodigo: TDBCampoCodigo
          Left = 65
          Top = 35
          Width = 183
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ShowCaption = False
          TabOrder = 1
          ERPCampoCodigoPK = False
          ERPCharCase = ecNormal
          ERPEdCampoChaveWidth = 30
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
            '        SELECT a.cdCofinsTipo,'
            '                     a.deCofinsTipo'
            '          FROM erp.cofinsTipo a'
            '       ) t'
            ' &filtro')
          ERPCamposFiltro.Strings = (
            'cdCofinsTipo'
            'deCofinsTipo')
          ERPCamposFiltroTitulo.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
          ERPCampoChave = 'cdCofinsTipo'
          ERPCampoDescricao = 'deCofinsTipo'
          ERPDataSource = FrBarraBotoes.dsDados
          ERPConnection = DmERP.fdConnERP
          ERPCampoChaveDataType = ftInteger
        end
      end
    end
    object cbflItemRevenda: TDBCheckBox
      Left = 105
      Top = 223
      Width = 116
      Height = 17
      Caption = 'Item de Revenda'
      DataField = 'flitemrevenda'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edcdCentroCusto: TDBCampoCodigo
      Left = 105
      Top = 198
      Width = 280
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 13
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 50
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
        '        SELECT ft.cdCentroCusto,'
        '               ft.deCentroCusto'
        '          FROM erp.CentroCusto ft'
        '         ORDER BY ft.deCentroCusto'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdCentroCusto'
        'deCentroCusto')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdCentroCusto'
      ERPCampoDescricao = 'deCentroCusto'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited sbBotoes: TScrollBox
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyItem
    end
  end
end
