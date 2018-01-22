object FIntComCotaFinanceira: TFIntComCotaFinanceira
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Cotas Financeiras'
  ClientHeight = 541
  ClientWidth = 910
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
  object grDados: TDBGrid
    Left = 0
    Top = 55
    Width = 910
    Height = 486
    Align = alClient
    DataSource = dsDados
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cdrepresentante'
        ReadOnly = True
        Title.Caption = 'C'#243'd. Rep.'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmrepresentante'
        ReadOnly = True
        Title.Caption = 'Nome Rep.'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlfatprevisto'
        ReadOnly = True
        Title.Caption = 'Valor Fat. Previsto'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlmediaprevisto'
        Title.Caption = 'M'#233'dia Prevista'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmusualt'
        ReadOnly = True
        Title.Caption = 'Usu'#225'rio Alt.'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtalteracao'
        ReadOnly = True
        Title.Caption = 'Data Alt.'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dehralteracao'
        ReadOnly = True
        Title.Caption = 'Hora Alt.'
        Width = 90
        Visible = True
      end>
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 0
    Width = 910
    Height = 55
    Align = alTop
    TabOrder = 1
    object lbdePeriodo: TLabel
      Left = 9
      Top = 20
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo:'
    end
    object btFechar: TBitBtn
      Left = 194
      Top = 2
      Width = 55
      Height = 52
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btFecharClick
    end
    object btSalvar: TBitBtn
      Left = 140
      Top = 2
      Width = 55
      Height = 52
      Caption = '&Salvar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btSalvarClick
    end
    object eddePeriodo: TDBCampoCodigo
      Left = 51
      Top = 17
      Width = 86
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 2
      ERPCampoCodigoPK = False
      ERPCharCase = ecUpperCase
      ERPEdCampoChaveWidth = 60
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPOnEdCampoChaveExit = eddePeriodoERPOnEdCampoChaveExit
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
  end
  object dsDados: TDataSource
    DataSet = DmERP.qyIntComCotaFin
    Left = 56
    Top = 240
  end
  object vtPedidoEmCarga: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 296
    Top = 235
    Data = {03000000000000000000}
    object vtPedidoEmCargarecnum: TIntegerField
      FieldName = 'recnum'
    end
    object vtPedidoEmCargacodigo_grupoPed: TIntegerField
      FieldName = 'codigo_grupoPed'
    end
    object nro_pedido: TIntegerField
      FieldName = 'nro_pedido'
    end
    object vtPedidoEmCargacodigo_transp: TIntegerField
      FieldName = 'codigo_transp'
    end
    object vtPedidoEmCargadata_emissao: TDateField
      FieldName = 'data_emissao'
    end
    object vtPedidoEmCargaobservacao: TStringField
      FieldName = 'observacao'
      Size = 500
    end
    object vtPedidoEmCargaseq: TIntegerField
      FieldName = 'seq'
    end
    object vtPedidoEmCargaflag_faturado: TStringField
      FieldName = 'flag_faturado'
      Size = 1
    end
    object vtPedidoEmCargadt_embarque: TDateField
      FieldName = 'dt_embarque'
    end
    object vtPedidoEmCargahora_embarque: TStringField
      FieldName = 'hora_embarque'
      Size = 5
    end
    object vtPedidoEmCargacubagem: TFloatField
      FieldName = 'cubagem'
    end
    object vtPedidoEmCargapeso_liquido: TFloatField
      FieldName = 'peso_liquido'
    end
    object vtPedidoEmCargapeso_bruto: TFloatField
      FieldName = 'peso_bruto'
    end
    object vtPedidoEmCargacod_veiculo: TIntegerField
      FieldName = 'cod_veiculo'
    end
    object vtPedidoEmCargacod_condutor: TIntegerField
      FieldName = 'cod_condutor'
    end
  end
end
