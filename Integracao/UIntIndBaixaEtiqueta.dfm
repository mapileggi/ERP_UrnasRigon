object FIntIndBaixaEtiqueta: TFIntIndBaixaEtiqueta
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Baixa de Etiquetas'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnCampos: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 104
    Align = alTop
    TabOrder = 0
    DesignSize = (
      939
      104)
    object lbDuploClicExcluir: TLabel
      Left = 8
      Top = 76
      Width = 377
      Height = 19
      Anchors = [akLeft, akBottom]
      Caption = 'Duplo clic na linha da grid para excluir a baixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 146
    end
    object gbConsultar: TGroupBox
      Left = 3
      Top = 1
      Width = 390
      Height = 67
      Caption = ' Consultar '
      TabOrder = 0
      object lbdtBaixa: TLabel
        Left = 12
        Top = 17
        Width = 56
        Height = 13
        Caption = 'Data Baixa:'
      end
      object lbdtBaixaA: TLabel
        Left = 190
        Top = 17
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbcdPedido: TLabel
        Left = 32
        Top = 41
        Width = 36
        Height = 13
        Caption = 'Pedido:'
      end
      object lbcdPedidoA: TLabel
        Left = 132
        Top = 41
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbcdItem: TLabel
        Left = 232
        Top = 41
        Width = 25
        Height = 13
        Caption = 'Ref.:'
      end
      object eddtBaixaIni: TDateTimePicker
        Left = 72
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        TabOrder = 0
      end
      object eddtBaixaFim: TDateTimePicker
        Left = 203
        Top = 14
        Width = 111
        Height = 21
        Date = 42342.685951053240000000
        Time = 42342.685951053240000000
        ShowCheckbox = True
        TabOrder = 1
      end
      object btConsultar: TBitBtn
        Left = 326
        Top = 11
        Width = 55
        Height = 52
        Caption = '&Consultar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 2
        OnClick = btConsultarClick
      end
      object edcdPedidoIni: TEdit
        Left = 72
        Top = 38
        Width = 55
        Height = 21
        NumbersOnly = True
        TabOrder = 3
      end
      object edcdPedidoFim: TEdit
        Left = 142
        Top = 38
        Width = 55
        Height = 21
        NumbersOnly = True
        TabOrder = 4
      end
      object edcdItem: TEdit
        Left = 259
        Top = 38
        Width = 55
        Height = 21
        TabOrder = 5
      end
    end
    object gbBaixar: TGroupBox
      Left = 399
      Top = 1
      Width = 468
      Height = 67
      Caption = ' Baixar '
      TabOrder = 1
      object lbcdSetor: TLabel
        Left = 42
        Top = 17
        Width = 30
        Height = 13
        Caption = 'Setor:'
      end
      object lbdeCodBarras: TLabel
        Left = 11
        Top = 41
        Width = 61
        Height = 13
        Caption = 'C'#243'd. Barras:'
      end
      object lbcdCarga: TLabel
        Left = 201
        Top = 17
        Width = 33
        Height = 13
        Caption = 'Carga:'
      end
      object lcbcdSetor: TDBLookupComboBox
        Left = 76
        Top = 14
        Width = 111
        Height = 21
        Enabled = False
        KeyField = 'cdsetor'
        ListField = 'desetor'
        ListSource = dsSetor
        TabOrder = 0
      end
      object edcdCodBarras: TEdit
        Left = 76
        Top = 38
        Width = 111
        Height = 21
        NumbersOnly = True
        TabOrder = 2
        OnChange = edcdCodBarrasChange
      end
      object edcdCarga: TDBCampoCodigo
        Left = 238
        Top = 14
        Width = 227
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
    end
    object btFechar: TBitBtn
      Left = 873
      Top = 12
      Width = 55
      Height = 52
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 2
      OnClick = btFecharClick
    end
    object btBaixarLote: TBitBtn
      Left = 637
      Top = 73
      Width = 85
      Height = 24
      Caption = '&Baixar Em Lote'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 3
      OnClick = btBaixarLoteClick
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 104
    Width = 939
    Height = 451
    Align = alClient
    TabOrder = 1
    object grDados: TDBGrid
      Left = 1
      Top = 1
      Width = 937
      Height = 449
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          FieldName = 'desetor'
          Title.Caption = 'Setor'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdpedido'
          Title.Caption = 'Pedido'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdseqped'
          Title.Caption = 'Seq. Ped.'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdidqtde'
          Title.Caption = 'ID Qtde.'
          Width = 52
          Visible = True
        end
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
          Width = 308
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dtbaixa'
          Title.Caption = 'Data Baixa'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dehrbaixa'
          Title.Caption = 'Hora Baixa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmusubaixa'
          Title.Caption = 'Usu'#225'rio Baixa'
          Width = 150
          Visible = True
        end>
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    Left = 47
    Top = 265
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
      '               s.cdSetorAnterior,'
      '               s.flEhSetorExpedicao '
      '          FROM erp.setor s'
      '         WHERE s.flControlaBaixa = '#39'S'#39
      '         ORDER BY s.deSetor'
      '       ) t'
      ' &filtro')
    Left = 227
    Top = 237
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
end
