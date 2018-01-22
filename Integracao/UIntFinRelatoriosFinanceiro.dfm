object FIntFinRelatoriosFinanceiro: TFIntFinRelatoriosFinanceiro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios do Financeiro'
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
    ActivePage = tsPendenciaRep
    Align = alClient
    TabOrder = 0
    object tsPendenciaRep: TTabSheet
      Caption = 'Pend'#234'ncias Por Representante'
      object sbRPR: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbRPRFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          object lbRPRcdRepresentante: TLabel
            Left = 33
            Top = 20
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Representante:'
          end
          object lbRPRdtDiaVcto: TLabel
            Left = 8
            Top = 44
            Width = 101
            Height = 13
            Alignment = taRightJustify
            BiDiMode = bdLeftToRight
            Caption = 'Considera T'#237't. Venc.:'
            ParentBiDiMode = False
          end
          object edRPRcdRepresentante: TDBCampoCodigo
            Left = 110
            Top = 17
            Width = 371
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
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
              '        SELECT codigo_repres AS cdRepresentante,'
              '               fantasia AS nmRepresentante'
              '          FROM repres'
              '         ORDER BY fantasia'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdRepresentante'
              'nmRepresentante')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Nome')
            ERPCampoChave = 'cdRepresentante'
            ERPCampoDescricao = 'nmRepresentante'
            ERPConnection = DmIntegracao.fdConnInteg
            ERPCampoChaveDataType = ftInteger
          end
          object edRPRdtDiaVcto: TDateTimePicker
            Left = 110
            Top = 41
            Width = 93
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            TabOrder = 1
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
  object dbPendRepRel: TfrxDBDataset
    UserName = 'frxDBPendRepRel'
    CloseDataSource = False
    DataSet = DmIntegracao.qyTitulo
    BCDToCurrency = False
    Left = 282
    Top = 224
  end
  object relPendRep: TfrxReport
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
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end; '
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relPendRepUserFunction
    Left = 362
    Top = 224
    Datasets = <
      item
        DataSet = dbPendRepRel
        DataSetName = 'frxDBPendRepRel'
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
        Top = 589.606680000000000000
        Width = 718.110700000000000000
        object Line5: TfrxLineView
          Width = 1046.929133858268000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 636.740716460000000000
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
          Width = 716.598854800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
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
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        DataSet = dbPendRepRel
        DataSetName = 'frxDBPendRepRel'
        RowCount = 0
        Stretched = True
        object frxDBEstoqueMaterialRelfltipomovimento: TfrxMemoView
          Left = 113.275568580000000000
          Width = 77.480322280000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBPendRepRel."dtEmissao"]')
          ParentFont = False
        end
        object frxDBEstoqueMaterialReldtmovimento: TfrxMemoView
          Width = 71.811023620000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPendRepRel."nuTitulo"]')
          ParentFont = False
        end
        object frxDBEstoqueMaterialReldehrmovimento: TfrxMemoView
          Left = 74.700787400000000000
          Width = 35.905489840000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBPendRepRel."nuSerie"]')
          ParentFont = False
        end
        object frxDBEstoqueMaterialRelnuqtde: TfrxMemoView
          Left = 284.795314650000000000
          Width = 37.795260940000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPendRepRel."cdTipoDoc"]')
          ParentFont = False
        end
        object frxDBMaterialMovRelcdunidademedida: TfrxMemoView
          Left = 324.260050000000000000
          Width = 37.795280470000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPendRepRel."deSiglaCobranca"]')
          ParentFont = False
        end
        object frxDBMaterialMovRelnmfornecedor: TfrxMemoView
          Left = 363.921289130000000000
          Width = 154.960610390000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPendRepRel."deBanco"]')
          ParentFont = False
        end
        object frxDBMaterialMovRelnmsolicitante: TfrxMemoView
          Left = 522.842517240000000000
          Width = 75.590502360000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPendRepRel."nuDiasVect"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 194.535560000000000000
          Width = 86.929150940000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBPendRepRel."dtVencto"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 600.945270000000000000
          Width = 113.385846300000000000
          Height = 17.007874020000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBPendRepRel."vlSaldoReceb"]')
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
          Left = 71.811070000000000000
          Top = 23.015770000000000000
          Width = 646.299166220000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'PEND'#202'NCIAS POR REPRESENTANTE')
          ParentFont = False
        end
      end
      object ghRep: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677165354330710000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBPendRepRel."cdRepresentante"'
        StartNewPage = True
        object Memo10: TfrxMemoView
          Width = 718.110236220000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Representante: [frxDBPendRepRel."cdRepresentante"] - [frxDBPendR' +
              'epRel."nmFantasiaRep"]')
          ParentFont = False
        end
      end
      object gfRep: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 461.102660000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo2: TfrxSysMemoView
          Left = 619.401980000000000000
          Top = 1.133858270000019000
          Width = 94.488250000000000000
          Height = 17.007874020000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPendRepRel."vlSaldoReceb">,MasterData1)]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 441.205010000000000000
          Top = 1.133858270000019000
          Width = 173.858380000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Saldo Rec. Rep.:')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Top = 1.133858269999990000
          Width = 71.811070000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T'#237'tulo')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 74.700787400000000000
          Top = 1.133858269999990000
          Width = 35.905489840000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'S'#233'rie')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 113.275568580000000000
          Top = 1.133858269999990000
          Width = 77.480322280000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 284.685220000000000000
          Top = 1.133858269999990000
          Width = 37.795260940000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Doc.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 324.260050000000000000
          Top = 1.133858269999990000
          Width = 37.795300000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cob.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 364.055350000000000000
          Top = 1.133858269999990000
          Width = 154.960730000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Portador')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 522.795610000000000000
          Top = 1.133858269999990000
          Width = 75.590502360000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dias Venc.')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 18.897650000000000000
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 194.535560000000000000
          Top = 1.133858269999990000
          Width = 86.929150940000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vencto.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 601.078737720000000000
          Top = 1.133858269999990000
          Width = 113.385860940000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo a Receber')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 506.457020000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo4: TfrxSysMemoView
          Left = 619.464566929134000000
          Top = 1.133858270000019000
          Width = 94.488250000000000000
          Height = 17.007874020000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPendRepRel."vlSaldoReceb">,MasterData1)]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 441.070866141732300000
          Top = 1.133858270000019000
          Width = 173.858267720000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Saldo Rec.:')
          ParentFont = False
        end
      end
      object ghCliente: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897637795275590000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBPendRepRel."nmFantasiaCli"'
        object Memo5: TfrxMemoView
          Left = 103.559055118110200000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Memo.UTF8W = (
            
              '[frxDBPendRepRel."cdCliente"] - [frxDBPendRepRel."nmFantasiaCli"' +
              ']')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo14: TfrxMemoView
          Width = 102.047310000000000000
          Height = 17.007874020000000000
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
      end
      object ghCidadeCli: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897637795275590000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBPendRepRel."nmCidadeCli"'
        object Memo16: TfrxMemoView
          Left = 103.559055120000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          DataSet = dbPendRepRel
          DataSetName = 'frxDBPendRepRel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBPendRepRel."nmCidadeCli"]/[frxDBPendRepRel."sgEstadoCli"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo18: TfrxMemoView
          Width = 102.047310000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
      end
      object gfCliente: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 393.071120000000000000
        Width = 718.110700000000000000
        object Line7: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object SysMemo3: TfrxSysMemoView
          Left = 619.401980000000000000
          Top = 1.133858270000019000
          Width = 94.488250000000000000
          Height = 17.007874020000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBPendRepRel."vlSaldoReceb">,MasterData1)]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 441.205010000000000000
          Top = 1.133858270000019000
          Width = 173.858380000000000000
          Height = 17.007874020000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Saldo Rec. Cli.:')
          ParentFont = False
        end
      end
      object gfCidade: TfrxGroupFooter
        FillType = ftBrush
        Top = 438.425480000000000000
        Visible = False
        Width = 718.110700000000000000
      end
    end
  end
end
