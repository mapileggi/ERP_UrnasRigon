object FIntIndBaixaProducao: TFIntIndBaixaProducao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Baixa de Produ'#231#227'o'
  ClientHeight = 555
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnCampos: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 241
    Align = alTop
    TabOrder = 0
    DesignSize = (
      939
      241)
    object lbDuploClicExcluir: TLabel
      Left = 8
      Top = 213
      Width = 423
      Height = 19
      Anchors = [akLeft, akBottom]
      Caption = 'Duplo clic na linha da grid para excluir o movimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 165
    end
    object gbConsultar: TGroupBox
      Left = 3
      Top = 1
      Width = 408
      Height = 209
      Anchors = [akLeft, akTop, akBottom]
      Caption = ' Consultar '
      TabOrder = 0
      DesignSize = (
        408
        209)
      object lbdtBaixa: TLabel
        Left = 20
        Top = 17
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Baixa:'
      end
      object lbdtBaixaA: TLabel
        Left = 195
        Top = 17
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbcdItemPesq: TLabel
        Left = 50
        Top = 65
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Item:'
      end
      object lbcdSetorPesq: TLabel
        Left = 46
        Top = 41
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Setor:'
      end
      object lbcdPedido: TLabel
        Left = 40
        Top = 113
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pedido:'
      end
      object lbcdUsuarioBaixa: TLabel
        Left = 7
        Top = 161
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usu'#225'rio Baixa:'
      end
      object lbcdCargaPesq: TLabel
        Left = 43
        Top = 137
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carga:'
      end
      object lbTipoEstoque: TLabel
        Left = 10
        Top = 185
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo Estoque:'
      end
      object lbcdTamanhoPesq: TLabel
        Left = 28
        Top = 89
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tamanho:'
      end
      object eddtBaixaIni: TDateTimePicker
        Left = 77
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        TabOrder = 0
      end
      object eddtBaixaFim: TDateTimePicker
        Left = 208
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685951053240000000
        Time = 42342.685951053240000000
        ShowCheckbox = True
        TabOrder = 1
      end
      object btConsultar: TBitBtn
        Left = 348
        Top = 11
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
      object edcdItemPesq: TEdit
        Left = 77
        Top = 62
        Width = 55
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object edcdPedido: TEdit
        Left = 77
        Top = 110
        Width = 55
        Height = 21
        NumbersOnly = True
        TabOrder = 5
      end
      object edcdUsuarioBaixa: TDBCampoCodigo
        Left = 77
        Top = 158
        Width = 326
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 7
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
      object edcdCargaPesq: TDBCampoCodigo
        Left = 77
        Top = 134
        Width = 327
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 6
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
      object edcdSetorPesq: TDBCampoCodigo
        Left = 77
        Top = 38
        Width = 265
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 2
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
          '        SELECT s.cdSetor,'
          '               s.deSetor'
          '          FROM erp.setor s'
          '         WHERE s.flControlaBaixa = '#39'S'#39
          '         ORDER BY s.cdSetor'
          '       ) t'
          ' &filtro')
        ERPCamposFiltro.Strings = (
          'cdSetor'
          'deSetor')
        ERPCamposFiltroTitulo.Strings = (
          'C'#243'digo'
          'Descri'#231#227'o')
        ERPCampoChave = 'cdSetor'
        ERPCampoDescricao = 'deSetor'
        ERPConnection = DmERP.fdConnERP
        ERPCampoChaveDataType = ftInteger
      end
      object cbTipoEstoque: TComboBox
        Left = 77
        Top = 182
        Width = 83
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 9
        Text = 'Todos'
        Items.Strings = (
          'Todos'
          'Interno'
          'Com Pedido')
      end
      object cbSomenteEst: TCheckBox
        Left = 166
        Top = 185
        Width = 145
        Height = 17
        Caption = 'Somente Em Estoque'
        TabOrder = 10
      end
      object lcbcdTamanhoPesq: TDBLookupComboBox
        Left = 77
        Top = 86
        Width = 132
        Height = 21
        KeyField = 'cdTamanho'
        ListField = 'deTamanho'
        ListSource = dsTamanhoPesq
        TabOrder = 4
      end
      object cbNaoImpEnzibEnzit: TCheckBox
        Left = 171
        Top = 64
        Width = 215
        Height = 17
        Caption = 'N'#227'o Listar Itens de Enzibac e Enzithan'
        TabOrder = 11
      end
      object btImgItem: TBitBtn
        Left = 134
        Top = 59
        Width = 26
        Height = 26
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 12
        OnClick = btImgItemClick
      end
    end
    object gbMovimentar: TGroupBox
      Left = 413
      Top = 1
      Width = 523
      Height = 209
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Movimentar '
      TabOrder = 1
      DesignSize = (
        523
        209)
      object lbcdSetor: TLabel
        Left = 62
        Top = 41
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Setor:'
      end
      object lbcdItem: TLabel
        Left = 66
        Top = 65
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Item:'
      end
      object lbnuQtde: TLabel
        Left = 60
        Top = 113
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtde.:'
      end
      object lbcdCarga: TLabel
        Left = 59
        Top = 137
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carga:'
      end
      object lbdeCodBarras: TLabel
        Left = 6
        Top = 185
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd. Barras Etiq.:'
      end
      object lbcdTamanho: TLabel
        Left = 44
        Top = 89
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tamanho:'
      end
      object lbQtdeMov: TLabel
        Left = 354
        Top = 137
        Width = 166
        Height = 23
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Qtde. Moviment.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbcdEmpresa: TLabel
        Left = 47
        Top = 17
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Empresa:'
      end
      object lcbcdSetor: TDBLookupComboBox
        Left = 93
        Top = 38
        Width = 132
        Height = 21
        Enabled = False
        KeyField = 'cdsetor'
        ListField = 'desetor'
        ListSource = dsSetor
        TabOrder = 0
        OnExit = lcbcdSetorExit
      end
      object edcdItem: TDBCampoCodigo
        Left = 93
        Top = 62
        Width = 298
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 1
        ERPCampoCodigoPK = False
        ERPCharCase = ecUpperCase
        ERPEdCampoChaveWidth = 70
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
          '        SELECT TRIM(a.item) AS cdItem,'
          '               TRIM(a.descricao) AS deItem'
          '          FROM item a'
          
            '         WHERE ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39#39 +
            '))'
          '          AND ('
          '                    (a.codigo_familia = 30) OR'
          '                    (a.flag_tipo_prod = '#39'R'#39')'
          '                  )'
          '         ORDER BY a.item'
          '       ) t'
          '&filtro')
        ERPCamposFiltro.Strings = (
          'cdItem'
          'deItem')
        ERPCamposFiltroTitulo.Strings = (
          'Item'
          'Descri'#231#227'o')
        ERPCampoChave = 'cdItem'
        ERPCampoDescricao = 'deItem'
        ERPConnection = DmIntegracao.fdConnInteg
        ERPCampoChaveDataType = ftString
      end
      object btMovimentar: TBitBtn
        Left = 397
        Top = 11
        Width = 69
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Movimentar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 6
        TabStop = False
        OnClick = btMovimentarClick
      end
      object btFechar: TBitBtn
        Left = 465
        Top = 11
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Fechar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 7
        TabStop = False
        OnClick = btFecharClick
      end
      object ednuQtde: TEdit
        Left = 93
        Top = 110
        Width = 37
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
      object edcdCarga: TDBCampoCodigo
        Left = 93
        Top = 134
        Width = 255
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 4
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
      object edcdCodBarras: TEdit
        Left = 93
        Top = 182
        Width = 111
        Height = 21
        NumbersOnly = True
        TabOrder = 5
        OnChange = edcdCodBarrasChange
      end
      object lcbcdTamanho: TDBLookupComboBox
        Left = 93
        Top = 86
        Width = 132
        Height = 21
        KeyField = 'cdTamanho'
        ListField = 'deTamanho'
        ListSource = dsTamanho
        TabOrder = 2
      end
      object btVerificarNaoMov: TBitBtn
        Left = 210
        Top = 181
        Width = 135
        Height = 23
        Caption = 'Itens N'#227'o Movimentados'
        Enabled = False
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 8
        TabStop = False
        OnClick = btVerificarNaoMovClick
      end
      object edQtdeMov: TEdit
        Left = 431
        Top = 166
        Width = 89
        Height = 37
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object btZerarContagem: TBitBtn
        Left = 374
        Top = 182
        Width = 55
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'Zerar '
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 10
        TabStop = False
        OnClick = btZerarContagemClick
      end
      object cbMovEstSetAnt: TCheckBox
        Left = 400
        Top = 69
        Width = 110
        Height = 22
        Anchors = [akTop, akRight]
        Caption = 'Mov. Estoque Setor Anterior'
        Checked = True
        State = cbChecked
        TabOrder = 11
        WordWrap = True
        OnClick = cbMovEstSetAntClick
      end
      object cbRetEstInterno: TCheckBox
        Left = 240
        Top = 40
        Width = 145
        Height = 17
        Caption = 'Retirar Estoque Interno?'
        TabOrder = 12
        OnClick = cbRetEstInternoClick
      end
      object btAjustaIDs: TButton
        Left = 273
        Top = 82
        Width = 75
        Height = 25
        Caption = 'Ajusta IDs'
        TabOrder = 13
        OnClick = btAjustaIDsClick
      end
      object cbMovItemCompleto: TCheckBox
        Left = 93
        Top = 160
        Width = 145
        Height = 17
        Caption = 'Mov. Qtde. Total Item?'
        TabOrder = 14
        OnClick = cbMovItemCompletoClick
      end
      object lcbcdEmpresa: TDBLookupComboBox
        Left = 93
        Top = 14
        Width = 284
        Height = 21
        KeyField = 'cdempresa'
        ListField = 'nmempresa'
        ListSource = dsEmpresa
        TabOrder = 15
        OnExit = lcbcdSetorExit
      end
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 241
    Width = 939
    Height = 314
    Align = alClient
    TabOrder = 1
    object grDados: TDBGrid
      Left = 1
      Top = 1
      Width = 937
      Height = 266
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = pmGrid
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grDadosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cditem'
          Title.Caption = 'Item'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deitem'
          Title.Caption = 'Descri'#231#227'o'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'detamanho'
          Title.Caption = 'Tamanho'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdidqtde'
          Title.Caption = 'C'#243'd. Id Qtde.'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'desetor'
          Title.Caption = 'Setor'
          Width = 102
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flemestoque'
          Title.Alignment = taCenter
          Title.Caption = 'Em Estoque'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtbaixa'
          Title.Caption = 'Dt. Baixa'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dehrbaixa'
          Title.Caption = 'Hr. Baixa'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmusubaixa'
          Title.Caption = 'Usu'#225'rio Baixa'
          Width = 117
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmempresa'
          Title.Caption = 'Empresa'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdcarga'
          Title.Caption = 'Carga'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdpedido'
          Title.Caption = 'Pedido'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdseqped'
          Title.Caption = 'Seq. Ped.'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdidqtdeseqped'
          Title.Caption = 'C'#243'd. Id Qtde. Item Ped.'
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cditembase'
          Title.Caption = 'Item Base'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'detamanhobase'
          Title.Caption = 'Tamanho Base'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cditemrelacionado'
          Title.Caption = 'C'#243'd. Item Relac.'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'decor'
          Title.Caption = 'Cor'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dealca'
          Title.Caption = 'Al'#231'a'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deadorno'
          Title.Caption = 'Adorno'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dechaveta'
          Title.Caption = 'Chaveta'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deforracao'
          Title.Caption = 'Forra'#231#227'o'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deimagem'
          Title.Caption = 'Imagem'
          Width = 110
          Visible = True
        end>
    end
    object pnTotaisGrid: TPanel
      Left = 1
      Top = 267
      Width = 937
      Height = 46
      Align = alBottom
      TabOrder = 1
      object lbnuQtdeTotal: TLabel
        Left = 5
        Top = 8
        Width = 114
        Height = 23
        Alignment = taRightJustify
        Caption = 'Qtde. Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ednuQtdeTotal: TEdit
        Left = 123
        Top = 4
        Width = 89
        Height = 37
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        NumbersOnly = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyIntIndBaixaProducao
    Left = 119
    Top = 233
  end
  object dsSetor: TDataSource
    AutoEdit = False
    DataSet = qySetor
    Left = 167
    Top = 233
  end
  object qySetor: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT s.cdSetor,'
      '               s.deSetor,'
      '               s.flControlaBaixa,'
      '               s.flEhSetorMontagem,'
      '               s.flEhSetorEmbalagem,'
      '               s.flEhSetorExpedicao,'
      '               sa.flEhSetorMontagem AS flEhSetAntMont,'
      '               s.cdSetorAnterior,'
      '               sa.deSetor AS deSetorAnt'
      '          FROM erp.setor s'
      
        '          LEFT JOIN erp.setor sa ON (sa.cdSetor = s.cdSetorAnter' +
        'ior)'
      '         WHERE s.flControlaBaixa = '#39'S'#39
      '         ORDER BY s.cdSetor'
      '       ) t'
      ' &filtro')
    Left = 211
    Top = 233
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object qySetorPesq: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT s.cdSetor,'
      '               s.deSetor,'
      '               s.flControlaBaixa,'
      '               s.flEhSetorExpedicao,'
      '               s.cdSetorAnterior'
      '          FROM erp.setor s'
      '         WHERE s.flControlaBaixa = '#39'S'#39
      '         ORDER BY s.cdSetor'
      '       ) t'
      ' &filtro')
    Left = 339
    Top = 233
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
  object dsSetorPesq: TDataSource
    AutoEdit = False
    DataSet = qySetorPesq
    Left = 271
    Top = 233
  end
  object vtTamanho: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'deTamanho'
    Left = 648
    Top = 258
    Data = {03000000000000000000}
    object vtTamanhocdTamanho: TIntegerField
      FieldName = 'cdTamanho'
    end
    object vtTamanhodeTamanho: TStringField
      FieldName = 'deTamanho'
      Size = 250
    end
  end
  object dsTamanho: TDataSource
    AutoEdit = False
    DataSet = vtTamanho
    Left = 568
    Top = 258
  end
  object pmGrid: TPopupMenu
    Left = 120
    Top = 329
    object pmiRemoverPedido: TMenuItem
      Caption = 'Remover Pedido/Estoque Interno'
      OnClick = pmiRemoverPedidoClick
    end
  end
  object qyAjusteIdP4: TFDQuery
    Connection = DmERP.fdConnERP
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    SQL.Strings = (
      'SELECT a.*,'
      '       b.cdSetorAnterior,'
      '       b.flEhSetorExpedicao'
      '  FROM erp.intIndBaixaProducao a'
      ' INNER JOIN ('
      '             SELECT s.cdSetor AS cdSet,'
      '                    s.cdSetorAnterior,'
      '                    s.flEhSetorExpedicao'
      '               FROM erp.setor s '
      '            ) b ON (b.cdSet = a.cdSetor)'
      ' WHERE /*('
      '        (a.flEmEstoque = '#39'S'#39') OR'
      '        (b.flEhSetorExpedicao = '#39'S'#39')'
      '       )'
      '   AND*/ a.cdSetor = :cdSetor'
      '  &filtro'
      ' ORDER BY a.flEmEstoque,'
      '          a.cdSetor,'
      '          a.cdItem,'
      '          a.cdTamanho,'
      '          a.cdIdQtde ')
    Left = 622
    Top = 447
    ParamData = <
      item
        Name = 'CDSETOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyEmpresa: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT e.cdEmpresa,'
      '       e.deRazaoSocial AS nmEmpresa'
      '  FROM erp.empresa e')
    Left = 327
    Top = 363
  end
  object dsEmpresa: TDataSource
    AutoEdit = False
    DataSet = qyEmpresa
    Left = 255
    Top = 361
  end
  object dsTamanhoPesq: TDataSource
    AutoEdit = False
    DataSet = vtTamanhoPesq
    Left = 568
    Top = 306
  end
  object vtTamanhoPesq: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    IndexFieldNames = 'deTamanho'
    Left = 648
    Top = 306
    Data = {03000000000000000000}
    object IntegerField1: TIntegerField
      FieldName = 'cdTamanho'
    end
    object StringField1: TStringField
      FieldName = 'deTamanho'
      Size = 250
    end
  end
end
