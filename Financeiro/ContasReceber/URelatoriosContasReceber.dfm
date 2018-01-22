object FRelatoriosContasReceber: TFRelatoriosContasReceber
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios do Contas a Receber'
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
    ActivePage = tsCobrancaContato
    Align = alClient
    TabOrder = 0
    object tsCobrancaContato: TTabSheet
      Caption = 'Contatos de Cobran'#231'as'
      object sbRCC: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvRaised
        BorderStyle = bsNone
        Color = clBtnFace
        ParentBackground = True
        ParentColor = False
        TabOrder = 0
        object sbRCCFiltros: TScrollBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object gbRCCFiltros: TGroupBox
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
            object lbRCCdtContato: TLabel
              Left = 74
              Top = 162
              Width = 43
              Height = 13
              Caption = 'Contato:'
            end
            object lbRCCdtContatoA: TLabel
              Left = 237
              Top = 162
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object lbRCCcdCliente: TLabel
              Left = 80
              Top = 66
              Width = 37
              Height = 13
              Caption = 'Cliente:'
            end
            object lbRCCcdRepresentante: TLabel
              Left = 41
              Top = 90
              Width = 76
              Height = 13
              Caption = 'Representante:'
            end
            object lbRCCdtCadastro: TLabel
              Left = 64
              Top = 18
              Width = 53
              Height = 13
              Caption = 'Cad. Cob.:'
            end
            object lbRCCdtCadastroA: TLabel
              Left = 237
              Top = 18
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object lbRCCdtRetornoA: TLabel
              Left = 237
              Top = 186
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object lbRCCdtRetorno: TLabel
              Left = 74
              Top = 186
              Width = 43
              Height = 13
              Caption = 'Retorno:'
            end
            object lbRCCsgUfCli: TLabel
              Left = 80
              Top = 138
              Width = 37
              Height = 13
              Caption = 'Estado:'
            end
            object lbRCCnmCidadeCli: TLabel
              Left = 80
              Top = 114
              Width = 37
              Height = 13
              Caption = 'Cidade:'
            end
            object lbRCCcdSituacao: TLabel
              Left = 72
              Top = 42
              Width = 45
              Height = 13
              Caption = 'Situa'#231#227'o:'
            end
            object lbRCCnmContato: TLabel
              Left = 37
              Top = 210
              Width = 80
              Height = 13
              Caption = 'Pessoa Contato:'
            end
            object lbRCCcdUsuarioCadContato: TLabel
              Left = 9
              Top = 234
              Width = 108
              Height = 13
              Alignment = taRightJustify
              Caption = 'Usu'#225'rio Cad. Contato:'
            end
            object edRCCdtContatoIni: TDateTimePicker
              Left = 118
              Top = 159
              Width = 111
              Height = 21
              Date = 42342.685948726850000000
              Time = 42342.685948726850000000
              ShowCheckbox = True
              Checked = False
              TabOrder = 7
            end
            object edRCCdtContatoFim: TDateTimePicker
              Left = 249
              Top = 159
              Width = 111
              Height = 21
              Date = 42342.685951053240000000
              Time = 42342.685951053240000000
              ShowCheckbox = True
              Checked = False
              TabOrder = 8
            end
            object edRCCdtCadastroIni: TDateTimePicker
              Left = 118
              Top = 15
              Width = 111
              Height = 21
              Date = 42342.685948726850000000
              Time = 42342.685948726850000000
              ShowCheckbox = True
              Checked = False
              TabOrder = 0
            end
            object edRCCdtCadastroFim: TDateTimePicker
              Left = 249
              Top = 15
              Width = 111
              Height = 21
              Date = 42342.685951053240000000
              Time = 42342.685951053240000000
              ShowCheckbox = True
              Checked = False
              TabOrder = 1
            end
            object edRCCdtRetornoFim: TDateTimePicker
              Left = 249
              Top = 183
              Width = 111
              Height = 21
              Date = 42342.685951053240000000
              Time = 42342.685951053240000000
              ShowCheckbox = True
              Checked = False
              TabOrder = 10
            end
            object edRCCdtRetornoIni: TDateTimePicker
              Left = 118
              Top = 183
              Width = 111
              Height = 21
              Date = 42342.685948726850000000
              Time = 42342.685948726850000000
              ShowCheckbox = True
              Checked = False
              TabOrder = 9
            end
            object edRCCcdCliente: TDBCampoCodigo
              Left = 118
              Top = 63
              Width = 349
              Height = 21
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 3
              ERPCampoCodigoPK = False
              ERPCharCase = ecNormal
              ERPEdCampoChaveWidth = 65
              ERPEdCampoChaveFontSize = 8
              ERPEdCampoChaveReadOnly = False
              ERPEdCampoChaveOnlyNumbers = False
              ERPEdCampoChaveDBEnabled = True
              ERPEdCampoChaveEnabled = True
              ERPLbDescricaoFontSize = 8
              ERPLbDescricaoTop = 0
              ERPBtProcurarEnabled = True
              ERPSqlPesquisa.Strings = (
                'SELECT t.*,'
                
                  '       CAST(t.deCliCid || '#39' - Fone 1: '#39' || COALESCE(t.deFone1, '#39 +
                  #39') || '
                '            '#39' - Fone 2: '#39' || COALESCE(t.deFone2, '#39#39') ||'
                
                  '            '#39' - Rep.: '#39' || t.cdRepresentante || '#39' - '#39' || t.nmRep' +
                  'resentante AS CHARACTER VARYING(1000)'
                '           ) AS deCliCidFone'
                '  FROM ('
                '        SELECT cli.cdCliente,'
                '               cli.flFisJur,'
                '               cli.deCpfCnpj,'
                '               cli.deRazaoSocial,'
                '               cli.nmFantasia,'
                '               CAST('
                '                    CASE'
                '                      WHEN LENGTH(cli.nuFone1) = 11 THEN'
                
                  '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
                  'SION),'#39'FM"("00")"0000"-"00000'#39')'
                '                      WHEN LENGTH(cli.nuFone1) = 10 THEN'
                
                  '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
                  'SION),'#39'FM"("00")"0000"-"0000'#39') '
                '                      ELSE'
                '                        cli.nuFone1  '
                '                    END AS CHARACTER VARYING(20)'
                '                   ) AS deFone1,'
                '               CAST('
                '                    CASE'
                '                      WHEN LENGTH(cli.nuFone2) = 11 THEN'
                
                  '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
                  'SION),'#39'FM"("00")"0000"-"00000'#39')'
                '                      WHEN LENGTH(cli.nuFone2) = 10 THEN'
                
                  '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
                  'SION),'#39'FM"("00")"0000"-"0000'#39') '
                '                      ELSE'
                '                        cli.nuFone2  '
                '                    END AS CHARACTER VARYING(20)'
                '                   ) AS deFone2,'
                '               cid.nmCidade,'
                '               cid.sgEstado,'
                '               cli.deRazaoSocial || '#39' - '#39' ||'
                '               cid.nmCidade || '#39'/'#39' ||'
                '               cid.sgEstado AS deCliCid,'
                '               cli.cdRepresentante,'
                '               rep.deRazaoSocial AS nmRepresentante'
                '  FROM erp.cliente cli'
                
                  '  LEFT JOIN erp.representante rep ON (rep.cdRepresentante = cli.' +
                  'cdRepresentante)'
                
                  '  LEFT JOIN erp.cidade        cid ON (cid.cdCidade = cli.cdCidad' +
                  'e)'
                '       ) t'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'cdCliente'
                'deRazaoSocial'
                'nmFantasia'
                'nmcidade'
                'sgestado')
              ERPCamposFiltroTitulo.Strings = (
                'Cliente'
                'Raz'#227'o Social'
                'Fantasia'
                'Cidade'
                'Estado')
              ERPCampoChave = 'cdcliente'
              ERPCampoDescricao = 'deCliCidFone'
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftInteger
            end
            object edRCCcdRepresentante: TDBCampoCodigo
              Left = 118
              Top = 87
              Width = 349
              Height = 21
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 4
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
                'SELECT r.cdRepresentante,'
                '       r.deRazaoSocial,'
                '       r.nmFantasia,'
                '       t01.nmCidade,'
                '       t01.sgEstado'
                '  FROM erp.representante r'
                '  LEFT JOIN ('
                '             SELECT cid.cdCidade AS cdCid,'
                '                    cid.nmCidade,'
                '                    cid.sgEstado'
                '               FROM erp.cidade cid '
                '            ) t01 ON (t01.cdCid = r.cdCidade)'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'cdRepresentante'
                'deRazaoSocial'
                'nmFantasia'
                'nmCidade'
                'sgEstado ')
              ERPCamposFiltroTitulo.Strings = (
                'C'#243'digo'
                'Raz'#227'o Social'
                'Fantasia'
                'Cidade'
                'Estado')
              ERPCampoChave = 'cdRepresentante'
              ERPCampoDescricao = 'nmFantasia'
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftInteger
            end
            object cbRCCsgUfCli: TComboBox
              Left = 118
              Top = 135
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
            object edRCCnmCidadeCli: TEdit
              Left = 118
              Top = 111
              Width = 242
              Height = 21
              TabOrder = 5
            end
            object cbRCCcdSituacao: TComboBox
              Left = 118
              Top = 39
              Width = 75
              Height = 21
              ItemIndex = 0
              TabOrder = 2
              Items.Strings = (
                ''
                'Em Aberto'
                'Finalizada')
            end
            object edRCCnmContato: TEdit
              Left = 118
              Top = 207
              Width = 242
              Height = 21
              TabOrder = 11
            end
            object edRCCcdUsuarioCadContato: TDBCampoCodigo
              Left = 118
              Top = 231
              Width = 326
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              BevelOuter = bvNone
              ShowCaption = False
              TabOrder = 12
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
                '        SELECT cdUsuario,'
                '               nmUsuario'
                '          FROM erp.usuario'
                '         ORDER BY cdUsuario'
                '       ) t'
                ' &filtro')
              ERPCamposFiltro.Strings = (
                'cdUsuario'
                'nmUsuario')
              ERPCamposFiltroTitulo.Strings = (
                'C'#243'digo'
                'Nome')
              ERPCampoChave = 'cdUsuario'
              ERPCampoDescricao = 'nmUsuario'
              ERPConnection = DmERP.fdConnERP
              ERPCampoChaveDataType = ftInteger
            end
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
  object dbCobrancaContato: TfrxDBDataset
    UserName = 'frxDBCobrancaContato'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdcobranca=cdcobranca'
      'dtcadcobranca=dtcadcobranca'
      'cdcliente=cdcliente'
      'vlcobranca=vlcobranca'
      'detextocobranca=detextocobranca'
      'cdsituacao=cdsituacao'
      'desituacao=desituacao'
      'nmcliente=nmcliente'
      'nmfantasia=nmfantasia'
      'defone1=defone1'
      'defone2=defone2'
      'cdcidade=cdcidade'
      'nmcidade=nmcidade'
      'sgestado=sgestado'
      'cdrepresentante=cdrepresentante'
      'nmrepresentante=nmrepresentante'
      'cdcobrancacontato=cdcobrancacontato'
      'dtcontato=dtcontato'
      'nmcontato=nmcontato'
      'flretornar=flretornar'
      'dtretorno=dtretorno'
      'dehrretorno=dehrretorno'
      'deobscontato=deobscontato')
    DataSet = DmERP.qyCobrancaContatoRel
    BCDToCurrency = False
    Left = 146
    Top = 336
  end
  object relCobrancaContato: TfrxReport
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
    OnUserFunction = relCobrancaContatoUserFunction
    Left = 251
    Top = 335
    Datasets = <
      item
        DataSet = dbCobrancaContato
        DataSetName = 'frxDBCobrancaContato'
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
            'Contatos de Cobran'#231'a')
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
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 964.559680000001400000
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
      object ghCobranca: TfrxGroupHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 13.228346460000000000
        ParentFont = False
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBCobrancaContato."cdcobranca"'
        Stretched = True
        object frxDBRelListaPedNUPEDIDO: TfrxMemoView
          Left = 45.354360000000000000
          Width = 47.244094490000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Cobran'#231'a:')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 94.267780000000000000
          Width = 41.574830000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCobrancaContato."cdcobranca"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 267.126160000000000000
          Width = 64.252010000000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCobrancaContato."vlcobranca"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 390.496031260000000000
          Width = 325.039479920000000000
          Height = 13.228346460000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCobrancaContato."detextocobranca"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 235.330860000000000000
          Width = 30.236208270000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Valor:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 333.598640000000000000
          Width = 54.803154490000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Referente a:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 136.063080000000000000
          Width = 43.464564490000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Situa'#231#227'o:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 181.196970000000000000
          Width = 52.913420000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCobrancaContato."desituacao"]')
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 61.472480000000000000
          Top = 0.377952760000000000
          Width = 69.921259840000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Contato')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 132.259879130000000000
          Top = 0.377952760000000000
          Width = 132.283442600000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pessoa Contato')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 265.126160000000000000
          Top = 0.377952760000000000
          Width = 71.810969920000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Retorno')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 339.937230000000000000
          Top = 0.377952760000000000
          Width = 62.362204720000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hr. Retorno')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 403.968770000000000000
          Top = 0.377952760000000000
          Width = 313.700924090000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Observa'#231#227'o Contato')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 16.897650000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 13.228346456692910000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dbCobrancaContato
        DataSetName = 'frxDBCobrancaContato'
        RowCount = 0
        Stretched = True
        object frxDBRelListaProdITEM: TfrxMemoView
          Left = 61.472480000000000000
          Width = 69.921259840000000000
          Height = 13.228346460000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBCobrancaContato."dtcontato"]')
          ParentFont = False
        end
        object frxDBRelListaProdNUQTD: TfrxMemoView
          Left = 264.944898980000000000
          Width = 71.811023620000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<frxDBCobrancaContato."dtretorno"> = nil, '#39#39', DateToStr(<fr' +
              'xDBCobrancaContato."dtretorno">))]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 132.149635590000000000
          Width = 132.283550000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCobrancaContato."nmcontato"]')
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
            end>
        end
        object Memo4: TfrxMemoView
          Left = 339.779544650000000000
          Width = 62.362204720000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBCobrancaContato."dehrretorno"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 403.897652440000000000
          Width = 313.700990000000000000
          Height = 13.228346460000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBCobrancaContato."deobscontato"]')
          ParentFont = False
        end
      end
      object ghRepresentante: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBCobrancaContato."cdrepresentante"'
        object Memo5: TfrxMemoView
          Width = 570.709030000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'Representante: [frxDBCobrancaContato."cdrepresentante"] - [frxDB' +
              'CobrancaContato."nmrepresentante"]')
          ParentFont = False
        end
      end
      object ghCliente: TfrxGroupHeader
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBCobrancaContato."cdcliente"'
        object Memo21: TfrxMemoView
          Left = 486.803315590000000000
          Width = 79.370078740000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBCobrancaContato."defone1"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 445.205010000000000000
          Width = 42.330708660000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fone 1:')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 30.236240000000000000
          Width = 411.968770000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'Cliente: [frxDBCobrancaContato."cdcliente"] - [frxDBCobrancaCont' +
              'ato."nmcliente"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 612.307335590000000000
          Width = 79.370078740000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBCobrancaContato."defone2"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 570.709030000000000000
          Width = 42.330708660000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fone 2:')
          ParentFont = False
        end
      end
      object ghCidade: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897637795275590000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBCobrancaContato."cdcidade"'
        object Memo22: TfrxMemoView
          Left = 15.118120000000000000
          Width = 570.709030000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'Cidade: [frxDBCobrancaContato."nmCidade"]/[frxDBCobrancaContato.' +
              '"sgEstado"]')
          ParentFont = False
        end
      end
    end
  end
end
