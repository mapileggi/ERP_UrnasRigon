inherited FIntIndMaterialEntCadastro: TFIntIndMaterialEntCadastro
  Caption = 'Entrada de Material'
  ClientWidth = 790
  OnShow = FormShow
  ExplicitWidth = 790
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 790
    ExplicitWidth = 790
    object lbcdMaterialMovimento: TLabel
      Left = 42
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbcdMaterial: TLabel
      Left = 37
      Top = 79
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Material:'
    end
    object lbnuQtde: TLabel
      Left = 47
      Top = 103
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtde.:'
    end
    object lbcdSituacaoMovimento: TLabel
      Left = 35
      Top = 55
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
    end
    object lbnmUsuCad: TLabel
      Left = 201
      Top = 7
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbdenuNotaFiscal: TLabel
      Left = 8
      Top = 175
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Nota Fiscal:'
    end
    object lbdeHrCadastro: TLabel
      Left = 616
      Top = 7
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Cad.:'
    end
    object lbdtCadastro: TLabel
      Left = 456
      Top = 7
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Cad.:'
    end
    object lbcdFornecedor: TLabel
      Left = 20
      Top = 151
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fornecedor:'
    end
    object lbdeObservacoes: TLabel
      Left = 12
      Top = 201
      Width = 67
      Height = 13
      Caption = 'Observa'#231#245'es:'
    end
    object lbvlUnitario: TLabel
      Left = 11
      Top = 127
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Unit'#225'rio:'
    end
    object lbnmUsuSit: TLabel
      Left = 208
      Top = 31
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio Sit.:'
    end
    object lbdtSituacaoMov: TLabel
      Left = 463
      Top = 31
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Sit.:'
    end
    object lbdeHrSituacaoMov: TLabel
      Left = 623
      Top = 31
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Sit.:'
    end
    object lbcdUnidadeMedida: TLabel
      Left = 173
      Top = 103
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unid. Medida:'
      Visible = False
    end
    object edcdMaterialMovimento: TDBCampoCodigo
      Left = 81
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
        'SELECT t.*   '
        '  FROM ('
        '        SELECT a.cdMaterialMovimento,'
        '               a.cdSituacaoMovimento,'
        '               CAST('
        '                    CASE'
        '                      WHEN a.cdSituacaoMovimento = 1 THEN'
        '                        '#39'Cadastrado'#39
        '                      WHEN a.cdSituacaoMovimento = 2 THEN'
        '                        '#39'Aprovado'#39
        '                      WHEN a.cdSituacaoMovimento = 3 THEN'
        '                        '#39'Rejeitado'#39
        '                      ELSE'
        '                        '#39'Inv'#225'lido'#39
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deSituacaoMovimento,'
        '               a.dtMovimento,'
        '               CAST('
        '                    CASE'
        '                      WHEN a.hrMovimento > 0 THEN'
        
          '                        TRIM(TO_CHAR(TRUNC(a.hrMovimento/60), '#39'0' +
          '0'#39')) || '#39':'#39' ||'
        
          '                        TRIM(TO_CHAR(MOD(a.hrMovimento, 60), '#39'00' +
          #39'))'
        '                    END AS CHARACTER VARYING(5)'
        '                   ) AS dehrMovimento,'
        '               a.cdMaterial,'
        '               a.deMaterial,'
        '               a.nuQtde,'
        '               a.cdFornecedor,'
        '               f.nmFantasia AS nmFornecedor'
        '          FROM erp.intIndMaterialMovimento a'
        
          '          LEFT JOIN erp.fornecedor f ON (f.cdFornecedor = a.cdFo' +
          'rnecedor)'
        '         WHERE a.flTipoMovimento = '#39'E'#39
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdMaterialMovimento'
        'deSituacaoMovimento'
        'dtMovimento'
        'dehrMovimento'
        'cdMaterial'
        'deMaterial'
        'nuQtde'
        'cdFornecedor'
        'nmFornecedor')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Situa'#231#227'o'
        'Data Mov.'
        'Hora Mov.'
        'C'#243'd. Material'
        'Desc. Material'
        'Qtde'
        'C'#243'd. Fornecedor'
        'Nome Fornecedor')
      ERPCampoChave = 'cdMaterialMovimento'
      ERPCampoDescricao = 'cdMaterialMovimento'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdMaterial: TDBCampoCodigo
      Left = 81
      Top = 76
      Width = 702
      Height = 21
      Anchors = [akLeft, akTop, akRight]
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
      ERPOnEdCampoChaveExit = edcdMaterialERPOnEdCampoChaveExit
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT TRIM(a.item)      AS cdMaterial,'
        '               TRIM(a.descricao) AS deMaterial,'
        '               TRIM(a.sigla_unidade) AS cdUnidadeMedida, '
        '               a.codigo_cCusto       AS cdCentroCusto,'
        '               b.descricao           AS deCentroCusto'
        '          FROM item a'
        
          '          LEFT JOIN cCusto b ON (b.codigo_cCusto = a.codigo_cCus' +
          'to)'
        '         WHERE a.tipo_item = '#39'C'#39
        '         ORDER BY a.item'
        '      ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdMaterial'
        'deMaterial'
        'cdUnidadeMedida'
        'cdCentroCusto'
        'deCentroCusto')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o'
        'Unid. Medida'
        'C'#243'd. C. de Custo'
        'Desc. C. de Custo')
      ERPCampoChave = 'cdMaterial'
      ERPCampoDescricao = 'deMaterial'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmIntegracao.fdConnInteg
      ERPCampoChaveDataType = ftString
    end
    object ednuQtde: TDBEdit
      Left = 81
      Top = 100
      Width = 64
      Height = 21
      DataField = 'nuqtde'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
    end
    object lcbcdSituacaoMovimento: TDBLookupComboBox
      Left = 81
      Top = 52
      Width = 90
      Height = 21
      DataField = 'cdsituacaomovimento'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdsituacaomovimento'
      ListField = 'desituacaomovimento'
      ListSource = dsMaterialMovSit
      TabOrder = 2
    end
    object ednmUsuCad: TDBEdit
      Left = 269
      Top = 4
      Width = 171
      Height = 21
      TabStop = False
      DataField = 'nmusucad'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object eddenuNotaFiscal: TDBEdit
      Left = 81
      Top = 172
      Width = 143
      Height = 21
      DataField = 'denunotafiscal'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 8
    end
    object cbflTipoMovimento: TDBCheckBox
      Left = 81
      Top = 31
      Width = 73
      Height = 17
      Caption = 'Entrada'
      DataField = 'fltipomovimento'
      DataSource = FrBarraBotoes.dsDados
      ReadOnly = True
      TabOrder = 1
      ValueChecked = 'E'
      ValueUnchecked = 'S'
    end
    object eddeHrCadastro: TDBEdit
      Left = 671
      Top = 4
      Width = 50
      Height = 21
      TabStop = False
      DataField = 'dehrcadastro'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object eddtCadastro: TDBDateTime
      Left = 511
      Top = 4
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 10
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcadastro'
      DataSource = FrBarraBotoes.dsDados
    end
    object edcdFornecedor: TDBCampoCodigo
      Left = 81
      Top = 148
      Width = 702
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 7
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
        'SELECT t.*,'
        
          '       CAST(t.deForCid || '#39' - Fone 1: '#39' || COALESCE(t.deFone1, '#39 +
          #39') || '
        
          '       '#39' - Fone 2: '#39' || COALESCE(t.deFone2, '#39#39') AS CHARACTER VAR' +
          'YING(250)) AS deForCidFone'
        '  FROM ('
        '        SELECT f.cdFornecedor,'
        '               f.flFisJur,'
        '               f.deCpfCnpj,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(f.deCpfCnpj) = 14 THEN'
        
          '                        REGEXP_REPLACE(f.deCpfCnpj, '#39'(\d{2})(\d{' +
          '3})(\d{3})(\d{4})(\d{2})'#39', '#39'\1.\2.\3/\4-\5'#39')'
        '                      WHEN LENGTH(f.deCpfCnpj) = 11 THEN'
        
          '                        REGEXP_REPLACE(f.deCpfCnpj, '#39'(\d{3})(\d{' +
          '3})(\d{3})(\d{2})'#39', '#39'\1.\2.\3-\4'#39') '
        '                      ELSE'
        '                        f.deCpfCnpj  '
        '                    END AS CHARACTER VARYING(50)'
        '                   ) AS deCpfCnpjM, '
        '               f.deRazaoSocial,'
        '               f.nmFantasia,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(f.nuFone1) = 11 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone1 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(f.nuFone1) = 10 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone1 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        f.nuFone1  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone1,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(f.nuFone2) = 11 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone2 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(f.nuFone2) = 10 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone2 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        f.nuFone2  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone2,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               f.deRazaoSocial || '#39' - '#39' ||'
        '               cid.nmCidade || '#39'/'#39' ||'
        '               cid.sgEstado AS deForCid'
        '          FROM erp.fornecedor f'
        
          '          LEFT JOIN erp.cidade cid ON (cid.cdCidade = f.cdCidade' +
          ')'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdFornecedor'
        'flFisJur'
        'deCpfCnpjM'
        'deRazaoSocial'
        'nmFantasia'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'F'#237's/Jur'
        'CPF/CNPJ'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdFornecedor'
      ERPCampoDescricao = 'nmFantasia'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object mdeObservacoes: TDBMemo
      Left = 81
      Top = 196
      Width = 696
      Height = 144
      DataField = 'deObservacoes'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 12
    end
    object edvlUnitario: TDBEdit
      Left = 81
      Top = 124
      Width = 64
      Height = 21
      DataField = 'vlunitario'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
    end
    object ednmUsuSit: TDBEdit
      Left = 269
      Top = 28
      Width = 171
      Height = 21
      TabStop = False
      DataField = 'nmUsuSit'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object eddtSituacaoMov: TDBDateTime
      Left = 511
      Top = 28
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 14
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtsituacaomov'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddeHrSituacaoMov: TDBEdit
      Left = 671
      Top = 28
      Width = 50
      Height = 21
      TabStop = False
      DataField = 'dehrsituacaomov'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object edcdUnidadeMedida: TDBCampoCodigo
      Left = 241
      Top = 100
      Width = 292
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 5
      Visible = False
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
        'SELECT cdUnidadeMedida, '
        '             deUnidadeMedida'
        '  FROM erp.unidadeMedida'
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
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 790
    ExplicitWidth = 790
    inherited sbBotoes: TScrollBox
      Width = 790
      ExplicitWidth = 790
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyIntIndMaterialMovEnt
    end
  end
  object dsMaterialMovSit: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyMaterialMovSit
    Left = 358
    Top = 152
  end
end
