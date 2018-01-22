object FIntComRelatorios: TFIntComRelatorios
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Relat'#243'rios'
  ClientHeight = 546
  ClientWidth = 1010
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
  object pcRelatorios: TPageControl
    Left = 0
    Top = 56
    Width = 1010
    Height = 490
    ActivePage = tsPedidos
    Align = alClient
    TabOrder = 0
    object tsPedidos: TTabSheet
      Caption = 'Pedidos'
      object sbPedidos: TScrollBox
        Left = 0
        Top = 0
        Width = 1002
        Height = 462
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        DesignSize = (
          1002
          462)
        object btListaPedRep: TButton
          Left = 83
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista de Pedidos/Rep.'
          TabOrder = 0
          WordWrap = True
          OnClick = btListaPedRepClick
        end
        object btListaPed: TButton
          Left = 569
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista de Pedidos'
          TabOrder = 1
          WordWrap = True
          OnClick = btListaPedClick
        end
        object btBilhetinho: TButton
          Left = 488
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista de Bilhetinhos'
          TabOrder = 2
          WordWrap = True
          OnClick = btBilhetinhoClick
        end
        object btListProd: TButton
          Left = 83
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Relat'#243'rio Produ'#231#227'o'
          TabOrder = 3
          WordWrap = True
          OnClick = btListProdClick
        end
        object btEtiqueta: TButton
          Left = 2
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista de Etiquetas'
          TabOrder = 4
          WordWrap = True
          OnClick = btEtiquetaClick
        end
        object btValorVendasUF: TButton
          Left = 245
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Valor Vendas/UF'
          TabOrder = 5
          WordWrap = True
          OnClick = btValorVendasUFClick
        end
        object btBaixaProd: TButton
          Left = 407
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Baixa de Produ'#231#227'o'
          TabOrder = 6
          WordWrap = True
          OnClick = btBaixaProdClick
        end
        object btListaItemPed: TButton
          Left = 2
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista Item de Pedidos'
          TabOrder = 7
          WordWrap = True
          OnClick = btListaItemPedClick
        end
        object btListaPed2: TButton
          Left = 650
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista de Pedidos 2'
          TabOrder = 8
          WordWrap = True
          OnClick = btListaPed2Click
        end
        object btListaPed3: TButton
          Left = 731
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista de Pedidos 3'
          TabOrder = 9
          WordWrap = True
          OnClick = btListaPed3Click
        end
        object btListaCarreg: TButton
          Left = 164
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Relat'#243'rio Carregamento'
          TabOrder = 10
          WordWrap = True
          OnClick = btListaCarregClick
        end
        object btListaPedCli: TButton
          Left = 164
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Lista de Pedidos/Cli.'
          TabOrder = 11
          WordWrap = True
          OnClick = btListaPedCliClick
        end
        object btVendasMesEmissRep: TButton
          Left = 326
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Vendas M'#234's Emiss'#227'o/Rep.'
          TabOrder = 12
          WordWrap = True
          OnClick = btVendasMesEmissRepClick
        end
        object btVendasMesEmisNfeRep: TButton
          Left = 407
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Vendas M'#234's Emis. NFe/Rep.'
          TabOrder = 13
          WordWrap = True
          OnClick = btVendasMesEmisNfeRepClick
        end
        object gbFiltrosPedido: TGroupBox
          Left = 3
          Top = 0
          Width = 999
          Height = 371
          Anchors = [akLeft, akTop, akBottom]
          Caption = 'Filtros'
          TabOrder = 14
          DesignSize = (
            999
            371)
          object lbPedido: TLabel
            Left = 345
            Top = 43
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido:'
          end
          object lbPedidoA: TLabel
            Left = 463
            Top = 43
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbdtReg: TLabel
            Left = 15
            Top = 19
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Cadastro:'
          end
          object lbdtRegA: TLabel
            Left = 209
            Top = 19
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbcdCarga: TLabel
            Left = 348
            Top = 19
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carga:'
          end
          object lbcdCargaA: TLabel
            Left = 463
            Top = 19
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbSeq: TLabel
            Left = 355
            Top = 67
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seq.:'
          end
          object lbSeqA: TLabel
            Left = 463
            Top = 67
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbcdItemA: TLabel
            Left = 463
            Top = 91
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbcdRep: TLabel
            Left = 562
            Top = 19
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Represent.:'
          end
          object lbcdRepA: TLabel
            Left = 702
            Top = 19
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbdtEmissaoNfsA: TLabel
            Left = 209
            Top = 67
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbdtEmissaoNfs: TLabel
            Left = 7
            Top = 67
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Emiss. NFS:'
          end
          object lbnuNfs: TLabel
            Left = 583
            Top = 67
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' NFs:'
          end
          object lbnuNfsA: TLabel
            Left = 702
            Top = 67
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbcdCliente: TLabel
            Left = 583
            Top = 43
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente:'
          end
          object lbcdClienteA: TLabel
            Left = 702
            Top = 43
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbTipoProduto: TLabel
            Left = 799
            Top = 19
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Prod.:'
          end
          object lbcdItem: TLabel
            Left = 688
            Top = 225
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Item:'
          end
          object lbcdPedido: TLabel
            Left = 438
            Top = 225
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido:'
          end
          object lbdtEmissaoA: TLabel
            Left = 209
            Top = 43
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbdtEmissao: TLabel
            Left = 21
            Top = 43
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Emiss'#227'o:'
          end
          object lbcdItemInterv: TLabel
            Left = 355
            Top = 91
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Item:'
          end
          object lbcdGrupoFat: TLabel
            Left = 564
            Top = 91
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo Fat.:'
          end
          object lbcdGrupoFatA: TLabel
            Left = 702
            Top = 91
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbnmCidade: TLabel
            Left = 830
            Top = 43
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cidade:'
          end
          object lbcdCargaEsc: TLabel
            Left = 9
            Top = 225
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carga:'
          end
          object lbdePeriodo: TLabel
            Left = 49
            Top = 91
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo:'
          end
          object lbdePeriodoA: TLabel
            Left = 209
            Top = 91
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbcdGrupoCli: TLabel
            Left = 816
            Top = 67
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo Cli.:'
          end
          object lbcdGrupoCliA: TLabel
            Left = 932
            Top = 67
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbClienteEsc: TLabel
            Left = 237
            Top = 225
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente:'
          end
          object eddtRegIni: TDateTimePicker
            Left = 91
            Top = 16
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 0
          end
          object eddtRegFim: TDateTimePicker
            Left = 222
            Top = 16
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 1
          end
          object edSeqIni: TEdit
            Left = 383
            Top = 64
            Width = 74
            Height = 21
            NumbersOnly = True
            TabOrder = 12
          end
          object edSeqFim: TEdit
            Left = 474
            Top = 64
            Width = 74
            Height = 21
            NumbersOnly = True
            TabOrder = 13
          end
          object eddtEmissaoNfsFim: TDateTimePicker
            Left = 222
            Top = 64
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 5
          end
          object eddtEmissaoNfsIni: TDateTimePicker
            Left = 91
            Top = 64
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 4
          end
          object gbTipoPedido: TGroupBox
            Left = 3
            Top = 112
            Width = 206
            Height = 54
            Caption = ' Somente Tipo de Pedido: '
            TabOrder = 28
            object cbTpPedV: TCheckBox
              Left = 4
              Top = 15
              Width = 62
              Height = 17
              Caption = 'Vendas'
              TabOrder = 0
            end
            object cbTpPedA: TCheckBox
              Left = 102
              Top = 15
              Width = 101
              Height = 33
              Caption = 'Assist'#234'ncia   (Troca, Reforma)'
              TabOrder = 1
              WordWrap = True
            end
            object cbTpPedO: TCheckBox
              Left = 4
              Top = 31
              Width = 92
              Height = 17
              Caption = 'Outros (Bonif.)'
              TabOrder = 2
            end
          end
          object gbSituacaoPed: TGroupBox
            Left = 212
            Top = 112
            Width = 282
            Height = 54
            Caption = ' Somente Situa'#231#227'o de Pedido: '
            TabOrder = 29
            object cbSitPedL: TCheckBox
              Left = 3
              Top = 31
              Width = 87
              Height = 17
              Caption = 'L - Liberado'
              TabOrder = 1
            end
            object cbSitPedC: TCheckBox
              Left = 197
              Top = 15
              Width = 82
              Height = 17
              Caption = 'C - Cancelado'
              TabOrder = 4
            end
            object cbSitPedE: TCheckBox
              Left = 3
              Top = 15
              Width = 105
              Height = 17
              Caption = 'E - N'#227'o Finalizado'
              TabOrder = 0
            end
            object cbSitPedR: TCheckBox
              Left = 197
              Top = 31
              Width = 83
              Height = 17
              Caption = 'R - Rejeitado'
              TabOrder = 5
            end
            object cbSitPedT: TCheckBox
              Left = 110
              Top = 31
              Width = 81
              Height = 17
              Caption = 'T - Faturado'
              TabOrder = 3
            end
            object cbSitPedB: TCheckBox
              Left = 110
              Top = 15
              Width = 81
              Height = 17
              Caption = 'B - Bloqueado'
              TabOrder = 2
            end
          end
          object gbOutrasOpcoes: TGroupBox
            Left = 3
            Top = 165
            Width = 993
            Height = 54
            Caption = 'Outras Op'#231#245'es'
            TabOrder = 31
            object cbSomenteEtiqNaoimpressa: TCheckBox
              Left = 3
              Top = 15
              Width = 174
              Height = 17
              Caption = 'Somente Etiq. N'#227'o Impressa'
              TabOrder = 0
            end
            object cbSomentePedSemCarga: TCheckBox
              Left = 3
              Top = 31
              Width = 174
              Height = 17
              Caption = 'Somente Pedidos Sem Carga'
              TabOrder = 1
            end
            object cbNaoImpPedCanc: TCheckBox
              Left = 350
              Top = 31
              Width = 185
              Height = 17
              Caption = 'N'#227'o Imprimir Pedidos Cancelados'
              Checked = True
              State = cbChecked
              TabOrder = 5
            end
            object cbNaoImpAcessUrnZinco: TCheckBox
              Left = 350
              Top = 15
              Width = 248
              Height = 17
              Caption = 'N'#227'o Imprimir Itens de Acess. e Urnas de Zinco'
              TabOrder = 4
            end
            object cbImprimirObsBilhet: TCheckBox
              Left = 168
              Top = 15
              Width = 174
              Height = 17
              Caption = 'Imprimir Obs. no Bilhetinho'
              TabOrder = 2
            end
            object cbNaoImpRefUof: TCheckBox
              Left = 607
              Top = 31
              Width = 251
              Height = 17
              Caption = 'N'#227'o Imprimir Itens de Reforma e de Outras Emp.'
              TabOrder = 7
            end
            object cbNaoImpEnzibEnzit: TCheckBox
              Left = 607
              Top = 15
              Width = 253
              Height = 17
              Caption = 'N'#227'o Imprimir Itens de Enzibac e Enzithan'
              TabOrder = 6
            end
            object cbBilhetinhoUmCliPorPag: TCheckBox
              Left = 168
              Top = 31
              Width = 162
              Height = 17
              Caption = 'Bilhetinho: Um Cliente Por P'#225'g.'
              TabOrder = 3
            end
          end
          object ednuNfsIni: TEdit
            Left = 622
            Top = 64
            Width = 74
            Height = 21
            NumbersOnly = True
            TabOrder = 20
          end
          object ednuNfsFim: TEdit
            Left = 713
            Top = 64
            Width = 74
            Height = 21
            NumbersOnly = True
            TabOrder = 21
          end
          object cbTipoProduto: TComboBox
            Left = 871
            Top = 16
            Width = 125
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 24
            Text = 'Todos'
            Items.Strings = (
              'Todos'
              'Produ'#231#227'o Pr'#243'pria'
              'Revenda')
          end
          object edcdItem: TDBCampoCodigo
            Left = 716
            Top = 222
            Width = 277
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 40
            ERPCampoCodigoPK = False
            ERPCharCase = ecUpperCase
            ERPEdCampoChaveWidth = 70
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
              '               TRIM(a.descricao) AS deItem,'
              '               CAST('
              '                         CASE'
              '                           WHEN a.flag_tipo_prod = '#39'R'#39' THEN'
              '                             '#39'Revenda'#39
              '                           WHEN a.flag_tipo_prod = '#39'P'#39' THEN'
              '                             '#39'Produ'#231#227'o Pr'#243'pria'#39
              '                          ELSE'
              '                             '#39'N'#227'o informado'#39
              '                          END AS CHARACTER VARYING(20)'
              '                        ) AS deTipoProduto'
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
              'deItem'
              'deTipoProduto')
            ERPCamposFiltroTitulo.Strings = (
              'Item'
              'Descri'#231#227'o'
              'Tipo de Produto')
            ERPCampoChave = 'cdItem'
            ERPCampoDescricao = 'deItem'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object btSalvarItemEsc: TBitBtn
            Left = 715
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 41
            OnClick = btSalvarItemEscClick
          end
          object btExluirItemEsc: TBitBtn
            Left = 740
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 42
            OnClick = btExluirItemEscClick
          end
          object grItensEscolhidos: TDBGrid
            Left = 772
            Top = 249
            Width = 224
            Height = 107
            Anchors = [akLeft, akTop, akBottom]
            DataSource = dsItensEscolhidos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 43
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cdItem'
                Title.Caption = 'Item'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'deItem'
                Title.Caption = 'Descri'#231#227'o'
                Width = 200
                Visible = True
              end>
          end
          object btSalvarPedEsc: TBitBtn
            Left = 475
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 37
            OnClick = btSalvarPedEscClick
          end
          object btExluirPedEsc: TBitBtn
            Left = 500
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 38
            OnClick = btExluirPedEscClick
          end
          object grPedidosEscolhidos: TDBGrid
            Left = 532
            Top = 246
            Width = 143
            Height = 107
            Anchors = [akLeft, akTop, akBottom]
            DataSource = dsPedidosEscolhidos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 39
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cdPedido'
                Title.Caption = 'Pedido'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'tpPedido'
                Title.Caption = 'Tipo'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'flStatusPed'
                Title.Caption = 'Status'
                Width = 38
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtEmissao'
                Title.Caption = 'Emiss'#227'o'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'deRazaoSocial'
                Title.Caption = 'Raz'#227'o Social'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'deFantasia'
                Title.Caption = 'Fantasia'
                Width = 200
                Visible = True
              end>
          end
          object edcdClienteIni: TDBCampoCodigo
            Left = 622
            Top = 40
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 18
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
              '        SELECT c.codigo_cliente AS cdCliente,'
              '               c.cgc            AS deCpfCnpj, '
              '               c.razao_social   AS deRazaoSocial,'
              '               c.fantasia       AS nmFantasia,  '
              '               c.telefone_1     AS nuFone1, '
              '               c.telefone_2     AS nuFone2,'
              '               c.celular        AS nuCelular, '
              '               c.fax            AS nuFax, '
              '               c.e_mail         AS deEmail,'
              '               c.e_mail_nfe     AS deEmailNfe,'
              '               end              AS deEndereco,'
              '               c.end_nro        AS nuEndereco,  '
              '               c.compl_end      AS deComplemento,'
              '               c.bairro         AS deBairro,'
              '               c.sigla_estado   AS sgEstado,'
              '               c.cidade         AS nmCidade'
              '          FROM cliente c'
              '       ) t'
              '  &filtro'
              ' ORDER BY t.cdCliente')
            ERPCamposFiltro.Strings = (
              'cdCliente'
              'deCpfCnpj'
              'deRazaoSocial'
              'nmFantasia'
              'nuFone1'
              'nuFone2'
              'nuCelular'
              'nuFax'
              'deEmail'
              'deEmailNfe'
              'deEndereco'
              'nuEndereco'
              'deComplemento'
              'deBairro'
              'sgEstado'
              'nmCidade')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'CPF/CNPJ'
              'Raz'#227'o Social'
              'Fantasia'
              'Fone 1'
              'Fone 2'
              'Celular'
              'Fax'
              'E-mail'
              'E-mail Nfe'
              'Endere'#231'o'
              'N'#186' End.'
              'Compl.'
              'Bairro'
              'Estado'
              'Cidade')
            ERPCampoChave = 'cdCliente'
            ERPCampoDescricao = 'nmFantasia'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdClienteFim: TDBCampoCodigo
            Left = 713
            Top = 40
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 19
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
              '        SELECT c.codigo_cliente AS cdCliente,'
              '               c.cgc            AS deCpfCnpj, '
              '               c.razao_social   AS deRazaoSocial,'
              '               c.fantasia       AS nmFantasia,  '
              '               c.telefone_1     AS nuFone1, '
              '               c.telefone_2     AS nuFone2,'
              '               c.celular        AS nuCelular, '
              '               c.fax            AS nuFax, '
              '               c.e_mail         AS deEmail,'
              '               c.e_mail_nfe     AS deEmailNfe,'
              '               end              AS deEndereco,'
              '               c.end_nro        AS nuEndereco,  '
              '               c.compl_end      AS deComplemento,'
              '               c.bairro         AS deBairro,'
              '               c.sigla_estado   AS sgEstado,'
              '               c.cidade         AS nmCidade'
              '          FROM cliente c'
              '       ) t'
              '  &filtro'
              ' ORDER BY t.cdCliente')
            ERPCamposFiltro.Strings = (
              'cdCliente'
              'deCpfCnpj'
              'deRazaoSocial'
              'nmFantasia'
              'nuFone1'
              'nuFone2'
              'nuCelular'
              'nuFax'
              'deEmail'
              'deEmailNfe'
              'deEndereco'
              'nuEndereco'
              'deComplemento'
              'deBairro'
              'sgEstado'
              'nmCidade')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'CPF/CNPJ'
              'Raz'#227'o Social'
              'Fantasia'
              'Fone 1'
              'Fone 2'
              'Celular'
              'Fax'
              'E-mail'
              'E-mail Nfe'
              'Endere'#231'o'
              'N'#186' End.'
              'Compl.'
              'Bairro'
              'Estado'
              'Cidade')
            ERPCampoChave = 'cdCliente'
            ERPCampoDescricao = 'nmFantasia'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdGrupoFatIni: TDBCampoCodigo
            Left = 622
            Top = 88
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 22
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
              'SELECT codigo AS cdGrupoFat,'
              '       descricao AS deGrupoFat'
              '  FROM grFat'
              '       ) t'
              '  &filtro'
              ' ORDER BY t.cdGrupoFat')
            ERPCamposFiltro.Strings = (
              'cdGrupoFat'
              'deGrupoFat')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdGrupoFat'
            ERPCampoDescricao = 'deGrupoFat'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdGrupoFatFim: TDBCampoCodigo
            Left = 713
            Top = 88
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 23
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
              'SELECT codigo AS cdGrupoFat,'
              '       descricao AS deGrupoFat'
              '  FROM grFat'
              '       ) t'
              '  &filtro'
              ' ORDER BY t.cdGrupoFat')
            ERPCamposFiltro.Strings = (
              'cdGrupoFat'
              'deGrupoFat')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdGrupoFat'
            ERPCampoDescricao = 'deGrupoFat'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object eddtEmissaoFim: TDateTimePicker
            Left = 222
            Top = 40
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 3
          end
          object eddtEmissaoIni: TDateTimePicker
            Left = 91
            Top = 40
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 2
          end
          object edcdCargaIni: TDBCampoCodigo
            Left = 383
            Top = 16
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 8
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
              '        SELECT DISTINCT '
              '               gp.codigo_grupoPed AS cdCarga,'
              '               gp.observacao      AS deCarga'
              '          FROM grupoPed gp'
              '         WHERE gp.observacao <> '#39#39
              '         UNION'
              '        SELECT DISTINCT '
              '               gp.codigo_grupoPed AS cdCarga,'
              '                '#39'SEM DESCRI'#199#195'O'#39'      AS deCarga'
              '          FROM grupoPed gp'
              '         WHERE gp.observacao = '#39#39
              '           AND gp.codigo_grupoPed NOT IN ('
              
                '                                          SELECT gp2.codigo_grup' +
                'oPed'
              '                                            FROM grupoPed gp2'
              
                '                                           WHERE gp2.observacao ' +
                '<> '#39#39
              '                                         )'
              '      ) t '
              '  &filtro'
              ' ORDER BY t.cdCarga DESC')
            ERPCamposFiltro.Strings = (
              'cdCarga'
              'deCarga')
            ERPCamposFiltroTitulo.Strings = (
              'Carga'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCarga'
            ERPCampoDescricao = 'deCarga'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdCargaFim: TDBCampoCodigo
            Left = 474
            Top = 16
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 9
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
              '        SELECT DISTINCT '
              '               gp.codigo_grupoPed AS cdCarga,'
              '               gp.observacao      AS deCarga'
              '          FROM grupoPed gp'
              '         WHERE gp.observacao <> '#39#39
              '         UNION'
              '        SELECT DISTINCT '
              '               gp.codigo_grupoPed AS cdCarga,'
              '                '#39'SEM DESCRI'#199#195'O'#39'      AS deCarga'
              '          FROM grupoPed gp'
              '         WHERE gp.observacao = '#39#39
              '           AND gp.codigo_grupoPed NOT IN ('
              
                '                                          SELECT gp2.codigo_grup' +
                'oPed'
              '                                            FROM grupoPed gp2'
              
                '                                           WHERE gp2.observacao ' +
                '<> '#39#39
              '                                         )'
              '      ) t '
              '  &filtro'
              ' ORDER BY t.cdCarga DESC'
              '')
            ERPCamposFiltro.Strings = (
              'cdCarga'
              'deCarga')
            ERPCamposFiltroTitulo.Strings = (
              'Carga'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCarga'
            ERPCampoDescricao = 'deCarga'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdPedidoIni: TDBCampoCodigo
            Left = 383
            Top = 40
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 10
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
              '        SELECT p.dt_emissao       AS dtEmissao,'
              '               p.nro_pedido       AS cdPedido,'
              '               p.tipo_pedido      AS tpPedido,'
              '               p.status_pedido    AS flStatusPed,'
              '               p.codigo_cliente   AS cdCliente,'
              '               c.razao_social     AS deRazaoSocial,'
              '               c.fantasia         AS deFantasia,'
              
                '               p.codigo_cliente || '#39' - '#39' || c.razao_social AS de' +
                'Caption'
              '          FROM pedido p '
              
                '         INNER JOIN cliente c ON (c.codigo_cliente = p.codigo_cl' +
                'iente)'
              '       ORDER BY p.nro_pedido DESC'
              '      ) t '
              '  &filtro')
            ERPCamposFiltro.Strings = (
              'cdPedido'
              'tpPedido'
              'dtEmissao'
              'flStatusPed'
              'cdCliente'
              'deRazaoSocial'
              'deFantasia')
            ERPCamposFiltroTitulo.Strings = (
              'N'#250'mero'
              'Tipo'
              'Emiss'#227'o'
              'Status'
              'Cliente'
              'Raz'#227'o Social'
              'Fantasia')
            ERPCampoChave = 'cdPedido'
            ERPCampoDescricao = 'deCaption'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdPedidoFim: TDBCampoCodigo
            Left = 474
            Top = 40
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 11
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
              '        SELECT p.dt_emissao       AS dtEmissao,'
              '               p.nro_pedido       AS cdPedido,'
              '               p.tipo_pedido      AS tpPedido,'
              '               p.status_pedido    AS flStatusPed,'
              '               p.codigo_cliente   AS cdCliente,'
              '               c.razao_social     AS deRazaoSocial,'
              '               c.fantasia         AS deFantasia,'
              
                '               p.codigo_cliente || '#39' - '#39' || c.razao_social AS de' +
                'Caption'
              '          FROM pedido p '
              
                '         INNER JOIN cliente c ON (c.codigo_cliente = p.codigo_cl' +
                'iente)'
              '       ORDER BY p.nro_pedido DESC'
              '      ) t '
              '  &filtro')
            ERPCamposFiltro.Strings = (
              'cdPedido'
              'tpPedido'
              'dtEmissao'
              'flStatusPed'
              'cdCliente'
              'deRazaoSocial'
              'deFantasia')
            ERPCamposFiltroTitulo.Strings = (
              'N'#250'mero'
              'Tipo'
              'Emiss'#227'o'
              'Status'
              'Cliente'
              'Raz'#227'o Social'
              'Fantasia')
            ERPCampoChave = 'cdPedido'
            ERPCampoDescricao = 'deCaption'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdItemIni: TDBCampoCodigo
            Left = 383
            Top = 88
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 14
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
              '               TRIM(a.descricao) AS deItem,'
              '               CAST('
              '                         CASE'
              '                           WHEN a.flag_tipo_prod = '#39'R'#39' THEN'
              '                             '#39'Revenda'#39
              '                           WHEN a.flag_tipo_prod = '#39'P'#39' THEN'
              '                             '#39'Produ'#231#227'o Pr'#243'pria'#39
              '                          ELSE'
              '                             '#39'N'#227'o informado'#39
              '                          END AS CHARACTER VARYING(20)'
              '                        ) AS deTipoProduto'
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
              'deItem'
              'deTipoProduto')
            ERPCamposFiltroTitulo.Strings = (
              'Item'
              'Descri'#231#227'o'
              'Tipo de Produto')
            ERPCampoChave = 'cdItem'
            ERPCampoDescricao = 'deItem'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object edcdItemFim: TDBCampoCodigo
            Left = 474
            Top = 88
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 15
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
              '               TRIM(a.descricao) AS deItem,'
              '               CAST('
              '                         CASE'
              '                           WHEN a.flag_tipo_prod = '#39'R'#39' THEN'
              '                             '#39'Revenda'#39
              '                           WHEN a.flag_tipo_prod = '#39'P'#39' THEN'
              '                             '#39'Produ'#231#227'o Pr'#243'pria'#39
              '                          ELSE'
              '                             '#39'N'#227'o informado'#39
              '                          END AS CHARACTER VARYING(20)'
              '                        ) AS deTipoProduto'
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
              'deItem'
              'deTipoProduto')
            ERPCamposFiltroTitulo.Strings = (
              'Item'
              'Descri'#231#227'o'
              'Tipo de Produto')
            ERPCampoChave = 'cdItem'
            ERPCampoDescricao = 'deItem'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object edcdRepIni: TDBCampoCodigo
            Left = 622
            Top = 16
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 16
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
              
                '        SELECT r.codigo_repres                AS cdRepresentante' +
                ',        '
              '               r.cgc                          AS deCpfCnpj, '
              '               r.razao_social                 AS deRazaoSocial,'
              '               r.fantasia                     AS nmFantasia,  '
              '               r.telefone_1                   AS nuFone1,'
              '               r.telefone_2                   AS nuFone2,'
              '               r.e_mail                       AS deEmail,'
              '               r.end                          AS deEndereco,'
              '               r.bairro                       AS deBairro,'
              '               r.sigla_estado                 AS sgEstado,'
              '               r.cidade                       AS nmCidade'
              '          FROM repres r'
              '     ORDER BY r.codigo_repres'
              '      ) t '
              '  &filtro')
            ERPCamposFiltro.Strings = (
              'cdRepresentante'
              'deCpfCnpj'
              'deRazaoSocial'
              'nmFantasia'
              'nuFone1'
              'nuFone2'
              'deEmail'
              'deEndereco'
              'deBairro'
              'sgEstado'
              'nmCidade')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'CPF/CNPJ'
              'Raz'#227'o Social'
              'Fantasia'
              'Fone 1'
              'Fone 2'
              'E-mail'
              'Endere'#231'o'
              'Bairro'
              'Estado'
              'Cidade')
            ERPCampoChave = 'cdRepresentante'
            ERPCampoDescricao = 'deRazaoSocial'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdRepFim: TDBCampoCodigo
            Left = 713
            Top = 16
            Width = 76
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 17
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
              
                '        SELECT r.codigo_repres                AS cdRepresentante' +
                ',        '
              '               r.cgc                          AS deCpfCnpj, '
              '               r.razao_social                 AS deRazaoSocial,'
              '               r.fantasia                     AS nmFantasia,  '
              '               r.telefone_1                   AS nuFone1,'
              '               r.telefone_2                   AS nuFone2,'
              '               r.e_mail                       AS deEmail,'
              '               r.end                          AS deEndereco,'
              '               r.bairro                       AS deBairro,'
              '               r.sigla_estado                 AS sgEstado,'
              '               r.cidade                       AS nmCidade'
              '          FROM repres r'
              '     ORDER BY r.codigo_repres'
              '      ) t '
              '  &filtro')
            ERPCamposFiltro.Strings = (
              'cdRepresentante'
              'deCpfCnpj'
              'deRazaoSocial'
              'nmFantasia'
              'nuFone1'
              'nuFone2'
              'deEmail'
              'deEndereco'
              'deBairro'
              'sgEstado'
              'nmCidade')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'CPF/CNPJ'
              'Raz'#227'o Social'
              'Fantasia'
              'Fone 1'
              'Fone 2'
              'E-mail'
              'Endere'#231'o'
              'Bairro'
              'Estado'
              'Cidade')
            ERPCampoChave = 'cdRepresentante'
            ERPCampoDescricao = 'deRazaoSocial'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object gbEstadosCli: TGroupBox
            Left = 497
            Top = 112
            Width = 499
            Height = 54
            Caption = ' Estados Clientes '
            TabOrder = 30
            object cbAC: TCheckBox
              Left = 6
              Top = 15
              Width = 36
              Height = 17
              Caption = 'AC'
              TabOrder = 0
            end
            object cbMT: TCheckBox
              Left = 211
              Top = 15
              Width = 36
              Height = 17
              Caption = 'MT'
              TabOrder = 12
            end
            object cbAL: TCheckBox
              Left = 6
              Top = 31
              Width = 36
              Height = 17
              Caption = 'AL'
              TabOrder = 1
            end
            object cbPA: TCheckBox
              Left = 211
              Top = 31
              Width = 36
              Height = 17
              Caption = 'PA'
              TabOrder = 13
            end
            object cbPE: TCheckBox
              Left = 245
              Top = 31
              Width = 36
              Height = 17
              Caption = 'PE'
              TabOrder = 15
            end
            object cbPB: TCheckBox
              Left = 245
              Top = 15
              Width = 36
              Height = 17
              Caption = 'PB'
              TabOrder = 14
            end
            object cbAP: TCheckBox
              Left = 41
              Top = 31
              Width = 36
              Height = 17
              Caption = 'AP'
              TabOrder = 3
            end
            object cbAM: TCheckBox
              Left = 41
              Top = 15
              Width = 36
              Height = 17
              Caption = 'AM'
              TabOrder = 2
            end
            object cbPR: TCheckBox
              Left = 280
              Top = 31
              Width = 36
              Height = 17
              Caption = 'PR'
              TabOrder = 17
            end
            object cbPI: TCheckBox
              Left = 280
              Top = 15
              Width = 36
              Height = 17
              Caption = 'PI'
              TabOrder = 16
            end
            object cbCE: TCheckBox
              Left = 75
              Top = 31
              Width = 36
              Height = 17
              Caption = 'CE'
              TabOrder = 5
            end
            object cbBA: TCheckBox
              Left = 75
              Top = 15
              Width = 36
              Height = 17
              Caption = 'BA'
              TabOrder = 4
            end
            object cbRN: TCheckBox
              Left = 315
              Top = 31
              Width = 36
              Height = 17
              Caption = 'RN'
              TabOrder = 19
            end
            object cbRJ: TCheckBox
              Left = 315
              Top = 15
              Width = 36
              Height = 17
              Caption = 'RJ'
              TabOrder = 18
            end
            object cbES: TCheckBox
              Left = 109
              Top = 31
              Width = 36
              Height = 17
              Caption = 'ES'
              TabOrder = 7
            end
            object cbDF: TCheckBox
              Left = 109
              Top = 15
              Width = 36
              Height = 17
              Caption = 'DF'
              TabOrder = 6
            end
            object cbGO: TCheckBox
              Left = 142
              Top = 15
              Width = 36
              Height = 17
              Caption = 'GO'
              TabOrder = 8
            end
            object cbMA: TCheckBox
              Left = 142
              Top = 31
              Width = 36
              Height = 17
              Caption = 'MA'
              TabOrder = 9
            end
            object cbRO: TCheckBox
              Left = 349
              Top = 15
              Width = 36
              Height = 17
              Caption = 'RO'
              TabOrder = 20
            end
            object cbRR: TCheckBox
              Left = 349
              Top = 31
              Width = 36
              Height = 17
              Caption = 'RR'
              TabOrder = 21
            end
            object cbMG: TCheckBox
              Left = 175
              Top = 15
              Width = 36
              Height = 17
              Caption = 'MG'
              TabOrder = 10
            end
            object cbMS: TCheckBox
              Left = 175
              Top = 31
              Width = 36
              Height = 17
              Caption = 'MS'
              TabOrder = 11
            end
            object cbRS: TCheckBox
              Left = 383
              Top = 15
              Width = 36
              Height = 17
              Caption = 'RS'
              TabOrder = 22
            end
            object cbSC: TCheckBox
              Left = 383
              Top = 31
              Width = 36
              Height = 17
              Caption = 'SC'
              TabOrder = 23
            end
            object cbSE: TCheckBox
              Left = 418
              Top = 15
              Width = 36
              Height = 17
              Caption = 'SE'
              TabOrder = 24
            end
            object cbTO: TCheckBox
              Left = 455
              Top = 15
              Width = 36
              Height = 17
              Caption = 'TO'
              TabOrder = 26
            end
            object cbSP: TCheckBox
              Left = 418
              Top = 31
              Width = 36
              Height = 17
              Caption = 'SP'
              TabOrder = 25
            end
          end
          object ednmCidade: TEdit
            Left = 871
            Top = 40
            Width = 125
            Height = 21
            TabOrder = 25
          end
          object edcdPedido: TDBCampoCodigo
            Left = 476
            Top = 222
            Width = 199
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 36
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
              '        SELECT p.dt_emissao       AS dtEmissao,'
              '               p.nro_pedido       AS cdPedido,'
              '               p.tipo_pedido      AS tpPedido,'
              '               p.status_pedido    AS flStatusPed,'
              '               p.codigo_cliente   AS cdCliente,'
              '               c.razao_social     AS deRazaoSocial,'
              '               c.fantasia         AS deFantasia,'
              
                '               p.codigo_cliente || '#39' - '#39' || c.razao_social AS de' +
                'Caption'
              '          FROM pedido p '
              
                '         INNER JOIN cliente c ON (c.codigo_cliente = p.codigo_cl' +
                'iente)'
              '       ORDER BY p.nro_pedido DESC'
              '      ) t '
              '  &filtro')
            ERPCamposFiltro.Strings = (
              'cdPedido'
              'tpPedido'
              'dtEmissao'
              'flStatusPed'
              'cdCliente'
              'deRazaoSocial'
              'deFantasia')
            ERPCamposFiltroTitulo.Strings = (
              'N'#250'mero'
              'Tipo'
              'Emiss'#227'o'
              'Status'
              'Cliente'
              'Raz'#227'o Social'
              'Fantasia')
            ERPCampoChave = 'cdPedido'
            ERPCampoDescricao = 'deCaption'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object btSalvarCargaEsc: TBitBtn
            Left = 43
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 33
            OnClick = btSalvarCargaEscClick
          end
          object btExluirCargaEsc: TBitBtn
            Left = 68
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 34
            OnClick = btExluirCargaEscClick
          end
          object grCargasEscolhidas: TDBGrid
            Left = 100
            Top = 246
            Width = 133
            Height = 107
            Anchors = [akLeft, akTop, akBottom]
            DataSource = dsCargasEscolhidas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 35
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cdCarga'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'deCarga'
                Title.Caption = 'Descri'#231#227'o'
                Width = 300
                Visible = True
              end>
          end
          object edcdCargaEsc: TDBCampoCodigo
            Left = 44
            Top = 222
            Width = 189
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 32
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 35
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
              '        SELECT DISTINCT '
              '               gp.codigo_grupoPed AS cdCarga,'
              '               gp.observacao      AS deCarga'
              '          FROM grupoPed gp'
              '         WHERE gp.observacao <> '#39#39
              '         UNION'
              '        SELECT DISTINCT '
              '               gp.codigo_grupoPed AS cdCarga,'
              '                '#39'SEM DESCRI'#199#195'O'#39'      AS deCarga'
              '          FROM grupoPed gp'
              '         WHERE gp.observacao = '#39#39
              '           AND gp.codigo_grupoPed NOT IN ('
              
                '                                          SELECT gp2.codigo_grup' +
                'oPed'
              '                                            FROM grupoPed gp2'
              
                '                                           WHERE gp2.observacao ' +
                '<> '#39#39
              '                                         )'
              '      ) t '
              '  &filtro'
              ' ORDER BY t.cdCarga DESC')
            ERPCamposFiltro.Strings = (
              'cdCarga'
              'deCarga')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCarga'
            ERPCampoDescricao = 'deCarga'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object eddePeriodoIni: TDBCampoCodigo
            Left = 91
            Top = 88
            Width = 111
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 6
            ERPCampoCodigoPK = False
            ERPCharCase = ecUpperCase
            ERPEdCampoChaveWidth = 87
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
              '        SELECT periodo AS dePeriodo,'
              '               dt_ini  AS dtPeriodoIni,'
              '               dt_fin  AS dtPeriodoFim'
              '          FROM periodo'
              '         ORDER BY periodo DESC'
              '       ) t'
              '&filtro')
            ERPCamposFiltro.Strings = (
              'dePeriodo'
              'dtPeriodoIni'
              'dtPeriodoFim')
            ERPCamposFiltroTitulo.Strings = (
              'Per'#237'odo'
              'Data Inicial'
              'Data Final')
            ERPCampoChave = 'dePeriodo'
            ERPCampoDescricao = 'dePeriodo'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object eddePeriodoFim: TDBCampoCodigo
            Left = 222
            Top = 88
            Width = 111
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 7
            ERPCampoCodigoPK = False
            ERPCharCase = ecUpperCase
            ERPEdCampoChaveWidth = 87
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
              '        SELECT periodo AS dePeriodo,'
              '               dt_ini  AS dtPeriodoIni,'
              '               dt_fin  AS dtPeriodoFim'
              '          FROM periodo'
              '         ORDER BY periodo DESC'
              '       ) t'
              '&filtro')
            ERPCamposFiltro.Strings = (
              'dePeriodo'
              'dtPeriodoIni'
              'dtPeriodoFim')
            ERPCamposFiltroTitulo.Strings = (
              'Per'#237'odo'
              'Data Inicial'
              'Data Final')
            ERPCampoChave = 'dePeriodo'
            ERPCampoDescricao = 'dePeriodo'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftString
          end
          object edcdGrupoCliIni: TDBCampoCodigo
            Left = 871
            Top = 64
            Width = 54
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 26
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
              '        SELECT codigo_grCli AS cdGrupoCli,'
              '               descricao    AS deGrupoCli'
              '          FROM grCli '
              '         ORDER BY codigo_grCli'
              '       ) t'
              '  &filtro')
            ERPCamposFiltro.Strings = (
              'cdGrupoCli'
              'deGrupoCli')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdGrupoCli'
            ERPCampoDescricao = 'deGrupoCli'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdGrupoCliFim: TDBCampoCodigo
            Left = 942
            Top = 64
            Width = 54
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 27
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
              '        SELECT codigo_grCli AS cdGrupoCli,'
              '               descricao    AS deGrupoCli'
              '          FROM grCli '
              '         ORDER BY codigo_grCli'
              '       ) t'
              '  &filtro')
            ERPCamposFiltro.Strings = (
              'cdGrupoCli'
              'deGrupoCli')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdGrupoCli'
            ERPCampoDescricao = 'deGrupoCli'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edcdCliente: TDBCampoCodigo
            Left = 276
            Top = 222
            Width = 156
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 44
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 40
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
              '        SELECT c.codigo_cliente AS cdCliente,'
              '               c.cgc            AS deCpfCnpj, '
              '               c.razao_social   AS deRazaoSocial,'
              '               c.fantasia       AS nmFantasia,  '
              '               c.telefone_1     AS nuFone1, '
              '               c.telefone_2     AS nuFone2,'
              '               c.celular        AS nuCelular, '
              '               c.fax            AS nuFax, '
              '               c.e_mail         AS deEmail,'
              '               c.e_mail_nfe     AS deEmailNfe,'
              '               end              AS deEndereco,'
              '               c.end_nro        AS nuEndereco,  '
              '               c.compl_end      AS deComplemento,'
              '               c.bairro         AS deBairro,'
              '               c.sigla_estado   AS sgEstado,'
              '               c.cidade         AS nmCidade'
              '          FROM cliente c'
              '       ) t'
              '  &filtro'
              ' ORDER BY t.cdCliente')
            ERPCamposFiltro.Strings = (
              'cdCliente'
              'deRazaoSocial')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Raz'#227'o Social')
            ERPCampoChave = 'cdCliente'
            ERPCampoDescricao = 'deRazaoSocial'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object btSalvarClienteEsc: TBitBtn
            Left = 275
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 45
            OnClick = btSalvarClienteEscClick
          end
          object btExluirClienteEsc: TBitBtn
            Left = 300
            Top = 245
            Width = 26
            Height = 26
            Layout = blGlyphTop
            NumGlyphs = 2
            ParentDoubleBuffered = True
            Spacing = 0
            TabOrder = 46
            OnClick = btExluirClienteEscClick
          end
          object grClientesEsc: TDBGrid
            Left = 332
            Top = 249
            Width = 100
            Height = 107
            Anchors = [akLeft, akTop, akBottom]
            DataSource = dsClientesEscolhidos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 47
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cdCliente'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'deRazaoSocial'
                Title.Caption = 'Raz'#227'o Social'
                Width = 350
                Visible = True
              end>
          end
        end
        object btReferenciasVendidas: TButton
          Left = 569
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Refer'#234'ncias Vendidas'
          TabOrder = 15
          WordWrap = True
          OnClick = btReferenciasVendidasClick
        end
        object btClienteSemPed: TButton
          Left = 650
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Clientes Sem Pedidos'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          WordWrap = True
          OnClick = btClienteSemPedClick
        end
        object btClientes: TButton
          Left = 731
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Clientes'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          WordWrap = True
          OnClick = btClientesClick
        end
        object btExportarDados: TButton
          Left = 812
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Exportar Dados'
          ParentShowHint = False
          PopupMenu = pmExportarDados
          ShowHint = True
          TabOrder = 18
          WordWrap = True
          OnClick = btExportarDadosClick
        end
        object btExtratoVendasCli: TButton
          Left = 812
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Extrato Vendas por Cliente'
          TabOrder = 19
          WordWrap = True
          OnClick = btExtratoVendasCliClick
        end
        object btAcompMetasRep: TButton
          Left = 488
          Top = 419
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Acomp. Metas Repres.'
          TabOrder = 20
          WordWrap = True
          OnClick = btAcompMetasRepClick
        end
        object btExtratoCarga: TButton
          Left = 326
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Extrato de Carregamento'
          TabOrder = 21
          WordWrap = True
          OnClick = btExtratoCargaClick
        end
        object btListaConferencia: TButton
          Left = 245
          Top = 377
          Width = 82
          Height = 42
          Anchors = [akLeft, akBottom]
          Caption = 'Relat'#243'rio Confer'#234'ncia'
          TabOrder = 22
          WordWrap = True
          OnClick = btListaConferenciaClick
        end
      end
    end
    object tsTabelaPreco: TTabSheet
      Caption = 'Tabela de Pre'#231'o'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sbTabelaPreco: TScrollBox
        Left = 0
        Top = 0
        Width = 1002
        Height = 462
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbFiltrosTabPreco: TGroupBox
          Left = 4
          Top = 7
          Width = 165
          Height = 57
          Caption = 'Filtros'
          TabOrder = 0
          object lbcdTabPreco: TLabel
            Left = 8
            Top = 24
            Width = 82
            Height = 13
            Caption = 'C'#243'd. Tab. Pre'#231'o:'
          end
          object edcdTabPreco: TEdit
            Left = 93
            Top = 21
            Width = 60
            Height = 21
            TabOrder = 0
          end
        end
        object btTabelaPreco: TButton
          Left = 5
          Top = 66
          Width = 82
          Height = 42
          Caption = 'Tabela Pre'#231'o'
          ImageIndex = 0
          TabOrder = 1
          OnClick = btTabelaPrecoClick
        end
      end
    end
  end
  object sbCampos: TScrollBox
    Left = 0
    Top = 0
    Width = 1010
    Height = 56
    Align = alTop
    Color = clBtnFace
    ParentBackground = True
    ParentColor = False
    TabOrder = 1
    object btFechar: TBitBtn
      Left = 0
      Top = 0
      Width = 55
      Height = 52
      Align = alLeft
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btFecharClick
    end
  end
  object vtEtiqueta: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 92
    Top = 355
    Data = {03000000000000000000}
    object vtEtiquetadtEmissao: TDateTimeField
      FieldName = 'dtEmissao'
    end
    object vtEtiquetadeCidade: TStringField
      FieldName = 'deCidade'
      Size = 250
    end
    object vtEtiquetasgUf: TStringField
      FieldName = 'sgUf'
      Size = 2
    end
    object vtEtiquetadeRazaoSocial: TStringField
      FieldName = 'deRazaoSocial'
      Size = 250
    end
    object vtEtiquetadeFantasia: TStringField
      FieldName = 'deFantasia'
      Size = 250
    end
    object vtEtiquetanuPedido: TIntegerField
      FieldName = 'nuPedido'
    end
    object vtEtiquetacdRep: TIntegerField
      FieldName = 'cdRep'
    end
    object vtEtiquetadeTipoAlca: TStringField
      FieldName = 'deTipoAlca'
    end
    object vtEtiquetadeAdorno: TStringField
      FieldName = 'deAdorno'
    end
    object vtEtiquetadeChaveta: TStringField
      FieldName = 'deChaveta'
    end
    object vtEtiquetadeForracao: TStringField
      FieldName = 'deForracao'
    end
    object vtEtiquetadeImagem: TStringField
      FieldName = 'deImagem'
    end
    object vtEtiquetaflAlcaPadrao: TStringField
      FieldName = 'flAlcaPadrao'
      Size = 1
    end
    object vtEtiquetaflAdornoPadrao: TStringField
      FieldName = 'flAdornoPadrao'
      Size = 1
    end
    object vtEtiquetaflChavetaPadrao: TStringField
      FieldName = 'flChavetaPadrao'
      Size = 1
    end
    object vtEtiquetaflForracaoPadrao: TStringField
      FieldName = 'flForracaoPadrao'
      Size = 1
    end
    object vtEtiquetaseq: TIntegerField
      FieldName = 'seq'
    end
    object vtEtiquetanuTotItens: TIntegerField
      FieldName = 'nuTotItens'
    end
    object vtEtiquetadeCor: TStringField
      FieldName = 'deCor'
    end
    object vtEtiquetaseqQtd: TIntegerField
      FieldName = 'seqQtd'
    end
    object vtEtiquetadeDescIni: TStringField
      FieldName = 'deDescIni'
      Size = 250
    end
    object vtEtiquetacdItem: TStringField
      FieldName = 'cdItem'
    end
    object vtEtiquetadePathImgItem: TStringField
      FieldName = 'dePathImgItem'
      Size = 500
    end
    object vtEtiquetadeCorExt: TStringField
      FieldName = 'deCorExt'
      Size = 300
    end
    object vtEtiquetadeTipoAlcaExt: TStringField
      FieldName = 'deTipoAlcaExt'
      Size = 300
    end
    object vtEtiquetadeAdornoExt: TStringField
      FieldName = 'deAdornoExt'
      Size = 300
    end
    object vtEtiquetadeChavetaExt: TStringField
      FieldName = 'deChavetaExt'
      Size = 300
    end
    object vtEtiquetadeForracaoExt: TStringField
      FieldName = 'deForracaoExt'
      Size = 300
    end
    object vtEtiquetadeImagemExt: TStringField
      FieldName = 'deImagemExt'
      Size = 300
    end
    object vtEtiquetadeDescVarsItem: TStringField
      FieldName = 'deDescVarsItem'
      Size = 500
    end
    object vtEtiquetadeItemTexto01: TStringField
      FieldName = 'deItemTexto01'
      Size = 500
    end
    object vtEtiquetadeItemTexto02: TStringField
      FieldName = 'deItemTexto02'
      Size = 500
    end
    object vtEtiquetadeItemTexto03: TStringField
      FieldName = 'deItemTexto03'
      Size = 500
    end
    object vtEtiquetadeTamanho: TStringField
      FieldName = 'deTamanho'
      Size = 250
    end
  end
  object vtPedido: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 32
    Top = 403
    Data = {03000000000000000000}
    object vtPedidonuPedido: TIntegerField
      FieldName = 'nuPedido'
    end
    object vtPedidoseq: TIntegerField
      FieldName = 'seq'
    end
    object vtPedidodeCidade: TStringField
      FieldName = 'deCidade'
      Size = 250
    end
    object vtPedidosgUf: TStringField
      FieldName = 'sgUf'
      Size = 2
    end
    object vtPedidocodigo_cliente: TIntegerField
      FieldName = 'codigo_cliente'
    end
    object vtPedidodeFantasia: TStringField
      FieldName = 'deFantasia'
      Size = 250
    end
    object vtPedidodtEmissao: TDateTimeField
      FieldName = 'dtEmissao'
    end
    object vtPedidostatus_pedido: TStringField
      FieldName = 'status_pedido'
      Size = 5
    end
    object vtPedidocdItem: TStringField
      FieldName = 'cdItem'
    end
    object vtPedidodescricao: TStringField
      FieldName = 'descricao'
      Size = 250
    end
    object vtPedidonuQtd: TIntegerField
      FieldName = 'nuQtd'
    end
    object vtPedidoflAlcaPadrao: TStringField
      FieldName = 'flAlcaPadrao'
      Size = 1
    end
    object vtPedidoflAdornoPadrao: TStringField
      FieldName = 'flAdornoPadrao'
      Size = 1
    end
    object vtPedidoflChavetaPadrao: TStringField
      FieldName = 'flChavetaPadrao'
      Size = 1
    end
    object vtPedidoflForracaoPadrao: TStringField
      FieldName = 'flForracaoPadrao'
      Size = 1
    end
    object vtPedidodeDescIni: TStringField
      FieldName = 'deDescIni'
      Size = 80
    end
    object vtPedidodeTipoAlca: TStringField
      FieldName = 'deTipoAlca'
    end
    object vtPedidodeAdorno: TStringField
      FieldName = 'deAdorno'
    end
    object vtPedidodeChaveta: TStringField
      FieldName = 'deChaveta'
    end
    object vtPedidodeForracao: TStringField
      FieldName = 'deForracao'
    end
    object vtPedidodeImagem: TStringField
      FieldName = 'deImagem'
    end
    object vtPedidodeRazaoSocial: TStringField
      FieldName = 'deRazaoSocial'
      Size = 250
    end
    object vtPedidocdRep: TIntegerField
      FieldName = 'cdRep'
    end
    object vtPedidodt_reg: TDateTimeField
      FieldName = 'dt_reg'
    end
    object vtPedidovlPercDesc: TCurrencyField
      FieldName = 'vlPercDesc'
    end
    object vtPedidoitem: TStringField
      FieldName = 'item'
    end
    object vtPedidocgc: TStringField
      FieldName = 'cgc'
    end
    object vtPedidobairro: TStringField
      FieldKind = fkCalculated
      FieldName = 'bairro'
      Size = 100
      Calculated = True
    end
    object vtPedidocep: TStringField
      FieldName = 'cep'
      Size = 15
    end
    object vtPedidoend: TStringField
      FieldName = 'end'
      Size = 100
    end
    object vtPedidovl_unitario: TCurrencyField
      FieldName = 'vl_unitario'
    end
    object vtPedidovl_bruto: TCurrencyField
      FieldName = 'vl_bruto'
    end
    object vtPedidovl_lucro: TCurrencyField
      FieldName = 'vl_lucro'
    end
    object vtPedidovl_margem: TCurrencyField
      FieldName = 'vl_margem'
    end
    object vtPedidovl_total: TCurrencyField
      FieldName = 'vl_total'
    end
    object vtPedidovlDesc: TCurrencyField
      FieldName = 'vlDesc'
    end
    object vtPedidovlTotBruto: TCurrencyField
      FieldName = 'vlTotBruto'
    end
    object vtPedidocodigo_banco: TStringField
      FieldName = 'codigo_banco'
      Size = 15
    end
    object vtPedidonmBanco: TStringField
      FieldName = 'nmBanco'
      Size = 100
    end
    object vtPedidotipo_cobranca: TIntegerField
      FieldName = 'tipo_cobranca'
    end
    object vtPedidodeCobranca: TStringField
      FieldName = 'deCobranca'
      Size = 50
    end
    object vtPedidodePrazo: TStringField
      FieldName = 'dePrazo'
      Size = 100
    end
    object vtPedidovlDevido: TCurrencyField
      FieldName = 'vlDevido'
    end
    object vtPedidovlCredito: TCurrencyField
      FieldName = 'vlCredito'
    end
    object vtPedidodeObs3: TStringField
      FieldName = 'deObs3'
      Size = 100
    end
    object vtPedidodeObs4: TStringField
      FieldName = 'deObs4'
      Size = 100
    end
    object vtPedidodeObs: TStringField
      FieldName = 'deObs'
      Size = 250
    end
    object vtPedidodePeriodo: TStringField
      FieldName = 'dePeriodo'
      Size = 15
    end
    object vtPedidocdGrupoFat: TIntegerField
      FieldName = 'cdGrupoFat'
    end
    object vtPedidodeGrupoFat: TStringField
      FieldName = 'deGrupoFat'
      Size = 50
    end
    object vtPedidodeRep: TStringField
      FieldName = 'deRep'
      Size = 100
    end
    object vtPedidodeObsCli: TStringField
      FieldName = 'deObsCli'
      Size = 1000
    end
    object vtPedidocdCarga: TIntegerField
      FieldName = 'cdCarga'
    end
    object vtPedidodeCarga: TStringField
      FieldName = 'deCarga'
      Size = 50
    end
    object vtPedidocdUsuCad: TIntegerField
      FieldName = 'cdUsuCad'
    end
    object vtPedidodeUsuCad: TStringField
      FieldName = 'deUsuCad'
    end
    object vtPedidovlDescNfs: TCurrencyField
      FieldName = 'vlDescNfs'
    end
    object vtPedidovlTotalItem: TCurrencyField
      FieldName = 'vlTotalItem'
    end
    object vtPedidotpPedido: TStringField
      FieldName = 'tpPedido'
      Size = 1
    end
    object vtPedidonuTotItens: TIntegerField
      FieldName = 'nuTotItens'
    end
    object vtPedidodeNatureza: TStringField
      FieldName = 'deNatureza'
    end
    object vtPedidonuTotVolumes: TIntegerField
      FieldName = 'nuTotVolumes'
    end
    object vtPedidodeCor: TStringField
      FieldName = 'deCor'
    end
    object vtPedidoflComPedido: TStringField
      FieldName = 'flComPedido'
      Size = 1
    end
    object vtPedidodePedidosAgrup: TStringField
      FieldName = 'dePedidosAgrup'
      Size = 2000
    end
    object vtPedidodtEmissaoNfs: TDateTimeField
      FieldName = 'dtEmissaoNfs'
    end
    object vtPedidonuQtdBaixaEmb: TIntegerField
      FieldName = 'nuQtdBaixaEmb'
    end
    object vtPedidonuQtdBaixaCarreg: TIntegerField
      FieldName = 'nuQtdBaixaCarreg'
    end
    object vtPedidoflEtiqEnvProd: TStringField
      FieldName = 'flEtiqEnvProd'
      Size = 1
    end
    object vtPedidocdItemSubGrupo: TIntegerField
      FieldName = 'cdItemSubGrupo'
    end
    object vtPedidodeItemSubGrupo: TStringField
      FieldName = 'deItemSubGrupo'
      Size = 250
    end
    object vtPedidocdItemGrupo: TIntegerField
      FieldName = 'cdItemGrupo'
    end
    object vtPedidodeItemGrupo: TStringField
      FieldName = 'deItemGrupo'
      Size = 250
    end
    object vtPedidodeObsPed: TStringField
      FieldName = 'deObsPed'
      Size = 2000
    end
    object vtPedidoflEhPontoDoze: TStringField
      FieldName = 'flEhPontoDoze'
      Size = 1
    end
    object vtPedidonuInscEst: TStringField
      FieldName = 'nuInscEst'
    end
    object vtPedidodePathImgItem: TStringField
      FieldName = 'dePathImgItem'
      Size = 500
    end
    object vtPedidonuNfs: TIntegerField
      FieldName = 'nuNfs'
    end
    object vtPedidovlFaturado: TCurrencyField
      FieldName = 'vlFaturado'
    end
    object vtPedidoflDesc70: TStringField
      FieldName = 'flDesc70'
      Size = 1
    end
    object vtPedidoflEhEbenzer: TStringField
      FieldName = 'flEhEbenzer'
      Size = 1
    end
    object vtPedidoflMostrarValor: TStringField
      FieldName = 'flMostrarValor'
      Size = 1
    end
    object vtPedidodeCompEmissao: TStringField
      FieldName = 'deCompEmissao'
      Size = 10
    end
    object vtPedidodeCompEmisNfs: TStringField
      FieldName = 'deCompEmisNfs'
      Size = 10
    end
    object vtPedidodeCorExt: TStringField
      FieldName = 'deCorExt'
      Size = 300
    end
    object vtPedidodeTipoAlcaExt: TStringField
      FieldName = 'deTipoAlcaExt'
      Size = 300
    end
    object vtPedidodeAdornoExt: TStringField
      FieldName = 'deAdornoExt'
      Size = 300
    end
    object vtPedidodeChavetaExt: TStringField
      FieldName = 'deChavetaExt'
      Size = 300
    end
    object vtPedidodeForracaoExt: TStringField
      FieldName = 'deForracaoExt'
      Size = 300
    end
    object vtPedidodeImagemExt: TStringField
      FieldName = 'deImagemExt'
      Size = 300
    end
    object vtPedidovlFrete: TCurrencyField
      FieldName = 'vlFrete'
    end
    object vtPedidocdCidade: TIntegerField
      FieldName = 'cdCidade'
    end
    object vtPedidonuFoneCli1: TStringField
      FieldName = 'nuFoneCli1'
      Size = 15
    end
    object vtPedidonuFoneCli2: TStringField
      FieldName = 'nuFoneCli2'
      Size = 15
    end
    object vtPedidonuCelular: TStringField
      FieldName = 'nuCelular'
      Size = 15
    end
    object vtPedidodeOrdCompEmis: TStringField
      FieldName = 'deOrdCompEmis'
      Size = 10
    end
    object vtPedidodeOrdCompEmisNfs: TStringField
      FieldName = 'deOrdCompEmisNfs'
      Size = 10
    end
    object vtPedidodeDescVarsItem: TStringField
      FieldName = 'deDescVarsItem'
      Size = 500
    end
    object vtPedidodeItemTexto01: TStringField
      FieldName = 'deItemTexto01'
      Size = 500
    end
    object vtPedidonuEndereco: TStringField
      FieldName = 'nuEndereco'
      Size = 10
    end
    object vtPedidodeTamanho: TStringField
      FieldName = 'deTamanho'
    end
    object vtPedidodeComplEnd: TStringField
      FieldName = 'deComplEnd'
      Size = 250
    end
    object vtPedidonuCep: TStringField
      FieldName = 'nuCep'
      Size = 15
    end
    object vtPedidodeEmail: TStringField
      FieldName = 'deEmail'
      Size = 250
    end
    object vtPedidovlPrevisto: TCurrencyField
      FieldName = 'vlPrevisto'
    end
    object vtPedidodeItemTexto02: TStringField
      FieldName = 'deItemTexto02'
      Size = 500
    end
    object vtPedidodeItemTexto03: TStringField
      FieldName = 'deItemTexto03'
      Size = 500
    end
    object vtPedidovlMediaPrev: TCurrencyField
      FieldName = 'vlMediaPrev'
    end
    object vtPedidodeObsCompleta: TStringField
      FieldName = 'deObsCompleta'
      Size = 4000
    end
    object vtPedidonmMotorista: TStringField
      FieldName = 'nmMotorista'
      Size = 100
    end
    object vtPedidodeEmailRep: TStringField
      FieldName = 'deEmailRep'
      Size = 250
    end
  end
  object dbRelEtiqueta: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dtEmissao=dtEmissao'
      'deCidade=deCidade'
      'sgUf=sgUf'
      'deRazaoSocial=deRazaoSocial'
      'deFantasia=deFantasia'
      'nuPedido=nuPedido'
      'cdRep=cdRep'
      'deTipoAlca=deTipoAlca'
      'deAdorno=deAdorno'
      'deChaveta=deChaveta'
      'deForracao=deForracao'
      'deImagem=deImagem'
      'flAlcaPadrao=flAlcaPadrao'
      'flAdornoPadrao=flAdornoPadrao'
      'flChavetaPadrao=flChavetaPadrao'
      'flForracaoPadrao=flForracaoPadrao'
      'seq=seq'
      'nuTotItens=nuTotItens'
      'deCor=deCor'
      'seqQtd=seqQtd'
      'deDescIni=deDescIni'
      'cdItem=cdItem'
      'dePathImgItem=dePathImgItem'
      'deCorExt=deCorExt'
      'deTipoAlcaExt=deTipoAlcaExt'
      'deAdornoExt=deAdornoExt'
      'deChavetaExt=deChavetaExt'
      'deForracaoExt=deForracaoExt'
      'deImagemExt=deImagemExt'
      'deDescVarsItem=deDescVarsItem'
      'deItemTexto01=deItemTexto01'
      'deItemTexto02=deItemTexto02'
      'deItemTexto03=deItemTexto03'
      'deTamanho=deTamanho')
    DataSet = vtEtiqueta
    BCDToCurrency = False
    Left = 154
    Top = 355
  end
  object relIntComercial: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 43073.437264375000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      '  vlPrevisto    : currency = 0.0;'
      '  vlPrevistoG   : currency = 0.0;'
      '  vlMediaPrev   : currency = 0.0;'
      '  vlMediaPrevG  : currency = 0.0;      '
      '  vlDiferencaG  : currency = 0.0;'
      '  vlMediaDifG   : currency = 0.0;        '
      '  iQtdPer       : Integer = 0;'
      '  iQtdRep       : Integer = 0;      '
      '  '
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;'
      ''
      'procedure gfPeriodoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  vlPrevisto   := vlPrevisto + <frxDBPedido."vlPrevisto">;'
      '  vlPrevistoG  := vlPrevistoG + <frxDBPedido."vlPrevisto">;  '
      '  vlMediaPrev  := vlMediaPrev + <frxDBPedido."vlMediaPrev">;'
      '  vlMediaPrevG := vlMediaPrevG + <frxDBPedido."vlMediaPrev">;'
      '    '
      
        '  iQtdPer      := iQtdPer + 1;                                  ' +
        '                  '
      'end;'
      ''
      'procedure gfRepOnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  vlMediaR : Currency;                                     '
      'begin'
      '  iQtdRep := iQtdRep + 1;                          '
      '  '
      
        '  mvlPrevistoRep.Text := FormatFloat('#39'#,##0.00'#39', vlPrevisto);   ' +
        '                   '
      
        '  mvlDifRep.Text      := FormatFloat('#39'#,##0.00'#39', vlPrevisto - SU' +
        'M(<frxDBPedido."vlFaturado">, MasterData1));'
      ''
      '  if vlPrevisto > 0 then'
      
        '    mPercAtingRep.Text := FormatFloat('#39'#,##0.00'#39', SUM(<frxDBPedi' +
        'do."vlFaturado">, MasterData1) / vlPrevisto * 100)      '
      '  else                '
      '    mPercAtingRep.Text := '#39'0'#39';            '
      ''
      
        '  vlDiferencaG        := vlDiferencaG + (vlPrevisto - SUM(<frxDB' +
        'Pedido."vlFaturado">, MasterData1));'
      ''
      '  /////'
      ''
      
        '  vlMediaR := SUM(<frxDBPedido."nuQtd">, MasterData1);          ' +
        '                      '
      '  '
      '  if vlMediaR > 0 then'
      
        '   vlMediaR := SUM(<frxDBPedido."vlFaturado">, MasterData1) / vl' +
        'MediaR;  '
      ''
      
        '  mvlMediaPrevRep.Text := FormatFloat('#39'#,##0.00'#39', vlMediaPrev); ' +
        '                     '
      
        '  mvlMediaDifRep.Text := FormatFloat('#39'#,##0.00'#39', vlMediaPrev - v' +
        'lMediaR);'
      ''
      '  if vlMediaPrev > 0 then'
      
        '    mPercMediaAtingRep.Text := FormatFloat('#39'#,##0.00'#39', vlMediaR ' +
        '/ vlMediaPrev * 100)      '
      '  else                '
      '    mPercMediaAtingRep.Text := '#39'0'#39';            '
      '                                           '
      
        '  vlMediaDifG        := vlMediaDifG + (vlMediaPrevG - vlMediaR);' +
        '      '
      ''
      
        '  gfRep.Visible := iQtdPer > 1;                                 ' +
        '                           '
      'end;'
      ''
      'procedure gfRepOnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  vlPrevisto  := 0.0;'
      '  vlMediaPrev := 0.0;      '
      '  iQtdPer     := 0;                                   '
      'end;'
      ''
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  vlMediaR : Currency;                                     '
      'begin'
      '  mvlPrevistoG.Text := FormatFloat('#39'#,##0.00'#39', vlPrevistoG);'
      '  mvlDifG.Text      := FormatFloat('#39'#,##0.00'#39', vlDiferencaG);'
      ''
      '  if vlPrevistoG > 0 then'
      
        '    mPercAtingG.Text := FormatFloat('#39'#,##0.00'#39', SUM(<frxDBPedido' +
        '."vlFaturado">, MasterData1) / vlPrevistoG * 100)        '
      '  else                '
      '    mPercAtingG.Text := '#39'0'#39';'
      ''
      '///    '
      ''
      
        '  vlMediaR := SUM(<frxDBPedido."nuQtd">, MasterData1);          ' +
        '                      '
      '  '
      '  if vlMediaR > 0 then'
      
        '   vlMediaR := SUM(<frxDBPedido."vlFaturado">, MasterData1) / vl' +
        'MediaR;      '
      
        '////////////////////////////////                                ' +
        '                                '
      
        '//  if vlMediaPrevG > 0 then                                  //' +
        'vlMediaPrevG      '
      
        '    mPercMediaAtingG.Text := FormatFloat('#39'#,##0.00'#39', vlMediaR / ' +
        '450 * 100);          '
      '//  else                '
      '//    mPercMediaAtingG.Text := '#39'0'#39';'
      '////////////////////////////'
      ''
      
        '  mvlMediaPrevG.Text := '#39'450,00'#39'; //FormatFloat('#39'#,##0.00'#39', vlMe' +
        'diaPrevG);'
      
        '  mvlMediaDifG.Text  := FormatFloat('#39'#,##0.00'#39', 450 - vlMediaR {' +
        'vlMediaDifG});    '
      ''
      
        '  Footer1.Visible := iQtdRep > 1;                               ' +
        '                             '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relIntComercialUserFunction
    Left = 143
    Top = 403
    Datasets = <
      item
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 319.370285000000000000
          Width = 408.189240000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Acompanhamento de Metas  por Representante')
          ParentFont = False
          VAlign = vaCenter
        end
        object picLogoEmp: TfrxPictureView
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 464.882190000000000000
        Width = 1046.929810000000000000
        object TotalPages: TfrxMemoView
          Left = 965.559680000000000000
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
          Width = 1046.929133858270000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object mUsuDataHora: TfrxMemoView
          Width = 1046.929255910000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = dbRelListaPreco
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
        Top = 268.346630000000000000
        Width = 1046.929810000000000000
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
        RowCount = 0
      end
      object ghRep: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677165354330700000
        Top = 200.315090000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBPedido."cdrep"'
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 464.882190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deRep">))]')
          ParentFont = False
        end
      end
      object gfRep: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677165350000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        OnAfterPrint = 'gfRepOnAfterPrint'
        OnBeforePrint = 'gfRepOnBeforePrint'
        object SysMemo1: TfrxSysMemoView
          Left = 209.763779530000000000
          Top = 0.755905511811022300
          Width = 117.165378740000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."VlFATURADO">,MasterData1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 0.755905511811022300
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totais Rep.:')
          ParentFont = False
        end
        object mvlDifRep: TfrxMemoView
          Left = 329.196850390000000000
          Top = 0.755905509999991000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mvlPrevistoRep: TfrxMemoView
          Left = 90.330708660000000000
          Top = 0.755905509999991000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mPercAtingRep: TfrxMemoView
          Left = 449.007874020000000000
          Top = 0.755905509999991000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mMediaRealizRep: TfrxMemoView
          Left = 617.196850390000000000
          Top = 0.755905511811022300
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(SUM(<frxDBPedido."nuQtd">, MasterData1) > 0, SUM(<frxDBPedi' +
              'do."vlFaturado">, MasterData1) / SUM(<frxDBPedido."nuQtd">, Mast' +
              'erData1), 0)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 488.314960630000000000
          Top = 0.755905509999991000
          Width = 15.118095590000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo4: TfrxSysMemoView
          Left = 933.543910000000000000
          Width = 79.370054330000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."nuQtd">,MasterData1)]')
          ParentFont = False
        end
        object mvlMediaPrevRep: TfrxMemoView
          Left = 508.346456690000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mvlMediaDifRep: TfrxMemoView
          Left = 724.913385830000000000
          Top = 0.755905509999991000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mPercMediaAtingRep: TfrxMemoView
          Left = 876.094764020000000000
          Top = 0.755905509999991000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 915.401850630000000000
          Top = 0.755905509999991000
          Width = 15.118095590000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 117.165430000000000000
        Width = 1046.929810000000000000
        object Memo7: TfrxMemoView
          Left = 90.141580940000000000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Previsto')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 209.724275200000000000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Realizado')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 329.369956690000000000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Diferen'#231'a')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 449.173120940000000000
          Width = 56.692898740000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '% Ating.')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 18.897650000000010000
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 31.795300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Per'#237'odo')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 617.063390000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'M'#233'dia Realiz.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 508.457020000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'M'#233'dia Prev.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 724.890230000000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Diferen'#231'a M'#233'dia')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 832.496600000000000000
          Width = 98.267728740000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '% Ating. M'#233'dia')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 933.543910000000000000
          Width = 79.370078740000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde. Itens')
          ParentFont = False
        end
      end
      object ghPeriodo: TfrxGroupHeader
        FillType = ftBrush
        Top = 245.669450000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBPedido."dePeriodo"'
      end
      object gfPeriodo: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 291.023810000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'gfPeriodoOnBeforePrint'
        object Memo12: TfrxMemoView
          Left = 617.062884720000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(SUM(<frxDBPedido."nuQtd">, MasterData1) > 0, SUM(<frxDBPedi' +
              'do."vlFaturado">, MasterData1) / SUM(<frxDBPedido."nuQtd">, Mast' +
              'erData1), 0)]')
          ParentFont = False
        end
        object mvlPrevistoPer: TfrxMemoView
          Left = 90.165430000000000000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          DataField = 'vlPrevisto'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPedido."vlPrevisto"]')
          ParentFont = False
        end
        object SysMemo26: TfrxSysMemoView
          Left = 209.763779530000000000
          Width = 117.165354330000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."VlFATURADO">,MasterData1)]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 329.196850390000000000
          Width = 117.165354330000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<frxDBPedido."vlPrevisto"> - SUM(<frxDBPedido."vlFaturado">, Ma' +
              'sterData1)]')
          ParentFont = False
        end
        object mPercAtingPer: TfrxMemoView
          Left = 448.984540000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<frxDBPedido."vlPrevisto"> > 0, SUM(<frxDBPedido."vlFaturad' +
              'o">, MasterData1) / <frxDBPedido."vlPrevisto">, 0) * 100]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 488.338900000000000000
          Width = 15.118095590000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
        object frxDBPedidodeCompEmissao: TfrxMemoView
          Left = 31.684953940000000000
          Width = 56.692903620000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[frxDBPedido."dePeriodo"]')
        end
        object SysMemo3: TfrxSysMemoView
          Left = 933.543910000000000000
          Width = 79.370054330000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."nuQtd">,MasterData1)]')
          ParentFont = False
        end
        object mvlMediaPrevPer: TfrxMemoView
          Left = 508.346456690000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPedido."vlMediaPrev"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 724.913385830000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[<frxDBPedido."vlMediaPrev"> - IIF(SUM(<frxDBPedido."nuQtd">, Ma' +
              'sterData1) > 0, SUM(<frxDBPedido."vlFaturado">, MasterData1) / S' +
              'UM(<frxDBPedido."nuQtd">, MasterData1), 0)]')
          ParentFont = False
        end
        object mPercMediaAtingPer: TfrxMemoView
          Left = 876.071430000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(<frxDBPedido."vlMediaPrev"> > 0, (SUM(<frxDBPedido."vlFatur' +
              'ado">, MasterData1) / SUM(<frxDBPedido."nuQtd">, MasterData1)) /' +
              ' <frxDBPedido."vlMediaPrev">, 0) * 100]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 915.425790000000000000
          Width = 15.118095590000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 1046.929810000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        object SysMemo2: TfrxSysMemoView
          Left = 209.763779530000000000
          Top = 0.755905511811022300
          Width = 117.165378740000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."VlFATURADO">,MasterData1)]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Top = 0.755905511811022300
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totais Gerais:')
          ParentFont = False
        end
        object mvlDifG: TfrxMemoView
          Left = 329.196850390000000000
          Top = 0.755905509999991000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mvlPrevistoG: TfrxMemoView
          Left = 90.330708660000000000
          Top = 0.755905509999991000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mPercAtingG: TfrxMemoView
          Left = 449.007874020000000000
          Top = 0.755905509999991000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 617.196850390000000000
          Top = 0.755905511811022300
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[IIF(SUM(<frxDBPedido."nuQtd">, MasterData1) > 0, SUM(<frxDBPedi' +
              'do."vlFaturado">, MasterData1) / SUM(<frxDBPedido."nuQtd">, Mast' +
              'erData1), 0)]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 488.314960630000000000
          Top = 0.755905509999991000
          Width = 15.118095590000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo5: TfrxSysMemoView
          Left = 933.543910000000000000
          Width = 79.370054330000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."nuQtd">,MasterData1)]')
          ParentFont = False
        end
        object mvlMediaPrevG: TfrxMemoView
          Left = 508.346456690000000000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mvlMediaDifG: TfrxMemoView
          Left = 724.913385830000000000
          Top = 0.755905509999991000
          Width = 105.826771650000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object mPercMediaAtingG: TfrxMemoView
          Left = 876.094764020000000000
          Top = 0.755905509999991000
          Width = 41.574803150000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 915.401850630000000000
          Top = 0.755905509999991000
          Width = 15.118095590000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
      end
    end
  end
  object dbRelListaPreco: TfrxDBDataset
    UserName = 'frxDBRelListaPreco'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CDTAB=CDTAB'
      'DETAB=DETAB'
      'CDITEM=CDITEM'
      'DEITEM=DEITEM'
      'CDTAM=CDTAM'
      'DETAM=DETAM'
      'VLURNA=VLURNA')
    DataSet = vtListaPreco
    BCDToCurrency = False
    Left = 829
    Top = 331
  end
  object relListaPreco: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42375.588701863400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   mUsuDataHora.Text := UsuarioDataHoraImpressao;    '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relListaPrecoUserFunction
    Left = 899
    Top = 331
    Datasets = <
      item
        DataSet = dbRelListaPreco
        DataSetName = 'frxDBRelListaPreco'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = dbRelListaPreco
        DataSetName = 'frxDBRelListaPreco'
        RowCount = 0
        object frxDBRelListaProdITEM: TfrxMemoView
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'CDITEM'
          DataSet = dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelListaPreco."CDITEM"]')
          ParentFont = False
        end
        object frxDBRelListaProdNUQTD: TfrxMemoView
          Left = 619.842920000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelListaPreco."VLURNA"]')
          ParentFont = False
        end
        object frxDBRelListaProdDESCRICAO: TfrxMemoView
          Left = 87.929190000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          DataField = 'DEITEM'
          DataSet = dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelListaPreco."DEITEM"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 77.811070000000000000
          Width = 11.716535433070870000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            ' - ')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object frxDBRelListaPrecoDETAM: TfrxMemoView
          Left = 415.748300000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'DETAM'
          DataSet = dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Memo.UTF8W = (
            '[frxDBRelListaPreco."DETAM"]')
        end
      end
      object GroupHeader3: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelListaPreco."CDTAB"'
        Stretched = True
        object frxDBRelListaProdDEFANTASIA: TfrxMemoView
          Width = 51.401574800000000000
          Height = 18.897650000000000000
          DataSet = dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tabela:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 53.913420000000000000
          Width = 661.417750000000000000
          Height = 18.897650000000000000
          DataSet = dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelListaPreco."CDTAB"] - [frxDBRelListaPreco."DETAB"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line3: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000010000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Pre'#231'os')
          ParentFont = False
        end
        object picLogoEmp: TfrxPictureView
          Left = 11.338590000000000000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 49.811070000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 631.181510000000000000
          Top = 27.133890000000010000
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
        object Line1: TfrxLineView
          Top = 27.133890000000010000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object mUsuDataHora: TfrxMemoView
          Top = 27.133890000000010000
          Width = 629.669664800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = dbRelListaPreco
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
        object Memo4: TfrxMemoView
          Top = 3.897649999999999000
          Width = 716.598854800000000000
          Height = 18.897650000000000000
          DataSet = dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'Acr'#233'cimo: Semi-Gorda e Gorda 30%            Super-Gorda 50%     ' +
              '       Extra-Gorda 90%            Acima de 2m 15%')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object vtListaPreco: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    FieldDefs = <
      item
        Name = 'cdTab'
        DataType = ftInteger
      end
      item
        Name = 'deTab'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'cdItem'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'deItem'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'cdTam'
        DataType = ftInteger
      end
      item
        Name = 'deTam'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'vlUrna'
        DataType = ftCurrency
      end>
    Left = 33
    Top = 354
    Data = {
      03000700050063645461620300000000000000050064655461620100FA000000
      0000060063644974656D0100960000000000060064654974656D0100FA000000
      00000500636454616D03000000000000000500646554616D0100640000000000
      0600766C55726E610700000000000000000000000000}
    object vtListaPrecocdTab: TIntegerField
      FieldName = 'cdTab'
    end
    object vtListaPrecodeTab: TStringField
      FieldName = 'deTab'
      Size = 250
    end
    object vtListaPrecocdItem: TStringField
      FieldName = 'cdItem'
      Size = 150
    end
    object vtListaPrecodeItem: TStringField
      FieldName = 'deItem'
      Size = 250
    end
    object vtListaPrecocdTam: TIntegerField
      FieldName = 'cdTam'
    end
    object vtListaPrecodeTam: TStringField
      FieldName = 'deTam'
      Size = 100
    end
    object vtListaPrecovlUrna: TCurrencyField
      FieldName = 'vlUrna'
    end
  end
  object relEtiqueta: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'BTPL42'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42326.470989386600000000
    ReportOptions.LastChange = 42403.713217442100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure mTextoItemOnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  sTexto : String;                                           '
      'begin'
      '  sTexto := '#39#39';'
      '    '
      '  if Trim(<frxDBDataset1."deItemTexto01">) <> '#39#39' then'
      '    sTexto := <frxDBDataset1."deItemTexto01">;'
      '      '
      '  if Trim(<frxDBDataset1."deItemTexto02">) <> '#39#39' then'
      '  begin'
      
        '    if Trim(sTexto) = '#39#39' then                                   ' +
        '                                  '
      '      sTexto := <frxDBDataset1."deItemTexto02">'
      '    else'
      
        '      sTexto := sTexto + '#39' '#39' + <frxDBDataset1."deItemTexto02">; ' +
        '       '
      '  end;'
      '    '
      '  if Trim(<frxDBDataset1."deItemTexto03">) <> '#39#39' then'
      '  begin'
      
        '    if Trim(sTexto) = '#39#39' then                                   ' +
        '                                  '
      '      sTexto := <frxDBDataset1."deItemTexto03">'
      '    else'
      
        '      sTexto := sTexto + '#39' '#39' + <frxDBDataset1."deItemTexto03">; ' +
        '       '
      '  end;              '
      ''
      '  mTextoItem.Text := sTexto;'
      ''
      
        '  if (Trim(<frxDBDataset1."deTamanho">) <> '#39#39') and (<frxDBDatase' +
        't1."deTamanho"> <> '#39'1,90'#39') then'
      '    mTextoItem.Font.Size := 7'
      '  else'
      '  begin'
      '    if Length(sTexto) > 50 then'
      '      mTextoItem.Font.Size := 7'
      '    else                '
      '      mTextoItem.Font.Size := 10;'
      '  end;              '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 218
    Top = 379
    Datasets = <
      item
        DataSet = dbRelEtiqueta
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 100.000000000000000000
      PaperHeight = 75.000000000000000000
      PaperSize = 256
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 283.464566930000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 377.953000000000000000
        DataSet = dbRelEtiqueta
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1dtEmissao: TfrxMemoView
          Left = 11.779530000000000000
          Top = 2.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'dtEmissao'
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."dtEmissao"]')
          ParentFont = False
        end
        object frxDBDataset1deRazaoSocial: TfrxMemoView
          Left = 11.559060000000000000
          Top = 38.677180000000000000
          Width = 359.055130310000000000
          Height = 18.897650000000000000
          DataField = 'deRazaoSocial'
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."deRazaoSocial"]')
          ParentFont = False
        end
        object frxDBDataset1deFantasia: TfrxMemoView
          Left = 11.559060000000000000
          Top = 60.354360000000000000
          Width = 359.055130310000000000
          Height = 18.897637800000000000
          DataField = 'deFantasia'
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8W = (
            '[frxDBDataset1."deFantasia"]')
          ParentFont = False
        end
        object frxDBDataset1deItem: TfrxMemoView
          Left = 11.559060000000000000
          Top = 81.252010000000000000
          Width = 359.055179130000000000
          Height = 117.165408030000000000
          StretchMode = smActualHeight
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."cdItem"] - [frxDBDataset1."deDescVarsItem"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object frxDBDataset1deCidade: TfrxMemoView
          Left = 87.149660000000000000
          Top = 2.000000000000000000
          Width = 283.464750000000000000
          Height = 34.015748030000000000
          StretchMode = smActualHeight
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."deCidade"]/[frxDBDataset1."sgUf"]')
          ParentFont = False
        end
        object frxDBDataset1nuPedido: TfrxMemoView
          Left = 11.559060000000000000
          Top = 201.606299210000000000
          Width = 185.196970000000000000
          Height = 17.007874020000000000
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pedido: [frxDBDataset1."nuPedido"]   I: [frxDBDataset1."seq"]')
          ParentFont = False
        end
        object frxDBDataset1cdRep: TfrxMemoView
          Left = 200.992270000000000000
          Top = 201.606299210000000000
          Width = 79.370130000000000000
          Height = 17.007874020000000000
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'digo: [frxDBDataset1."cdRep"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 284.023810000000000000
          Top = 201.606299210000000000
          Width = 86.929190000000000000
          Height = 17.007874020000000000
          DataSet = dbRelEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Qtd.: [frxDBDataset1."nuTotItens"]')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          Left = 11.716535430000000000
          Top = 219.748031500000000000
          Width = 83.200000000000000000
          Height = 62.362209610000000000
          BarType = bcCode_2_5_interleaved
          Expression = 
            'FormatFloat('#39'00000000'#39', <frxDBDataset1."nuPedido">) + FormatFloa' +
            't('#39'000'#39', <frxDBDataset1."seq">) + FormatFloat('#39'000'#39', <frxDBDatas' +
            'et1."seqQtd">)'
          Rotation = 0
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.300000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object mTextoItem: TfrxMemoView
          Left = 155.338582680000000000
          Top = 219.212740000000000000
          Width = 215.433070870000000000
          Height = 43.464554720000000000
          OnBeforePrint = 'mTextoItemOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 155.960730000000000000
          Top = 262.008040000000100000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              '[IIF((Trim(<frxDBDataset1."deTamanho">) <> '#39#39') and (<frxDBDatase' +
              't1."deTamanho"> <> '#39'1,90'#39'), '#39'Tamanho: '#39' + <frxDBDataset1."deTama' +
              'nho">, '#39#39')]')
          ParentFont = False
        end
      end
    end
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 132
    Top = 8
  end
  object dbPedido: TfrxDBDataset
    UserName = 'frxDBPedido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nuPedido=NUPEDIDO'
      'seq=SEQ'
      'deCidade=DECIDADE'
      'sgUf=SGUF'
      'codigo_cliente=CODIGO_CLIENTE'
      'deFantasia=DEFANTASIA'
      'dtEmissao=DTEMISSAO'
      'status_pedido=STATUS_PEDIDO'
      'cdItem=CDITEM'
      'descricao=DESCRICAO'
      'nuQtd=NUQTD'
      'flAlcaPadrao=flAlcaPadrao'
      'flAdornoPadrao=flAdornoPadrao'
      'flChavetaPadrao=flChavetaPadrao'
      'flForracaoPadrao=flForracaoPadrao'
      'deDescIni=deDescIni'
      'deTipoAlca=deTipoAlca'
      'deAdorno=deAdorno'
      'deChaveta=deChaveta'
      'deForracao=deForracao'
      'deImagem=deImagem'
      'deRazaoSocial=deRazaoSocial'
      'cdRep=cdRep'
      'dt_reg=dt_reg'
      'vlPercDesc=vlPercDesc'
      'item=item'
      'cgc=cgc'
      'bairro=bairro'
      'cep=cep'
      'end=end'
      'vl_unitario=vl_unitario'
      'vl_bruto=vl_bruto'
      'vl_lucro=vl_lucro'
      'vl_margem=vl_margem'
      'vl_total=vl_total'
      'vlDesc=vlDesc'
      'vlTotBruto=vlTotBruto'
      'codigo_banco=codigo_banco'
      'nmBanco=nmBanco'
      'tipo_cobranca=tipo_cobranca'
      'deCobranca=deCobranca'
      'dePrazo=dePrazo'
      'vlDevido=vlDevido'
      'vlCredito=vlCredito'
      'deObs3=deObs3'
      'deObs4=deObs4'
      'deObs=deObs'
      'dePeriodo=dePeriodo'
      'cdGrupoFat=cdGrupoFat'
      'deGrupoFat=deGrupoFat'
      'deRep=deRep'
      'deObsCli=deObsCli'
      'cdCarga=cdCarga'
      'deCarga=deCarga'
      'cdUsuCad=cdUsuCad'
      'deUsuCad=deUsuCad'
      'vlDescNfs=vlDescNfs'
      'vlTotalItem=vlTotalItem'
      'tpPedido=tpPedido'
      'nuTotItens=nuTotItens'
      'deNatureza=deNatureza'
      'nuTotVolumes=nuTotVolumes'
      'deCor=deCor'
      'flComPedido=flComPedido'
      'dePedidosAgrup=dePedidosAgrup'
      'dtEmissaoNfs=dtEmissaoNfs'
      'nuQtdBaixaEmb=nuQtdBaixaEmb'
      'nuQtdBaixaCarreg=nuQtdBaixaCarreg'
      'flEtiqEnvProd=flEtiqEnvProd'
      'cdItemSubGrupo=cdItemSubGrupo'
      'deItemSubGrupo=deItemSubGrupo'
      'cdItemGrupo=cdItemGrupo'
      'deItemGrupo=deItemGrupo'
      'deObsPed=deObsPed'
      'flEhPontoDoze=flEhPontoDoze'
      'nuInscEst=nuInscEst'
      'dePathImgItem=dePathImgItem'
      'nuNfs=nuNfs'
      'vlFaturado=vlFaturado'
      'flDesc70=flDesc70'
      'flEhEbenzer=flEhEbenzer'
      'flMostrarValor=flMostrarValor'
      'deCompEmissao=deCompEmissao'
      'deCompEmisNfs=deCompEmisNfs'
      'deCorExt=deCorExt'
      'deTipoAlcaExt=deTipoAlcaExt'
      'deAdornoExt=deAdornoExt'
      'deChavetaExt=deChavetaExt'
      'deForracaoExt=deForracaoExt'
      'deImagemExt=deImagemExt'
      'vlFrete=vlFrete'
      'cdCidade=cdCidade'
      'nuFoneCli1=nuFoneCli1'
      'nuFoneCli2=nuFoneCli2'
      'nuCelular=nuCelular'
      'deOrdCompEmis=deOrdCompEmis'
      'deOrdCompEmisNfs=deOrdCompEmisNfs'
      'deDescVarsItem=deDescVarsItem'
      'deItemTexto01=deItemTexto01'
      'nuEndereco=nuEndereco'
      'deTamanho=deTamanho'
      'deComplEnd=deComplEnd'
      'nuCep=nuCep'
      'deEmail=deEmail'
      'vlPrevisto=vlPrevisto'
      'deItemTexto02=deItemTexto02'
      'deItemTexto03=deItemTexto03'
      'vlMediaPrev=vlMediaPrev'
      'deObsCompleta=deObsCompleta'
      'nmMotorista=nmMotorista')
    DataSet = vtPedido
    BCDToCurrency = False
    Left = 79
    Top = 403
  end
  object qyPedItemAgrup: TFDQuery
    Connection = DmIntegracao.fdConnInteg
    SQL.Strings = (
      'SELECT nro_pedido AS nuPedidoOri, '
      '       seq        AS nuSeqPedOri'
      '  FROM itemPedC '
      ' WHERE nro_ped_agrup = :cdPedido'
      '   AND seq_ped_agrup = :nuSeqPed')
    Left = 870
    Top = 280
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NUSEQPED'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object vtItensEscolhidos: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 880
    Top = 387
    Data = {03000000000000000000}
    object vtItensEscolhidoscdItem: TStringField
      FieldName = 'cdItem'
      Size = 50
    end
    object vtItensEscolhidosdeItem: TStringField
      FieldName = 'deItem'
      Size = 300
    end
  end
  object dsItensEscolhidos: TDataSource
    AutoEdit = False
    DataSet = vtItensEscolhidos
    Left = 951
    Top = 371
  end
  object vtPedidosEscolhidos: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 560
    Top = 355
    Data = {03000000000000000000}
    object vtPedidosEscolhidoscdPedido: TIntegerField
      FieldName = 'cdPedido'
    end
    object vtPedidosEscolhidostpPedido: TStringField
      FieldName = 'tpPedido'
      Size = 1
    end
    object vtPedidosEscolhidosdtEmissao: TDateField
      FieldName = 'dtEmissao'
    end
    object vtPedidosEscolhidosflStatusPed: TStringField
      FieldName = 'flStatusPed'
      Size = 1
    end
    object vtPedidosEscolhidoscdCliente: TIntegerField
      FieldName = 'cdCliente'
    end
    object vtPedidosEscolhidosdeRazaoSocial: TStringField
      FieldName = 'deRazaoSocial'
      Size = 300
    end
    object vtPedidosEscolhidosdeFantasia: TStringField
      FieldName = 'deFantasia'
      Size = 300
    end
  end
  object dsPedidosEscolhidos: TDataSource
    AutoEdit = False
    DataSet = vtPedidosEscolhidos
    Left = 658
    Top = 363
  end
  object relClientesSemPed: TfrxReport
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
    OnUserFunction = relClientesSemPedUserFunction
    Left = 912
    Top = 499
    Datasets = <
      item
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = -98.267780000000000000
          Width = 914.646260000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Clientes Sem Pedido')
          ParentFont = False
          VAlign = vaCenter
        end
        object picLogoEmp: TfrxPictureView
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 404.409710000000000000
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
          DataSet = dbRelListaPreco
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
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 41.574830000000000000
          Width = 253.228510000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 16.897650000000010000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Left = 390.165334800000000000
          Width = 94.488230470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 366.614204960000000000
          Width = 22.677165350000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
      end
      object ghRep: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBPedido."cdRep"'
        object Memo5: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Representante: [frxDBPedido."deRep"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 15.118110240000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
        RowCount = 0
        object frxDBPedidoDEFANTASIA: TfrxMemoView
          Left = 66.811040710000000000
          Width = 291.023810000000000000
          Height = 15.118112680000000000
          DataSetName = 'frxDBRelListaPedRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBPedido."DEFANTASIA"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 366.614410000000000000
          Width = 22.677180000000000000
          Height = 15.118112680000000000
          DataSetName = 'frxDBRelListaPedRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBPedido."SGUF"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 392.315065590000000000
          Width = 313.700990000000000000
          Height = 15.118110240000000000
          DataSetName = 'frxDBRelListaPedRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBPedido."DECIDADE"]')
          ParentFont = False
        end
        object frxDBPedidoCODIGO_CLIENTE: TfrxMemoView
          Width = 56.692950000000000000
          Height = 15.118110240000000000
          DataField = 'CODIGO_CLIENTE'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPedido."CODIGO_CLIENTE"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 53.692950000000010000
          Width = 15.118105350000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            ' - ')
          ParentFont = False
        end
      end
      object gfRep: TfrxGroupFooter
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          Left = 393.071120000000000000
          Top = 0.377952755905539600
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 294.803340000000000000
          Top = 0.377952760000027800
          Width = 94.488235350000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total de clientes:')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo2: TfrxSysMemoView
          Left = 393.071120000000000000
          Top = 0.377952760000027800
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 253.228510000000000000
          Top = 0.377952760000027800
          Width = 136.063065350000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total geral de clientes:')
          ParentFont = False
        end
      end
    end
  end
  object relClientes: TfrxReport
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
    OnUserFunction = relClientesUserFunction
    Left = 968
    Top = 499
    Datasets = <
      item
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Width = 1046.929810000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Lista de Clientes')
          ParentFont = False
          VAlign = vaCenter
        end
        object picLogoEmp: TfrxPictureView
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        object TotalPages: TfrxMemoView
          Left = 964.795920000000000000
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
        object mUsuDataHora: TfrxMemoView
          Width = 1045.417964800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = dbRelListaPreco
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
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 117.165430000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Left = 0.779530000000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 16.897650000000010000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Left = 891.283764800000000000
          Width = 154.960710470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 871.732634960000000000
          Width = 18.897635350000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 618.063390000000000000
          Width = 83.149640470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fone 1')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 702.433520000000000000
          Width = 83.149640470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fone 2')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 786.362710000000000000
          Width = 83.149640470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Celular')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 49.133890000000000000
          Width = 309.921440470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Raz'#227'o Social')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 362.055381730000000000
          Width = 253.228490470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fantasia')
          ParentFont = False
        end
      end
      object ghRep: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBPedido."cdRep"'
        object Memo5: TfrxMemoView
          Width = 1046.929810000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Representante: [frxDBPedido."deRep"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 15.118110240000000000
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
        RowCount = 0
        object frxDBPedidoDEFANTASIA: TfrxMemoView
          Left = 49.133858270000000000
          Width = 309.921460000000000000
          Height = 15.118112680000000000
          DataField = 'deRazaoSocial'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."deRazaoSocial"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 871.732840000000000000
          Width = 18.897650000000000000
          Height = 15.118112680000000000
          DataSetName = 'frxDBRelListaPedRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."SGUF"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 893.433495590000000000
          Width = 151.181200000000000000
          Height = 15.118110240000000000
          DataSetName = 'frxDBRelListaPedRep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."DECIDADE"]')
          ParentFont = False
        end
        object frxDBPedidoCODIGO_CLIENTE: TfrxMemoView
          Left = 0.779530000000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          DataField = 'CODIGO_CLIENTE'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPedido."CODIGO_CLIENTE"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 618.063390000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          DataField = 'nuFoneCli1'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."nuFoneCli1"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 702.433520000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."nuFoneCli2"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 786.362710000000000000
          Width = 83.149660000000000000
          Height = 15.118110240000000000
          DataField = 'nuCelular'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."nuCelular"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 362.055350000000000000
          Width = 253.228510000000000000
          Height = 15.118112680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."deFantasia"]')
          ParentFont = False
        end
      end
      object gfRep: TfrxGroupFooter
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        object Line2: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo1: TfrxSysMemoView
          Left = 983.898270000000000000
          Top = 0.377952760000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 885.630490000000000000
          Top = 0.377952760000000000
          Width = 94.488235350000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total de clientes:')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 1046.929810000000000000
        object Line3: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo2: TfrxSysMemoView
          Left = 983.898270000000000000
          Top = 0.377952760000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 844.055660000000000000
          Top = 0.377952760000000000
          Width = 136.063065350000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total geral de clientes:')
          ParentFont = False
        end
      end
    end
  end
  object pmExportarDados: TPopupMenu
    Left = 692
    Top = 8
    object pmiWay: TMenuItem
      Caption = 'Way'
      object pmiClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = pmiClientesClick
      end
      object pmiPedidos: TMenuItem
        Caption = 'Rotas'
        OnClick = pmiPedidosClick
      end
    end
    object pmiWebRouter: TMenuItem
      Caption = 'Web Router'
      OnClick = pmiWebRouterClick
    end
    object pmiRoutEasy: TMenuItem
      Caption = 'RoutEasy'
      OnClick = pmiRoutEasyClick
    end
  end
  object sdDadosWay: TSaveDialog
    FileName = 'DadosWay'
    Filter = 'Arquivo CSV|.csv'
    Title = 'Exporta'#231#227'o de Dados Way'
    Left = 512
    Top = 16
  end
  object relExtratoVendaCli: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'HP Officejet Pro 8610'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 400
    Top = 11
    Datasets = <
      item
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
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
      object ghCliente: TfrxGroupHeader
        FillType = ftBrush
        Top = 98.267780000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBPedido."CODIGO_CLIENTE"'
      end
      object gfCliente: TfrxGroupFooter
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 143.622140000000000000
        Width = 1046.929810000000000000
        Stretched = True
        object SysMemo13: TfrxSysMemoView
          Left = 823.543817240000000000
          Width = 34.015770000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."NUQTD">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo24: TfrxSysMemoView
          Left = 857.708717560000000000
          Width = 94.488188980000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."VlFATURADO">,MasterData1)]')
          ParentFont = False
        end
        object frxDBPedidoCODIGO_CLIENTE: TfrxMemoView
          Left = -0.000000000000000888
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO_CLIENTE'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPedido."CODIGO_CLIENTE"]')
          ParentFont = False
        end
        object frxDBPedidodeRazaoSocial: TfrxMemoView
          Left = 60.031540000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deRazaoSocial">))]')
          ParentFont = False
        end
        object frxDBPedidoSGUF: TfrxMemoView
          Left = 362.614410000000000000
          Width = 26.456695350000000000
          Height = 18.897650000000000000
          DataField = 'SGUF'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBPedido."SGUF"]')
          ParentFont = False
        end
        object frxDBPedidoDECIDADE: TfrxMemoView
          Left = 388.535437950000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deCidade">))]')
          ParentFont = False
        end
        object frxDBPedidodeRep: TfrxMemoView
          Left = 634.740570000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deRep">))]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 952.440949760000000000
          Width = 94.488188980000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(IIF(SUM(<frxDBPedido."NUQTD">,MasterData1) > 0, SUM(<frxDBPedi' +
              'do."vlFaturado">,MasterData1)/SUM(<frxDBPedido."NUQTD">,MasterDa' +
              'ta1), 0))]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 120.944960000000000000
        Width = 1046.929810000000000000
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
        RowCount = 0
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 18.897637795275590000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Width = 60.472440940000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 823.669347480000000000
          Width = 34.015748030000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Qtd.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 59.984251970000000000
          Width = 302.362226690000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Raz'#227'o Social')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 362.480336930000000000
          Width = 26.456695350000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 388.425218820000000000
          Width = 245.669308430000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 634.582713780000000000
          Width = 188.976399920000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Representante')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 857.708717560000000000
          Width = 94.488188980000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Vl. Fat.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 952.440949760000000000
          Width = 94.488188980000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'M'#233'dia Cliente')
          ParentFont = False
        end
      end
    end
  end
  object expExcel: TfrxXLSExport
    ShowDialog = False
    FileName = 'Relatorio'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    MergeCells = False
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = False
    SuppressPageHeadersFooters = True
    Left = 296
    Top = 8
  end
  object sdDadosWebRouter: TSaveDialog
    FileName = 'DadosWebRouter'
    Filter = 'Arquivo XLS|.xls'
    Title = 'Exporta'#231#227'o de Dados WebRouter'
    Left = 592
    Top = 24
  end
  object vtCargasEscolhidas: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 200
    Top = 299
    Data = {03000000000000000000}
    object vtCargasEscolhidascdCarga: TIntegerField
      FieldName = 'cdCarga'
    end
    object vtCargasEscolhidasdeCarga: TStringField
      FieldName = 'deCarga'
      Size = 250
    end
  end
  object dsCargasEscolhidas: TDataSource
    AutoEdit = False
    DataSet = vtCargasEscolhidas
    Left = 266
    Top = 331
  end
  object relExpDadosRoutEasy: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'HP Officejet Pro 8610'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 920
    Top = 11
    Datasets = <
      item
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 440.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ghPedido: TfrxGroupHeader
        FillType = ftBrush
        Top = 90.708720000000000000
        Width = 1587.402600000000000000
        Condition = 'frxDBPedido."NUPEDIDO"'
      end
      object gfPedido: TfrxGroupFooter
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Height = 11.338582680000000000
        ParentFont = False
        Top = 136.063080000000000000
        Width = 1587.402600000000000000
        Stretched = True
        object SysMemo24: TfrxSysMemoView
          Left = 1320.811377560000000000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPedido."VlTOTBRUTO">,MasterData1)]')
        end
        object frxDBPedidoCODIGO_CLIENTE: TfrxMemoView
          Width = 68.031540000000000000
          Height = 11.338582680000000000
          DataField = 'CODIGO_CLIENTE'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPedido."CODIGO_CLIENTE"]')
        end
        object frxDBPedidodeRazaoSocial: TfrxMemoView
          Left = 67.826840000000000000
          Width = 143.622140000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deRazaoSocial">))]')
        end
        object frxDBPedidoSGUF: TfrxMemoView
          Left = 643.299630000000000000
          Width = 27.968503940000000000
          Height = 11.338582680000000000
          DataField = 'SGUF'
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBPedido."SGUF"]')
        end
        object frxDBPedidoDECIDADE: TfrxMemoView
          Left = 548.275697950000000000
          Width = 94.488250000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deCidade">))]')
        end
        object frxDBPedidodeRep: TfrxMemoView
          Left = 317.260050000000000000
          Width = 139.842610000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."end">))]')
        end
        object Memo3: TfrxMemoView
          Left = 211.275590550000000000
          Width = 45.354218430000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 257.008040000000000000
          Width = 60.472480000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPedido."nuPedido"]')
        end
        object Memo7: TfrxMemoView
          Left = 457.323130000000000000
          Width = 34.015770000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPedido."nuEndereco"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 491.496756220000000000
          Width = 56.692950000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deComplEnd">))]')
        end
        object Memo12: TfrxMemoView
          Left = 671.134666220000000000
          Width = 41.574830000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."nuCep">))]')
        end
        object Memo15: TfrxMemoView
          Left = 712.709496220000000000
          Width = 26.456710000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            'Brasil')
        end
        object Memo20: TfrxMemoView
          Left = 739.166206220000000000
          Width = 37.795300000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 776.961506220000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 826.047759130000000000
          Width = 124.724490000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '20')
        end
        object Memo27: TfrxMemoView
          Left = 950.772249130000000000
          Width = 105.826840000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '08:00:00 AM')
        end
        object Memo29: TfrxMemoView
          Left = 1056.599089130000000000
          Width = 105.826840000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '11:59:00 PM')
        end
        object Memo31: TfrxMemoView
          Left = 1162.473566220000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[<frxDBPedido."deEmail">]')
        end
        object Memo4: TfrxMemoView
          Left = 1215.386986220000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Memo.UTF8W = (
            '[<frxDBPedido."nuFoneCli1">]')
        end
        object Memo33: TfrxMemoView
          Left = 1268.300406220000000000
          Width = 52.913420000000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
        end
        object Memo37: TfrxMemoView
          Left = 1510.409448820000000000
          Width = 34.015708980000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
        end
        object Memo39: TfrxMemoView
          Left = 1544.425196850000000000
          Width = 41.574768980000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
        end
        object Memo36: TfrxMemoView
          Left = 1415.677165350000000000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 113.385900000000000000
        Width = 1587.402600000000000000
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
        RowCount = 0
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Height = 11.338582680000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1587.402600000000000000
        object Memo2: TfrxMemoView
          Width = 68.031500940000000000
          Height = 11.338582680000000000
          HAlign = haRight
          Memo.UTF8W = (
            'C'#243'digo do Cliente')
        end
        object Memo14: TfrxMemoView
          Left = 67.779551970000000000
          Width = 143.621966690000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Nome do Cliente')
        end
        object Memo17: TfrxMemoView
          Left = 643.165556930000000000
          Width = 27.968503940000000000
          Height = 11.338582680000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Estado')
        end
        object Memo18: TfrxMemoView
          Left = 548.165478820000000000
          Width = 94.488108430000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Munic'#237'pio')
        end
        object Memo19: TfrxMemoView
          Left = 317.102193780000000000
          Width = 139.842509920000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Rua')
        end
        object Memo26: TfrxMemoView
          Left = 1320.811377560000000000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Informa'#231#227'o Adicional 1')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 211.433210000000000000
          Width = 45.354218430000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'N'#250'mero NF')
        end
        object Memo6: TfrxMemoView
          Left = 257.008040000000000000
          Width = 60.472440940000000000
          Height = 11.338582680000000000
          HAlign = haRight
          Memo.UTF8W = (
            'N'#250'mero Pedido')
        end
        object Memo9: TfrxMemoView
          Left = 457.323130000000000000
          Width = 34.015730940000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'N'#250'mero')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
          Width = 56.692849920000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Complemento')
        end
        object Memo13: TfrxMemoView
          Left = 670.976810000000000000
          Width = 41.574729920000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'CEP')
        end
        object Memo16: TfrxMemoView
          Left = 712.551640000000000000
          Width = 26.456609920000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Pa'#237's')
        end
        object Memo21: TfrxMemoView
          Left = 739.008350000000000000
          Width = 37.795199920000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Peso (kg)')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 776.803650000000000000
          Width = 49.133789920000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Volume (m'#179')')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 825.937540000000000000
          Width = 124.724348430000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Tempo de atendimento no cliente (min.)')
        end
        object Memo28: TfrxMemoView
          Left = 950.662030000000000000
          Width = 105.826698430000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'In'#237'cio do intervalo permitido')
        end
        object Memo30: TfrxMemoView
          Left = 1056.488870000000000000
          Width = 105.826698430000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Fim do intervalo permitido')
        end
        object Memo32: TfrxMemoView
          Left = 1162.315710000000000000
          Width = 52.913319920000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'E-mail')
        end
        object Memo8: TfrxMemoView
          Left = 1215.229130000000000000
          Width = 52.913319920000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Telefone')
        end
        object Memo34: TfrxMemoView
          Left = 1268.142550000000000000
          Width = 52.913319920000000000
          Height = 11.338582680000000000
          Memo.UTF8W = (
            'Observa'#231#245'es')
        end
        object Memo35: TfrxMemoView
          Left = 1415.544220000000000000
          Width = 94.488188980000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Informa'#231#227'o Adicional 2')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 1510.409448820000000000
          Width = 34.015708980000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Latitude')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 1544.425196850000000000
          Width = 41.574768980000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Longitude')
          ParentFont = False
        end
      end
    end
  end
  object expExcelX: TfrxXLSXExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    EmptyLines = False
    PictureType = gpPNG
    Left = 216
    Top = 8
  end
  object relExpDadosWebRouter: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'HP Officejet Pro 8610'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 800
    Top = 11
    Datasets = <
      item
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 440.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ghPedido: TfrxGroupHeader
        FillType = ftBrush
        Top = 98.267780000000000000
        Width = 1587.402600000000000000
        Condition = 'frxDBPedido."NUPEDIDO"'
      end
      object gfPedido: TfrxGroupFooter
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897637800000000000
        ParentFont = False
        Top = 143.622140000000000000
        Width = 1587.402600000000000000
        Stretched = True
        object frxDBPedidoCODIGO_CLIENTE: TfrxMemoView
          Width = 438.425480000000000000
          Height = 18.897637800000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[NameCase(Lowercase(<frxDBPedido."end"> + IIF(<frxDBPedido."nuEn' +
              'dereco"> <> '#39#39', '#39','#39' + <frxDBPedido."nuEndereco">, '#39','#39') + IIF(<fr' +
              'xDBPedido."bairro"> <> '#39#39', '#39','#39' + <frxDBPedido."bairro">, '#39','#39') + ' +
              'IIF(<frxDBPedido."deCidade"> <> '#39#39', '#39','#39' + <frxDBPedido."deCidade' +
              '">, '#39','#39') + IIF(<frxDBPedido."sgUf"> <> '#39#39', '#39','#39' + <frxDBPedido."s' +
              'gUf">, '#39','#39')))]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object frxDBPedidodeRazaoSocial: TfrxMemoView
          Left = 438.220780000000000000
          Width = 154.960730000000000000
          Height = 18.897637800000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
        object frxDBPedidodeRep: TfrxMemoView
          Left = 949.441560000000000000
          Width = 291.023810000000000000
          Height = 18.897637800000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[NameCase(Lowercase(<frxDBPedido."deRazaoSocial">))]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 592.787650550000000000
          Width = 170.078708430000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0,5')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 763.465060000000000000
          Width = 185.196970000000000000
          Height = 18.897637800000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '30')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 1240.465370000000000000
          Width = 68.031540000000000000
          Height = 18.897637800000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[<frxDBPedido."nuTotVolumes"> * 40]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 1308.434296220000000000
          Width = 86.929190000000000000
          Height = 18.897637800000000000
          DataSet = dbPedido
          DataSetName = 'frxDBPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 120.944960000000000000
        Width = 1587.402600000000000000
        DataSet = dbPedido
        DataSetName = 'frxDBPedido'
        RowCount = 0
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897637800000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 1587.402600000000000000
        object Memo2: TfrxMemoView
          Width = 438.425440940000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'ENDERE'#199'OS')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 438.173491970000000000
          Width = 154.960556690000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'TEMPO PARADA (DIAS)')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 949.283703780000000000
          Width = 291.023709920000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 592.945270000000000000
          Width = 170.078708430000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'TEMPO PARADA (HORAS)')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 763.465060000000000000
          Width = 185.196930940000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'TEMPO PARADA (MINUTOS)')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 1240.465370000000000000
          Width = 68.031500940000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'PESO(Kg)')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 1308.276440000000000000
          Width = 86.929089920000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'VOLUME(m'#179')')
          ParentFont = False
        end
      end
    end
  end
  object pmAcompMetas: TPopupMenu
    Left = 548
    Top = 504
    object pmiImprimirAcompMetas: TMenuItem
      Caption = 'Imprimir'
      OnClick = pmiImprimirAcompMetasClick
    end
    object pmiEmailAcompMetas: TMenuItem
      Caption = 'E-mail'
      OnClick = pmiEmailAcompMetasClick
    end
  end
  object frPdfExport: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = True
    CenterWindow = False
    PrintScaling = False
    Left = 954
    Top = 253
  end
  object vtClientesEscolhidos: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 344
    Top = 371
    Data = {03000000000000000000}
    object vtClientesEscolhidoscdCliente: TIntegerField
      FieldName = 'cdCliente'
    end
    object vtClientesEscolhidosdeRazaoSocial: TStringField
      FieldName = 'deRazaoSocial'
      Size = 250
    end
  end
  object dsClientesEscolhidos: TDataSource
    AutoEdit = False
    DataSet = vtClientesEscolhidos
    Left = 447
    Top = 371
  end
  object pmListaPed3: TPopupMenu
    Left = 754
    Top = 421
    object pmiImpListaPed3: TMenuItem
      Caption = 'Imprimir'
      OnClick = pmiImpListaPed3Click
    end
    object pmiEmailListaPed3: TMenuItem
      Caption = 'E-mail'
      OnClick = pmiEmailListaPed3Click
    end
  end
end
