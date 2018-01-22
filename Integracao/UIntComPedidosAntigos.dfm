object FIntComPedidosAntigos: TFIntComPedidosAntigos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Consulta de Pedidos Antigos'
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
    Height = 94
    Align = alTop
    TabOrder = 0
    DesignSize = (
      939
      94)
    object gbFiltros: TGroupBox
      Left = 4
      Top = 1
      Width = 932
      Height = 89
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Filtros: '
      TabOrder = 0
      DesignSize = (
        932
        89)
      object lbdtPedido: TLabel
        Left = 39
        Top = 17
        Width = 62
        Height = 13
        Caption = 'Data Pedido:'
      end
      object lbdtPedidoA: TLabel
        Left = 220
        Top = 17
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbnmCliente: TLabel
        Left = 37
        Top = 41
        Width = 64
        Height = 13
        Caption = 'Raz'#227'o Social:'
      end
      object lbnmFantasia: TLabel
        Left = 56
        Top = 65
        Width = 45
        Height = 13
        Caption = 'Fantasia:'
      end
      object lbnmCidadeCli: TLabel
        Left = 382
        Top = 17
        Width = 37
        Height = 13
        Caption = 'Cidade:'
      end
      object lbnmVendedor: TLabel
        Left = 361
        Top = 41
        Width = 58
        Height = 13
        Caption = 'Represent.:'
      end
      object lbdeUfCli: TLabel
        Left = 660
        Top = 17
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado:'
      end
      object lbdeItem: TLabel
        Left = 393
        Top = 65
        Width = 26
        Height = 13
        Caption = 'Item:'
      end
      object lbdeCor: TLabel
        Left = 505
        Top = 65
        Width = 21
        Height = 13
        Caption = 'Cor:'
      end
      object lbcdCliAnt: TLabel
        Left = 652
        Top = 65
        Width = 45
        Height = 13
        Caption = 'C'#243'd. Cli.:'
      end
      object eddtPedidoIni: TDateTimePicker
        Left = 102
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        TabOrder = 0
      end
      object eddtPedidoFim: TDateTimePicker
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
        Left = 765
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
      object ednmCliente: TEdit
        Left = 102
        Top = 38
        Width = 242
        Height = 21
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
      object ednmFantasia: TEdit
        Left = 102
        Top = 62
        Width = 242
        Height = 21
        TabOrder = 3
      end
      object ednmCidadeCli: TEdit
        Left = 421
        Top = 14
        Width = 223
        Height = 21
        TabOrder = 4
      end
      object ednmVendedor: TEdit
        Left = 421
        Top = 38
        Width = 223
        Height = 21
        TabOrder = 5
      end
      object cbdeUfCli: TComboBox
        Left = 703
        Top = 14
        Width = 44
        Height = 21
        ItemIndex = 0
        TabOrder = 6
        Items.Strings = (
          ''
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PR'
          'PB'
          'PA'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SE'
          'SP'
          'TO')
      end
      object eddeItem: TEdit
        Left = 421
        Top = 62
        Width = 68
        Height = 21
        TabOrder = 7
      end
      object eddeCor: TEdit
        Left = 529
        Top = 62
        Width = 115
        Height = 21
        TabOrder = 8
      end
      object edcdCliAnt: TEdit
        Left = 703
        Top = 62
        Width = 44
        Height = 21
        TabOrder = 11
      end
      object btImprimir: TBitBtn
        Left = 819
        Top = 21
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Imprimir'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 12
        OnClick = btImprimirClick
      end
      object btExportar: TBitBtn
        Left = 735
        Top = 34
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Exportar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 13
        Visible = False
        OnClick = btExportarClick
      end
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 94
    Width = 939
    Height = 461
    Align = alClient
    TabOrder = 1
    object lbItensPedido: TLabel
      Left = 1
      Top = 292
      Width = 937
      Height = 19
      Align = alBottom
      Caption = 'Itens do Pedido:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 134
    end
    object lbPedidos: TLabel
      Left = 1
      Top = 1
      Width = 937
      Height = 19
      Align = alTop
      Caption = 'Pedidos:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 70
    end
    object grDados: TDBGrid
      Left = 1
      Top = 20
      Width = 937
      Height = 272
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grDadosCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cdpedido'
          Title.Caption = 'C'#243'd. Pedido'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nupedido'
          Title.Caption = 'N'#186' Pedido'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmcliente'
          Title.Caption = 'Raz'#227'o Social'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmfantasiacliente'
          Title.Caption = 'Fantasia'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deenderecocli'
          Title.Caption = 'End. Cliente'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmcidadecli'
          Title.Caption = 'Cidade Cliente'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deufcli'
          Title.Caption = 'UF Cliente'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'decepcli'
          Title.Caption = 'CEP Cliente'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtpedido'
          Title.Caption = 'Data Pedido'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'decondpagto'
          Title.Caption = 'Cond. Pagto.'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmvendedor'
          Title.Caption = 'Representante'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmcomprador'
          Title.Caption = 'Comprador'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'depedidoobs1'
          Title.Caption = 'Obs. 1 Pedido'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'depedidoobs2'
          Title.Caption = 'Obs. 2 Pedido'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdrota'
          Title.Caption = 'Rota'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'derota'
          Title.Caption = 'Desc. Rota'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deveiculorota'
          Title.Caption = 'Ve'#237'culo Rota'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmmotoristarota'
          Title.Caption = 'Motorista Rota'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmajudanterota'
          Title.Caption = 'Ajudante Rota'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deobsrota'
          Title.Caption = 'Obs. Rota'
          Width = 200
          Visible = True
        end>
    end
    object grItensPed: TDBGrid
      Left = 1
      Top = 311
      Width = 937
      Height = 108
      Align = alBottom
      DataSource = dsDadosItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cditem'
          Title.Caption = 'C'#243'd. Item'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deitem'
          Title.Caption = 'Item'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'detamanho'
          Title.Caption = 'Tamanho'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'decor'
          Title.Caption = 'Cor'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'depadrao'
          Title.Caption = 'Padr'#227'o'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuqtde'
          Title.Caption = 'Qtde.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlunitario'
          Title.Caption = 'Vl. Unit'#225'rio'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vltotal'
          Title.Caption = 'Vl. Total'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'detrocabonif'
          Title.Caption = 'Troca/Bonif.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deobservacao'
          Title.Caption = 'Observa'#231#227'o'
          Width = 250
          Visible = True
        end>
    end
    object pnTotaisPedido: TPanel
      Left = 1
      Top = 419
      Width = 937
      Height = 41
      Align = alBottom
      TabOrder = 2
      object lbQtdTotal: TLabel
        Left = 341
        Top = 7
        Width = 40
        Height = 19
        Caption = 'Qtd.:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbTotaisPedido: TLabel
        Left = 5
        Top = 7
        Width = 143
        Height = 19
        Caption = 'Totais do Pedido:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lbValorTotal: TLabel
        Left = 541
        Top = 7
        Width = 49
        Height = 19
        Caption = 'Valor:'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object edTotaisPedido: TEdit
        Left = 154
        Top = 6
        Width = 85
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edQtdTotal: TEdit
        Left = 385
        Top = 6
        Width = 85
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edValorTotal: TEdit
        Left = 593
        Top = 6
        Width = 107
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyIntComPedidosAntigos
    Left = 87
    Top = 121
  end
  object dsDadosItens: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyIntComItensPedAntigos
    Left = 87
    Top = 177
  end
  object dbRelPedAnt: TfrxDBDataset
    UserName = 'frxDBRelPedAnt'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdpedido=cdpedido'
      'nupedido=nupedido'
      'cdcliente=cdcliente'
      'nmcliente=nmcliente'
      'nmfantasiacliente=nmfantasiacliente'
      'deenderecocli=deenderecocli'
      'cdcliant=cdcliant'
      'cdcidadecli=cdcidadecli'
      'nmcidadecli=nmcidadecli'
      'deufcli=deufcli'
      'decepcli=decepcli'
      'dtpedido=dtpedido'
      'decondpagto=decondpagto'
      'cdvendedor=cdvendedor'
      'nmvendedor=nmvendedor'
      'nmcomprador=nmcomprador'
      'cdrota=cdrota'
      'deveiculorota=deveiculorota'
      'nmmotoristarota=nmmotoristarota'
      'nmajudanterota=nmajudanterota'
      'dtsaidarota=dtsaidarota'
      'derota=derota'
      'deobsrota=deobsrota'
      'destatusrota=destatusrota'
      'nuprioridaderota=nuprioridaderota'
      'depedidoobs1=depedidoobs1'
      'depedidoobs2=depedidoobs2'
      'destatusped=destatusped')
    DataSet = DmERP.qyIntComPedidosAntigos
    BCDToCurrency = False
    Left = 218
    Top = 251
  end
  object relPedAnt: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42375.588701863400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 298
    Top = 283
    Datasets = <
      item
        DataSet = dbRelItemPedAnt
        DataSetName = 'frxDBRelItemPedAnt'
      end
      item
        DataSet = dbRelPedAnt
        DataSetName = 'frxDBRelPedAnt'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        DataSet = dbRelItemPedAnt
        DataSetName = 'frxDBRelItemPedAnt'
        RowCount = 0
        object Line4: TfrxLineView
          Top = 15.118120000000010000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object frxDBRelItemPedAntdeitem: TfrxMemoView
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          DataField = 'deitem'
          DataSet = dbRelItemPedAnt
          DataSetName = 'frxDBRelItemPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelItemPedAnt."deitem"]')
          ParentFont = False
        end
        object frxDBRelItemPedAntdecor: TfrxMemoView
          Left = 142.622140000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DataField = 'decor'
          DataSet = dbRelItemPedAnt
          DataSetName = 'frxDBRelItemPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelItemPedAnt."decor"]')
          ParentFont = False
        end
        object frxDBRelItemPedAntnuqtde: TfrxMemoView
          Left = 406.409710000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DataField = 'nuqtde'
          DataSet = dbRelItemPedAnt
          DataSetName = 'frxDBRelItemPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelItemPedAnt."nuqtde"]')
          ParentFont = False
        end
        object frxDBRelItemPedAntvlunitario: TfrxMemoView
          Left = 472.441250000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'vlunitario'
          DataSet = dbRelItemPedAnt
          DataSetName = 'frxDBRelItemPedAnt'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelItemPedAnt."vlunitario"]')
          ParentFont = False
        end
        object frxDBRelItemPedAntvltotal: TfrxMemoView
          Left = 555.590910000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'vltotal'
          DataSet = dbRelItemPedAnt
          DataSetName = 'frxDBRelItemPedAnt'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelItemPedAnt."vltotal"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 279.685220000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          DataField = 'detamanho'
          DataSet = dbRelItemPedAnt
          DataSetName = 'frxDBRelItemPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelItemPedAnt."detamanho"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelPedAnt."cdpedido"'
        StartNewPage = True
        Stretched = True
        object Line3: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object picLogoEmp: TfrxPictureView
          Left = 3.779530000000000000
          Top = 5.779530000000000000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          Left = 136.063080000000000000
          Top = 3.779530000000001000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object frxDBRelPedAntnmcliente: TfrxMemoView
          Left = 226.771800000000000000
          Top = 3.779530000000001000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          DataField = 'nmcliente'
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Memo.UTF8W = (
            '[frxDBRelPedAnt."nmcliente"]')
        end
        object Memo5: TfrxMemoView
          Left = 136.063080000000000000
          Top = 60.472480000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cond. Pagto.:')
          ParentFont = False
        end
        object frxDBRelPedAntdecondpagto: TfrxMemoView
          Left = 226.771800000000000000
          Top = 60.472480000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          DataField = 'decondpagto'
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Memo.UTF8W = (
            '[frxDBRelPedAnt."decondpagto"]')
        end
        object Memo8: TfrxMemoView
          Left = 559.370440000000000000
          Top = 3.779530000000001000
          Width = 151.181141420000000000
          Height = 18.897650000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Pedido N'#186':')
          ParentFont = False
        end
        object frxDBRelPedAntnupedido: TfrxMemoView
          Left = 561.149970000000000000
          Top = 24.677180000000000000
          Width = 151.181200000000000000
          Height = 45.354360000000000000
          DataField = 'nupedido'
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelPedAnt."nupedido"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 136.063080000000000000
          Top = 22.677180000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object frxDBRelPedAntdeenderecocli: TfrxMemoView
          Left = 226.771800000000000000
          Top = 22.677180000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          DataField = 'deenderecocli'
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelPedAnt."deenderecocli"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 136.063080000000000000
          Top = 41.354360000000000000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cidade/UF:')
          ParentFont = False
        end
        object frxDBRelPedAntnmcidadecli: TfrxMemoView
          Left = 226.771653540000000000
          Top = 41.196850393700790000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelPedAnt."nmcidadecli"]/[frxDBRelPedAnt."deufcli"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 84.929190000000000000
          Width = 139.842551420000000000
          Height = 15.118120000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 142.622140000000000000
          Top = 84.929190000000000000
          Width = 136.063021420000000000
          Height = 15.118120000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cor')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 406.409710000000000000
          Top = 84.929190000000000000
          Width = 64.251951420000000000
          Height = 15.118120000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 472.440981500000000000
          Top = 84.929190000000000000
          Width = 79.370071420000000000
          Height = 15.118120000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vl. Unit.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 555.590910000000000000
          Top = 84.929190000000000000
          Width = 79.370071420000000000
          Height = 15.118120000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Vl. Total')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Top = 100.047310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo14: TfrxMemoView
          Left = 279.685220000000000000
          Top = 85.039370080000000000
          Width = 124.724431420000000000
          Height = 15.118120000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tamanho')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 23.354360000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 631.181510000000000000
          Top = 2.456709999999987000
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
          Top = 2.456709999999987000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 226.771800000000000000
          Top = 2.456709999999987000
          Width = 285.732434800000000000
          Height = 18.897650000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data/Hora Impress'#227'o: [Date] - [Time]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line2: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 20.787401570000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 555.590551181102300000
          Top = 1.133858269999990000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelItemPedAnt."vltotal">,MasterData1)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo3: TfrxSysMemoView
          Left = 406.299212598425200000
          Top = 1.133858269999990000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelItemPedAnt."nuqtde">,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 302.362400000000000000
          Top = 1.133858269999990000
          Width = 102.047251420000000000
          Height = 15.118120000000000000
          DataSet = dbRelPedAnt
          DataSetName = 'frxDBRelPedAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totais do Pedido:')
          ParentFont = False
        end
      end
    end
  end
  object dbRelItemPedAnt: TfrxDBDataset
    UserName = 'frxDBRelItemPedAnt'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdpedido=cdpedido'
      'cditem=cditem'
      'deitem=deitem'
      'nuqtde=nuqtde'
      'detamanho=detamanho'
      'decor=decor'
      'depadrao=depadrao'
      'vlunitario=vlunitario'
      'vltotal=vltotal'
      'detrocabonif=detrocabonif'
      'deobservacao=deobservacao'
      'dtdigitacao=dtdigitacao')
    DataSet = DmERP.qyIntComItensPedAntigos
    BCDToCurrency = False
    Left = 218
    Top = 307
  end
  object pdfExport: TfrxPDFExport
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
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 392
    Top = 288
  end
end
