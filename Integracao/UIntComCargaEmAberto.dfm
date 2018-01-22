object FIntComCargaEmAberto: TFIntComCargaEmAberto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Cargas Em Aberto'
  ClientHeight = 544
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnCampos: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 85
    Align = alTop
    TabOrder = 0
    DesignSize = (
      994
      85)
    object lbDuploClicObs: TLabel
      Left = 8
      Top = 58
      Width = 463
      Height = 19
      Anchors = [akLeft, akBottom]
      Caption = 'Duplo clic na linha da grid para visualizar as observa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btFechar: TBitBtn
      Left = 186
      Top = 0
      Width = 55
      Height = 52
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      TabStop = False
      OnClick = btFecharClick
    end
    object btConsultar: TBitBtn
      Left = 1
      Top = 0
      Width = 55
      Height = 52
      Caption = '&Consultar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btConsultarClick
    end
    object btImprimir: TBitBtn
      Left = 55
      Top = 0
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
    object btAlertasCarga: TBitBtn
      Left = 109
      Top = 0
      Width = 78
      Height = 52
      Caption = '&Alertas Carga'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 3
      TabStop = False
      OnClick = btAlertasCargaClick
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 85
    Width = 994
    Height = 459
    Align = alClient
    TabOrder = 1
    object grDados: TDBGrid
      Left = 1
      Top = 1
      Width = 992
      Height = 457
      Align = alClient
      DataSource = dsIntComCargaPesq
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = grDadosDrawColumnCell
      OnDblClick = grDadosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cdCarga'
          Title.Caption = 'Carga'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deCarga'
          Title.Caption = 'Descri'#231#227'o'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuPintura'
          Title.Caption = 'N'#186' Pintura'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmMotorista'
          Title.Caption = 'Motorista'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmAjudante'
          Title.Caption = 'Ajudante'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dePlaca'
          Title.Caption = 'Placa'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dtSaida'
          Title.Alignment = taCenter
          Title.Caption = 'Data Sa'#237'da'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dtIniCarreg'
          Title.Caption = 'Dt. Iniciou Carreg.'
          Width = 95
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'hrIniCarreg'
          Title.Caption = 'Hr. Iniciou Carreg.'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flTemAlerta'
          Title.Alignment = taCenter
          Title.Caption = 'Tem Alerta?'
          Width = 69
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flTemObs'
          Title.Alignment = taCenter
          Title.Caption = 'Tem Obs.?'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuQtdeCarga'
          Title.Caption = 'Qtde.'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flSetorLixa'
          Title.Alignment = taCenter
          Title.Caption = 'Cristiano'
          Width = 52
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flSetorFaturamento'
          Title.Alignment = taCenter
          Title.Caption = 'FTM'
          Width = 26
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flSetorExpedicao'
          Title.Alignment = taCenter
          Title.Caption = 'Mot.'
          Visible = True
        end>
    end
  end
  object dsIntComCargaPesq: TDataSource
    AutoEdit = False
    DataSet = vtIntComCargaPesq
    Left = 359
    Top = 17
  end
  object vtIntComCargaPesq: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'dtSaida,cdCarga'
    FieldDefs = <
      item
        Name = 'cdCarga'
        DataType = ftInteger
      end
      item
        Name = 'deCarga'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'nuPintura'
        DataType = ftInteger
      end
      item
        Name = 'nmMotorista'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'nmAjudante'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'dePlaca'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'dtSaida'
        DataType = ftDate
      end
      item
        Name = 'flTemObs'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'nuQtdeCarga'
        DataType = ftInteger
      end
      item
        Name = 'deObsSistema'
        DataType = ftString
        Size = 4000
      end
      item
        Name = 'cdPrioridade'
        DataType = ftInteger
      end>
    Left = 481
    Top = 18
    Data = {
      03000B0007006364436172676103000000000000000700646543617267610100
      F4010000000009006E7550696E7475726103000000000000000B006E6D4D6F74
      6F72697374610100FA00000000000A006E6D416A7564616E74650100FA000000
      000007006465506C61636101000A000000000007006474536169646109000000
      000000000800666C54656D4F627301000100000000000B006E75517464654361
      72676103000000000000000C0064654F627353697374656D610100A00F000000
      000C0063645072696F7269646164650300000000000000000000000000}
    object vtIntComCargaPesqcdCarga: TIntegerField
      FieldName = 'cdCarga'
    end
    object vtIntComCargaPesqdeCarga: TStringField
      FieldName = 'deCarga'
      Size = 500
    end
    object vtIntComCargaPesqnupintura: TIntegerField
      FieldName = 'nuPintura'
    end
    object vtIntComCargaPesqnmMotorista: TStringField
      FieldName = 'nmMotorista'
      Size = 250
    end
    object vtIntComCargaPesqnmAjudante: TStringField
      FieldName = 'nmAjudante'
      Size = 250
    end
    object vtIntComCargaPesqdePlaca: TStringField
      FieldName = 'dePlaca'
      Size = 10
    end
    object vtIntComCargaPesqdtSaida: TDateField
      FieldName = 'dtSaida'
    end
    object vtIntComCargaPesqflTemObs: TStringField
      FieldName = 'flTemObs'
      Size = 1
    end
    object vtIntComCargaPesqnuQtdeCarga: TIntegerField
      FieldName = 'nuQtdeCarga'
    end
    object vtIntComCargaPesqdeObsSistema: TStringField
      FieldName = 'deObsSistema'
      Size = 4000
    end
    object vtIntComCargaPesqcdPrioridade: TIntegerField
      FieldName = 'cdPrioridade'
    end
    object vtIntComCargaPesqflSetorLixa: TStringField
      FieldName = 'flSetorLixa'
      OnGetText = vtIntComCargaPesqflSetorLixaGetText
      Size = 1
    end
    object vtIntComCargaPesqflSetorFaturamento: TStringField
      FieldName = 'flSetorFaturamento'
      OnGetText = vtIntComCargaPesqflSetorFaturamentoGetText
      Size = 1
    end
    object vtIntComCargaPesqflSetorExpedicao: TStringField
      FieldName = 'flSetorExpedicao'
      OnGetText = vtIntComCargaPesqflSetorExpedicaoGetText
      Size = 1
    end
    object vtIntComCargaPesqflTemAlerta: TStringField
      FieldName = 'flTemAlerta'
      Size = 1
    end
    object vtIntComCargaPesqdtIniCarreg: TDateField
      FieldName = 'dtIniCarreg'
    end
    object vtIntComCargaPesqhrIniCarreg: TStringField
      FieldName = 'hrIniCarreg'
      Size = 5
    end
  end
  object relCargas: TfrxReport
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
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frxDBRelCargas."cdPrioridade"> = 2 then'
      '    MasterData1.Font.Color := clBlue'
      '  else if <frxDBRelCargas."cdPrioridade"> = 3 then'
      '    MasterData1.Font.Color := clRed'
      '  else'
      '    MasterData1.Font.Color := clBlack;                 '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relCargasUserFunction
    Left = 227
    Top = 147
    Datasets = <
      item
        DataSet = dbRelCargas
        DataSetName = 'frxDBRelCargas'
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897637800000000000
        ParentFont = False
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Child = relCargas.Child1
        DataSet = dbRelCargas
        DataSetName = 'frxDBRelCargas'
        RowCount = 0
        Stretched = True
        object frxDBRelCargascdCarga: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'cdCarga'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelCargas."cdCarga"]')
        end
        object frxDBRelCargasdeCarga: TfrxMemoView
          Left = 45.354360000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'deCarga'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          Memo.UTF8W = (
            '[frxDBRelCargas."deCarga"]')
        end
        object frxDBRelCargasnuQtdeCarga: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'nuQtdeCarga'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelCargas."nuQtdeCarga"]')
        end
        object frxDBRelCargasnuPintura: TfrxMemoView
          Left = 181.417440000000000000
          Width = 18.897637795275600000
          Height = 18.897650000000000000
          DataField = 'nuPintura'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          Memo.UTF8W = (
            '[frxDBRelCargas."nuPintura"]')
        end
        object frxDBRelCargasnmMotorista: TfrxMemoView
          Left = 202.094620000000000000
          Width = 170.078727950000000000
          Height = 18.897650000000000000
          DataField = 'nmMotorista'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          Memo.UTF8W = (
            '[frxDBRelCargas."nmMotorista"]')
        end
        object frxDBRelCargasnmAjudante: TfrxMemoView
          Left = 375.173199060000000000
          Width = 136.062987240000000000
          Height = 18.897650000000000000
          DataField = 'nmAjudante'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          Memo.UTF8W = (
            '[frxDBRelCargas."nmAjudante"]')
        end
        object frxDBRelCargasdePlaca: TfrxMemoView
          Left = 513.016080000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'dePlaca'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          Memo.UTF8W = (
            '[frxDBRelCargas."dePlaca"]')
        end
        object frxDBRelCargasdtSaida: TfrxMemoView
          Left = 587.827150000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtSaida'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelCargas."dtSaida"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110553540000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cargas Em Aberto')
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
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 761.465060000000000000
          Top = 0.677180000000021200
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
          Top = 0.677180000000021200
          Width = 1046.929150940000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object mUsuDataHora: TfrxMemoView
          Top = 0.677180000000021200
          Width = 743.055564800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = dbRelCargas
          DataSetName = 'frxDBRelCargas'
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
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Line2: TfrxLineView
          Top = 19.677179999999990000
          Width = 718.110236220471900000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 30.236240000000000000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Carga')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 181.417317950000000000
          Width = 18.897596300000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 201.960622600000000000
          Width = 170.078796300000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Motorista')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 375.173470000000000000
          Width = 136.062987240000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ajudante')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 513.016080000000000000
          Width = 71.811016300000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Placa')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 587.716520790000000000
          Width = 79.370076300000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data Sa'#237'da')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 668.976810000000000000
          Width = 45.354306300000000000
          Height = 18.897650000000000000
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
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 1.889763779527560000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Top = 0.377952759999999400
          Width = 718.110236220471900000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 652.079160000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelCargas."nuQtdeCarga">,MasterData1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 591.827150000000000000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object dbRelCargas: TfrxDBDataset
    UserName = 'frxDBRelCargas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdCarga=cdCarga'
      'deCarga=deCarga'
      'nuPintura=nuPintura'
      'nmMotorista=nmMotorista'
      'nmAjudante=nmAjudante'
      'dePlaca=dePlaca'
      'dtSaida=dtSaida'
      'flTemObs=flTemObs'
      'nuQtdeCarga=nuQtdeCarga'
      'deObsSistema=deObsSistema'
      'cdPrioridade=cdPrioridade')
    DataSet = vtIntComCargaPesq
    BCDToCurrency = False
    Left = 141
    Top = 147
  end
end
