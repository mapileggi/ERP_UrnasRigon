object FIntComAtualizacaoTabPreco: TFIntComAtualizacaoTabPreco
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Atualiza'#231#227'o Tab. Pre'#231'o'
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
  OnShow = FormShow
  DesignSize = (
    783
    488)
  PixelsPerInch = 96
  TextHeight = 13
  object lbcdVariavel: TLabel
    Left = 26
    Top = 32
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vari'#225'vel:'
  end
  object lbcdItem: TLabel
    Left = 42
    Top = 56
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'Item:'
  end
  object lbLog: TLabel
    Left = 7
    Top = 237
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'LOG:'
  end
  object lbTabPreco: TLabel
    Left = 12
    Top = 8
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tab. Pre'#231'o:'
  end
  object btAtualizar: TBitBtn
    Left = 670
    Top = 1
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = '&Atualizar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 5
    OnClick = btAtualizarClick
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
  object edcdVariavel: TDBCampoCodigo
    Left = 69
    Top = 29
    Width = 332
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
      '        SELECT codigo_variavel AS cdVariavel,'
      '               nome AS deVariavel'
      '          FROM variavel'
      '         WHERE codigo_variavel IN(5, 10, 15, 19, 20, 25, 30)'
      '      ) t '
      '  &filtro'
      ' ORDER BY t.cdVariavel'
      '')
    ERPCamposFiltro.Strings = (
      'cdVariavel'
      'deVariavel')
    ERPCamposFiltroTitulo.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    ERPCampoChave = 'cdVariavel'
    ERPCampoDescricao = 'deVariavel'
    ERPConnection = DmIntegracao.fdConnInteg
    ERPCampoChaveDataType = ftInteger
  end
  object mLog: TMemo
    Left = 0
    Top = 256
    Width = 779
    Height = 226
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object edcdItem: TDBCampoCodigo
    Left = 69
    Top = 53
    Width = 524
    Height = 21
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
      '               TRIM(a.descricao) AS deItem,'
      '               CAST('
      '                         CASE'
      '                           WHEN a.flag_tipo_prod = '#39'R'#39' THEN'
      '                             '#39'Revenda'#39
      '                           WHEN a.flag_tipo_prod = '#39'P'#39' THEN'
      '                             '#39'Produ'#231#227'o Pr'#243'pria'#39
      '                          ELSE'
      '                             '#39'N'#227'o informado'#39
      '                          END AS CHARACTER VARYING(20)'
      '                        ) AS deTipoProduto'
      '          FROM item a'
      '         WHERE a.item_ativo = '#39'S'#39
      '           AND a.item NOT LIKE '#39'%.12%'#39
      
        '           AND ((a.est_item_conf = '#39'S'#39') OR (a.est_item_conf = '#39#39 +
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
      'deItem'
      'deTipoProduto')
    ERPCamposFiltroTitulo.Strings = (
      'Item'
      'Descri'#231#227'o'
      'Tipo de Produto')
    ERPCampoChave = 'cdItem'
    ERPCampoDescricao = 'deItem'
    ERPConnection = DmIntegracao.fdConnInteg
    ERPCampoChaveDataType = ftString
  end
  object btSalvarItemEsc: TBitBtn
    Left = 69
    Top = 77
    Width = 26
    Height = 26
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 3
    OnClick = btSalvarItemEscClick
  end
  object btExluirItemEsc: TBitBtn
    Left = 94
    Top = 77
    Width = 26
    Height = 26
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 2
    OnClick = btExluirItemEscClick
  end
  object grItensEscolhidos: TDBGrid
    Left = 126
    Top = 78
    Width = 298
    Height = 149
    DataSource = dsItensEscolhidos
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
        FieldName = 'cdItem'
        Title.Caption = 'Item'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'deItem'
        Title.Caption = 'Descri'#231#227'o'
        Width = 200
        Visible = True
      end>
  end
  object mRefsImg: TMemo
    Left = 430
    Top = 96
    Width = 185
    Height = 131
    Lines.Strings = (
      '2075'
      '2075.12'
      '2077'
      '2077.12'
      '2090'
      '2090.12'
      '902075'
      '207752'
      '902077'
      '207772'
      '902090'
      '207902'
      'SOBTAMP01'
      'SOBRETAM01')
    TabOrder = 8
  end
  object edcdTabPreco: TDBCampoCodigo
    Left = 69
    Top = 5
    Width = 332
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 9
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
      '        SELECT codigo_tab AS cdTabPreco,'
      '               descricao AS deTabPreco'
      '          FROM tab'
      '      ) t '
      '  &filtro'
      ' ORDER BY t.cdTabPreco'
      '')
    ERPCamposFiltro.Strings = (
      'cdTabPreco'
      'deTabPreco')
    ERPCamposFiltroTitulo.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    ERPCampoChave = 'cdTabPreco'
    ERPCampoDescricao = 'deTabPreco'
    ERPConnection = DmIntegracao.fdConnInteg
    ERPCampoChaveDataType = ftString
  end
  object qyItensVarPadrao: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT a.cdItem,'
      '       a.flCobrarCor,'
      '       a.deTipoAlca,'
      '       a.cdTipoAlcaSeq,'
      '       COALESCE('
      '                ('
      '                 SELECT b.vlPrecoPadrao'
      '                   FROM erp.variavelItens b'
      '                  WHERE b.cdVariavel = 15'
      '                    AND b.cdVariavelItem = a.cdTipoAlcaSeq'
      '                ),'
      '                0'
      '               ) AS vlPrecoPadAlca,'
      '       a.deAdorno,'
      '       a.cdAdornoSeq,'
      '       COALESCE('
      '                ('
      '                 SELECT b.vlPrecoPadrao'
      '                   FROM erp.variavelItens b'
      '                  WHERE b.cdVariavel = 19'
      '                    AND b.cdVariavelItem = a.cdAdornoSeq'
      '                ),'
      '                0'
      '               ) AS vlPrecoPadAdorno,'
      '       a.deChaveta,'
      '       a.cdChavetaSeq,'
      '       COALESCE('
      '                ('
      '                 SELECT b.vlPrecoPadrao'
      '                   FROM erp.variavelItens b'
      '                  WHERE b.cdVariavel = 20'
      '                    AND b.cdVariavelItem = a.cdChavetaSeq'
      '                ),'
      '                0'
      '               ) AS vlPrecoPadChaveta,'
      '       a.deForracao,'
      '       a.cdForracaoSeq,'
      '       COALESCE('
      '                ('
      '                 SELECT b.vlPrecoPadrao'
      '                   FROM erp.variavelItens b'
      '                  WHERE b.cdVariavel = 25'
      '                    AND b.cdVariavelItem = a.cdForracaoSeq'
      '                ),'
      '                0'
      '               ) AS vlPrecoPadForracao'
      '  FROM erp.intSupItensConfPadrao a'
      ' &filtro'
      ' ORDER BY a.cdItem ')
    Left = 62
    Top = 392
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
  object qyVarItemFaltante: TFDQuery
    Connection = DmIntegracao.fdConnInteg
    SQL.Strings = (
      'SELECT COALESCE((SELECT MAX(c.recnum) FROM vlVarItB c), 0) + '
      '       ROW_NUMBER() OVER() AS recNum, '
      '       t.* '
      '  FROM ( '
      '        SELECT d.* '
      '          FROM ( '
      '                SELECT it.codigo_tab, '
      ' '#9#9'       it.item, '
      #9#9'       vv.codigo_variavel, '
      #9#9'       vv.seq AS valorVar, '
      #9#9'       :vlPreco AS preco_agregar  '
      '                  FROM itemTab it, '
      '                       valorVar vv, '
      '                       item i '
      '                 WHERE it.item = i.item '
      '                   AND i.flag_tipo_prod <> '#39'R'#39' '
      '                   AND it.vl > 0 '
      '                    &codTab'
      '                   AND it.item IN(&itens)'
      '                   AND vv.codigo_variavel = :cdVariavel        '
      '                   AND vv.seq = :cdVariavelItem'
      '                   AND NOT EXISTS ( '
      '                                   SELECT vi.recNum '
      '                                     FROM vlVarItb vi '
      
        '                                    WHERE vi.codigo_tab = it.cod' +
        'igo_tab '
      '                                      AND vi.item = it.item '
      
        '                                      AND vi.codigo_variavel = v' +
        'v.codigo_variavel '
      '                                      AND vi.valorVar = vv.seq '
      '                                  ) '
      
        '                 ORDER BY it.codigo_tab, it.item, vv.codigo_vari' +
        'avel, vv.seq '
      '               ) d '
      '       ) t '
      '  WHERE t.preco_agregar > 0')
    Left = 294
    Top = 400
    ParamData = <
      item
        Name = 'VLPRECO'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDVARIAVEL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDVARIAVELITEM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'CODTAB'
      end
      item
        Value = Null
        Name = 'ITENS'
      end>
  end
  object qyVariavelItens: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT b.cdVariavel,'
      '       b.cdVariavelItem,'
      '       b.deValor,'
      '       b.vlPrecoPadrao'
      '  FROM erp.variavelItens b'
      ' WHERE b.cdVariavel = :cdVariavel'
      '   AND b.cdVariavelItem <> :cdVariavelItem'
      ' ORDER BY b.cdVariavel, b.vlPrecoPadrao')
    Left = 158
    Top = 392
    ParamData = <
      item
        Name = 'CDVARIAVEL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDVARIAVELITEM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object vtItensEscolhidos: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 272
    Top = 139
    Data = {03000000000000000000}
    object vtItensEscolhidoscdItem: TStringField
      FieldName = 'cdItem'
      Size = 50
    end
    object vtItensEscolhidosdeItem: TStringField
      FieldName = 'deItem'
      Size = 300
    end
  end
  object dsItensEscolhidos: TDataSource
    AutoEdit = False
    DataSet = vtItensEscolhidos
    Left = 359
    Top = 139
  end
  object qyTamItemFaltante: TFDQuery
    Connection = DmIntegracao.fdConnInteg
    SQL.Strings = (
      'SELECT COALESCE((SELECT MAX(c.recnum) FROM vlVarItB c), 0) + '
      '       ROW_NUMBER() OVER() AS recNum,'
      '       t.* '
      '  FROM ('
      '        SELECT d.*'
      '          FROM ('
      '                SELECT it.codigo_tab,'
      ' '#9#9'               it.item,'
      #9#9'               vv.codigo_variavel,'
      #9#9'               vv.seq as valorVar,'
      #9#9'               CASE'
      
        #9#9'                 WHEN vv.seq IN(51, 52) THEN -- 1,90 Gordo, Se' +
        'mi Gordo'
      #9#9'                   it.vl * 30 / 100'
      
        #9#9'                 WHEN vv.seq IN(53, 70) THEN -- 1,90 Super Gor' +
        'do | 1,90 CREMACAO'
      #9#9'                   it.vl * 50 / 100'
      #9#9'                 WHEN vv.seq = 54 THEN -- 1,90 Extra Gordo'
      #9#9'                   it.vl * 90 / 100'
      
        #9#9'                 WHEN vv.seq IN (55, 60, 65) THEN -- 2,00 | 2,' +
        '10 | 2,20 '
      #9#9'                   it.vl * 15 / 100'
      
        #9#9'                 WHEN vv.seq IN (56, 57, 61, 62, 66, 67) THEN ' +
        '-- 2,00 Gordo, Semi Gordo'
      #9#9'                   it.vl * 45 / 100'
      
        #9#9'                 WHEN vv.seq IN (58, 63, 68) THEN -- 2,00 Supe' +
        'r Gordo'
      #9#9'                   it.vl * 65 / 100'
      
        #9#9'                 WHEN vv.seq IN (59, 64, 69) THEN -- 2,00 Extr' +
        'a Gordo'
      #9#9'                   it.vl * 105 / 100'#9#9'                   '
      
        #9#9'                 WHEN vv.seq IN(71, 72) THEN -- 1,90 Gordo Cre' +
        'ma'#231#227'o, Semi Gordo Crema'#231#227'o'
      #9#9'                   it.vl * 80 / 100'
      
        #9#9'                 WHEN vv.seq = 73 THEN -- 1,90 Super Gordo Cre' +
        'ma'#231#227'o '
      #9#9'                   it.vl'
      
        #9#9'                 WHEN vv.seq = 74 THEN -- 1,90 Extra Gordo Cre' +
        'ma'#231#227'o'
      #9#9'                   it.vl * 140 / 100'
      #9#9'                 ELSE'
      #9#9'                   0'
      #9#9'               END AS preco_agregar'
      '                  FROM itemTab it,'
      '                       valorVar vv,'
      '                       item i'
      '                 WHERE it.item = i.item'
      '                   AND i.flag_tipo_prod <> '#39'R'#39
      '                   AND it.vl > 0'
      '                   AND it.item NOT LIKE '#39'CZ.%'#39
      '                   AND it.item NOT LIKE '#39'CX.OSSOS%'#39
      '                   AND it.item NOT LIKE '#39'SOBTAMP%'#39
      '                   AND it.item NOT LIKE '#39'ACESS%'#39
      #9#9'   AND it.item NOT LIKE '#39'INVOLUCRO%'#39' '
      #9#9'   AND it.item NOT LIKE '#39'UOF%'#39' '
      '                   AND vv.codigo_variavel = 5'
      '                   AND vv.seq > 50'
      '                   AND NOT EXISTS ('
      '                                   SELECT vi.recNum'
      '                                     FROM vlVarItb vi'
      
        '                                    WHERE vi.codigo_tab = it.cod' +
        'igo_tab '
      '                                      AND vi.item = it.item'
      
        '                                      AND vi.codigo_variavel = v' +
        'v.codigo_variavel'
      '                                      AND vi.valorVar = vv.seq'
      '                                  )'
      '                   &filtro'
      
        '                 ORDER BY it.codigo_tab, it.item, vv.codigo_vari' +
        'avel, vv.seq'
      '               ) d   '
      '         WHERE d.preco_agregar > 0'
      '       ) t')
    Left = 414
    Top = 400
    MacroData = <
      item
        Value = Null
        Name = 'FILTRO'
      end>
  end
end
