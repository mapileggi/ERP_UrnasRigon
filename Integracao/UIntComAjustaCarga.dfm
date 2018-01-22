object FIntComAjustaCarga: TFIntComAjustaCarga
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Ajustar Cargas'
  ClientHeight = 488
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    783
    488)
  PixelsPerInch = 96
  TextHeight = 13
  object lbcdPedido: TLabel
    Left = 14
    Top = 34
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pedido:'
  end
  object lbcdCarga: TLabel
    Left = 17
    Top = 10
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Carga:'
  end
  object btSalvar: TBitBtn
    Left = 670
    Top = 1
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = '&Salvar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 5
    OnClick = btSalvarClick
  end
  object btFechar: TBitBtn
    Left = 724
    Top = 1
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = '&Fechar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 6
    OnClick = btFecharClick
  end
  object btConsultar: TBitBtn
    Left = 616
    Top = 1
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
  object grDados: TDBGrid
    Left = 0
    Top = 144
    Width = 779
    Height = 338
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsPedidoEmCarga
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'recnum'
        Title.Caption = 'RecNum'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo_grupoPed'
        ReadOnly = True
        Title.Caption = 'N'#186' Carga'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nro_pedido'
        ReadOnly = True
        Title.Caption = 'Pedido'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo_transp'
        ReadOnly = True
        Title.Caption = 'C'#243'd. Transp.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_emissao'
        ReadOnly = True
        Title.Caption = 'Data Emiss'#227'o'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacao'
        Title.Caption = 'Desc. Carga'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'seq'
        Title.Caption = 'Seq.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'flag_faturado'
        Title.Caption = 'Faturado'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dt_embarque'
        Title.Caption = 'Data Embarque'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hora_embarque'
        Title.Caption = 'Hora Emb.'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cubagem'
        Title.Caption = 'Cubagem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'peso_liquido'
        Title.Caption = 'Peso L'#237'quido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'peso_bruto'
        Title.Caption = 'Peso Bruto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cod_veiculo'
        Title.Caption = 'C'#243'd. Ve'#237'culo'
        Visible = True
      end
      item
        Expanded = False
        ImeName = 'cod_condutor'
        Title.Caption = 'C'#243'd. Condutor'
        Visible = True
      end>
  end
  object edcdPedido: TDBCampoCodigo
    Left = 52
    Top = 31
    Width = 392
    Height = 21
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
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
      '        SELECT p.dt_emissao       AS dtEmissao,'
      '               p.nro_pedido       AS cdPedido,'
      '               p.tipo_pedido      AS tpPedido,'
      '               p.status_pedido    AS flStatusPed,'
      '               p.codigo_cliente   AS cdCliente,'
      '               c.razao_social     AS deRazaoSocial,'
      '               c.fantasia         AS deFantasia,'
      
        '               p.codigo_cliente || '#39' - '#39' || c.razao_social AS de' +
        'Caption'
      '          FROM pedido p '
      
        '         INNER JOIN cliente c ON (c.codigo_cliente = p.codigo_cl' +
        'iente)'
      '       ORDER BY p.nro_pedido DESC'
      '      ) t '
      '  &filtro')
    ERPCamposFiltro.Strings = (
      'cdPedido'
      'tpPedido'
      'dtEmissao'
      'flStatusPed'
      'cdCliente'
      'deRazaoSocial'
      'deFantasia')
    ERPCamposFiltroTitulo.Strings = (
      'N'#250'mero'
      'Tipo'
      'Emiss'#227'o'
      'Status'
      'Cliente'
      'Raz'#227'o Social'
      'Fantasia')
    ERPCampoChave = 'cdPedido'
    ERPCampoDescricao = 'deCaption'
    ERPConnection = DmIntegracao.fdConnInteg
    ERPCampoChaveDataType = ftInteger
  end
  object btSalvarPedEsc: TBitBtn
    Left = 51
    Top = 54
    Width = 26
    Height = 26
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 2
    OnClick = btSalvarPedEscClick
  end
  object btExluirPedEsc: TBitBtn
    Left = 76
    Top = 54
    Width = 26
    Height = 26
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 3
    OnClick = btExluirPedEscClick
  end
  object grPedidosEscolhidos: TDBGrid
    Left = 108
    Top = 55
    Width = 671
    Height = 83
    Anchors = [akLeft, akTop, akRight]
    DataSource = dsPedidosEscolhidos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'cdPedido'
        Title.Caption = 'Pedido'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tpPedido'
        Title.Caption = 'Tipo'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'flStatusPed'
        Title.Caption = 'Status'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dtEmissao'
        Title.Caption = 'Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deRazaoSocial'
        Title.Caption = 'Raz'#227'o Social'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deFantasia'
        Title.Caption = 'Fantasia'
        Width = 200
        Visible = True
      end>
  end
  object edcdCarga: TDBCampoCodigo
    Left = 52
    Top = 7
    Width = 392
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
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
  object dsPedidoEmCarga: TDataSource
    AutoEdit = False
    DataSet = vtPedidoEmCarga
    Left = 56
    Top = 240
  end
  object qyPedidoEmCarga: TFDQuery
    Connection = DmIntegracao.fdConnInteg
    SQL.Strings = (
      'SELECT COALESCE((SELECT MAX(c.recnum) FROM grupoPed c), 0) + '
      '       ROW_NUMBER() OVER() AS recnum,'
      '       t.*'
      '  FROM ('
      '        SELECT c.codigo_grupoPed, '
      '               p.nro_pedido,'
      '               p.codigo_transp,'
      '               p.dt_emissao AS data_emissao,'
      '               c.observacao, '
      '               c.seq + ROW_NUMBER() OVER() AS seq, '
      '               '#39'S'#39' AS flag_faturado, '
      '               c.dt_embarque, '
      '               c.hora_embarque, '
      '               p.cubagem, '
      '               p.peso_liquido, '
      '               p.peso_bruto, '
      '               c.cod_veiculo, '
      '               c.cod_condutor'
      '          FROM pedido p,'
      '               ('
      '                SELECT a.codigo_grupoPed, '
      '                       a.observacao, '
      '                       a.seq, '
      '                       a.dt_embarque, '
      '                       a.hora_embarque, '
      '                       a.cubagem, '
      '                       a.peso_liquido, '
      '                       a.peso_bruto, '
      '                       a.cod_veiculo, '
      '                       a.cod_condutor'
      '                  FROM grupoPed a'
      '                 WHERE a.codigo_grupoPed = :cdCarga'
      '                 ORDER BY a.seq DESC'
      '                 LIMIT 1       '
      '               ) c'
      '         WHERE p.status_pedido = '#39'T'#39
      '           AND NOT EXISTS ('
      '                           SELECT x.codigo_grupoPed'
      '                             FROM grupoPed x'
      '                            WHERE x.nro_pedido = p.nro_pedido'
      '                          )'
      '           AND p.nro_pedido IN (&listaPed)'
      '         ORDER BY p.nro_pedido'
      '       ) t')
    Left = 182
    Top = 240
    ParamData = <
      item
        Name = 'CDCARGA'
        ParamType = ptInput
      end>
    MacroData = <
      item
        Value = Null
        Name = 'LISTAPED'
      end>
  end
  object vtPedidosEscolhidos: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 424
    Top = 283
    Data = {03000000000000000000}
    object vtPedidosEscolhidoscdPedido: TIntegerField
      FieldName = 'cdPedido'
    end
    object vtPedidosEscolhidostpPedido: TStringField
      FieldName = 'tpPedido'
      Size = 1
    end
    object vtPedidosEscolhidosdtEmissao: TDateField
      FieldName = 'dtEmissao'
    end
    object vtPedidosEscolhidosflStatusPed: TStringField
      FieldName = 'flStatusPed'
      Size = 1
    end
    object vtPedidosEscolhidoscdCliente: TIntegerField
      FieldName = 'cdCliente'
    end
    object vtPedidosEscolhidosdeRazaoSocial: TStringField
      FieldName = 'deRazaoSocial'
      Size = 300
    end
    object vtPedidosEscolhidosdeFantasia: TStringField
      FieldName = 'deFantasia'
      Size = 300
    end
  end
  object dsPedidosEscolhidos: TDataSource
    AutoEdit = False
    DataSet = vtPedidosEscolhidos
    Left = 522
    Top = 283
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
  object pmSalvar: TPopupMenu
    Left = 492
    Top = 8
    object pmiPedidosEmCarga: TMenuItem
      Caption = 'Pedidos em carga'
      OnClick = pmiPedidosEmCargaClick
    end
    object pmiDescricaoCarga: TMenuItem
      Caption = 'Descri'#231#227'o carga'
      OnClick = pmiDescricaoCargaClick
    end
  end
end
