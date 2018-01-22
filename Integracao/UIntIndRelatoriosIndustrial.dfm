object FIntIndRelatoriosIndustrial: TFIntIndRelatoriosIndustrial
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios do Industrial'
  ClientHeight = 382
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcRelatorios: TPageControl
    Left = 0
    Top = 0
    Width = 479
    Height = 330
    ActivePage = tsEstoqueProducao
    Align = alClient
    TabOrder = 0
    object tsEstoqueProducao: TTabSheet
      Caption = 'Estoque de Produ'#231#227'o'
      object sbREP: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbREPFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          object lbREPcdItem: TLabel
            Left = 51
            Top = 44
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Item:'
          end
          object lbREPcdSetor: TLabel
            Left = 47
            Top = 20
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Setor:'
          end
          object lbREPTipoEstoque: TLabel
            Left = 11
            Top = 68
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Estoque:'
          end
          object lbREPcdEmpresa: TLabel
            Left = 32
            Top = 92
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa:'
          end
          object edREPcdItem: TDBCampoCodigo
            Left = 78
            Top = 41
            Width = 371
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecUpperCase
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
              '        SELECT TRIM(a.item) AS cdItem,'
              '               TRIM(a.descricao) AS deItem'
              '          FROM item a'
              
                '         WHERE ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39#39 +
                '))'
              '          AND ('
              '                    (a.codigo_familia = 30) OR'
              '                    (a.flag_tipo_prod = '#39'R'#39')'
              '                  )'
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
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object edREPcdSetor: TDBCampoCodigo
            Left = 78
            Top = 17
            Width = 371
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 47
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
              '        SELECT s.cdSetor,'
              '               s.deSetor'
              '          FROM erp.setor s'
              '         WHERE s.flControlaBaixa = '#39'S'#39
              '         ORDER BY s.cdSetor'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdSetor'
              'deSetor')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdSetor'
            ERPCampoDescricao = 'deSetor'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object cbREPTipoEstoque: TComboBox
            Left = 78
            Top = 65
            Width = 83
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 2
            Text = 'Todos'
            Items.Strings = (
              'Todos'
              'Interno'
              'Com Pedido')
          end
          object edREPcdEmpresa: TDBCampoCodigo
            Left = 78
            Top = 89
            Width = 371
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 3
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 47
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT t01.cdEmpresa,'
              '       t01.deRazaoSocial,'
              '       t01.nmFantasia,'
              '       t01.cdCidade,'
              '       t01.nmCidade,'
              '       t01.sgEstado'
              '  FROM ('
              '        SELECT e.cdEmpresa,'
              '               e.deRazaoSocial,'
              '               e.nmFantasia,'
              '               e.cdCidade,'
              '               cid.nmCidade,'
              '               cid.sgEstado'
              '          FROM erp.empresa e'
              
                '          LEFT JOIN erp.cidade cid ON (cid.cdCidade = e.cdCidade' +
                ')'
              '       ) t01 '
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdEmpresa'
              'deCnpj'
              'deRazaoSocial'
              'nmFantasia'
              'nmcidade'
              'sgestado')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'CNPJ'
              'Raz'#227'o Social'
              'Fantasia'
              'Cidade'
              'Estado')
            ERPCampoChave = 'cdEmpresa'
            ERPCampoDescricao = 'deRazaoSocial'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
        end
      end
    end
    object tsProducaoDiaria: TTabSheet
      Caption = 'Produ'#231#227'o Di'#225'ria'
      ImageIndex = 2
      object sbRPD: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbRPD: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          DesignSize = (
            471
            302)
          object lbRPDcdItem: TLabel
            Left = 51
            Top = 68
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Item:'
          end
          object lbRPDdtBaixa: TLabel
            Left = 23
            Top = 20
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Mov.:'
          end
          object lbRPDcdSetor: TLabel
            Left = 47
            Top = 44
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Setor:'
          end
          object lbRPDdtBaixaA: TLabel
            Left = 178
            Top = 20
            Width = 6
            Height = 13
            Alignment = taRightJustify
            Caption = 'a'
          end
          object lbRPDcdEmpresa: TLabel
            Left = 32
            Top = 92
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa:'
          end
          object edRPDcdItem: TDBCampoCodigo
            Left = 78
            Top = 65
            Width = 378
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 3
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecUpperCase
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
              '        SELECT TRIM(a.item) AS cdItem,'
              '               TRIM(a.descricao) AS deItem'
              '          FROM item a'
              '         WHERE a.item NOT LIKE '#39'%.12%'#39
              
                '           AND ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39#39 +
                '))'
              '          AND ('
              '                    (a.codigo_familia = 30) OR'
              '                    (a.flag_tipo_prod = '#39'R'#39')'
              '                  )'
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
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object edRPDdtBaixaIni: TDateTimePicker
            Left = 79
            Top = 17
            Width = 93
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            TabOrder = 0
          end
          object edRPDcdSetor: TDBCampoCodigo
            Left = 78
            Top = 41
            Width = 378
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 2
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 47
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
              '        SELECT s.cdSetor,'
              '               s.deSetor'
              '          FROM erp.setor s'
              '         WHERE s.flControlaBaixa = '#39'S'#39
              '         ORDER BY s.cdSetor'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdSetor'
              'deSetor')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdSetor'
            ERPCampoDescricao = 'deSetor'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRPDdtBaixaFim: TDateTimePicker
            Left = 190
            Top = 17
            Width = 93
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            TabOrder = 1
          end
          object edRPDcdEmpresa: TDBCampoCodigo
            Left = 78
            Top = 89
            Width = 371
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 4
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 47
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT t01.cdEmpresa,'
              '       t01.deRazaoSocial,'
              '       t01.nmFantasia,'
              '       t01.cdCidade,'
              '       t01.nmCidade,'
              '       t01.sgEstado'
              '  FROM ('
              '        SELECT e.cdEmpresa,'
              '               e.deRazaoSocial,'
              '               e.nmFantasia,'
              '               e.cdCidade,'
              '               cid.nmCidade,'
              '               cid.sgEstado'
              '          FROM erp.empresa e'
              
                '          LEFT JOIN erp.cidade cid ON (cid.cdCidade = e.cdCidade' +
                ')'
              '       ) t01 '
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdEmpresa'
              'deCnpj'
              'deRazaoSocial'
              'nmFantasia'
              'nmcidade'
              'sgestado')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'CNPJ'
              'Raz'#227'o Social'
              'Fantasia'
              'Cidade'
              'Estado')
            ERPCampoChave = 'cdEmpresa'
            ERPCampoDescricao = 'deRazaoSocial'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
        end
      end
    end
    object tsItensRelacionados: TTabSheet
      Caption = 'Itens Relacionados'
      ImageIndex = 1
      object sbRIR: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbRIRFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          object lbRIRcdItemBase: TLabel
            Left = 33
            Top = 20
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Item Base:'
          end
          object lbRIRcdTamanhoBase: TLabel
            Left = 11
            Top = 44
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tamanho Base:'
          end
          object edRIRcdItemBase: TDBCampoCodigo
            Left = 86
            Top = 17
            Width = 371
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecUpperCase
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
              '        SELECT TRIM(a.item) AS cdItem,'
              '               TRIM(a.descricao) AS deItem'
              '          FROM item a'
              
                '         WHERE  ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39 +
                #39'))'
              '          AND ('
              '                    (a.codigo_familia = 30) OR'
              '                    (a.flag_tipo_prod = '#39'R'#39')'
              '                  )'
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
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object edRIRcdTamanhoBase: TDBCampoCodigo
            Left = 86
            Top = 41
            Width = 371
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            TabStop = True
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
              '              SELECT seq   AS cdTamanho,'
              '                           valor AS deTamanho'
              '                FROM valorVar'
              '              WHERE codigo_variavel = 5 '
              '              ORDER BY valor'
              '            ) t'
              '&filtro')
            ERPCamposFiltro.Strings = (
              'cdTamanho'
              'deTamanho')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdTamanho'
            ERPCampoDescricao = 'deTamanho'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
        end
      end
    end
    object tsMaterialMovimento: TTabSheet
      Caption = 'Movimento de Materiais'
      ImageIndex = 3
      object sbRMM: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbRMMFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          object lbRMMdtMovimento: TLabel
            Left = 47
            Top = 17
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Mov.:'
          end
          object lbRMMdtMovimentoA: TLabel
            Left = 220
            Top = 17
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRMMdtSituacaoMovA: TLabel
            Left = 220
            Top = 41
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRMMdtSituacaoMov: TLabel
            Left = 30
            Top = 41
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Situa'#231#227'o:'
          end
          object lbRMMflTipoMovimento: TLabel
            Left = 50
            Top = 89
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Mov.:'
          end
          object lbRMMcdSituacaoMovimento: TLabel
            Left = 29
            Top = 113
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Situa'#231#227'o Mov.:'
          end
          object lbRMMcdMaterial: TLabel
            Left = 59
            Top = 162
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Material:'
          end
          object lbRMMcdFornecedor: TLabel
            Left = 42
            Top = 186
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fornecedor:'
          end
          object lbRMMflTipoSolicitacao: TLabel
            Left = 48
            Top = 137
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Sa'#237'da:'
          end
          object lbRMMcdCentroCusto: TLabel
            Left = 18
            Top = 210
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Centro de Custo:'
          end
          object lbRMMdtCadSolicitacaoA: TLabel
            Left = 220
            Top = 65
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRMMdtCadSolicitacao: TLabel
            Left = 21
            Top = 65
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Solicita'#231#227'o:'
          end
          object edRMMdtMovimentoIni: TDateTimePicker
            Left = 102
            Top = 14
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            TabOrder = 0
          end
          object edRMMdtMovimentoFim: TDateTimePicker
            Left = 233
            Top = 14
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            TabOrder = 1
          end
          object edRMMdtSituacaoMovFim: TDateTimePicker
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
          object edRMMdtSituacaoMovIni: TDateTimePicker
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
          object cbRMMflTipoMovimento: TComboBox
            Left = 102
            Top = 86
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
          object cbRMMcdSituacaoMovimento: TComboBox
            Left = 102
            Top = 110
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
          object edRMMcdMaterial: TDBCampoCodigo
            Left = 102
            Top = 159
            Width = 330
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 9
            TabStop = True
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
          object edRMMcdFornecedor: TDBCampoCodigo
            Left = 102
            Top = 183
            Width = 330
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 10
            TabStop = True
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
          object cbRMMflTipoSolicitacao: TComboBox
            Left = 102
            Top = 134
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
          object edRMMcdCentroCusto: TDBCampoCodigo
            Left = 102
            Top = 207
            Width = 330
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 11
            TabStop = True
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
          object edRMMdtCadSolicitacaoFim: TDateTimePicker
            Left = 233
            Top = 62
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 5
          end
          object edRMMdtCadSolicitacaoIni: TDateTimePicker
            Left = 102
            Top = 62
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 4
          end
        end
      end
    end
    object tsMaterialEstoque: TTabSheet
      Caption = 'Estoque de Materiais'
      ImageIndex = 4
      object sbREM: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbREM: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          object lbREMcdMaterial: TLabel
            Left = 59
            Top = 18
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Material:'
          end
          object lbREMcdCentroCusto: TLabel
            Left = 18
            Top = 42
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Centro de Custo:'
          end
          object edREMcdMaterial: TDBCampoCodigo
            Left = 102
            Top = 15
            Width = 349
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            TabStop = True
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
          object edREMcdCentroCusto: TDBCampoCodigo
            Left = 102
            Top = 39
            Width = 349
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            TabStop = True
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
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 330
    Width = 479
    Height = 52
    Align = alBottom
    TabOrder = 1
    object btImprimir: TBitBtn
      Left = 1
      Top = 1
      Width = 55
      Height = 50
      Align = alLeft
      Caption = '&Imprimir'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btImprimirClick
    end
    object btFechar: TBitBtn
      Left = 56
      Top = 1
      Width = 55
      Height = 50
      Align = alLeft
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btFecharClick
    end
  end
  object relEstProdRel: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relEstProdRelUserFunction
    Left = 218
    Top = 336
    Datasets = <
      item
        DataSet = dbEstProdRel
        DataSetName = 'frxDBEstProdRel'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 351.496290000000000000
        Width = 1046.929810000000000000
        object Line5: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 964.559826460000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mUsuDataHora: TfrxMemoView
          Width = 966.047834800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 112.881880000000000000
        Top = 177.637910000000000000
        Width = 1046.929810000000000000
        DataSet = dbEstProdRel
        DataSetName = 'frxDBEstProdRel'
        RowCount = 0
        Stretched = True
        object DBCross1: TfrxDBCrossView
          Width = 242.000000000000000000
          Height = 112.000000000000000000
          ColumnLevels = 2
          DownThenAcross = False
          ShowCorner = False
          ShowTitle = False
          CellFields.Strings = (
            'qtdest')
          ColumnFields.Strings = (
            'degruposet'
            'detamanho')
          DataSet = dbEstProdRel
          DataSetName = 'frxDBEstProdRel'
          RowFields.Strings = (
            'cditem')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F56696577204C6566743D2237352220
            546F703D223233332C3633373931222057696474683D22353822204865696768
            743D22313822205265737472696374696F6E733D2232342220416C6C6F774578
            7072657373696F6E733D2246616C73652220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            392220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D
            223022204672616D652E5479703D2231352220476170583D2233222047617059
            3D2233222048416C69676E3D22686152696768742220506172656E74466F6E74
            3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
            2230222F3E3C546672784D656D6F56696577204C6566743D2237352220546F70
            3D223235312C3633373931222057696474683D22353822204865696768743D22
            313822205265737472696374696F6E733D2232342220416C6C6F774578707265
            7373696F6E733D2246616C73652220466F6E742E436861727365743D22312220
            466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D392220
            466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D223022
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222048416C69676E3D22686152696768742220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D223022
            2F3E3C546672784D656D6F56696577204C6566743D223131332220546F703D22
            3336222057696474683D22323822204865696768743D22313822205265737472
            696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246
            616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D22302220466F6E742E4865696768743D222D392220466F6E742E4E616D65
            3D22417269616C2220466F6E742E5374796C653D223022204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            22686152696768742220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D2230222F3E3C546672784D65
            6D6F56696577204C6566743D223131332220546F703D22353422205769647468
            3D22323822204865696768743D22313822205265737472696374696F6E733D22
            32342220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E
            742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E
            742E4865696768743D222D392220466F6E742E4E616D653D22417269616C2220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204761
            70583D22332220476170593D2233222048416C69676E3D226861526967687422
            20506172656E74466F6E743D2246616C7365222056416C69676E3D2276614365
            6E7465722220546578743D2230222F3E3C546672784D656D6F56696577204C65
            66743D223133332220546F703D223233332C3633373931222057696474683D22
            383922204865696768743D22313822205265737472696374696F6E733D223234
            2220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E
            436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E
            4865696768743D222D392220466F6E742E4E616D653D22417269616C2220466F
            6E742E5374796C653D223022204672616D652E5479703D223135222047617058
            3D22332220476170593D2233222048416C69676E3D2268615269676874222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D2230222F3E3C546672784D656D6F56696577204C656674
            3D223133332220546F703D223235312C3633373931222057696474683D223839
            22204865696768743D22313822205265737472696374696F6E733D2232342220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D392220466F6E742E4E616D653D22417269616C2220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686152696768742220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D2230222F3E3C2F63656C6C6D656D6F733E3C63656C6C686561
            6465726D656D6F733E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222056416C69676E3D22766143656E7465722220546578743D22
            717464657374222F3E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222056416C69676E3D22766143656E7465722220546578743D22
            717464657374222F3E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222056416C69676E3D22766143656E7465722220546578743D22
            222F3E3C2F63656C6C6865616465726D656D6F733E3C636F6C756D6E6D656D6F
            733E3C546672784D656D6F56696577204C6566743D2237352220546F703D2231
            39372C3633373931222057696474683D22353822204865696768743D22313822
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E
            742E436F6C6F723D22302220466F6E742E4865696768743D222D392220466F6E
            742E4E616D653D22417269616C2220466F6E742E5374796C653D223022204672
            616D652E5479703D2231352220476170583D22332220476170593D2233222048
            416C69676E3D22686143656E7465722220506172656E74466F6E743D2246616C
            7365222056416C69676E3D22766143656E7465722220546578743D22222F3E3C
            546672784D656D6F56696577204C6566743D2237352220546F703D223231352C
            3633373931222057696474683D22353822204865696768743D22313822205265
            737472696374696F6E733D2232342220416C6C6F7745787072657373696F6E73
            3D2246616C73652220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D392220466F6E742E4E
            616D653D22417269616C2220466F6E742E5374796C653D223022204672616D65
            2E5479703D2231352220476170583D22332220476170593D2233222048416C69
            676E3D22686143656E7465722220506172656E74466F6E743D2246616C736522
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C2F636F
            6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D656D6F733E3C546672
            784D656D6F56696577204C6566743D223133332220546F703D223139372C3633
            373931222057696474683D22383922204865696768743D223336222052657374
            72696374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246
            616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D22302220466F6E742E4865696768743D222D392220466F6E742E4E616D65
            3D22417269616C2220466F6E742E5374796C653D223122204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            22686143656E7465722220506172656E74466F6E743D2246616C736522205641
            6C69676E3D22766143656E7465722220546578743D22546F74616C204974656D
            222F3E3C546672784D656D6F56696577204C6566743D223131332220546F703D
            223138222057696474683D22323822204865696768743D223138222052657374
            72696374696F6E733D2238222056697369626C653D2246616C73652220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D392220466F6E742E4E616D653D22417269616C2220466F6E742E5374
            796C653D223122204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E7465722220506172656E
            74466F6E743D2246616C7365222056416C69676E3D22766143656E7465722220
            546578743D22546F74616C222F3E3C2F636F6C756D6E746F74616C6D656D6F73
            3E3C636F726E65726D656D6F733E3C546672784D656D6F56696577204C656674
            3D22302220546F703D2230222057696474683D22383122204865696768743D22
            3022205265737472696374696F6E733D2238222056697369626C653D2246616C
            73652220416C6C6F7745787072657373696F6E733D2246616C73652220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322204841
            6C69676E3D22686143656E746572222056416C69676E3D22766143656E746572
            2220546578743D224974656D222F3E3C546672784D656D6F56696577204C6566
            743D2237352220546F703D223139372C3633373931222057696474683D223134
            3722204865696768743D223022205265737472696374696F6E733D2238222056
            697369626C653D2246616C73652220416C6C6F7745787072657373696F6E733D
            2246616C736522204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E746572222056416C6967
            6E3D22766143656E7465722220546578743D226465677275706F7365742C2064
            6574616D616E686F222F3E3C546672784D656D6F56696577204C6566743D2230
            2220546F703D2230222057696474683D223022204865696768743D2230222052
            65737472696374696F6E733D2238222056697369626C653D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222048416C69676E
            3D22686143656E746572222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C546672784D656D6F56696577204C6566743D22302220546F
            703D2230222057696474683D22383122204865696768743D2232322220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222048416C69676E3D22686143656E746572222056416C69676E
            3D22766143656E7465722220546578743D2263646974656D222F3E3C2F636F72
            6E65726D656D6F733E3C726F776D656D6F733E3C546672784D656D6F56696577
            204C6566743D2232302220546F703D223233332C363337393122205769647468
            3D22353522204865696768743D22313822205265737472696374696F6E733D22
            32342220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E
            742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E
            742E4865696768743D222D392220466F6E742E4E616D653D22417269616C2220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204761
            70583D22332220476170593D2233222048416C69676E3D22686143656E746572
            2220506172656E74466F6E743D2246616C7365222056416C69676E3D22766143
            656E7465722220546578743D22222F3E3C2F726F776D656D6F733E3C726F7774
            6F74616C6D656D6F733E3C546672784D656D6F56696577204C6566743D223230
            2220546F703D223235312C3633373931222057696474683D2235352220486569
            6768743D22313822205265737472696374696F6E733D22382220416C6C6F7745
            787072657373696F6E733D2246616C73652220466F6E742E436861727365743D
            22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D22
            2D392220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C65
            3D223122204672616D652E5479703D2231352220476170583D22332220476170
            593D2233222048416C69676E3D22686143656E7465722220506172656E74466F
            6E743D2246616C7365222056416C69676E3D22766143656E7465722220546578
            743D22546F74616C205365746F72222F3E3C2F726F77746F74616C6D656D6F73
            3E3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C66
            756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C69
            74656D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974
            656D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Top = 20.015770000000000000
          Width = 1046.929810000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTOQUE DE PRODU'#199#195'O')
          ParentFont = False
        end
      end
    end
  end
  object dbEstProdRel: TfrxDBDataset
    UserName = 'frxDBEstProdRel'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cditem=cditem'
      'deitem=deitem'
      'degruposet=degruposet'
      'cdsetor=cdsetor'
      'desetor=desetor'
      'cdtamanho=cdtamanho'
      'detamanho=detamanho'
      'degrupotam=degrupotam'
      'qtdest=qtdest')
    DataSet = DmERP.qyEstoqueProducaoRel
    BCDToCurrency = False
    Left = 146
    Top = 336
  end
  object frxCrossRelatorios: TfrxCrossObject
    Left = 304
    Top = 336
  end
  object dbItensRelacRel: TfrxDBDataset
    UserName = 'dbItensRelacRel'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdItemRelacionado=cditemrelacionado'
      'cdItem=cditem'
      'cdTamanho=cdtamanho'
      'cdItemBase=cditembase'
      'cdTamanhoBase=cdtamanhobase'
      'deItem=deitem'
      'deTamanho=detamanho'
      'deItemBase=deitembase'
      'deTamanhoBase=detamanhobase'
      'cdTipoRelacao=cdTipoRelacao'
      'deTipoRelacao=deTipoRelacao')
    DataSet = vtItensRelacRel
    BCDToCurrency = False
    Left = 114
    Top = 280
  end
  object relItensRelacRel: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;'
      ''
      'procedure ghTamanhoBaseOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  ghTamanhoBase.Visible := <dbItensRelacRel."cdTipoRelacao"> = 1' +
        ';                                          '
      'end;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  MasterData1.Visible := <dbItensRelacRel."cdTipoRelacao"> = 1; ' +
        ' '
      'end;'
      ''
      'procedure gfItemBaseOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  gfItemBase.Visible := <dbItensRelacRel."cdTipoRelacao"> = 1;  ' +
        '  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relItensRelacRelUserFunction
    Left = 202
    Top = 280
    Datasets = <
      item
        DataSet = dbItensRelacRel
        DataSetName = 'dbItensRelacRel'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 468.661720000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 964.559680000001000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line5: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 639.520246460000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mUsuDataHora: TfrxMemoView
          Width = 641.008254800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dbItensRelacRel
        DataSetName = 'dbItensRelacRel'
        RowCount = 0
        Stretched = True
        object dbItensRelacRelcditem: TfrxMemoView
          Left = 7.559059999999999000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'cditem'
          DataSet = dbItensRelacRel
          DataSetName = 'dbItensRelacRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbItensRelacRel."cditem"]')
          ParentFont = False
        end
        object dbItensRelacReldeitem: TfrxMemoView
          Left = 89.708720000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          DataField = 'deitem'
          DataSet = dbItensRelacRel
          DataSetName = 'dbItensRelacRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbItensRelacRel."deitem"]')
          ParentFont = False
        end
        object dbItensRelacReldetamanho: TfrxMemoView
          Left = 385.512060000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          DataField = 'detamanho'
          DataSet = dbItensRelacRel
          DataSetName = 'dbItensRelacRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbItensRelacRel."detamanho"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Top = 0.000000000000002305
          Width = 718.110236220000000000
          Height = 83.149660000000000000
        end
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Top = 6.559060000000000000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Top = 22.795300000000000000
          Width = 718.110700000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Relacionamento dos Itens')
          ParentFont = False
        end
      end
      object ghItemBase: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677167800000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        Condition = 'dbItensRelacRel."cditembase"'
        object dbItensRelacRelcditembase: TfrxMemoView
          Left = 90.149660000000000000
          Width = 393.071120000000000000
          Height = 18.897650000000000000
          DataSet = dbItensRelacRel
          DataSetName = 'dbItensRelacRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbItensRelacRel."cditembase"] - [dbItensRelacRel."deitembase"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Item Base:')
          ParentFont = False
        end
      end
      object ghTamanhoBase: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ghTamanhoBaseOnBeforePrint'
        Child = relItensRelacRel.Child1
        Condition = 'dbItensRelacRel."cdtamanhobase"'
        object Memo2: TfrxMemoView
          Left = 120.283550000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DataSet = dbItensRelacRel
          DataSetName = 'dbItensRelacRel'
          Memo.UTF8W = (
            '[dbItensRelacRel."detamanhobase"]')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo3: TfrxMemoView
          Left = 14.677180000000000000
          Width = 103.937007870000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tamanho Base:')
          ParentFont = False
        end
      end
      object gfTamanhoBase: TfrxGroupFooter
        FillType = ftBrush
        Top = 381.732530000000000000
        Width = 718.110700000000000000
      end
      object gfItemBase: TfrxGroupFooter
        FillType = ftBrush
        Height = 3.779530000000000000
        Top = 404.409710000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'gfItemBaseOnBeforePrint'
        object Line1: TfrxLineView
          Top = 0.779530000000022500
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        object Memo4: TfrxMemoView
          Left = 74.590600000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 385.511811023622000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tamanho')
          ParentFont = False
        end
      end
      object ghTipoRelacao: TfrxGroupHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        Condition = 'dbItensRelacRel."cdTipoRelacao"'
        ReprintOnNewPage = True
        StartNewPage = True
        object dbItensRelacReldeTipoRelacao: TfrxMemoView
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'deTipoRelacao'
          DataSet = dbItensRelacRel
          DataSetName = 'dbItensRelacRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dbItensRelacRel."deTipoRelacao"]')
          ParentFont = False
        end
      end
    end
  end
  object vtItensRelacRel: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'cdTipoRelacao,cdItemBase,cdTamanhoBase,cdItem'
    Left = 32
    Top = 280
    Data = {03000000000000000000}
    object vtItensRelacRelcdItemRelacionado: TIntegerField
      FieldName = 'cdItemRelacionado'
    end
    object vtItensRelacRelcdItem: TStringField
      FieldName = 'cdItem'
      Size = 30
    end
    object vtItensRelacRelcdTamanho: TIntegerField
      FieldName = 'cdTamanho'
    end
    object vtItensRelacRelcdItemBase: TStringField
      FieldName = 'cdItemBase'
      Size = 30
    end
    object vtItensRelacRelcdTamanhoBase: TIntegerField
      FieldName = 'cdTamanhoBase'
    end
    object vtItensRelacReldeItem: TStringField
      FieldName = 'deItem'
      Size = 250
    end
    object vtItensRelacReldeTamanho: TStringField
      FieldName = 'deTamanho'
      Size = 250
    end
    object vtItensRelacReldeItemBase: TStringField
      FieldName = 'deItemBase'
      Size = 250
    end
    object vtItensRelacReldeTamanhoBase: TStringField
      FieldName = 'deTamanhoBase'
      Size = 250
    end
    object vtItensRelacRelcdTipoRelacao: TIntegerField
      FieldName = 'cdTipoRelacao'
    end
    object vtItensRelacReldeTipoRelacao: TStringField
      FieldName = 'deTipoRelacao'
      Size = 50
    end
  end
  object relProdDiaria: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;'
      ''
      'procedure mPeriodoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      ' mPeriodo.Text := PeriodoProducao;    '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relProdDiariaUserFunction
    Left = 354
    Top = 280
    Datasets = <
      item
        DataSet = dbProdDiariaRel
        DataSetName = 'frxDBProdDiaria'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        object Line5: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 964.559826460000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mUsuDataHora: TfrxMemoView
          Width = 966.047834800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 112.000000000000000000
        Top = 230.551330000000000000
        Width = 1046.929810000000000000
        DataSet = dbProdDiariaRel
        DataSetName = 'frxDBProdDiaria'
        RowCount = 0
        Stretched = True
        object DBCross1: TfrxDBCrossView
          Width = 242.000000000000000000
          Height = 112.000000000000000000
          ColumnLevels = 2
          DownThenAcross = False
          ShowCorner = False
          ShowTitle = False
          CellFields.Strings = (
            'qtdest')
          ColumnFields.Strings = (
            'degruposet'
            'detamanho')
          DataSet = dbProdDiariaRel
          DataSetName = 'frxDBProdDiaria'
          RowFields.Strings = (
            'cditem')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F56696577204C6566743D2237352220
            546F703D223238362C3535313333222057696474683D22353822204865696768
            743D22313822205265737472696374696F6E733D2232342220416C6C6F774578
            7072657373696F6E733D2246616C73652220466F6E742E436861727365743D22
            312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            392220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D
            223022204672616D652E5479703D2231352220476170583D2233222047617059
            3D2233222048416C69676E3D22686152696768742220506172656E74466F6E74
            3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
            2230222F3E3C546672784D656D6F56696577204C6566743D2237352220546F70
            3D223330342C3535313333222057696474683D22353822204865696768743D22
            313822205265737472696374696F6E733D2232342220416C6C6F774578707265
            7373696F6E733D2246616C73652220466F6E742E436861727365743D22312220
            466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D392220
            466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D223022
            204672616D652E5479703D2231352220476170583D22332220476170593D2233
            222048416C69676E3D22686152696768742220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D223022
            2F3E3C546672784D656D6F56696577204C6566743D223131332220546F703D22
            3336222057696474683D22323822204865696768743D22313822205265737472
            696374696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246
            616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D22302220466F6E742E4865696768743D222D392220466F6E742E4E616D65
            3D22417269616C2220466F6E742E5374796C653D223022204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            22686152696768742220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D2230222F3E3C546672784D65
            6D6F56696577204C6566743D223131332220546F703D22353422205769647468
            3D22323822204865696768743D22313822205265737472696374696F6E733D22
            32342220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E
            742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E
            742E4865696768743D222D392220466F6E742E4E616D653D22417269616C2220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204761
            70583D22332220476170593D2233222048416C69676E3D226861526967687422
            20506172656E74466F6E743D2246616C7365222056416C69676E3D2276614365
            6E7465722220546578743D2230222F3E3C546672784D656D6F56696577204C65
            66743D223133332220546F703D223238362C3535313333222057696474683D22
            383922204865696768743D22313822205265737472696374696F6E733D223234
            2220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E
            436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E
            4865696768743D222D392220466F6E742E4E616D653D22417269616C2220466F
            6E742E5374796C653D223022204672616D652E5479703D223135222047617058
            3D22332220476170593D2233222048416C69676E3D2268615269676874222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D2230222F3E3C546672784D656D6F56696577204C656674
            3D223133332220546F703D223330342C3535313333222057696474683D223839
            22204865696768743D22313822205265737472696374696F6E733D2232342220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D392220466F6E742E4E616D653D22417269616C2220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686152696768742220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D2230222F3E3C2F63656C6C6D656D6F733E3C63656C6C686561
            6465726D656D6F733E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222056416C69676E3D22766143656E7465722220546578743D22
            717464657374222F3E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222056416C69676E3D22766143656E7465722220546578743D22
            717464657374222F3E3C546672784D656D6F56696577204C6566743D22302220
            546F703D2230222057696474683D223022204865696768743D22302220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222056416C69676E3D22766143656E7465722220546578743D22
            222F3E3C2F63656C6C6865616465726D656D6F733E3C636F6C756D6E6D656D6F
            733E3C546672784D656D6F56696577204C6566743D2237352220546F703D2232
            35302C3535313333222057696474683D22353822204865696768743D22313822
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E
            742E436F6C6F723D22302220466F6E742E4865696768743D222D392220466F6E
            742E4E616D653D22417269616C2220466F6E742E5374796C653D223022204672
            616D652E5479703D2231352220476170583D22332220476170593D2233222048
            416C69676E3D22686143656E7465722220506172656E74466F6E743D2246616C
            7365222056416C69676E3D22766143656E7465722220546578743D22222F3E3C
            546672784D656D6F56696577204C6566743D2237352220546F703D223236382C
            3535313333222057696474683D22353822204865696768743D22313822205265
            737472696374696F6E733D2232342220416C6C6F7745787072657373696F6E73
            3D2246616C73652220466F6E742E436861727365743D22312220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D392220466F6E742E4E
            616D653D22417269616C2220466F6E742E5374796C653D223022204672616D65
            2E5479703D2231352220476170583D22332220476170593D2233222048416C69
            676E3D22686143656E7465722220506172656E74466F6E743D2246616C736522
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C2F636F
            6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D656D6F733E3C546672
            784D656D6F56696577204C6566743D223133332220546F703D223235302C3535
            313333222057696474683D22383922204865696768743D223336222052657374
            72696374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246
            616C73652220466F6E742E436861727365743D22312220466F6E742E436F6C6F
            723D22302220466F6E742E4865696768743D222D392220466F6E742E4E616D65
            3D22417269616C2220466F6E742E5374796C653D223122204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            22686143656E7465722220506172656E74466F6E743D2246616C736522205641
            6C69676E3D22766143656E7465722220546578743D22546F74616C204974656D
            222F3E3C546672784D656D6F56696577204C6566743D223131332220546F703D
            223138222057696474683D22323822204865696768743D223138222052657374
            72696374696F6E733D2238222056697369626C653D2246616C73652220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D392220466F6E742E4E616D653D22417269616C2220466F6E742E5374
            796C653D223122204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E7465722220506172656E
            74466F6E743D2246616C7365222056416C69676E3D22766143656E7465722220
            546578743D22546F74616C222F3E3C2F636F6C756D6E746F74616C6D656D6F73
            3E3C636F726E65726D656D6F733E3C546672784D656D6F56696577204C656674
            3D22302220546F703D2230222057696474683D22353522204865696768743D22
            3022205265737472696374696F6E733D2238222056697369626C653D2246616C
            73652220416C6C6F7745787072657373696F6E733D2246616C73652220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322204841
            6C69676E3D22686143656E746572222056416C69676E3D22766143656E746572
            2220546578743D224974656D222F3E3C546672784D656D6F56696577204C6566
            743D2237352220546F703D223235302C3535313333222057696474683D223134
            3722204865696768743D223022205265737472696374696F6E733D2238222056
            697369626C653D2246616C73652220416C6C6F7745787072657373696F6E733D
            2246616C736522204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E746572222056416C6967
            6E3D22766143656E7465722220546578743D226465677275706F7365742C2064
            6574616D616E686F222F3E3C546672784D656D6F56696577204C6566743D2230
            2220546F703D2230222057696474683D223022204865696768743D2230222052
            65737472696374696F6E733D2238222056697369626C653D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222048416C69676E
            3D22686143656E746572222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C546672784D656D6F56696577204C6566743D22302220546F
            703D2230222057696474683D22353522204865696768743D2233362220526573
            7472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D22
            46616C736522204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222048416C69676E3D22686143656E746572222056416C69676E
            3D22766143656E7465722220546578743D2263646974656D222F3E3C2F636F72
            6E65726D656D6F733E3C726F776D656D6F733E3C546672784D656D6F56696577
            204C6566743D2232302220546F703D223238362C353531333322205769647468
            3D22353522204865696768743D22313822205265737472696374696F6E733D22
            32342220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E
            742E436861727365743D22312220466F6E742E436F6C6F723D22302220466F6E
            742E4865696768743D222D392220466F6E742E4E616D653D22417269616C2220
            466F6E742E5374796C653D223022204672616D652E5479703D22313522204761
            70583D22332220476170593D2233222048416C69676E3D22686143656E746572
            2220506172656E74466F6E743D2246616C7365222056416C69676E3D22766143
            656E7465722220546578743D22222F3E3C2F726F776D656D6F733E3C726F7774
            6F74616C6D656D6F733E3C546672784D656D6F56696577204C6566743D223230
            2220546F703D223330342C3535313333222057696474683D2235352220486569
            6768743D22313822205265737472696374696F6E733D22382220416C6C6F7745
            787072657373696F6E733D2246616C73652220466F6E742E436861727365743D
            22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D22
            2D392220466F6E742E4E616D653D22417269616C2220466F6E742E5374796C65
            3D223122204672616D652E5479703D2231352220476170583D22332220476170
            593D2233222048416C69676E3D22686143656E7465722220506172656E74466F
            6E743D2246616C7365222056416C69676E3D22766143656E7465722220546578
            743D22546F74616C205365746F72222F3E3C2F726F77746F74616C6D656D6F73
            3E3C63656C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C66
            756E6374696F6E733E3C636F6C756D6E736F72743E3C6974656D20302F3E3C69
            74656D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974
            656D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Top = 20.015770000000000000
          Width = 1046.929810000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'PRODU'#199#195'O DI'#193'RIA')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 177.637910000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object mPeriodo: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          OnBeforePrint = 'mPeriodoOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'TITULO')
          ParentFont = False
        end
      end
    end
  end
  object dbProdDiariaRel: TfrxDBDataset
    UserName = 'frxDBProdDiaria'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dtbaixa=dtbaixa'
      'cditem=cditem'
      'deitem=deitem'
      'degruposet=degruposet'
      'cdsetor=cdsetor'
      'desetor=desetor'
      'cdtamanho=cdtamanho'
      'detamanho=detamanho'
      'degrupotam=degrupotam'
      'qtdest=qtdest')
    DataSet = DmERP.qyProducaoDiariaRel
    BCDToCurrency = False
    Left = 282
    Top = 280
  end
  object dbMaterialMovRel: TfrxDBDataset
    UserName = 'frxDBMaterialMovRel'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdMaterialMovimento=cdmaterialmovimento'
      'flTipoMovimento=fltipomovimento'
      'cdSituacaoMovimento=cdsituacaomovimento'
      'dtMovimento=dtmovimento'
      'hrMovimento=hrmovimento'
      'cdMaterial=cdmaterial'
      'deMaterial=dematerial'
      'cdUnidadeMedida=cdunidademedida'
      'nuQtde=nuqtde'
      'vlUnitario=vlunitario'
      'cdFornecedor=cdfornecedor'
      'cdMaterialSolicitacao=cdmaterialsolicitacao'
      'deNuNotaFiscal=denunotafiscal'
      'dtSituacaoMov=dtsituacaomov'
      'hrSituacaoMov=hrsituacaomov'
      'cdUsuarioSituacaoMov=cdusuariosituacaomov'
      'deObservacoes=deobservacoes'
      'dtCadastro=dtcadastro'
      'hrCadastro=hrcadastro'
      'cdUsuarioCadastro=cdusuariocadastro'
      'dtAlteracao=dtalteracao'
      'hrAlteracao=hralteracao'
      'cdUsuarioAlteracao=cdusuarioalteracao'
      'vlUnitES=vlunites'
      'deSituacaoMovimento=desituacaomovimento'
      'deHrCadastro=dehrcadastro'
      'deHrAlteracao=dehralteracao'
      'deHrMovimento=dehrmovimento'
      'deHrSituacaoMov=dehrsituacaomov'
      'nuQtdeMov=nuqtdemov'
      'nmFornecedor=nmfornecedor'
      'cdSolicitante=cdsolicitante'
      'nmSolicitante=nmsolicitante'
      'flTipoSolicitacao=flTipoSolicitacao'
      'deTipoSolicitacao=detiposolicitacao'
      'nmUsuCad=nmusucad'
      'nmUsuAlt=nmusualt'
      'nmUsuSit=nmususit'
      'vlCusto=vlcusto'
      'cdCentroCusto=cdCentroCusto'
      'deCentroCusto=deCentroCusto')
    DataSet = vtMaterialMovRel
    BCDToCurrency = False
    Left = 122
    Top = 216
  end
  object relMaterialMovRel: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;'
      ''
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Footer1.Visible := EhUsuarioEscritorio;    '
      'end;'
      ''
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo13.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'procedure Memo14OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo14.Visible := EhUsuarioEscritorio;    '
      'end;'
      ''
      'procedure Memo15OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo15.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'procedure Memo16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo16.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'procedure Memo17OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo17.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'procedure Memo19OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo19.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'procedure SysMemo2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SysMemo2.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'procedure SysMemo4OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  SysMemo4.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'procedure Memo21OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Memo21.Visible := EhUsuarioEscritorio;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relMaterialMovRelUserFunction
    Left = 210
    Top = 216
    Datasets = <
      item
        DataSet = dbMaterialMovRel
        DataSetName = 'frxDBMaterialMovRel'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 529.134200000000000000
        Width = 1046.929810000000000000
        object Line5: TfrxLineView
          Width = 1046.929133858268000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 965.559826460000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mUsuDataHora: TfrxMemoView
          Width = 1045.417964800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 17.007874020000000000
        Top = 313.700990000000000000
        Width = 1046.929810000000000000
        DataSet = dbMaterialMovRel
        DataSetName = 'frxDBMaterialMovRel'
        RowCount = 0
        Stretched = True
        object frxDBEstoqueMaterialRelfltipomovimento: TfrxMemoView
          Left = 148.291338580000000000
          Width = 66.141732280000000000
          Height = 17.007874020000000000
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."fltipomovimento"]')
          ParentFont = False
        end
        object frxDBEstoqueMaterialReldtmovimento: TfrxMemoView
          Width = 71.811023620000000000
          Height = 17.007874015748030000
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."dtmovimento"]')
          ParentFont = False
        end
        object frxDBEstoqueMaterialReldehrmovimento: TfrxMemoView
          Left = 74.700787400000000000
          Width = 69.921259840000000000
          Height = 17.007874015748030000
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."dehrmovimento"]')
          ParentFont = False
        end
        object frxDBEstoqueMaterialRelnuqtde: TfrxMemoView
          Left = 289.354374650000000000
          Width = 60.472440940000000000
          Height = 17.007874020000000000
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."nuqtde"]')
          ParentFont = False
        end
        object frxDBMaterialMovRelcdunidademedida: TfrxMemoView
          Left = 351.716760000000000000
          Width = 30.236220470000000000
          Height = 17.007874020000000000
          DataField = 'cdunidademedida'
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."cdunidademedida"]')
          ParentFont = False
        end
        object frxDBMaterialMovRelnmfornecedor: TfrxMemoView
          Left = 384.598469130000000000
          Width = 185.196850390000000000
          Height = 17.007874020000000000
          DataField = 'nmfornecedor'
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."nmfornecedor"]')
          ParentFont = False
        end
        object frxDBMaterialMovRelnmsolicitante: TfrxMemoView
          Left = 571.929177800000000000
          Width = 143.622042360000000000
          Height = 17.007874020000000000
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."nmsolicitante"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 217.212740000000000000
          Width = 71.811030940000000000
          Height = 17.007874020000000000
          DataField = 'desituacaomovimento'
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."desituacaomovimento"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 873.071430000000000000
          Width = 83.149606300000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo15OnBeforePrint'
          DataField = 'vlunites'
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."vlunites"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 959.000620000000000000
          Width = 83.149606300000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."vlCusto"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end
            item
            end>
        end
        object frxDBMaterialMovRelnmusucad: TfrxMemoView
          Left = 718.110700000000000000
          Width = 151.181200000000000000
          Height = 17.007874020000000000
          DataField = 'nmusucad'
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMaterialMovRel."nmusucad"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Top = 23.015770000000000000
          Width = 1046.929810000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'MOVIMENTO DE MATERIAIS')
          ParentFont = False
        end
      end
      object ghMaterial: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677165350000000000
        Top = 268.346630000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBMaterialMovRel."cdmaterial"'
        object frxDBEstoqueMaterialRelcdmaterial: TfrxMemoView
          Left = 62.031540000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Memo.UTF8W = (
            
              '[frxDBMaterialMovRel."cdmaterial"] - [frxDBMaterialMovRel."demat' +
              'erial"]')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo10: TfrxMemoView
          Width = 60.472480000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Material:')
          ParentFont = False
        end
      end
      object gfMaterial: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 355.275820000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 270.346630000000000000
          Top = 1.000000000000000000
          Width = 79.370130000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMaterialMovRel."nuqtdemov">,MasterData1)]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 179.858380000000000000
          Top = 1.133858270000000000
          Width = 90.708720000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total (E-S):')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 1046.929133858268000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo2: TfrxSysMemoView
          Left = 918.984850000000000000
          Top = 1.133858270000000000
          Width = 124.724490000000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'SysMemo2OnBeforePrint'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMaterialMovRel."vlCusto">,MasterData1)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 797.480830000000000000
          Top = 1.133858270000000000
          Width = 120.944960000000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo17OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo Total Mat.:')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Top = 1.133858269999990000
          Width = 71.811070000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data Mov.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 74.700787400000000000
          Top = 1.133858269999990000
          Width = 69.921259840000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Hora Mov.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 148.291338580000000000
          Top = 1.133858269999990000
          Width = 66.141732280000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo Mov.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 289.244280000000000000
          Top = 1.133858269999990000
          Width = 60.472440940000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 351.716760000000000000
          Top = 1.133858269999990000
          Width = 30.236240000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'UN')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 384.732530000000000000
          Top = 1.133858269999990000
          Width = 185.196970000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 571.929499999999900000
          Top = 1.133858269999990000
          Width = 143.622042360000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Solicitante')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 18.897650000000000000
          Width = 1046.929133858268000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Width = 1046.929133858268000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 217.212740000000000000
          Top = 1.133858269999990000
          Width = 71.811030940000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 873.070966220000000000
          Top = 1.133858269999990000
          Width = 83.149620940000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vl. Unit'#225'rio')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 959.000620000000000000
          Top = 1.133858269999990000
          Width = 83.149620940000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo14OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 718.110700000000000000
          Top = 1.133858269999990000
          Width = 151.181102360000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Usu'#225'rio Mov.')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 445.984540000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object Line4: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo4: TfrxSysMemoView
          Left = 918.984850000000000000
          Top = 1.133858270000000000
          Width = 124.724490000000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'SysMemo4OnBeforePrint'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMaterialMovRel."vlCusto">,MasterData1)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 797.480830000000000000
          Top = 1.133858270000000000
          Width = 120.944960000000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo19OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo Total:')
          ParentFont = False
        end
      end
      object ghCentroCusto: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBMaterialMovRel."cdCentroCusto"'
        object frxDBMaterialMovReldeCentroCusto: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          DataSet = dbMaterialMovRel
          DataSetName = 'frxDBMaterialMovRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[frxDBMaterialMovRel."cdCentroCusto"] - [frxDBMaterialMovRel."de' +
              'CentroCusto"]')
          ParentFont = False
        end
      end
      object gfCentroCusto: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 400.630180000000000000
        Width = 1046.929810000000000000
        object SysMemo3: TfrxSysMemoView
          Left = 270.346630000000000000
          Top = 1.000000000000000000
          Width = 79.370130000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMaterialMovRel."nuqtdemov">,MasterData1)]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 179.858380000000000000
          Top = 1.133858270000000000
          Width = 90.708720000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total (E-S):')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo5: TfrxSysMemoView
          Left = 918.984850000000000000
          Top = 1.133858270000000000
          Width = 124.724490000000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'SysMemo2OnBeforePrint'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBMaterialMovRel."vlCusto">,MasterData1)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 748.346940000000000000
          Top = 1.133858270000000000
          Width = 170.078850000000000000
          Height = 17.007874020000000000
          OnBeforePrint = 'Memo21OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo Total C. Custo:')
          ParentFont = False
        end
      end
    end
  end
  object vtMaterialMovRel: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'cdCentroCusto,deMaterial,flTipoMovimento'
    Left = 32
    Top = 216
    Data = {03000000000000000000}
    object vtMaterialMovRelcdMaterialMovimento: TIntegerField
      FieldName = 'cdMaterialMovimento'
    end
    object vtMaterialMovRelflTipoMovimento: TStringField
      FieldName = 'flTipoMovimento'
      Size = 1
    end
    object vtMaterialMovRelcdSituacaoMovimento: TIntegerField
      FieldName = 'cdSituacaoMovimento'
    end
    object vtMaterialMovReldtMovimento: TDateField
      FieldName = 'dtMovimento'
    end
    object vtMaterialMovRelhrMovimento: TIntegerField
      FieldName = 'hrMovimento'
    end
    object vtMaterialMovRelcdMaterial: TStringField
      FieldName = 'cdMaterial'
      Size = 30
    end
    object vtMaterialMovReldeMaterial: TStringField
      FieldName = 'deMaterial'
      Size = 250
    end
    object vtMaterialMovRelcdUnidadeMedida: TStringField
      FieldName = 'cdUnidadeMedida'
      Size = 3
    end
    object vtMaterialMovRelnuQtde: TFloatField
      FieldName = 'nuQtde'
    end
    object vtMaterialMovRelvlUnitario: TFloatField
      FieldName = 'vlUnitario'
    end
    object vtMaterialMovRelcdFornecedor: TIntegerField
      FieldName = 'cdFornecedor'
    end
    object vtMaterialMovRelcdMaterialSolicitacao: TIntegerField
      FieldName = 'cdMaterialSolicitacao'
    end
    object vtMaterialMovReldeNuNotaFiscal: TStringField
      FieldName = 'deNuNotaFiscal'
      Size = 250
    end
    object vtMaterialMovReldtSituacaoMov: TDateField
      FieldName = 'dtSituacaoMov'
    end
    object vtMaterialMovRelhrSituacaoMov: TIntegerField
      FieldName = 'hrSituacaoMov'
    end
    object vtMaterialMovRelcdUsuarioSituacaoMov: TIntegerField
      FieldName = 'cdUsuarioSituacaoMov'
    end
    object vtMaterialMovReldeObservacoes: TStringField
      FieldName = 'deObservacoes'
      Size = 4000
    end
    object vtMaterialMovReldtCadastro: TDateField
      FieldName = 'dtCadastro'
    end
    object vtMaterialMovRelhrCadastro: TIntegerField
      FieldName = 'hrCadastro'
    end
    object vtMaterialMovRelcdUsuarioCadastro: TIntegerField
      FieldName = 'cdUsuarioCadastro'
    end
    object vtMaterialMovReldtAlteracao: TDateField
      FieldName = 'dtAlteracao'
    end
    object vtMaterialMovRelhrAlteracao: TIntegerField
      FieldName = 'hrAlteracao'
    end
    object vtMaterialMovRelcdUsuarioAlteracao: TIntegerField
      FieldName = 'cdUsuarioAlteracao'
    end
    object vtMaterialMovRelvlUnitES: TFloatField
      FieldName = 'vlUnitES'
    end
    object vtMaterialMovReldeSituacaoMovimento: TStringField
      FieldName = 'deSituacaoMovimento'
    end
    object vtMaterialMovReldeHrCadastro: TStringField
      FieldName = 'deHrCadastro'
      Size = 5
    end
    object vtMaterialMovReldeHrAlteracao: TStringField
      FieldName = 'deHrAlteracao'
      Size = 5
    end
    object vtMaterialMovReldeHrMovimento: TStringField
      FieldName = 'deHrMovimento'
      Size = 5
    end
    object vtMaterialMovReldeHrSituacaoMov: TStringField
      FieldName = 'deHrSituacaoMov'
      Size = 5
    end
    object vtMaterialMovRelnuQtdeMov: TFloatField
      FieldName = 'nuQtdeMov'
    end
    object vtMaterialMovRelnmFornecedor: TStringField
      FieldName = 'nmFornecedor'
      Size = 250
    end
    object vtMaterialMovRelcdSolicitante: TIntegerField
      FieldName = 'cdSolicitante'
    end
    object vtMaterialMovRelnmSolicitante: TStringField
      FieldName = 'nmSolicitante'
      Size = 250
    end
    object vtMaterialMovRelflTipoSolicitacao: TStringField
      FieldName = 'flTipoSolicitacao'
      Size = 1
    end
    object vtMaterialMovReldeTipoSolicitacao: TStringField
      FieldName = 'deTipoSolicitacao'
      Size = 10
    end
    object vtMaterialMovRelnmUsuCad: TStringField
      FieldName = 'nmUsuCad'
      Size = 250
    end
    object vtMaterialMovRelnmUsuAlt: TStringField
      FieldName = 'nmUsuAlt'
      Size = 250
    end
    object vtMaterialMovRelnmUsuSit: TStringField
      FieldName = 'nmUsuSit'
      Size = 250
    end
    object vtMaterialMovRelvlCusto: TFloatField
      FieldName = 'vlCusto'
    end
    object vtMaterialMovRelcdCentroCusto: TIntegerField
      FieldName = 'cdCentroCusto'
    end
    object vtMaterialMovReldeCentroCusto: TStringField
      FieldName = 'deCentroCusto'
      Size = 250
    end
    object vtMaterialMovReldtCadSolicitacao: TDateField
      FieldName = 'dtCadSolicitacao'
    end
  end
  object vtMaterialEstRel: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'cdCentroCusto,deMaterial'
    FieldDefs = <
      item
        Name = 'cdMaterial'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'deMaterial'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'nuQtdEst'
        DataType = ftFloat
      end
      item
        Name = 'cdCentroCusto'
        DataType = ftInteger
      end
      item
        Name = 'deCentroCusto'
        DataType = ftString
        Size = 250
      end>
    Left = 32
    Top = 168
    Data = {
      030005000A0063644D6174657269616C01001E00000000000A0064654D617465
      7269616C0100FA000000000008006E7551746445737406000000000000000D00
      636443656E74726F437573746F03000000000000000D00646543656E74726F43
      7573746F0100FA0000000000000000000000}
    object StringField2: TStringField
      FieldName = 'cdMaterial'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'deMaterial'
      Size = 250
    end
    object FloatField1: TFloatField
      FieldName = 'nuQtdEst'
    end
    object IntegerField13: TIntegerField
      FieldName = 'cdCentroCusto'
    end
    object StringField19: TStringField
      FieldName = 'deCentroCusto'
      Size = 250
    end
    object vtMaterialEstRelcdUnidadeMedidda: TStringField
      FieldName = 'cdUnidadeMedida'
      Size = 3
    end
  end
  object dbMaterialEstRel: TfrxDBDataset
    UserName = 'frxDBMaterialEstRel'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdMaterial=cdmaterial'
      'deMaterial=dematerial'
      'nuQtdEst=nuQtdEst'
      'cdCentroCusto=cdCentroCusto'
      'deCentroCusto=deCentroCusto'
      'cdUnidadeMedida=cdUnidadeMedida')
    DataSet = vtMaterialEstRel
    BCDToCurrency = False
    Left = 122
    Top = 168
  end
  object relMaterialEstRel: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relMaterialEstRelUserFunction
    Left = 210
    Top = 168
    Datasets = <
      item
        DataSet = dbMaterialEstRel
        DataSetName = 'frxDBMaterialEstRel'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object Line5: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 634.740716459998000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mUsuDataHora: TfrxMemoView
          Width = 718.110236220000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 21.921259842519690000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = dbMaterialEstRel
        DataSetName = 'frxDBMaterialEstRel'
        RowCount = 0
        Stretched = True
        object frxDBMaterialEstRelcdmaterial: TfrxMemoView
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'cdmaterial'
          DataSet = dbMaterialEstRel
          DataSetName = 'frxDBMaterialEstRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMaterialEstRel."cdmaterial"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 89.488250000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            ' - ')
          ParentFont = False
        end
        object frxDBMaterialEstReldematerial: TfrxMemoView
          Left = 112.385900000000000000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          DataField = 'dematerial'
          DataSet = dbMaterialEstRel
          DataSetName = 'frxDBMaterialEstRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMaterialEstRel."dematerial"]')
          ParentFont = False
        end
        object frxDBMaterialEstRelnuQtdEst: TfrxMemoView
          Left = 570.488560000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = dbMaterialEstRel
          DataSetName = 'frxDBMaterialEstRel'
          DisplayFormat.FormatStr = '%2.4n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBMaterialEstRel."nuQtdEst"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Top = 20.031496062992120000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object frxDBMaterialEstRelcdUnidadeMedida: TfrxMemoView
          Left = 684.094930000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'cdUnidadeMedida'
          DataSet = dbMaterialEstRel
          DataSetName = 'frxDBMaterialEstRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBMaterialEstRel."cdUnidadeMedida"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Top = 23.015770000000000000
          Width = 718.110236220000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTOQUE DE MATERIAIS')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 24.566929130000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Left = 60.472480000000010000
          Top = 1.133858269999990000
          Width = 71.811070000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Material')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 592.606680000000100000
          Top = 1.133858269999990000
          Width = 86.929150940000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 18.897650000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Left = 684.094930000000000000
          Top = 1.133858269999990000
          Width = 30.236200940000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UN')
          ParentFont = False
        end
      end
      object ghCentroCusto: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBMaterialEstRel."cdCentroCusto"'
        ReprintOnNewPage = True
        object frxDBMaterialMovReldeCentroCusto: TfrxMemoView
          Width = 718.110236220000000000
          Height = 18.897650000000000000
          DataSet = dbMaterialEstRel
          DataSetName = 'frxDBMaterialEstRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[frxDBMaterialEstRel."cdCentroCusto"] - [frxDBMaterialEstRel."de' +
              'CentroCusto"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
end
