object FMaterialMovimentoConsulta: TFMaterialMovimentoConsulta
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Consulta de Movimento de Materiais'
  ClientHeight = 555
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnCampos: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 121
    Align = alTop
    TabOrder = 0
    DesignSize = (
      939
      121)
    object gbFiltros: TGroupBox
      Left = 4
      Top = 1
      Width = 932
      Height = 114
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Filtros: '
      TabOrder = 0
      DesignSize = (
        932
        114)
      object lbdtMovimento: TLabel
        Left = 47
        Top = 17
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Mov.:'
      end
      object lbdtMovimentoA: TLabel
        Left = 220
        Top = 17
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbdtSituacaoMovA: TLabel
        Left = 220
        Top = 41
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbdtSituacaoMov: TLabel
        Left = 30
        Top = 41
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Situa'#231#227'o:'
      end
      object lbcdSituacaoMovimento: TLabel
        Left = 461
        Top = 41
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = 'Situa'#231#227'o Mov.:'
      end
      object lbflTipoMovimento: TLabel
        Left = 482
        Top = 17
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Mov.:'
      end
      object lbcdFornecedor: TLabel
        Left = 42
        Top = 89
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fornecedor:'
      end
      object lbcdMaterial: TLabel
        Left = 59
        Top = 65
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Material:'
      end
      object lbflTipoSolicitacao: TLabel
        Left = 480
        Top = 65
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Sa'#237'da:'
      end
      object lbcdCentroCusto: TLabel
        Left = 450
        Top = 89
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Centro de Custo:'
      end
      object eddtMovimentoIni: TDateTimePicker
        Left = 102
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        TabOrder = 0
      end
      object eddtMovimentoFim: TDateTimePicker
        Left = 233
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685951053240000000
        Time = 42342.685951053240000000
        ShowCheckbox = True
        TabOrder = 1
      end
      object btConsultar: TBitBtn
        Left = 819
        Top = 21
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Consultar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 9
        OnClick = btConsultarClick
      end
      object eddtSituacaoMovFim: TDateTimePicker
        Left = 233
        Top = 38
        Width = 111
        Height = 21
        Date = 42342.685951053240000000
        Time = 42342.685951053240000000
        ShowCheckbox = True
        Checked = False
        TabOrder = 3
      end
      object eddtSituacaoMovIni: TDateTimePicker
        Left = 102
        Top = 38
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        Checked = False
        TabOrder = 2
      end
      object btFechar: TBitBtn
        Left = 873
        Top = 21
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Fechar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 10
        OnClick = btFecharClick
      end
      object cbcdSituacaoMovimento: TComboBox
        Left = 534
        Top = 38
        Width = 112
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 7
        Text = '0 - Todas'
        Items.Strings = (
          '0 - Todas'
          '1 - Cadastrado'
          '2 - Aprovado'
          '3 - Rejeitado')
      end
      object cbflTipoMovimento: TComboBox
        Left = 534
        Top = 14
        Width = 67
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 6
        Text = 'Todos'
        Items.Strings = (
          'Todos'
          'Entrada'
          'Sa'#237'da')
      end
      object edcdFornecedor: TDBCampoCodigo
        Left = 102
        Top = 86
        Width = 330
        Height = 21
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 5
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
        ERPConnection = DmERP.fdConnERP
        ERPCampoChaveDataType = ftInteger
      end
      object edcdMaterial: TDBCampoCodigo
        Left = 102
        Top = 62
        Width = 294
        Height = 21
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 4
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
      object cbflTipoSolicitacao: TComboBox
        Left = 534
        Top = 62
        Width = 67
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 8
        Text = 'Todas'
        Items.Strings = (
          'Todas'
          'Interna'
          'Externa')
      end
      object edcdCentroCusto: TDBCampoCodigo
        Left = 534
        Top = 86
        Width = 349
        Height = 21
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 11
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
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 121
    Width = 939
    Height = 434
    Align = alClient
    TabOrder = 1
    object grDados: TDBGrid
      Left = 1
      Top = 1
      Width = 937
      Height = 432
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grDadosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cdMaterialMovimento'
          Title.Caption = 'C'#243'd. Mov.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'flTipoMovimento'
          Title.Caption = 'Tipo Mov.'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtMovimento'
          Title.Caption = 'Dt. Movimento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deHrMovimento'
          Title.Caption = 'Hr. Mov.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deSituacaoMovimento'
          Title.Caption = 'Situa'#231#227'o'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deCentroCusto'
          Title.Caption = 'Centro de Custo'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdMaterial'
          Title.Caption = 'C'#243'd. Material'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deMaterial'
          Title.Caption = 'Desc. Material'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdUnidadeMedida'
          Title.Caption = 'UN'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuQtde'
          Title.Caption = 'Qtde.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlUnitario'
          Title.Caption = 'Valor Unit.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdFornecedor'
          Title.Caption = 'C'#243'd. Fornec.'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmFornecedor'
          Title.Caption = 'Nome Fornec.'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtSituacaoMov'
          Title.Caption = 'Dt. Situa'#231#227'o'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deHrSituacaoMov'
          Title.Caption = 'Hr. Situa'#231#227'o'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmUsuCad'
          Title.Caption = 'Usu'#225'rio Cad.'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmSolicitante'
          Title.Caption = 'Solicitante Sa'#237'da Mat.'
          Width = 110
          Visible = True
        end>
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = vtMaterialMovConsulta
    Left = 375
    Top = 185
  end
  object vtMaterialMovConsulta: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'cdCentroCusto,deMaterial,flTipoMovimento'
    Left = 72
    Top = 184
    Data = {03000000000000000000}
    object vtMaterialMovConsultacdMaterialMovimento: TIntegerField
      FieldName = 'cdMaterialMovimento'
    end
    object vtMaterialMovConsultaflTipoMovimento: TStringField
      FieldName = 'flTipoMovimento'
      Size = 1
    end
    object vtMaterialMovConsultacdSituacaoMovimento: TIntegerField
      FieldName = 'cdSituacaoMovimento'
    end
    object vtMaterialMovConsultadtMovimento: TDateField
      FieldName = 'dtMovimento'
    end
    object vtMaterialMovConsultahrMovimento: TIntegerField
      FieldName = 'hrMovimento'
    end
    object vtMaterialMovConsultacdMaterial: TStringField
      FieldName = 'cdMaterial'
      Size = 30
    end
    object vtMaterialMovConsultadeMaterial: TStringField
      FieldName = 'deMaterial'
      Size = 250
    end
    object vtMaterialMovConsultacdUnidadeMedida: TStringField
      FieldName = 'cdUnidadeMedida'
      Size = 3
    end
    object vtMaterialMovConsultanuQtde: TFloatField
      FieldName = 'nuQtde'
    end
    object vtMaterialMovConsultavlUnitario: TFloatField
      FieldName = 'vlUnitario'
    end
    object vtMaterialMovConsultacdFornecedor: TIntegerField
      FieldName = 'cdFornecedor'
    end
    object vtMaterialMovConsultacdMaterialSolicitacao: TIntegerField
      FieldName = 'cdMaterialSolicitacao'
    end
    object vtMaterialMovConsultadeNuNotaFiscal: TStringField
      FieldName = 'deNuNotaFiscal'
      Size = 250
    end
    object vtMaterialMovConsultadtSituacaoMov: TDateField
      FieldName = 'dtSituacaoMov'
    end
    object vtMaterialMovConsultahrSituacaoMov: TIntegerField
      FieldName = 'hrSituacaoMov'
    end
    object vtMaterialMovConsultacdUsuarioSituacaoMov: TIntegerField
      FieldName = 'cdUsuarioSituacaoMov'
    end
    object vtMaterialMovConsultadeObservacoes: TStringField
      FieldName = 'deObservacoes'
      Size = 4000
    end
    object vtMaterialMovConsultadtCadastro: TDateField
      FieldName = 'dtCadastro'
    end
    object vtMaterialMovConsultahrCadastro: TIntegerField
      FieldName = 'hrCadastro'
    end
    object vtMaterialMovConsultacdUsuarioCadastro: TIntegerField
      FieldName = 'cdUsuarioCadastro'
    end
    object vtMaterialMovConsultadtAlteracao: TDateField
      FieldName = 'dtAlteracao'
    end
    object vtMaterialMovConsultahrAlteracao: TIntegerField
      FieldName = 'hrAlteracao'
    end
    object vtMaterialMovConsultacdUsuarioAlteracao: TIntegerField
      FieldName = 'cdUsuarioAlteracao'
    end
    object vtMaterialMovConsultavlUnitES: TFloatField
      FieldName = 'vlUnitES'
    end
    object vtMaterialMovConsultadeSituacaoMovimento: TStringField
      FieldName = 'deSituacaoMovimento'
    end
    object vtMaterialMovConsultadeHrCadastro: TStringField
      FieldName = 'deHrCadastro'
      Size = 5
    end
    object vtMaterialMovConsultadeHrAlteracao: TStringField
      FieldName = 'deHrAlteracao'
      Size = 5
    end
    object vtMaterialMovConsultadeHrMovimento: TStringField
      FieldName = 'deHrMovimento'
      Size = 5
    end
    object vtMaterialMovConsultadeHrSituacaoMov: TStringField
      FieldName = 'deHrSituacaoMov'
      Size = 5
    end
    object vtMaterialMovConsultanuQtdeMov: TFloatField
      FieldName = 'nuQtdeMov'
    end
    object vtMaterialMovConsultanmFornecedor: TStringField
      FieldName = 'nmFornecedor'
      Size = 250
    end
    object vtMaterialMovConsultacdSolicitante: TIntegerField
      FieldName = 'cdSolicitante'
    end
    object vtMaterialMovConsultanmSolicitante: TStringField
      FieldName = 'nmSolicitante'
      Size = 250
    end
    object vtMaterialMovConsultaflTipoSolicitacao: TStringField
      FieldName = 'flTipoSolicitacao'
      Size = 1
    end
    object vtMaterialMovConsultadeTipoSolicitacao: TStringField
      FieldName = 'deTipoSolicitacao'
      Size = 10
    end
    object vtMaterialMovConsultanmUsuCad: TStringField
      FieldName = 'nmUsuCad'
      Size = 250
    end
    object vtMaterialMovConsultanmUsuAlt: TStringField
      FieldName = 'nmUsuAlt'
      Size = 250
    end
    object vtMaterialMovConsultanmUsuSit: TStringField
      FieldName = 'nmUsuSit'
      Size = 250
    end
    object vtMaterialMovConsultavlCusto: TFloatField
      FieldName = 'vlCusto'
    end
    object vtMaterialMovConsultacdCentroCusto: TIntegerField
      FieldName = 'cdCentroCusto'
    end
    object vtMaterialMovConsultadeCentroCusto: TStringField
      FieldName = 'deCentroCusto'
      Size = 250
    end
  end
end
