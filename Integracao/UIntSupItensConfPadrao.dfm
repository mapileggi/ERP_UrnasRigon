object FIntSupItensConfPadrao: TFIntSupItensConfPadrao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Conf. Padr'#227'o Itens'
  ClientHeight = 548
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sbCampos: TScrollBox
    Left = 0
    Top = 0
    Width = 965
    Height = 56
    Align = alTop
    Color = clBtnFace
    ParentBackground = True
    ParentColor = False
    TabOrder = 0
    object lbcdItem: TLabel
      Left = 143
      Top = 19
      Width = 26
      Height = 13
      Caption = 'Item:'
    end
    object btProcurar: TBitBtn
      Left = 239
      Top = 0
      Width = 55
      Height = 52
      Caption = '&Procurar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btProcurarClick
    end
    object btSalvar: TBitBtn
      Left = 293
      Top = 0
      Width = 55
      Height = 52
      Caption = '&Salvar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 2
      OnClick = btSalvarClick
    end
    object btFechar: TBitBtn
      Left = 401
      Top = 0
      Width = 55
      Height = 52
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 4
      OnClick = btFecharClick
    end
    object edcdItem: TEdit
      Left = 170
      Top = 16
      Width = 62
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnKeyDown = edcdItemKeyDown
    end
    object btImprimir: TBitBtn
      Left = 347
      Top = 0
      Width = 55
      Height = 52
      Caption = '&Imprimir'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 3
      OnClick = btImprimirClick
    end
    object btConsultar: TBitBtn
      Left = 83
      Top = 0
      Width = 55
      Height = 52
      Caption = '&Consultar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 5
      OnClick = btConsultarClick
    end
    object cbSomenteItensAtivos: TCheckBox
      Left = 3
      Top = 11
      Width = 78
      Height = 29
      Caption = 'Somente Itens Ativos'
      Checked = True
      State = cbChecked
      TabOrder = 6
      WordWrap = True
    end
  end
  object sbDados: TScrollBox
    Left = 0
    Top = 56
    Width = 965
    Height = 492
    Align = alClient
    TabOrder = 1
    object grDados: TDBGrid
      Left = 0
      Top = 0
      Width = 961
      Height = 488
      Align = alClient
      DataSource = dsIntSupItensCfgPad
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grDadosCellClick
      OnDrawColumnCell = grDadosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'cditem'
          ReadOnly = True
          Title.Caption = 'Item'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flcobrarcor'
          Title.Alignment = taCenter
          Title.Caption = 'Cobrar Cor'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'detipoalca'
          Title.Caption = 'Tipo de Al'#231'a'
          Width = 191
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deadorno'
          Title.Caption = 'Adorno'
          Width = 210
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dechaveta'
          Title.Caption = 'Chaveta'
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deforracao'
          Title.Caption = 'Forra'#231#227'o'
          Width = 277
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdtipoalca'
          ReadOnly = True
          Title.Caption = 'C'#243'd. Tipo Al'#231'a'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdadorno'
          ReadOnly = True
          Title.Caption = 'C'#243'd. Adorno'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdchaveta'
          ReadOnly = True
          Title.Caption = 'C'#243'd. Chaveta'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdforracao'
          ReadOnly = True
          Title.Caption = 'C'#243'd. Forra'#231#227'o'
          Width = 64
          Visible = True
        end>
    end
  end
  object dsIntSupItensCfgPad: TDataSource
    DataSet = DmERP.qyIntSupItensCfgPad
    Left = 320
    Top = 3
  end
  object vtTipoAlca: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 402
    Top = 3
    Data = {03000000000000000000}
    object vtTipoAlcacdRecNum: TIntegerField
      FieldName = 'cdRecNum'
    end
    object vtTipoAlcacdVarItem: TIntegerField
      FieldName = 'cdVarItem'
    end
    object vtTipoAlcadeVarItem: TStringField
      FieldName = 'deVarItem'
      Size = 250
    end
    object vtTipoAlcacdSeq: TIntegerField
      FieldName = 'cdSeq'
    end
  end
  object vtAdorno: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 452
    Top = 3
    Data = {03000000000000000000}
    object vtAdornocdRecNum: TIntegerField
      FieldName = 'cdRecNum'
    end
    object vtAdornocdVarItem: TIntegerField
      FieldName = 'cdVarItem'
    end
    object vtAdornodeVarItem: TStringField
      FieldName = 'deVarItem'
      Size = 250
    end
    object vtAdornocdSeq: TIntegerField
      FieldName = 'cdSeq'
    end
  end
  object vtChaveta: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 502
    Top = 3
    Data = {03000000000000000000}
    object vtChavetacdRecNum: TIntegerField
      FieldName = 'cdRecNum'
    end
    object vtChavetacdVarItem: TIntegerField
      FieldName = 'cdVarItem'
    end
    object vtChavetadeVarItem: TStringField
      FieldName = 'deVarItem'
      Size = 250
    end
    object vtChavetacdSeq: TIntegerField
      FieldName = 'cdSeq'
    end
  end
  object vtForracao: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 556
    Top = 3
    Data = {03000000000000000000}
    object vtForracaocdRecNum: TIntegerField
      FieldName = 'cdRecNum'
    end
    object vtForracaocdVarItem: TIntegerField
      FieldName = 'cdVarItem'
    end
    object vtForracaodeVarItem: TStringField
      FieldName = 'deVarItem'
      Size = 250
    end
    object vtForracaocdSeq: TIntegerField
      FieldName = 'cdSeq'
    end
  end
  object dbRelConfPadrao: TfrxDBDataset
    UserName = 'frxDBRelConfPadrao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cditem=CDITEM'
      'cdtipoalcarecnum=cdtipoalcarecnum'
      'cdtipoalca=cdtipoalca'
      'detipoalca=detipoalca'
      'cdadornorecnum=cdadornorecnum'
      'cdadorno=cdadorno'
      'deadorno=deadorno'
      'cdchavetarecnum=cdchavetarecnum'
      'cdchaveta=cdchaveta'
      'dechaveta=dechaveta'
      'cdforracaorecnum=cdforracaorecnum'
      'cdforracao=cdforracao'
      'deforracao=deforracao'
      'dtcadastro=dtcadastro'
      'hrcadastro=hrcadastro'
      'cdusuariocadastro=cdusuariocadastro'
      'dtalteracao=dtalteracao'
      'hralteracao=hralteracao'
      'cdusuarioalteracao=cdusuarioalteracao')
    DataSet = DmERP.qyIntSupItensCfgPad
    BCDToCurrency = False
    Left = 141
    Top = 147
  end
  object relConfPadrao: TfrxReport
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
    OnUserFunction = relConfPadraoUserFunction
    Left = 227
    Top = 147
    Datasets = <
      item
        DataSet = dbRelConfPadrao
        DataSetName = 'frxDBRelConfPadrao'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118110240000000000
        ParentFont = False
        Top = 204.094620000000000000
        Width = 1046.929810000000000000
        Child = relConfPadrao.Child1
        DataSet = dbRelConfPadrao
        DataSetName = 'frxDBRelConfPadrao'
        RowCount = 0
        Stretched = True
        object frxDBRelListaProdITEM: TfrxMemoView
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'CDITEM'
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelConfPadrao."CDITEM"]')
          ParentFont = False
        end
        object frxDBRelListaPrecoDETAM: TfrxMemoView
          Left = 88.267780000000000000
          Width = 215.433210000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[IIF(Trim(<frxDBRelConfPadrao."detipoalca">) <> '#39#39', <frxDBRelCon' +
              'fPadrao."detipoalca">, '#39#39')]')
          ParentFont = False
        end
        object frxDBRelConfPadraocdtipoalca: TfrxMemoView
          Left = 59.811070000000000000
          Width = 26.456710000000000000
          Height = 15.118110240000000000
          DataField = 'cdtipoalca'
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelConfPadrao."cdtipoalca"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 332.157700000000000000
          Width = 215.433210000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[IIF(Trim(<frxDBRelConfPadrao."deAdorno">) <> '#39#39', <frxDBRelConfP' +
              'adrao."deAdorno">, '#39#39')]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 303.700990000000000000
          Width = 26.456710000000000000
          Height = 15.118110240000000000
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelConfPadrao."cdAdorno"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 576.945270000000000000
          Width = 215.433210000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[IIF(Trim(<frxDBRelConfPadrao."deChaveta">) <> '#39#39', <frxDBRelConf' +
              'Padrao."deChaveta">, '#39#39')]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 548.488560000000000000
          Width = 26.456710000000000000
          Height = 15.118110240000000000
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelConfPadrao."cdChaveta"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 820.173780000000000000
          Width = 215.433210000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              '[IIF(Trim(<frxDBRelConfPadrao."deForracao">) <> '#39#39', <frxDBRelCon' +
              'fPadrao."deForracao">, '#39#39')]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 791.717070000000000000
          Width = 26.456710000000000000
          Height = 15.118110240000000000
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelConfPadrao."cdForracao"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Top = 18.897650000000000000
          Width = 1046.929810000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Configura'#231#227'o Padr'#227'o das Urnas')
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
        Height = 19.574830000000000000
        Top = 306.141930000000000000
        Width = 1046.929810000000000000
        object TotalPages: TfrxMemoView
          Left = 965.559680000000000000
          Top = 0.677180000000000000
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
          Top = 0.677179999999998500
          Width = 1046.929150940000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object mUsuDataHora: TfrxMemoView
          Top = 0.677180000000000000
          Width = 966.047834800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = dbRelConfPadrao
          DataSetName = 'frxDBRelConfPadrao'
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
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 158.740260000000000000
        Width = 1046.929810000000000000
        ReprintOnNewPage = True
        object Line2: TfrxLineView
          Top = 19.677180000000000000
          Width = 1046.929150940000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Width = 60.472440944881890000
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
        object Memo3: TfrxMemoView
          Left = 59.740157480000000000
          Width = 245.669396300000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Al'#231'a')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 1046.929150940000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 303.787401570000000000
          Width = 241.889866300000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Adorno')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 548.456692910000000000
          Width = 243.779527560000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Chaveta')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 791.748031500000000000
          Width = 245.669396300000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Forra'#231#227'o')
          ParentFont = False
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 1.889763779527559000
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        object Line4: TfrxLineView
          Top = 0.377952755905511800
          Width = 1046.929150940000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object sdDadosExcel: TSaveDialog
    FileName = 'DadosWay'
    Filter = 'Arquivo CSV|.csv'
    Title = 'Exporta'#231#227'o de Dados Way'
    Left = 384
    Top = 112
  end
  object pmExportarExcel: TPopupMenu
    Left = 468
    Top = 112
    object pmiExportarExcel: TMenuItem
      Caption = 'Exportar Excel (.csv)'
      OnClick = pmiExportarExcelClick
    end
  end
end
