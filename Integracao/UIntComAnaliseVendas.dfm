object FIntComAnaliseVendas: TFIntComAnaliseVendas
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'An'#225'lise de Vendas'
  ClientHeight = 347
  ClientWidth = 775
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
  object lbUltimos: TLabel
    Left = 20
    Top = 70
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = #218'ltimos:'
  end
  object lbLimiteReg: TLabel
    Left = 236
    Top = 70
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = 'Limite de Registros:'
  end
  object edPeriodo: TEdit
    Left = 61
    Top = 67
    Width = 30
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object rbDias: TRadioButton
    Left = 103
    Top = 69
    Width = 41
    Height = 17
    Caption = 'Dias'
    TabOrder = 2
  end
  object rbMeses: TRadioButton
    Left = 151
    Top = 69
    Width = 58
    Height = 17
    Caption = 'Meses'
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object gbItemGrupo: TGroupBox
    Left = 3
    Top = 97
    Width = 203
    Height = 195
    Caption = ' Grupo de Item '
    TabOrder = 5
    DesignSize = (
      203
      195)
    object grItemGrupo: TDBGrid
      Left = 9
      Top = 21
      Width = 185
      Height = 164
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsItemGrupoFil
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grItemGrupoCellClick
      OnDrawColumnCell = grItemGrupoDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flselecionado'
          Title.Caption = 'Sel.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deitemgrupo'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 123
          Visible = True
        end>
    end
  end
  object gbItemSubGrupo: TGroupBox
    Left = 210
    Top = 97
    Width = 351
    Height = 195
    Caption = ' SubGrupo de Item '
    TabOrder = 6
    DesignSize = (
      351
      195)
    object grItemSubGrupo: TDBGrid
      Left = 9
      Top = 21
      Width = 333
      Height = 164
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsItemSubGrupoFil
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grItemSubGrupoCellClick
      OnDrawColumnCell = grItemSubGrupoDrawColumnCell
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flselecionado'
          Title.Caption = 'Sel.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deitemgrupo'
          ReadOnly = True
          Title.Caption = 'Grupo'
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deitemsubgrupo'
          Title.Caption = 'SubGrupo'
          Width = 169
          Visible = True
        end>
    end
  end
  object gbEstadosCli: TGroupBox
    Left = 567
    Top = 97
    Width = 148
    Height = 195
    Caption = ' Estados Clientes '
    TabOrder = 7
    object cbAC: TCheckBox
      Left = 6
      Top = 23
      Width = 36
      Height = 17
      Caption = 'AC'
      TabOrder = 0
    end
    object cbMT: TCheckBox
      Left = 59
      Top = 55
      Width = 36
      Height = 17
      Caption = 'MT'
      TabOrder = 12
    end
    object cbAL: TCheckBox
      Left = 6
      Top = 39
      Width = 36
      Height = 17
      Caption = 'AL'
      TabOrder = 1
    end
    object cbPA: TCheckBox
      Left = 59
      Top = 71
      Width = 36
      Height = 17
      Caption = 'PA'
      TabOrder = 13
    end
    object cbPE: TCheckBox
      Left = 59
      Top = 103
      Width = 36
      Height = 17
      Caption = 'PE'
      TabOrder = 15
    end
    object cbPB: TCheckBox
      Left = 59
      Top = 87
      Width = 36
      Height = 17
      Caption = 'PB'
      TabOrder = 14
    end
    object cbAP: TCheckBox
      Left = 6
      Top = 71
      Width = 36
      Height = 17
      Caption = 'AP'
      TabOrder = 3
    end
    object cbAM: TCheckBox
      Left = 6
      Top = 55
      Width = 36
      Height = 17
      Caption = 'AM'
      TabOrder = 2
    end
    object cbPR: TCheckBox
      Left = 59
      Top = 135
      Width = 36
      Height = 17
      Caption = 'PR'
      TabOrder = 17
    end
    object cbPI: TCheckBox
      Left = 59
      Top = 119
      Width = 36
      Height = 17
      Caption = 'PI'
      TabOrder = 16
    end
    object cbCE: TCheckBox
      Left = 6
      Top = 103
      Width = 36
      Height = 17
      Caption = 'CE'
      TabOrder = 5
    end
    object cbBA: TCheckBox
      Left = 6
      Top = 87
      Width = 36
      Height = 17
      Caption = 'BA'
      TabOrder = 4
    end
    object cbRN: TCheckBox
      Left = 59
      Top = 167
      Width = 36
      Height = 17
      Caption = 'RN'
      TabOrder = 19
    end
    object cbRJ: TCheckBox
      Left = 59
      Top = 151
      Width = 36
      Height = 17
      Caption = 'RJ'
      TabOrder = 18
    end
    object cbES: TCheckBox
      Left = 6
      Top = 135
      Width = 36
      Height = 17
      Caption = 'ES'
      TabOrder = 7
    end
    object cbDF: TCheckBox
      Left = 6
      Top = 119
      Width = 36
      Height = 17
      Caption = 'DF'
      TabOrder = 6
    end
    object cbGO: TCheckBox
      Left = 6
      Top = 151
      Width = 36
      Height = 17
      Caption = 'GO'
      TabOrder = 8
    end
    object cbMA: TCheckBox
      Left = 6
      Top = 167
      Width = 36
      Height = 17
      Caption = 'MA'
      TabOrder = 9
    end
    object cbRO: TCheckBox
      Left = 109
      Top = 23
      Width = 36
      Height = 17
      Caption = 'RO'
      TabOrder = 20
    end
    object cbRR: TCheckBox
      Left = 109
      Top = 39
      Width = 36
      Height = 17
      Caption = 'RR'
      TabOrder = 21
    end
    object cbMG: TCheckBox
      Left = 59
      Top = 23
      Width = 36
      Height = 17
      Caption = 'MG'
      TabOrder = 10
    end
    object cbMS: TCheckBox
      Left = 59
      Top = 39
      Width = 36
      Height = 17
      Caption = 'MS'
      TabOrder = 11
    end
    object cbRS: TCheckBox
      Left = 109
      Top = 55
      Width = 36
      Height = 17
      Caption = 'RS'
      TabOrder = 22
    end
    object cbSC: TCheckBox
      Left = 109
      Top = 71
      Width = 36
      Height = 17
      Caption = 'SC'
      TabOrder = 23
    end
    object cbSE: TCheckBox
      Left = 109
      Top = 87
      Width = 36
      Height = 17
      Caption = 'SE'
      TabOrder = 24
    end
    object cbTO: TCheckBox
      Left = 109
      Top = 119
      Width = 36
      Height = 17
      Caption = 'TO'
      TabOrder = 26
    end
    object cbSP: TCheckBox
      Left = 109
      Top = 103
      Width = 36
      Height = 17
      Caption = 'SP'
      TabOrder = 25
    end
  end
  object sbCampos: TScrollBox
    Left = 0
    Top = 0
    Width = 775
    Height = 56
    Align = alTop
    Color = clBtnFace
    ParentBackground = True
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 722
    object btFechar: TBitBtn
      Left = 0
      Top = 0
      Width = 55
      Height = 52
      Align = alLeft
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btFecharClick
    end
  end
  object edLimiteReg: TEdit
    Left = 333
    Top = 67
    Width = 35
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object btItensMaisVend: TButton
    Left = 2
    Top = 298
    Width = 82
    Height = 42
    Caption = 'Itens Mais Vendidos'
    TabOrder = 8
    WordWrap = True
    OnClick = btItensMaisVendClick
  end
  object gbTipoPedido: TGroupBox
    Left = 379
    Top = 56
    Width = 390
    Height = 40
    Caption = ' Somente Tipo de Pedido: '
    TabOrder = 9
    object cbTpPedV: TCheckBox
      Left = 4
      Top = 15
      Width = 60
      Height = 17
      Caption = 'Vendas'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbTpPedA: TCheckBox
      Left = 85
      Top = 15
      Width = 167
      Height = 17
      Caption = 'Assist'#234'ncia   (Troca, Reforma)'
      TabOrder = 1
      WordWrap = True
    end
    object cbTpPedO: TCheckBox
      Left = 279
      Top = 15
      Width = 92
      Height = 17
      Caption = 'Outros (Bonif.)'
      TabOrder = 2
    end
  end
  object qyItemGrupoFil: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT CAST('#39'N'#39' AS CHAR(1)) AS flSelecionado,'
      '               cdItemGrupo,'
      '               deItemGrupo'
      '          FROM erp.dw_itemGrupo'
      '         ORDER BY deItemGrupo'
      '       ) t')
    Left = 126
    Top = 202
    object qyItemGrupoFilflselecionado: TWideStringField
      FieldName = 'flselecionado'
      Origin = 'flselecionado'
      OnGetText = qyItemGrupoFilflselecionadoGetText
      Size = 1
    end
    object qyItemGrupoFilcditemgrupo: TIntegerField
      FieldName = 'cditemgrupo'
      Origin = 'cditemgrupo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyItemGrupoFildeitemgrupo: TWideStringField
      FieldName = 'deitemgrupo'
      Origin = 'deitemgrupo'
      Size = 250
    end
  end
  object dsItemGrupoFil: TDataSource
    DataSet = qyItemGrupoFil
    Left = 48
    Top = 202
  end
  object qyItemSubGrupoFil: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT CAST('#39'N'#39' AS CHAR(1)) AS flSelecionado,'
      '               a.cdItemGrupo,'
      '               a.cdItemSubGrupo,'
      '               b.deItemGrupo,'
      '               a.deItemSubGrupo'
      '          FROM erp.dw_itemSubGrupo a'
      
        '         INNER JOIN erp.dw_itemGrupo b ON (b.cdItemGrupo = a.cdI' +
        'temGrupo)'
      '         ORDER BY b.deItemGrupo, a.deItemSubGrupo'
      '       ) t')
    Left = 352
    Top = 203
    object qyItemSubGrupoFilflselecionado: TWideStringField
      FieldName = 'flselecionado'
      Origin = 'flselecionado'
      OnGetText = qyItemSubGrupoFilflselecionadoGetText
      Size = 1
    end
    object qyItemSubGrupoFilcditemgrupo: TIntegerField
      FieldName = 'cditemgrupo'
      Origin = 'cditemgrupo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyItemSubGrupoFilcditemsubgrupo: TIntegerField
      FieldName = 'cditemsubgrupo'
      Origin = 'cditemsubgrupo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyItemSubGrupoFildeitemgrupo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'deitemgrupo'
      Origin = 'deitemgrupo'
      Size = 250
    end
    object qyItemSubGrupoFildeitemsubgrupo: TWideStringField
      FieldName = 'deitemsubgrupo'
      Origin = 'deitemsubgrupo'
      Size = 250
    end
  end
  object dsItemSubGrupoFil: TDataSource
    DataSet = qyItemSubGrupoFil
    Left = 258
    Top = 203
  end
  object qyDados: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT c.deItemGrupo,'
      '               d.deItemSubGrupo,'
      '               CASE'
      '                 WHEN e.mes <= 6 THEN'
      '                   1'
      '                 ELSE'
      '                   2'
      '               END AS nuSemestre,'
      '               e.ano,'
      '               f.deRazaoSocial AS nmRepresentante,'
      '               g.deRazaoSocial AS nmCliente,'
      '               h.nmCidade,'
      '               h.sgEstado,'
      '               a.nuQtde,'
      '               a.vlBrutoItem,'
      '               a.vlFaturadoItem'
      '          FROM erp.dw_vendas a'
      
        '         INNER JOIN erp.dw_item          b ON (b.cdItem = a.cdIt' +
        'em) '
      
        '         INNER JOIN erp.dw_itemGrupo     c ON (c.cdItemGrupo = b' +
        '.cdItemGrupo)'
      
        '         INNER JOIN erp.dw_itemSubGrupo  d ON (d.cdItemGrupo = b' +
        '.cdItemGrupo AND d.cdItemSubGrupo = b.cdItemSubGrupo)'
      
        '         INNER JOIN erp.dw_tempo         e ON (e.cdTempo = a.cdT' +
        'empo)'
      
        '         INNER JOIN erp.dw_representante f ON (f.cdRepresentante' +
        ' = a.cdRepresentante)'
      
        '         INNER JOIN erp.dw_cliente       g ON (g.cdCliente = a.c' +
        'dCliente)'
      
        '         INNER JOIN erp.dw_cidade       h ON (h.cdCidade = a.cdC' +
        'idade)'
      '         &filtro'
      '       ) t'
      ' &ordem')
    Left = 246
    Top = 10
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end
      item
        Value = Null
        Name = 'ORDEM'
      end>
  end
end
