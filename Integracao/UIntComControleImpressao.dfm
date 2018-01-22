object FIntComControleImpressao: TFIntComControleImpressao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Controle de Impress'#227'o'
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnCampos: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 98
    Align = alTop
    TabOrder = 0
    DesignSize = (
      939
      98)
    object gbFiltros: TGroupBox
      Left = 1
      Top = 0
      Width = 932
      Height = 93
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Filtros: '
      TabOrder = 0
      DesignSize = (
        932
        93)
      object lbdtCadastro: TLabel
        Left = 36
        Top = 41
        Width = 74
        Height = 13
        Caption = 'Data Cadastro:'
      end
      object lbdtCadastroA: TLabel
        Left = 229
        Top = 41
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbcdModeloRelatorio: TLabel
        Left = 11
        Top = 17
        Width = 99
        Height = 13
        Caption = 'Modelo de Relat'#243'rio:'
      end
      object lbnuPedido: TLabel
        Left = 408
        Top = 17
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pedido:'
      end
      object lbnuPedidoA: TLabel
        Left = 510
        Top = 17
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = 'a'
      end
      object lbcdCarga: TLabel
        Left = 411
        Top = 41
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carga:'
      end
      object eddtCadastroIni: TDateTimePicker
        Left = 111
        Top = 38
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        TabOrder = 1
      end
      object eddtCadastroFim: TDateTimePicker
        Left = 242
        Top = 38
        Width = 111
        Height = 21
        Date = 42342.685951053240000000
        Time = 42342.685951053240000000
        ShowCheckbox = True
        TabOrder = 2
      end
      object btConsultar: TBitBtn
        Left = 672
        Top = 21
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Consultar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 7
        OnClick = btConsultarClick
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
        TabOrder = 8
        OnClick = btFecharClick
      end
      object cbcdModeloRelatorio: TComboBox
        Left = 111
        Top = 14
        Width = 242
        Height = 21
        ItemIndex = 0
        TabOrder = 0
        Text = 'Etiqueta'
        Items.Strings = (
          'Etiqueta'
          'Rel. Produ'#231#227'o'
          'Bilhetinho'
          'Lista Pedido'
          'Lista Pedido Por Representante'
          'Valor Vendas UF'
          'Baixa de Produ'#231#227'o'
          'Lista Item Pedidos'
          'Lista Pedidos 2'
          'Lista Pedidos 3'
          'Lista Carregamento'
          'Lista Pedido Por Cliente'
          'Vendas M'#234's Por Representante'
          'Vendas M'#234's Nfe Por Representante'
          'Refer'#234'ncias Vendidas'
          'Extrato de Vendas Por Cliente'
          'Acomp. Metas Repres.'
          'Extrato Carregamento')
      end
      object btSalvar: TBitBtn
        Left = 726
        Top = 21
        Width = 94
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Salvar Env. Prod.'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 9
        OnClick = btSalvarClick
      end
      object cbNaoMostrarJaEnv: TCheckBox
        Left = 111
        Top = 63
        Width = 258
        Height = 17
        Caption = 'N'#227'o Mostrar Pedidos J'#225' Enviados Para Produ'#231#227'o'
        TabOrder = 3
      end
      object btExluir: TBitBtn
        Left = 819
        Top = 21
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Excluir'
        DoubleBuffered = False
        Layout = blGlyphTop
        NumGlyphs = 2
        Spacing = 0
        TabOrder = 10
        OnClick = btExluirClick
      end
      object ednuPedidoIni: TEdit
        Left = 447
        Top = 14
        Width = 58
        Height = 21
        NumbersOnly = True
        TabOrder = 4
      end
      object ednuPedidoFim: TEdit
        Left = 519
        Top = 14
        Width = 58
        Height = 21
        NumbersOnly = True
        TabOrder = 5
      end
      object edcdCarga: TDBCampoCodigo
        Left = 447
        Top = 38
        Width = 219
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
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 98
    Width = 939
    Height = 457
    Align = alClient
    TabOrder = 1
    object grDados: TDBGrid
      Left = 1
      Top = 1
      Width = 937
      Height = 455
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = pmMarcarDesmarcar
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grDadosCellClick
      OnDrawColumnCell = grDadosDrawColumnCell
      OnTitleClick = grDadosTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flEnvProducao'
          Title.Alignment = taCenter
          Title.Caption = 'Env. Prod.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtCadastro'
          ReadOnly = True
          Title.Caption = 'Data Impress'#227'o'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuPedido'
          ReadOnly = True
          Title.Caption = 'Pedido'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmCidade'
          ReadOnly = True
          Title.Caption = 'Cidade'
          Width = 198
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'sgUf'
          ReadOnly = True
          Title.Caption = 'Estado'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dehrCadastro'
          Title.Caption = 'Hr. Impress'#227'o'
          Width = 90
          Visible = True
        end>
    end
  end
  object dsDados: TDataSource
    DataSet = vtDados
    Left = 87
    Top = 121
  end
  object vtDados: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'sgUf,nmCidade,nuPedido'
    Left = 312
    Top = 122
    Data = {03000000000000000000}
    object vtDadosflSelecionado: TStringField
      FieldName = 'flEnvProducao'
      OnGetText = vtDadosflSelecionadoGetText
      Size = 1
    end
    object vtDadosnuPedido: TIntegerField
      FieldName = 'nuPedido'
    end
    object vtDadoscdUsuarioImpressao: TIntegerField
      FieldName = 'cdUsuarioImpressao'
    end
    object vtDadosnuTipoImpressao: TIntegerField
      FieldName = 'nuTipoImpressao'
    end
    object vtDadosdtCadastro: TDateTimeField
      FieldName = 'dtCadastro'
    end
    object vtDadosnmCidade: TStringField
      FieldName = 'nmCidade'
      Size = 250
    end
    object vtDadossgUf: TStringField
      FieldName = 'sgUf'
      Size = 2
    end
    object vtDadosdehrCadastro: TStringField
      FieldName = 'dehrCadastro'
      Size = 5
    end
  end
  object pmMarcarDesmarcar: TPopupMenu
    Left = 160
    Top = 178
    object pmiMarcarTodos: TMenuItem
      Caption = 'Marcar Todos'
      OnClick = pmiMarcarTodosClick
    end
    object pmiDesmarcarTodos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = pmiDesmarcarTodosClick
    end
  end
end
