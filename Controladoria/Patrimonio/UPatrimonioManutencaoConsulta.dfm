object FPatrimonioManutencaoConsulta: TFPatrimonioManutencaoConsulta
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Consulta de Manuten'#231#227'o de Patrim'#244'nio'
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
      Left = 4
      Top = 1
      Width = 932
      Height = 93
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Filtros: '
      TabOrder = 0
      DesignSize = (
        932
        93)
      object lbdtManutencao: TLabel
        Left = 12
        Top = 17
        Width = 89
        Height = 13
        Caption = 'Data Manuten'#231#227'o:'
      end
      object lbdtManutencaoA: TLabel
        Left = 220
        Top = 17
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbdePatrimonio: TLabel
        Left = 17
        Top = 66
        Width = 84
        Height = 13
        Caption = 'Desc. Patrim'#244'nio:'
      end
      object lbcdPatrimonio: TLabel
        Left = 47
        Top = 41
        Width = 54
        Height = 13
        Caption = 'Patrim'#244'nio:'
      end
      object lbdtTerminoA: TLabel
        Left = 550
        Top = 17
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbdtTermino: TLabel
        Left = 364
        Top = 17
        Width = 68
        Height = 13
        Caption = 'Data T'#233'rmino:'
      end
      object lbcdSituacao: TLabel
        Left = 387
        Top = 66
        Width = 45
        Height = 13
        Caption = 'Situa'#231#227'o:'
      end
      object lbcdSetor: TLabel
        Left = 573
        Top = 66
        Width = 30
        Height = 13
        Caption = 'Setor:'
      end
      object eddtManutencaoIni: TDateTimePicker
        Left = 102
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        TabOrder = 0
      end
      object eddtManutencaoFim: TDateTimePicker
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
        Left = 819
        Top = 21
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Consultar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 8
        OnClick = btConsultarClick
      end
      object eddePatrimonio: TEdit
        Left = 102
        Top = 63
        Width = 242
        Height = 21
        TabOrder = 5
      end
      object edcdPatrimonio: TDBCampoCodigo
        Left = 102
        Top = 39
        Width = 570
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
          'SELECT t01.*'
          '  FROM ('
          '        SELECT p.cdPatrimonio,'
          '               p.nuPatrimonio,'
          '               p.dePatrimonio,'
          '               p.cdPatrimonioTipo,'
          '               pt.dePatrimonioTipo,'
          '               p.dtAquisicao,'
          '               p.cdSetor,'
          '               s.deSetor,'
          '               CAST(p.dePatrimonio || '#39' - N'#186' '#39' ||'
          
            '                         p.nuPatrimonio AS CHARACTER VARYING(250' +
            ')'
          '                   ) AS deDescPatr '
          '          FROM erp.patrimonio p'
          
            '          LEFT JOIN erp.patrimonioTipo pt ON (pt.cdPatrimonioTip' +
            'o = p.cdPatrimonioTipo)'
          
            '          LEFT JOIN erp.setor          s  ON (s.cdSetor = p.cdSe' +
            'tor)'
          '       ) t01 '
          ' &filtro')
        ERPCamposFiltro.Strings = (
          'cdPatrimonio'
          'nuPatrimonio'
          'dePatrimonio'
          'dePatrimonioTipo'
          'deSetor')
        ERPCamposFiltroTitulo.Strings = (
          'C'#243'digo'
          'N'#250'mero'
          'Descri'#231#227'o'
          'Tipo'
          'Setor')
        ERPCampoChave = 'cdPatrimonio'
        ERPCampoDescricao = 'deDescPatr'
        ERPConnection = DmERP.fdConnERP
        ERPCampoChaveDataType = ftInteger
      end
      object eddtTerminoFim: TDateTimePicker
        Left = 561
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685951053240000000
        Time = 42342.685951053240000000
        ShowCheckbox = True
        Checked = False
        TabOrder = 3
      end
      object eddtTerminoIni: TDateTimePicker
        Left = 432
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        Checked = False
        TabOrder = 2
      end
      object lcbcdSituacao: TDBLookupComboBox
        Left = 432
        Top = 63
        Width = 107
        Height = 21
        KeyField = 'cdsituacao'
        ListField = 'desituacao'
        ListSource = DmERP.dsPatrimonioSituacao
        TabOrder = 6
        TabStop = False
      end
      object lcbcdSetor: TDBLookupComboBox
        Left = 604
        Top = 63
        Width = 111
        Height = 21
        KeyField = 'cdsetor'
        ListField = 'desetor'
        ListSource = dsSetor
        TabOrder = 7
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
        TabOrder = 9
        OnClick = btFecharClick
      end
      object btLimparSetor: TBitBtn
        Left = 715
        Top = 63
        Width = 21
        Height = 21
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 10
        OnClick = btLimparSetorClick
      end
      object btLimparSit: TBitBtn
        Left = 539
        Top = 63
        Width = 21
        Height = 21
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 11
        OnClick = btLimparSitClick
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'flSelecionado'
          Title.Alignment = taCenter
          Title.Caption = 'Sel.'
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deSituacao'
          ReadOnly = True
          Title.Caption = 'Situa'#231#227'o'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdPatrimonioManutencao'
          ReadOnly = True
          Title.Caption = 'C'#243'd. Manut.'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dePatrimonio'
          ReadOnly = True
          Title.Caption = 'Patrim'#244'nio'
          Width = 198
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtManutencao'
          ReadOnly = True
          Title.Caption = 'Dt. Manut.'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deResponsavel'
          ReadOnly = True
          Title.Caption = 'Respons'#225'vel'
          Width = 149
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deManutencao'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 231
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtTermino'
          ReadOnly = True
          Title.Caption = 'Dt. T'#233'rmino'
          Width = 83
          Visible = True
        end>
    end
  end
  object dsDados: TDataSource
    DataSet = vtDados
    Left = 87
    Top = 121
  end
  object dsSetor: TDataSource
    AutoEdit = False
    DataSet = qySetor
    Left = 175
    Top = 121
  end
  object vtDados: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 312
    Top = 122
    Data = {03000000000000000000}
    object vtDadosflSelecionado: TStringField
      FieldName = 'flSelecionado'
      OnGetText = vtDadosflSelecionadoGetText
      Size = 1
    end
    object vtDadoscdSituacao: TIntegerField
      FieldName = 'cdSituacao'
    end
    object vtDadosdeSituacao: TStringField
      FieldName = 'deSituacao'
      Size = 25
    end
    object vtDadoscdPatrimonioManutencao: TIntegerField
      FieldName = 'cdPatrimonioManutencao'
    end
    object vtDadoscdPatrimonio: TIntegerField
      FieldName = 'cdPatrimonio'
    end
    object vtDadosdePatrimonio: TStringField
      FieldName = 'dePatrimonio'
      Size = 250
    end
    object vtDadosdtManutencao: TDateTimeField
      FieldName = 'dtManutencao'
    end
    object vtDadosderesponsavel: TStringField
      FieldName = 'deResponsavel'
      Size = 250
    end
    object vtDadosdeManutencao: TStringField
      FieldName = 'deManutencao'
      Size = 4000
    end
    object vtDadosdtTermino: TDateTimeField
      FieldName = 'dtTermino'
    end
  end
  object qySetor: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT s.cdSetor,'
      '               s.deSetor'
      '          FROM erp.setor s'
      '         ORDER BY s.cdSetor'
      '       ) t'
      ' &filtro')
    Left = 235
    Top = 125
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
end
