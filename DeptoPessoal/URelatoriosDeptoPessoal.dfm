object FRelatoriosDeptoPessoal: TFRelatoriosDeptoPessoal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios do Depto. Pessoal'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcRelatorios: TPageControl
    Left = 0
    Top = 0
    Width = 479
    Height = 330
    ActivePage = tsRegistroPonto
    Align = alClient
    TabOrder = 0
    object tsRegistroPonto: TTabSheet
      Caption = 'Registro de Ponto'
      object sbRRP: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        DesignSize = (
          471
          302)
        object gbRRPFiltros: TGroupBox
          Left = 3
          Top = 0
          Width = 464
          Height = 299
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = ' Filtros: '
          TabOrder = 0
          object lbRRPdtPonto: TLabel
            Left = 35
            Top = 18
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Ponto:'
          end
          object lbRRPdtPontoA: TLabel
            Left = 213
            Top = 18
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRRPcdColaborador: TLabel
            Left = 30
            Top = 42
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Colaborador:'
          end
          object edRRPdtPontoIni: TDateTimePicker
            Left = 94
            Top = 15
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 0
          end
          object edRRPdtPontoFim: TDateTimePicker
            Left = 225
            Top = 15
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 1
          end
          object edRRPcdColaborador: TDBCampoCodigo
            Left = 94
            Top = 39
            Width = 364
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 2
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
              '        SELECT a.cdColaborador,'
              '               a.nmColaborador,'
              '               a.deCpf,'
              '               cid.nmCidade,'
              '               cid.sgEstado,'
              '               cs.deColabSituacao'
              '  FROM erp.Colaborador a'
              
                '  LEFT JOIN erp.colabSituacao cs ON (cs.cdColabSituacao = a.cdCo' +
                'labSituacao)'
              '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = a.cdCidade)'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdColaborador'
              'nmColaborador'
              'deColabSituacao'
              'deCpf'
              'nmcidade'
              'sgestado')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Nome'
              'Situa'#231#227'o'
              'CPF'
              'Cidade'
              'Estado')
            ERPCampoChave = 'cdColaborador'
            ERPCampoDescricao = 'nmColaborador'
            ERPConnection = DmERP.fdConnERP
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
  object dbColabPonto: TfrxDBDataset
    UserName = 'frxDBColabPonto'
    CloseDataSource = False
    FieldAliases.Strings = (
      'nmEmpresa=nmempresa'
      'deCnpj=decnpj'
      'nuInscEst=nuinscest'
      'cdColaborador=cdcolaborador'
      'nmColaborador=nmcolaborador'
      'cdCodigoFolha=cdcodigofolha'
      'nuPis=nupis'
      'nuCtps=nuctps'
      'deCtpsSerie=dectpsserie'
      'dtAdmissao=dtadmissao'
      'deCargo=decargo'
      'deSetor=desetor'
      'dtPonto=dtponto'
      'deHoraPonto=dehoraponto'
      'flEntSai=flentsai'
      'deDiaSemana=deDiaSemana'
      'deGrupoDia=deGrupoDia')
    DataSet = vtColabPonto
    BCDToCurrency = False
    Left = 146
    Top = 336
  end
  object relColabPonto: TfrxReport
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
      'procedure mTextoRodapeOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mTextoRodape.Text := TextoRodape;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relColabPontoUserFunction
    Left = 219
    Top = 335
    Datasets = <
      item
        DataSet = dbColabPonto
        DataSetName = 'frxDBColabPonto'
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
            'Cart'#227'o Ponto')
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
        Top = 646.299630000000000000
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 79.543290000000000000
        ParentFont = False
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dbColabPonto
        DataSetName = 'frxDBColabPonto'
        RowCount = 0
        Stretched = True
        object DBCross1: TfrxDBCrossView
          Width = 218.795300000000000000
          Height = 75.527559060000000000
          AutoSize = False
          Border = False
          DownThenAcross = False
          ShowColumnTotal = False
          ShowCorner = False
          ShowRowTotal = False
          ShowTitle = False
          CellFields.Strings = (
            'dehoraponto')
          ColumnFields.Strings = (
            'flentsai')
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          RowFields.Strings = (
            'deGrupoDia')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F56696577204C6566743D223133352C
            32333632342220546F703D223339362C3831393132393533222057696474683D
            2236332C353539303622204865696768743D2231372C37363337373935332220
            5265737472696374696F6E733D2232342220416C6C6F7745787072657373696F
            6E733D2246616C73652220466F6E742E436861727365743D22312220466F6E74
            2E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E
            742E4E616D653D22436F7572696572204E65772220466F6E742E5374796C653D
            22302220476170583D22332220476170593D2233222048416C69676E3D226861
            43656E7465722220506172656E74466F6E743D2246616C7365222056416C6967
            6E3D22766143656E7465722220546578743D2230222F3E3C546672784D656D6F
            56696577204C6566743D2238312220546F703D223636222057696474683D2238
            3022204865696768743D22323222205265737472696374696F6E733D22323422
            20416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E
            5479703D2231352220476170583D22332220476170593D2233222048416C6967
            6E3D2268615269676874222056416C69676E3D22766143656E74657222205465
            78743D2230222F3E3C546672784D656D6F56696577204C6566743D2231313422
            20546F703D223636222057696474683D22353922204865696768743D22323222
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C736522204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F56696577204C6566743D223136312220546F703D22363622205769647468
            3D22383122204865696768743D22323222205265737472696374696F6E733D22
            32342220416C6C6F7745787072657373696F6E733D2246616C73652220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322204841
            6C69676E3D2268615269676874222056416C69676E3D22766143656E74657222
            20546578743D2230222F3E3C2F63656C6C6D656D6F733E3C63656C6C68656164
            65726D656D6F733E3C546672784D656D6F56696577204C6566743D2230222054
            6F703D2230222057696474683D223022204865696768743D2230222052657374
            72696374696F6E733D22382220416C6C6F7745787072657373696F6E733D2246
            616C736522204672616D652E5479703D2231352220476170583D223322204761
            70593D2233222056416C69676E3D22766143656E7465722220546578743D2264
            65686F7261706F6E746F222F3E3C546672784D656D6F56696577204C6566743D
            22302220546F703D2230222057696474683D223022204865696768743D223022
            205265737472696374696F6E733D22382220416C6C6F7745787072657373696F
            6E733D2246616C736522204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222056416C69676E3D22766143656E74657222205465
            78743D226465686F7261706F6E746F222F3E3C2F63656C6C6865616465726D65
            6D6F733E3C636F6C756D6E6D656D6F733E3C546672784D656D6F56696577204C
            6566743D223133352C32333632342220546F703D223337392C30353533352220
            57696474683D2236332C353539303622204865696768743D2231372C37363337
            3739353322205265737472696374696F6E733D2232342220416C6C6F77457870
            72657373696F6E733D2246616C73652220466F6E742E436861727365743D2231
            2220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D31
            312220466F6E742E4E616D653D22436F7572696572204E65772220466F6E742E
            5374796C653D22302220476170583D22332220476170593D2233222048416C69
            676E3D22686143656E7465722220506172656E74466F6E743D2246616C736522
            2056416C69676E3D22766143656E7465722220546578743D22222F3E3C2F636F
            6C756D6E6D656D6F733E3C636F6C756D6E746F74616C6D656D6F733E3C546672
            784D656D6F56696577204C6566743D223133382220546F703D22323222205769
            6474683D22383122204865696768743D22323222205265737472696374696F6E
            733D2238222056697369626C653D2246616C73652220416C6C6F774578707265
            7373696F6E733D2246616C73652220466F6E742E436861727365743D22312220
            466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D313322
            20466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D2231
            22204672616D652E5479703D2231352220476170583D22332220476170593D22
            33222048416C69676E3D22686143656E7465722220506172656E74466F6E743D
            2246616C7365222056416C69676E3D22766143656E7465722220546578743D22
            4772616E6420546F74616C222F3E3C2F636F6C756D6E746F74616C6D656D6F73
            3E3C636F726E65726D656D6F733E3C546672784D656D6F56696577204C656674
            3D22302220546F703D2230222057696474683D22353822204865696768743D22
            323222205265737472696374696F6E733D2238222056697369626C653D224661
            6C73652220416C6C6F7745787072657373696F6E733D2246616C736522204672
            616D652E5479703D2231352220476170583D22332220476170593D2233222048
            416C69676E3D22686143656E746572222056416C69676E3D22766143656E7465
            722220546578743D2244617461222F3E3C546672784D656D6F56696577204C65
            66743D223133352C32333632342220546F703D223337392C3035353335222057
            696474683D2236332C353539303622204865696768743D223022205265737472
            696374696F6E733D2238222056697369626C653D2246616C73652220416C6C6F
            7745787072657373696F6E733D2246616C736522204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222048416C69676E3D226861
            43656E746572222056416C69676E3D22766143656E7465722220546578743D22
            666C656E74736169222F3E3C546672784D656D6F56696577204C6566743D2230
            2220546F703D2230222057696474683D223022204865696768743D2230222052
            65737472696374696F6E733D2238222056697369626C653D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C736522204672616D652E54
            79703D2231352220476170583D22332220476170593D2233222048416C69676E
            3D22686143656E746572222056416C69676E3D22766143656E74657222205465
            78743D22222F3E3C546672784D656D6F56696577204C6566743D22302220546F
            703D223232222057696474683D22353822204865696768743D22343422205265
            737472696374696F6E733D22382220416C6C6F7745787072657373696F6E733D
            2246616C736522204672616D652E5479703D2231352220476170583D22332220
            476170593D2233222048416C69676E3D22686143656E746572222056416C6967
            6E3D22766143656E7465722220546578743D226465477275706F446961222F3E
            3C2F636F726E65726D656D6F733E3C726F776D656D6F733E3C546672784D656D
            6F56696577204C6566743D2232302220546F703D223339362C38313931323935
            33222057696474683D223131352C323336323422204865696768743D2231372C
            373633373739353322205265737472696374696F6E733D2232342220416C6C6F
            7745787072657373696F6E733D2246616C73652220466F6E742E436861727365
            743D22312220466F6E742E436F6C6F723D22302220466F6E742E486569676874
            3D222D31312220466F6E742E4E616D653D22436F7572696572204E6577222046
            6F6E742E5374796C653D22302220476170583D22332220476170593D22332220
            506172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E
            7465722220546578743D22222F3E3C2F726F776D656D6F733E3C726F77746F74
            616C6D656D6F733E3C546672784D656D6F56696577204C6566743D2230222054
            6F703D223636222057696474683D22383122204865696768743D223232222052
            65737472696374696F6E733D2238222056697369626C653D2246616C73652220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22312220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D31332220466F6E742E4E616D653D22417269616C2220466F6E
            742E5374796C653D223122204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D22686143656E746572222050
            6172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E74
            65722220546578743D224772616E6420546F74616C222F3E3C2F726F77746F74
            616C6D656D6F733E3C63656C6C66756E6374696F6E733E3C6974656D20302F3E
            3C2F63656C6C66756E6374696F6E733E3C636F6C756D6E736F72743E3C697465
            6D20302F3E3C2F636F6C756D6E736F72743E3C726F77736F72743E3C6974656D
            20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
      object ghColab: TfrxGroupHeader
        FillType = ftBrush
        Height = 181.417440000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBColabPonto."nmcolaborador"'
        object Memo2: TfrxMemoView
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Empresa:')
          ParentFont = False
        end
        object frxDBColabPontonmempresa: TfrxMemoView
          Left = 94.708720000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          DataField = 'nmempresa'
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBColabPonto."nmempresa"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Top = 22.677179999999990000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'CNPJ:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 94.708720000000000000
          Top = 22.677179999999990000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Memo.UTF8W = (
            '[frxDBColabPonto."decnpj"]')
        end
        object Memo6: TfrxMemoView
          Top = 45.354360000000010000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Inscri'#231#227'o Est.:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 94.708720000000000000
          Top = 45.354360000000010000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Memo.UTF8W = (
            '[frxDBColabPonto."nuinscest"]')
        end
        object Memo8: TfrxMemoView
          Top = 68.031540000000010000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 94.708720000000000000
          Top = 68.031540000000010000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBColabPonto."nmcolaborador"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Top = 90.708720000000000000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'N'#186' Folha:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 94.708720000000000000
          Top = 90.708720000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Memo.UTF8W = (
            '[frxDBColabPonto."cdcodigofolha"]')
        end
        object Memo12: TfrxMemoView
          Top = 113.385900000000000000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'CTPS:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 94.708720000000000000
          Top = 113.385900000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Memo.UTF8W = (
            
              '[IIF(<frxDBColabPonto."dectpsserie"> = '#39#39', <frxDBColabPonto."nuc' +
              'tps">, <frxDBColabPonto."nuctps"> + '#39'/'#39' + <frxDBColabPonto."dect' +
              'psserie">)]')
        end
        object Memo14: TfrxMemoView
          Top = 136.063080000000000000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Fun'#231#227'o:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 94.708720000000000000
          Top = 136.063080000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Memo.UTF8W = (
            '[frxDBColabPonto."decargo"]')
        end
        object Memo16: TfrxMemoView
          Top = 158.740260000000000000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Departamento:')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 94.708720000000000000
          Top = 158.740260000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Memo.UTF8W = (
            '[frxDBColabPonto."desetor"]')
        end
        object Memo18: TfrxMemoView
          Left = 220.448980000000000000
          Top = 90.708720000000000000
          Width = 96.377974720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'N'#186' PIS/PASEP:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 315.157700000000000000
          Top = 90.708720000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Memo.UTF8W = (
            '[frxDBColabPonto."nupis"]')
        end
        object Memo20: TfrxMemoView
          Left = 246.905690000000000000
          Top = 113.385900000000000000
          Width = 69.921264720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Admiss'#227'o:')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 315.157700000000000000
          Top = 113.385900000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          DisplayFormat.Kind = fkDateTime
          Memo.UTF8W = (
            '[frxDBColabPonto."dtadmissao"]')
        end
        object Memo22: TfrxMemoView
          Left = 410.086890000000000000
          Width = 289.134004720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haBlock
          Memo.UTF8W = (
            'Hor'#225'rio de Trabalho')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 447.086890000000000000
          Top = 18.897650000000000000
          Width = 289.134004720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            'ENT 1   SAI 1  ENT 2    SAI 2   ENT 3  SAI 3')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 410.086890000000000000
          Top = 37.795300000000000000
          Width = 213.543404720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            'SEG   07:20   11:30   13:20   18:00')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 413.086890000000000000
          Top = 56.692949999999990000
          Width = 209.763874720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            'TER   07:20   11:30   13:20   18:00')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 410.086890000000000000
          Top = 75.590600000000000000
          Width = 213.543404720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            'QUA   07:20   11:30   13:20   18:00')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 416.086890000000000000
          Top = 94.488250000000000000
          Width = 213.543404720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            'QUI   07:20   11:30   13:20   18:00')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 413.086890000000000000
          Top = 113.385900000000000000
          Width = 213.543404720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            'SEX   07:20   11:30   13:20   17:50')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 412.086890000000000000
          Top = 132.283550000000000000
          Width = 300.472594720000100000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'SAB   Extra    Extra    Extra    Extra   Extra   Extra')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 408.976377950000000000
          Top = 151.181200000000000000
          Width = 300.472594720000100000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'DOM   Extra    Extra    Extra    Extra   Extra   Extra')
          ParentFont = False
        end
      end
      object gfColab: TfrxGroupFooter
        FillType = ftBrush
        Height = 124.724490000000000000
        Top = 461.102660000000000000
        Width = 718.110700000000000000
        object mTextoRodape: TfrxMemoView
          Top = 3.779530000000022000
          Width = 716.220894720000000000
          Height = 49.133890000000000000
          OnBeforePrint = 'mTextoRodapeOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haBlock
          Memo.UTF8W = (
            
              'Reconhe'#231'o a exatid'#227'o das horas constantes de acordo com minha fr' +
              'equ'#234'ncia neste intervalo 00/00/000 a 00/00/0000. Nos termos da P' +
              'ortaria MTB No. 3626 de 13/11/1991, artigo 13, o presente Cart'#227'o' +
              ' Ponto substitui o quadro de hor'#225'rio de Trabalho. Inclusive Fich' +
              'a de Hor'#225'rio de Trabalho Externo.')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 3.779530000000000000
          Top = 98.267779999999900000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBColabPonto."nmcolaborador"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 374.173470000000000000
          Top = 98.267779999999900000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = dbColabPonto
          DataSetName = 'frxDBColabPonto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            '  ')
          ParentFont = False
        end
      end
    end
  end
  object frxCrossObj: TfrxCrossObject
    Left = 287
    Top = 336
  end
  object vtColabPonto: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    FieldDefs = <
      item
        Name = 'nmEmpresa'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'deCnpj'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'nuInscEst'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cdColaborador'
        DataType = ftInteger
      end
      item
        Name = 'nmColaborador'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'cdCodigoFolha'
        DataType = ftInteger
      end
      item
        Name = 'nuPis'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'nuCtps'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'deCtpsSerie'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'dtAdmissao'
        DataType = ftDate
      end
      item
        Name = 'deCargo'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'deSetor'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'dtPonto'
        DataType = ftDate
      end
      item
        Name = 'deHoraPonto'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'flEntSai'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'deDiaSemana'
        DataType = ftString
        Size = 3
      end>
    Left = 147
    Top = 282
    Data = {
      0300100009006E6D456D70726573610100FA000000000006006465436E706A01
      001E000000000009006E75496E736345737401001400000000000D006364436F
      6C61626F7261646F7203000000000000000D006E6D436F6C61626F7261646F72
      0100FA00000000000D006364436F6469676F466F6C6861030000000000000005
      006E7550697301000B000000000006006E754374707301001400000000000B00
      646543747073536572696501000A00000000000A00647441646D697373616F09
      0000000000000007006465436172676F0100FA0000000000070064655365746F
      720100FA000000000007006474506F6E746F09000000000000000B006465486F
      7261506F6E746F01000500000000000800666C456E7453616901000100000000
      000B00646544696153656D616E610100030000000000000000000000}
    object vtColabPontonmEmpresa: TStringField
      FieldName = 'nmEmpresa'
      Size = 250
    end
    object vtColabPontodeCnpj: TStringField
      FieldName = 'deCnpj'
      Size = 30
    end
    object vtColabPontonuInscEst: TStringField
      FieldName = 'nuInscEst'
    end
    object vtColabPontocdColaborador: TIntegerField
      FieldName = 'cdColaborador'
    end
    object vtColabPontonmColaborador: TStringField
      FieldName = 'nmColaborador'
      Size = 250
    end
    object vtColabPontocdCodigoFolha: TIntegerField
      FieldName = 'cdCodigoFolha'
    end
    object vtColabPontonuPis: TStringField
      FieldName = 'nuPis'
      Size = 11
    end
    object vtColabPontonuCtps: TStringField
      FieldName = 'nuCtps'
    end
    object vtColabPontodeCtpsSerie: TStringField
      FieldName = 'deCtpsSerie'
      Size = 10
    end
    object vtColabPontodtAdmissao: TDateField
      FieldName = 'dtAdmissao'
    end
    object vtColabPontodeCargo: TStringField
      FieldName = 'deCargo'
      Size = 250
    end
    object vtColabPontodeSetor: TStringField
      FieldName = 'deSetor'
      Size = 250
    end
    object vtColabPontodtPonto: TDateField
      FieldName = 'dtPonto'
    end
    object vtColabPontodeHoraPonto: TStringField
      FieldName = 'deHoraPonto'
      Size = 5
    end
    object vtColabPontoflEntSai: TStringField
      DisplayWidth = 10
      FieldName = 'flEntSai'
      Size = 10
    end
    object vtColabPontodeDiaSemana: TStringField
      FieldName = 'deDiaSemana'
      Size = 3
    end
    object vtColabPontodeGrupoDia: TStringField
      FieldName = 'deGrupoDia'
    end
  end
end
