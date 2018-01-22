inherited FNaturezaCadastro: TFNaturezaCadastro
  Caption = 'Naturezas'
  ClientWidth = 833
  ExplicitWidth = 833
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 833
    ExplicitWidth = 833
    object lbcdNatureza: TLabel
      Left = 50
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeNatureza: TLabel
      Left = 37
      Top = 34
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbNaturezaFiscal: TLabel
      Left = 8
      Top = 59
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o Fiscal:'
    end
    object lbnmUsuCad: TLabel
      Left = 259
      Top = 7
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 513
      Top = 7
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio Alt.:'
    end
    object edcdNatureza: TDBCampoCodigo
      Left = 88
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
        'SELECT t.*'
        '  FROM ('
        '        SELECT p.cdNatureza,'
        '               p.deNatureza,'
        '               p.deNaturezaFiscal,'
        '               p.flNaturezaTipo'
        '          FROM erp.Natureza p'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdNatureza'
        'flNaturezaTipo'
        'deNatureza'
        'deNaturezaFiscal')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Tipo'
        'Descri'#231#227'o'
        'Descri'#231#227'o Fiscal')
      ERPCampoChave = 'cdNatureza'
      ERPCampoDescricao = 'cdNatureza'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednmUsuCad: TDBEdit
      Left = 325
      Top = 4
      Width = 166
      Height = 21
      TabStop = False
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
      TabOrder = 3
    end
    object ednmUsuAlt: TDBEdit
      Left = 574
      Top = 4
      Width = 166
      Height = 21
      TabStop = False
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
      TabOrder = 4
    end
    object eddeNatureza: TDBEdit
      Left = 88
      Top = 31
      Width = 739
      Height = 21
      DataField = 'deNatureza'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edNaturezaFiscal: TDBEdit
      Left = 88
      Top = 56
      Width = 739
      Height = 21
      DataField = 'denaturezafiscal'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object pcDados: TPageControl
      Left = 1
      Top = 78
      Width = 828
      Height = 406
      ActivePage = tsFaturamento
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
      object tsFaturamento: TTabSheet
        Caption = 'Faturamento'
        object sbFaturamento: TScrollBox
          Left = 0
          Top = 0
          Width = 820
          Height = 378
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 814
          ExplicitHeight = 374
          object gbParametros: TGroupBox
            Left = 3
            Top = 2
            Width = 316
            Height = 373
            Caption = ' Par'#226'metros '
            TabOrder = 0
            object lbflConsignacao: TLabel
              Left = 10
              Top = 121
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Consigna'#231#227'o:'
            end
            object cbflNaturezaTipo: TDBCheckBox
              Left = 76
              Top = 18
              Width = 153
              Height = 17
              Caption = 'Natureza de Entrada'
              DataField = 'flnaturezatipo'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 0
              ValueChecked = 'E'
              ValueUnchecked = 'S'
            end
            object cbflDentroEstado: TDBCheckBox
              Left = 76
              Top = 34
              Width = 95
              Height = 17
              Caption = 'Dentro Estado'
              DataField = 'fldentroestado'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflExportacao: TDBCheckBox
              Left = 76
              Top = 50
              Width = 95
              Height = 17
              Caption = 'Exporta'#231#227'o'
              DataField = 'flexportacao'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflDrawback: TDBCheckBox
              Left = 76
              Top = 66
              Width = 95
              Height = 17
              Caption = 'Drawback'
              DataField = 'fldrawback'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflDevolucao: TDBCheckBox
              Left = 76
              Top = 82
              Width = 95
              Height = 17
              Caption = 'Devolu'#231#227'o'
              DataField = 'fldevolucao'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflDevolucaoOutraOper: TDBCheckBox
              Left = 76
              Top = 98
              Width = 159
              Height = 17
              Caption = 'Outra Oper. de Devolu'#231#227'o'
              DataField = 'fldevolucaooutraoper'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflVendaFutura: TDBCheckBox
              Left = 76
              Top = 146
              Width = 159
              Height = 17
              Caption = 'Venda Futura'
              DataField = 'flvendafutura'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 6
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflOperacaoTriangular: TDBCheckBox
              Left = 76
              Top = 162
              Width = 159
              Height = 17
              Caption = 'Opera'#231#227'o Triangular'
              DataField = 'floperacaotriangular'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 7
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflBonificacao: TDBCheckBox
              Left = 76
              Top = 178
              Width = 159
              Height = 17
              Caption = 'Bonifica'#231#227'o'
              DataField = 'flbonificacao'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 8
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflNaturezaServico: TDBCheckBox
              Left = 76
              Top = 194
              Width = 159
              Height = 17
              Caption = 'Natureza de Servi'#231'o'
              DataField = 'flnaturezaservico'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 9
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflNaturezaTransporte: TDBCheckBox
              Left = 76
              Top = 210
              Width = 159
              Height = 17
              Caption = 'Natureza de Transporte'
              DataField = 'flnaturezatransporte'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 10
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflVendaOrdemSemValor: TDBCheckBox
              Left = 76
              Top = 226
              Width = 159
              Height = 17
              Caption = 'Venda Ordem Sem Valor'
              DataField = 'flvendaordemsemvalor'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 11
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflVendaOrgaoPublico: TDBCheckBox
              Left = 76
              Top = 242
              Width = 159
              Height = 17
              Caption = 'Venda '#211'rg'#227'o P'#250'blico'
              DataField = 'flvendaorgaopublico'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 12
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object edflConsignacao: TDBCampoCodigo
              Left = 76
              Top = 119
              Width = 231
              Height = 21
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 13
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
                
                  '        SELECT CAST('#39'D'#39' AS CHAR(1)) AS flConsignacao, CAST('#39'Devo' +
                  'lu'#231#227'o'#39' AS CHARACTER VARYING(15)) AS deConsignacao'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'F'#39' AS CHAR(1)) AS flConsignacao, CAST('#39'Fatu' +
                  'ramento'#39' AS CHARACTER VARYING(15)) AS deConsignacao'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'N'#39' AS CHAR(1)) AS flConsignacao, CAST('#39'N'#227'o'#39 +
                  ' AS CHARACTER VARYING(15)) AS deConsignacao'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'R'#39' AS CHAR(1)) AS flConsignacao, CAST('#39'Reme' +
                  'ssa'#39' AS CHARACTER VARYING(15)) AS deConsignacao'
                '       ) t'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'flConsignacao'
                'deConsignacao')
              ERPCamposFiltroTitulo.Strings = (
                'C'#243'digo'
                'Descri'#231#227'o')
              ERPCampoChave = 'flConsignacao'
              ERPCampoDescricao = 'deConsignacao'
              ERPDataSource = FrBarraBotoes.dsDados
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftString
            end
          end
          object gbIPI: TGroupBox
            Left = 330
            Top = 2
            Width = 426
            Height = 88
            Caption = ' IPI '
            TabOrder = 1
            DesignSize = (
              426
              88)
            object lbcdIpiTipo: TLabel
              Left = 80
              Top = 15
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo IPI:'
            end
            object edcdIpiTipo: TDBCampoCodigo
              Left = 122
              Top = 12
              Width = 301
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
            object cbflIpiIncideIcms: TDBCheckBox
              Left = 122
              Top = 34
              Width = 159
              Height = 17
              Caption = 'IPI Incide ICMS'
              DataField = 'flipiincideicms'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflIpiIncidePisCofins: TDBCheckBox
              Left = 122
              Top = 50
              Width = 159
              Height = 17
              Caption = 'IPI Incide PIS/COFINS'
              DataField = 'flipiincidepiscofins'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflIpiCred50Perc: TDBCheckBox
              Left = 122
              Top = 66
              Width = 159
              Height = 17
              Caption = 'Cr'#233'd. IPI 50%'
              DataField = 'flipicred50perc'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
          object gbICMS: TGroupBox
            Left = 330
            Top = 90
            Width = 426
            Height = 285
            Caption = ' ICMS '
            TabOrder = 2
            DesignSize = (
              426
              285)
            object lbcdIcmsTipo: TLabel
              Left = 69
              Top = 15
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo ICMS:'
            end
            object lbcdIcmsSitTrib: TLabel
              Left = 27
              Top = 39
              Width = 94
              Height = 13
              Alignment = taRightJustify
              Caption = 'Situa'#231#227'o Tribut'#225'ria:'
            end
            object lbcdIcmsSitTribSimples: TLabel
              Left = 14
              Top = 63
              Width = 107
              Height = 13
              Alignment = taRightJustify
              Caption = 'Sit. Tribut'#225'ria Simples:'
            end
            object lbflIcmsCalcSubstTrib: TLabel
              Left = 7
              Top = 122
              Width = 114
              Height = 13
              Alignment = taRightJustify
              Caption = 'Calc. Substitui'#231#227'o Trib.:'
            end
            object lbvlIcmsPercReducaoSubst: TLabel
              Left = 27
              Top = 146
              Width = 94
              Height = 13
              Alignment = taRightJustify
              Caption = '% Redu'#231#227'o Subst.:'
            end
            object lbflIcmsReducaoTipo: TLabel
              Left = 37
              Top = 169
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo de Redu'#231#227'o:'
            end
            object lbvlIcmsReducaoPerc: TLabel
              Left = 61
              Top = 194
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = '% Redu'#231#227'o:'
            end
            object lbvlIcmsDesconto: TLabel
              Left = 62
              Top = 242
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desc. ICMS:'
            end
            object edcdIcmsTipo: TDBCampoCodigo
              Left = 122
              Top = 12
              Width = 301
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
                '        SELECT a.cdIcmsTipo,'
                '                     a.deIcmsTipo'
                '          FROM erp.icmsTipo a'
                '       ) t'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'cdIcmsTipo'
                'deIcmsTipo')
              ERPCamposFiltroTitulo.Strings = (
                'C'#243'digo'
                'Descri'#231#227'o')
              ERPCampoChave = 'cdIcmsTipo'
              ERPCampoDescricao = 'deIcmsTipo'
              ERPDataSource = FrBarraBotoes.dsDados
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftInteger
            end
            object edcdIcmsSitTrib: TDBCampoCodigo
              Left = 122
              Top = 36
              Width = 301
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
            object edcdIcmsSitTribSimples: TDBCampoCodigo
              Left = 122
              Top = 60
              Width = 301
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 2
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
                '        SELECT a.cdIcmsSitTribSimples,'
                '                     a.deIcmsSitTribSimples'
                '          FROM erp.icmsSitTribSimples a'
                '       ) t'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'cdIcmsSitTribSimples'
                'deIcmsSitTribSimples')
              ERPCamposFiltroTitulo.Strings = (
                'C'#243'digo'
                'Descri'#231#227'o')
              ERPCampoChave = 'cdIcmsSitTribSimples'
              ERPCampoDescricao = 'deIcmsSitTribSimples'
              ERPDataSource = FrBarraBotoes.dsDados
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftInteger
            end
            object cbflIcmsCalcPartSimples: TDBCheckBox
              Left = 122
              Top = 84
              Width = 159
              Height = 17
              Caption = 'Calc. Partilha ICMS Simples'
              DataField = 'flicmscalcpartsimples'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object cbflIcmsMsgAprovCred: TDBCheckBox
              Left = 122
              Top = 100
              Width = 159
              Height = 17
              Caption = 'Msg. de Aprov. de Cr'#233'dito'
              DataField = 'flicmsmsgaprovcred'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object edflIcmsCalcSubstTrib: TDBCampoCodigo
              Left = 122
              Top = 119
              Width = 301
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 5
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
                
                  '        SELECT CAST('#39'C'#39' AS CHAR(1)) AS flIcmsCalcSubstTrib, CAST' +
                  '('#39'Consumidor Final'#39' AS CHARACTER VARYING(50)) AS deIcmsCalcSubst' +
                  'Trib'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'N'#39' AS CHAR(1)) AS flIcmsCalcSubstTrib, CAST' +
                  '('#39'N'#227'o'#39' AS CHARACTER VARYING(50)) AS deIcmsCalcSubstTrib'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'P'#39' AS CHAR(1)) AS flIcmsCalcSubstTrib, CAST' +
                  '('#39'Calcula S.T. para pessoa f'#237'sica'#39' AS CHARACTER VARYING(50)) AS ' +
                  'deIcmsCalcSubstTrib'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'S'#39' AS CHAR(1)) AS flIcmsCalcSubstTrib, CAST' +
                  '('#39'Sim'#39' AS CHARACTER VARYING(50)) AS deIcmsCalcSubstTrib'
                '       ) t'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'flIcmsCalcSubstTrib'
                'deIcmsCalcSubstTrib')
              ERPCamposFiltroTitulo.Strings = (
                'C'#243'digo'
                'Descri'#231#227'o')
              ERPCampoChave = 'flIcmsCalcSubstTrib'
              ERPCampoDescricao = 'deIcmsCalcSubstTrib'
              ERPDataSource = FrBarraBotoes.dsDados
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftString
            end
            object edvlIcmsPercReducaoSubst: TDBEdit
              Left = 122
              Top = 143
              Width = 64
              Height = 21
              DataField = 'vlicmspercreducaosubst'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 6
            end
            object edflIcmsReducaoTipo: TDBCampoCodigo
              Left = 122
              Top = 167
              Width = 301
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 7
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
                
                  '        SELECT CAST('#39'D'#39' AS CHAR(1)) AS flIcmsReducaoTipo, CAST('#39 +
                  'Diferimento'#39' AS CHARACTER VARYING(50)) AS deIcmsReducaoTipo'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'I'#39' AS CHAR(1)) AS flIcmsReducaoTipo, CAST('#39 +
                  'Isen'#231#227'o'#39' AS CHARACTER VARYING(50)) AS deIcmsReducaoTipo'
                '         UNION ALL'
                
                  '        SELECT CAST('#39'V'#39' AS CHAR(1)) AS flIcmsReducaoTipo, CAST('#39 +
                  'Apenas no valor do ICMS'#39' AS CHARACTER VARYING(50)) AS deIcmsRedu' +
                  'caoTipo'
                '       ) t'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'flIcmsReducaoTipo'
                'deIcmsReducaoTipo')
              ERPCamposFiltroTitulo.Strings = (
                'C'#243'digo'
                'Descri'#231#227'o')
              ERPCampoChave = 'flIcmsReducaoTipo'
              ERPCampoDescricao = 'deIcmsReducaoTipo'
              ERPDataSource = FrBarraBotoes.dsDados
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftString
            end
            object edvlIcmsReducaoPerc: TDBEdit
              Left = 122
              Top = 191
              Width = 64
              Height = 21
              DataField = 'vlicmsreducaoperc'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 8
            end
            object cbflIcmsCalcStUsoCon: TDBCheckBox
              Left = 122
              Top = 217
              Width = 159
              Height = 17
              Caption = 'Calc. S.T. Uso Con.'
              DataField = 'flicmscalcstusocon'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 9
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object edvlIcmsDesconto: TDBEdit
              Left = 122
              Top = 239
              Width = 64
              Height = 21
              DataField = 'vlicmsdesconto'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 10
            end
            object cbflIcmsDebCreLivros: TDBCheckBox
              Left = 122
              Top = 265
              Width = 167
              Height = 17
              Caption = 'Deb./Cred. ICMS (Obs Livros)'
              DataField = 'flicmsdebcrelivros'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 11
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
      end
      object tsOutros: TTabSheet
        Caption = 'Outros'
        ImageIndex = 1
        object sbOutros: TScrollBox
          Left = 0
          Top = 0
          Width = 820
          Height = 378
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            820
            378)
          object lbcdPisTipo: TLabel
            Left = 472
            Top = 5
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo PIS:'
          end
          object lbcdCofinsTipo: TLabel
            Left = 450
            Top = 29
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo COFINS:'
          end
          object lbcdContribSocialTipo: TLabel
            Left = 398
            Top = 53
            Width = 117
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Contribui'#231#227'o Social:'
          end
          object lbcdImpostoRendaTipo: TLabel
            Left = 400
            Top = 77
            Width = 115
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Imposto de Renda:'
          end
          object lbcdOperSisdeclara: TLabel
            Left = 377
            Top = 101
            Width = 138
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Opera'#231#227'o Sisdeclara:'
          end
          object cbflMovFinanceiro: TDBCheckBox
            Left = 5
            Top = 4
            Width = 159
            Height = 17
            Caption = 'Movimento Financeiro'
            DataField = 'flmovfinanceiro'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflMovFiscal: TDBCheckBox
            Left = 5
            Top = 20
            Width = 159
            Height = 17
            Caption = 'Movimento Fiscal'
            DataField = 'flmovfiscal'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflFaturamento: TDBCheckBox
            Left = 5
            Top = 36
            Width = 159
            Height = 17
            Caption = 'Movimento Faturamento'
            DataField = 'flfaturamento'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflMovEstoque: TDBCheckBox
            Left = 5
            Top = 52
            Width = 159
            Height = 17
            Caption = 'Movimento Estoque'
            DataField = 'flmovestoque'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflEstoqueTerceiros: TDBCheckBox
            Left = 5
            Top = 68
            Width = 159
            Height = 17
            Caption = 'Estoque Terceiros'
            DataField = 'flestoqueterceiros'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflEstoqueArmazenagem: TDBCheckBox
            Left = 5
            Top = 84
            Width = 159
            Height = 17
            Caption = 'Estoque Armazenagem'
            DataField = 'flestoquearmazenagem'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 5
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflEntraCalcRentab: TDBCheckBox
            Left = 5
            Top = 100
            Width = 186
            Height = 17
            Caption = 'Entra no C'#225'lculo de Rentabilidade'
            DataField = 'flentracalcrentab'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 6
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflAbateRentab: TDBCheckBox
            Left = 5
            Top = 116
            Width = 159
            Height = 17
            Caption = 'Abate da Rentabilidade'
            DataField = 'flabaterentab'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 7
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflConsideraSisdec: TDBCheckBox
            Left = 207
            Top = 4
            Width = 159
            Height = 17
            Caption = 'Considera Sisdeclara'
            DataField = 'flconsiderasisdec'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflMsgLeiTransp: TDBCheckBox
            Left = 207
            Top = 20
            Width = 191
            Height = 17
            Caption = 'Mensagem da Lei da Transpar'#234'ncia'
            DataField = 'flmsgleitransp'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 9
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edcdPisTipo: TDBCampoCodigo
            Left = 516
            Top = 2
            Width = 301
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 10
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
          object edcdCofinsTipo: TDBCampoCodigo
            Left = 516
            Top = 26
            Width = 301
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 11
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
          object edcdContribSocialTipo: TDBCampoCodigo
            Left = 516
            Top = 50
            Width = 301
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 12
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
              
                '        SELECT CAST(0 AS INTEGER) AS cdContribSocialTipo, CAST('#39 +
                'Tributado'#39' AS CHARACTER VARYING(15)) AS deContribSocialTipo'
              '         UNION ALL'
              
                '        SELECT CAST(1 AS INTEGER) AS cdContribSocialTipo, CAST('#39 +
                'Isento'#39' AS CHARACTER VARYING(15)) AS deContribSocialTipo'
              '         UNION ALL'
              
                '        SELECT CAST(2 AS INTEGER) AS cdContribSocialTipo, CAST('#39 +
                'Outros'#39' AS CHARACTER VARYING(15)) AS deContribSocialTipo'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdContribSocialTipo'
              'deContribSocialTipo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdContribSocialTipo'
            ERPCampoDescricao = 'deContribSocialTipo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdImpostoRendaTipo: TDBCampoCodigo
            Left = 516
            Top = 74
            Width = 301
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 13
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
              
                '        SELECT CAST(0 AS INTEGER) AS cdImpostoRendaTipo, CAST('#39'T' +
                'ributado'#39' AS CHARACTER VARYING(15)) AS deImpostoRendaTipo'
              '         UNION ALL'
              
                '        SELECT CAST(1 AS INTEGER) AS cdImpostoRendaTipo, CAST('#39'I' +
                'sento'#39' AS CHARACTER VARYING(15)) AS deImpostoRendaTipo'
              '         UNION ALL'
              
                '        SELECT CAST(2 AS INTEGER) AS cdImpostoRendaTipo, CAST('#39'O' +
                'utros'#39' AS CHARACTER VARYING(15)) AS deImpostoRendaTipo'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdImpostoRendaTipo'
              'deImpostoRendaTipo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdImpostoRendaTipo'
            ERPCampoDescricao = 'deImpostoRendaTipo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object cbflUtilizaControleTerc: TDBCheckBox
            Left = 207
            Top = 36
            Width = 176
            Height = 17
            Caption = 'Utiliza Controle de Terceiriza'#231#227'o'
            DataField = 'flutilizacontroleterc'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 14
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflGeraValorCalcBonif: TDBCheckBox
            Left = 207
            Top = 52
            Width = 166
            Height = 17
            Caption = 'Gera Valor C'#225'lculo Bonifica'#231#227'o'
            DataField = 'flgeravalorcalcbonif'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 15
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edcdOperSisdeclara: TDBCampoCodigo
            Left = 516
            Top = 98
            Width = 301
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 16
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
              '        SELECT cdOperSisdeclara,'
              '                     deOperSisdeclara'
              '          FROM erp.operSisdeclara'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdOperSisdeclara'
              'deOperSisdeclara')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdOperSisdeclara'
            ERPCampoDescricao = 'deOperSisdeclara'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object cbflMovSelos: TDBCheckBox
            Left = 207
            Top = 68
            Width = 100
            Height = 17
            Caption = 'Movimenta Selos'
            DataField = 'flmovselos'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 17
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflOperSemCredSt: TDBCheckBox
            Left = 207
            Top = 84
            Width = 153
            Height = 17
            Caption = 'Opera'#231#227'o Sem Cr'#233'dito S.T.'
            DataField = 'flopersemcredst'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 18
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflOperSemCredIpi: TDBCheckBox
            Left = 207
            Top = 100
            Width = 153
            Height = 17
            Caption = 'Opera'#231#227'o Sem Cr'#233'dito IPI'
            DataField = 'flopersemcredipi'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 19
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      object tsParametrosContabeis: TTabSheet
        Caption = 'Par'#226'metros Cont'#225'beis'
        ImageIndex = 2
        object sbParametrosContabeis: TScrollBox
          Left = 0
          Top = 0
          Width = 820
          Height = 378
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          ExplicitTop = 3
          ExplicitWidth = 817
          ExplicitHeight = 374
          DesignSize = (
            820
            378)
          object lbcdPisBase: TLabel
            Left = 105
            Top = 141
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base PIS:'
          end
          object lbcdCofinsBase: TLabel
            Left = 83
            Top = 165
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base COFINS:'
          end
          object lbcdSimplesBase: TLabel
            Left = 86
            Top = 189
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Simples:'
          end
          object lbvlPercPis: TLabel
            Left = 102
            Top = 69
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = '% de PIS:'
          end
          object lbvlPercCofins: TLabel
            Left = 80
            Top = 93
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = '% de COFINS:'
          end
          object lbvlPercAbatCofinsTitNf: TLabel
            Left = 236
            Top = 93
            Width = 211
            Height = 13
            Alignment = taRightJustify
            Caption = '% de Abat. de COFINS nos T'#237'tulos da Nota:'
          end
          object lbvlPercAbatPisTitNf: TLabel
            Left = 258
            Top = 69
            Width = 189
            Height = 13
            Alignment = taRightJustify
            Caption = '% de Abat. de PIS nos T'#237'tulos da Nota:'
          end
          object lbflAbateRetencao: TLabel
            Left = 25
            Top = 213
            Width = 126
            Height = 13
            Alignment = taRightJustify
            Caption = 'Abate Reten'#231#227'o (4,65%):'
          end
          object lbvlPercIcms: TLabel
            Left = 93
            Top = 117
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = '% de ICMS:'
          end
          object lbcdIpiCodigo: TLabel
            Left = 97
            Top = 237
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo IPI:'
          end
          object lbcdIpiEnquadramento: TLabel
            Left = 3
            Top = 261
            Width = 148
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo de Enquadramento IPI:'
          end
          object lbcdPisCodigo: TLabel
            Left = 95
            Top = 285
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo PIS:'
          end
          object lbcdCofinsCodigo: TLabel
            Left = 73
            Top = 309
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo COFINS:'
          end
          object edcdPisBase: TDBCampoCodigo
            Left = 152
            Top = 138
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 10
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
              
                '        SELECT CAST(1 AS INTEGER) AS cdPisBase, CAST('#39'Soma'#39' AS C' +
                'HARACTER VARYING(15)) AS dePisBase'
              '         UNION ALL'
              
                '        SELECT CAST(2 AS INTEGER) AS cdPisBase, CAST('#39'Abate'#39' AS ' +
                'CHARACTER VARYING(15)) AS dePisBase'
              '         UNION ALL'
              
                '        SELECT CAST(3 AS INTEGER) AS cdPisBase, CAST('#39'N'#227'o Consid' +
                'era'#39' AS CHARACTER VARYING(15)) AS dePisBase'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdPisBase'
              'dePisBase')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdPisBase'
            ERPCampoDescricao = 'dePisBase'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdCofinsBase: TDBCampoCodigo
            Left = 152
            Top = 162
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 11
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
              
                '        SELECT CAST(1 AS INTEGER) AS cdCofinsBase, CAST('#39'Soma'#39' A' +
                'S CHARACTER VARYING(15)) AS deCofinsBase'
              '         UNION ALL'
              
                '        SELECT CAST(2 AS INTEGER) AS cdCofinsBase, CAST('#39'Abate'#39' ' +
                'AS CHARACTER VARYING(15)) AS deCofinsBase'
              '         UNION ALL'
              
                '        SELECT CAST(3 AS INTEGER) AS cdCofinsBase, CAST('#39'N'#227'o Con' +
                'sidera'#39' AS CHARACTER VARYING(15)) AS deCofinsBase'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdCofinsBase'
              'deCofinsBase')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCofinsBase'
            ERPCampoDescricao = 'deCofinsBase'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdSimplesBase: TDBCampoCodigo
            Left = 152
            Top = 186
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 12
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
              
                '        SELECT CAST(1 AS INTEGER) AS cdSimplesBase, CAST('#39'Soma'#39' ' +
                'AS CHARACTER VARYING(15)) AS deSimplesBase'
              '         UNION ALL'
              
                '        SELECT CAST(2 AS INTEGER) AS cdSimplesBase, CAST('#39'Abate'#39 +
                ' AS CHARACTER VARYING(15)) AS deSimplesBase'
              '         UNION ALL'
              
                '        SELECT CAST(3 AS INTEGER) AS cdSimplesBase, CAST('#39'N'#227'o Co' +
                'nsidera'#39' AS CHARACTER VARYING(15)) AS deSimplesBase'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdSimplesBase'
              'deSimplesBase')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdSimplesBase'
            ERPCampoDescricao = 'deSimplesBase'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object cbflIsencaoPisCofins: TDBCheckBox
            Left = 152
            Top = 4
            Width = 165
            Height = 17
            Caption = 'Possui Isen'#231#227'o de PIS/COFINS'
            DataField = 'flisencaopiscofins'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edvlPercPis: TDBEdit
            Left = 152
            Top = 66
            Width = 64
            Height = 21
            DataField = 'vlPercPis'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 5
          end
          object edvlPercCofins: TDBEdit
            Left = 152
            Top = 90
            Width = 64
            Height = 21
            DataField = 'vlperccofins'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 6
          end
          object cbflRetencaoPisCofinsCsll: TDBCheckBox
            Left = 152
            Top = 20
            Width = 215
            Height = 17
            Caption = 'Reten'#231#227'o PIS, COFINS e CSLL (4,65%)'
            DataField = 'flretencaopiscofinscsll'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflAbatePisCofinsTitNf: TDBCheckBox
            Left = 152
            Top = 36
            Width = 230
            Height = 17
            Caption = 'Abate PIS/COFINS dos T'#237'tulos da Nota'
            DataField = 'flabatepiscofinstitnf'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edvlPercAbatPisTitNf: TDBEdit
            Left = 448
            Top = 66
            Width = 64
            Height = 21
            DataField = 'vlpercabatpistitnf'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 8
          end
          object edvlPercAbatCofinsTitNf: TDBEdit
            Left = 448
            Top = 90
            Width = 64
            Height = 21
            DataField = 'vlpercabatcofinstitnf'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 9
          end
          object cbflProdMonofasSn: TDBCheckBox
            Left = 448
            Top = 4
            Width = 230
            Height = 17
            Caption = 'Produto Monof'#225'sico SN (Lei 10.485/2002)'
            DataField = 'flprodmonofassn'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edflAbateRetencao: TDBCampoCodigo
            Left = 152
            Top = 210
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 13
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
              
                '        SELECT CAST('#39'R'#39' AS CHAR(1)) AS flAbateRetencao, CAST('#39'N'#227 +
                'o abate nos t'#237'tulos/nota, mas ret'#233'm no recebimento'#39' AS CHARACTER' +
                ' VARYING(60)) AS deAbateRetencao'
              '         UNION ALL'
              
                '        SELECT CAST('#39'S'#39' AS CHAR(1)) AS flAbateRetencao, CAST('#39'Si' +
                'm (abate na nota e nos t'#237'tulos)'#39' AS CHARACTER VARYING(60)) AS de' +
                'AbateRetencao'
              '         UNION ALL'
              
                '        SELECT CAST('#39'T'#39' AS CHAR(1)) AS flAbateRetencao, CAST('#39'Ab' +
                'ate somente nos t'#237'tulos'#39' AS CHARACTER VARYING(60)) AS deAbateRet' +
                'encao'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'flAbateRetencao'
              'deAbateRetencao')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'flAbateRetencao'
            ERPCampoDescricao = 'deAbateRetencao'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftString
          end
          object edvlPercIcms: TDBEdit
            Left = 152
            Top = 114
            Width = 64
            Height = 21
            DataField = 'vlpercicms'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 7
          end
          object cbflDiferencaIcms: TDBCheckBox
            Left = 448
            Top = 20
            Width = 102
            Height = 17
            Caption = 'Diferen'#231'a ICMS'
            DataField = 'fldiferencaicms'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 4
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edcdIpiCodigo: TDBCampoCodigo
            Left = 152
            Top = 234
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 14
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
              '        SELECT cdIpiCodigo,'
              '                     deIpiCodigo'
              '          FROM erp.ipiCodigo'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdIpiCodigo'
              'deIpiCodigo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdIpiCodigo'
            ERPCampoDescricao = 'deIpiCodigo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdIpiEnquadramento: TDBCampoCodigo
            Left = 152
            Top = 258
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 15
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
              '        SELECT cdIpiEnquadramento,'
              '                     deIpiEnquadramento'
              '          FROM erp.ipiEnquadramento'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdIpiEnquadramento'
              'deIpiEnquadramento')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdIpiEnquadramento'
            ERPCampoDescricao = 'deIpiEnquadramento'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdPisCodigo: TDBCampoCodigo
            Left = 152
            Top = 282
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 16
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
              '        SELECT cdPisCodigo,'
              '                     dePisCodigo'
              '          FROM erp.pisCodigo'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdPisCodigo'
              'dePisCodigo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdPisCodigo'
            ERPCampoDescricao = 'dePisCodigo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdCofinsCodigo: TDBCampoCodigo
            Left = 152
            Top = 306
            Width = 665
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 17
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
              '        SELECT cdCofinsCodigo,'
              '                     deCofinsCodigo'
              '          FROM erp.cofinsCodigo'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdCofinsCodigo'
              'deCofinsCodigo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCofinsCodigo'
            ERPCampoDescricao = 'deCofinsCodigo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
        end
      end
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 833
    ExplicitWidth = 833
    inherited sbBotoes: TScrollBox
      Width = 833
      ExplicitWidth = 833
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyNatureza
    end
  end
end
