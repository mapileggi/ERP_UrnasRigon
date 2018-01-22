inherited FFatDiarioCadastro: TFFatDiarioCadastro
  Caption = 'Faturamento Di'#225'rio'
  ClientWidth = 790
  ExplicitWidth = 790
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 790
    ExplicitWidth = 790
    object lbcdFatDiario: TLabel
      Left = 54
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbcdEmpresa: TLabel
      Left = 46
      Top = 34
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empresa:'
    end
    object lbdtMovimento: TLabel
      Left = 9
      Top = 59
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Movimento:'
    end
    object lbvlFaturado: TLabel
      Left = 63
      Top = 86
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor:'
    end
    object edcdEmpresa: TDBCampoCodigo
      Left = 93
      Top = 31
      Width = 677
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 1
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
        'deRazaoSocial'
        'nmFantasia')
      ERPCamposFiltroTitulo.Strings = (
        'Empresa'
        'Raz'#227'o Social'
        'Fantasia')
      ERPCampoChave = 'cdEmpresa'
      ERPCampoDescricao = 'deRazaoSocial'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdFatDiario: TDBCampoCodigo
      Left = 93
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
        'SELECT t01.*'
        '  FROM ('
        '        SELECT fd.cdFatDiario,'
        '               fd.cdEmpresa,'
        '               e.nmFantasia,'
        '               e.deRazaoSocial,'
        '               fd.dtMovimento,'
        
          '               CAST(TO_CHAR(fd.dtMovimento, '#39'mm/yyyy'#39') AS CHARAC' +
          'TER VARYING(10)) AS deComp,'
        '               fd.vlFaturado'
        '          FROM erp.fatDiario fd'
        
          '          LEFT JOIN erp.empresa e ON (e.cdEmpresa = fd.cdEmpresa' +
          ')'
        '       ) t01 '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdFatDiario'
        'cdEmpresa'
        'deRazaoSocial'
        'deComp'
        'dtMovimento'
        'vlFaturado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Empresa'
        'Raz'#227'o Social'
        'Comp.'
        'Data Mov.'
        'Valor Fat.')
      ERPCampoChave = 'cdFatDiario'
      ERPCampoDescricao = 'cdFatDiario'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edvlFaturado: TDBEdit
      Left = 93
      Top = 83
      Width = 68
      Height = 21
      DataField = 'vlfaturado'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object eddtMovimento: TDBDateTime
      Left = 93
      Top = 57
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 2
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtmovimento'
      DataSource = FrBarraBotoes.dsDados
    end
    object gbRelatorio: TGroupBox
      Left = 8
      Top = 128
      Width = 368
      Height = 70
      Caption = ' Relat'#243'rio '
      TabOrder = 4
      object lbdtMovIni: TLabel
        Left = 10
        Top = 30
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Movimento:'
      end
      object lbdtMovA: TLabel
        Left = 191
        Top = 30
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object btImprimir: TBitBtn
        Left = 303
        Top = 12
        Width = 55
        Height = 52
        Caption = '&Imprimir'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 2
        OnClick = btImprimirClick
      end
      object eddtMovIni: TDateTimePicker
        Left = 93
        Top = 27
        Width = 93
        Height = 21
        Date = 42550.654724236120000000
        Time = 42550.654724236120000000
        TabOrder = 0
      end
      object eddtMovFim: TDateTimePicker
        Left = 202
        Top = 27
        Width = 93
        Height = 21
        Date = 42550.654724236120000000
        Time = 42550.654724236120000000
        TabOrder = 1
      end
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
      DataSet = DmERP.qyFatDiario
    end
  end
  object dbRelFatDiario: TfrxDBDataset
    UserName = 'frxDBRelFatDiario'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdfatdiario=cdfatdiario'
      'cdempresa=cdempresa'
      'nmfantasia=nmfantasia'
      'derazaosocial=derazaosocial'
      'decomp=decomp'
      'dtmovimento=dtmovimento'
      'vlfaturado=vlfaturado')
    DataSet = qyFatDiarioRel
    BCDToCurrency = False
    Left = 218
    Top = 283
  end
  object relFatDiario: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'HP Officejet Pro 8610'
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
        DataSet = dbRelFatDiario
        DataSetName = 'frxDBRelFatDiario'
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
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        DataSet = dbRelFatDiario
        DataSetName = 'frxDBRelFatDiario'
        RowCount = 0
        object frxDBRelListaProdITEM: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtmovimento'
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelFatDiario."dtmovimento"]')
          ParentFont = False
        end
        object frxDBRelListaProdNUQTD: TfrxMemoView
          Left = 151.181200000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelFatDiario."vlfaturado"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Top = 18.897650000000030000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelFatDiario."cdempresa"'
        StartNewPage = True
        Stretched = True
        object frxDBRelListaProdDEFANTASIA: TfrxMemoView
          Width = 66.519694800000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 69.031540000000000000
          Width = 646.299630000000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelFatDiario."derazaosocial"]')
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
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Faturamento')
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
        Height = 23.354360000000000000
        Top = 464.882190000000000000
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
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
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
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelFatDiario."decomp"'
        object Memo2: TfrxMemoView
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Compet'#234'ncia:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 90.708720000000000000
          Width = 619.842920000000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelFatDiario."decomp"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 20.787401570000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 136.063080000000000000
          Top = 1.779530000000022000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelFatDiario."vlfaturado">,MasterData1)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 42.015770000000000000
          Top = 1.779530000000022000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Comp.:')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          Left = 136.063080000000000000
          Top = 1.779530000000022000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelFatDiario."vlfaturado">,MasterData1)]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 41.952755910000000000
          Top = 1.889763780000010000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Emp.:')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
        object SysMemo3: TfrxSysMemoView
          Left = 136.063080000000000000
          Top = 1.779530000000022000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelFatDiario."vlfaturado">,MasterData1)]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo7: TfrxMemoView
          Left = 41.952755910000000000
          Top = 1.889763780000010000
          Width = 90.708661420000000000
          Height = 18.897650000000000000
          DataSet = dbRelFatDiario
          DataSetName = 'frxDBRelFatDiario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral:')
          ParentFont = False
        end
      end
    end
  end
  object qyFatDiarioRel: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t01.*'
      '  FROM ('
      '        SELECT fd.cdFatDiario,'
      '               fd.cdEmpresa,'
      '               e.nmFantasia,'
      '               e.deRazaoSocial,'
      
        '               CAST(TO_CHAR(fd.dtMovimento, '#39'mm/yyyy'#39') AS CHARAC' +
        'TER VARYING(10)) AS deComp,'
      '               fd.dtMovimento,'
      '               fd.vlFaturado'
      '          FROM erp.fatDiario fd'
      
        '          LEFT JOIN erp.empresa e ON (e.cdEmpresa = fd.cdEmpresa' +
        ')'
      '       ) t01 '
      ' &filtro'
      ' ORDER BY t01.cdEmpresa, t01.deComp, t01.dtMovimento')
    Left = 118
    Top = 288
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
end
