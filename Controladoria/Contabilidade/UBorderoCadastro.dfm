inherited FBorderoCadastro: TFBorderoCadastro
  Caption = 'Borderos'
  ClientWidth = 830
  ExplicitWidth = 830
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 830
    ExplicitWidth = 830
    object lbcdBordero: TLabel
      Left = 59
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbcdMotorista: TLabel
      Left = 47
      Top = 83
      Width = 49
      Height = 13
      Caption = 'Motorista:'
    end
    object lbnuKmFinal: TLabel
      Left = 53
      Top = 251
      Width = 43
      Height = 13
      Caption = 'Km Final:'
    end
    object lbnmUsuCad: TLabel
      Left = 371
      Top = 7
      Width = 66
      Height = 13
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 607
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Usu'#225'rio Alt.:'
    end
    object lbdtSaida: TLabel
      Left = 48
      Top = 179
      Width = 48
      Height = 13
      Caption = 'Dt. Sa'#237'da:'
    end
    object lbdtRetorno: TLabel
      Left = 35
      Top = 203
      Width = 61
      Height = 13
      Caption = 'Dt. Retorno:'
    end
    object lbnuKmInicial: TLabel
      Left = 48
      Top = 227
      Width = 48
      Height = 13
      Caption = 'Km Inicial:'
    end
    object lbcdVeiculo: TLabel
      Left = 59
      Top = 59
      Width = 37
      Height = 13
      Caption = 'Ve'#237'culo:'
    end
    object lbnuQtdeItens: TLabel
      Left = 36
      Top = 155
      Width = 60
      Height = 13
      Caption = 'Qtde. Itens:'
    end
    object lbnmAjudante: TLabel
      Left = 48
      Top = 107
      Width = 48
      Height = 13
      Caption = 'Ajudante:'
    end
    object lbnuLitrosCombustivel: TLabel
      Left = 5
      Top = 275
      Width = 91
      Height = 13
      Caption = 'Litros Combust'#237'vel:'
    end
    object lbdeRegiao: TLabel
      Left = 59
      Top = 131
      Width = 37
      Height = 13
      Caption = 'Regi'#227'o:'
    end
    object lbcdCarga: TLabel
      Left = 63
      Top = 34
      Width = 33
      Height = 13
      Caption = 'Carga:'
    end
    object edcdMotorista: TDBCampoCodigo
      Left = 98
      Top = 80
      Width = 503
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 3
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
        '        SELECT m.cdMotorista,'
        '                     m.nmMotorista'
        '          FROM erp.motorista m'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdMotorista'
        'nmMotorista')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Nome')
      ERPCampoChave = 'cdMotorista'
      ERPCampoDescricao = 'nmMotorista'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdBordero: TDBCampoCodigo
      Left = 98
      Top = 4
      Width = 91
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      ERPCampoCodigoPK = True
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
        '        SELECT b.cdBordero,'
        '               m.nmMotorista,                 '
        '               CAST('
        
          '                   REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', '#39 +
          '\1-\2'#39') || '#39' - '#39' ||'
        '                    CASE'
        '                      WHEN v.cdVeiculoTipo = 1 THEN'
        '                        '#39'Carro'#39' '
        '                      WHEN v.cdVeiculoTipo = 2 THEN'
        '                        '#39'Caminh'#227'o'#39
        '                      WHEN v.cdVeiculoTipo = 3 THEN'
        '                        '#39'Caminhonete'#39
        '                      WHEN v.cdVeiculoTipo = 4 THEN'
        '                        '#39'Carreta'#39
        '                      WHEN v.cdVeiculoTipo = 5 THEN'
        '                        '#39'Moto'#39' '
        '                    END AS CHARACTER VARYING(30)'
        '                   ) AS deVeiculo,'
        '               b.dtSaida,'
        '               b.dtRetorno'
        '          FROM erp.bordero b'
        
          '          LEFT JOIN erp.motorista m  ON (m.cdMotorista = b.cdMot' +
          'orista)'
        
          '          LEFT JOIN erp.veiculo   v  ON (v.cdVeiculo = b.cdVeicu' +
          'lo)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdBordero'
        'nmMotorista'
        'deVeiculo'
        'dtSaida'
        'dtRetorno')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Motorista'
        'Ve'#237'culo'
        'Dt. Sa'#237'da'
        'Dt. Retorno')
      ERPCampoChave = 'cdBordero'
      ERPCampoDescricao = 'cdBordero'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednmUsuCad: TDBEdit
      Left = 437
      Top = 4
      Width = 155
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'nmusucad'
      DataSource = FrBarraBotoes.dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object ednmUsuAlt: TDBEdit
      Left = 668
      Top = 4
      Width = 155
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'nmusualt'
      DataSource = FrBarraBotoes.dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object eddtSaida: TDBDateTime
      Left = 98
      Top = 176
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 7
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtsaida'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddtRetorno: TDBDateTime
      Left = 98
      Top = 200
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 8
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtretorno'
      DataSource = FrBarraBotoes.dsDados
    end
    object edcdVeiculo: TDBCampoCodigo
      Left = 98
      Top = 56
      Width = 503
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
        '        SELECT v.cdVeiculo,'
        '               CAST('
        '                    CASE'
        '                      WHEN v.cdVeiculoTipo = 1 THEN'
        '                        '#39'Carro'#39' '
        '                      WHEN v.cdVeiculoTipo = 2 THEN'
        '                        '#39'Caminh'#227'o'#39
        '                      WHEN v.cdVeiculoTipo = 3 THEN'
        '                        '#39'Caminhonete'#39
        '                      WHEN v.cdVeiculoTipo = 4 THEN'
        '                        '#39'Carreta'#39
        '                      WHEN v.cdVeiculoTipo = 5 THEN'
        '                        '#39'Moto'#39' '
        '                    END AS CHARACTER VARYING(30)'
        '                   ) AS deVeiculoTipo,'
        '               v.dePlaca,'
        
          '               CAST(REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
          #39'\1-\2'#39') AS CHARACTER VARYING(15)) AS dePlacaM, '
        '               CAST('
        
          '                    REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
          #39'\1-\2'#39') || '#39' - '#39' ||               '
        '                    CASE'
        '                      WHEN v.cdVeiculoTipo = 1 THEN'
        '                        '#39'Carro'#39' '
        '                      WHEN v.cdVeiculoTipo = 2 THEN'
        '                        '#39'Caminh'#227'o'#39
        '                      WHEN v.cdVeiculoTipo = 3 THEN'
        '                        '#39'Caminhonete'#39
        '                      WHEN v.cdVeiculoTipo = 4 THEN'
        '                        '#39'Carreta'#39
        '                      WHEN v.cdVeiculoTipo = 5 THEN'
        '                        '#39'Moto'#39' '
        '                    END AS CHARACTER VARYING(30)'
        '                   ) AS deVeiculo'
        '          FROM erp.veiculo v'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdVeiculo'
        'deVeiculoTipo'
        'dePlacaM')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Tipo'
        'Placa')
      ERPCampoChave = 'cdVeiculo'
      ERPCampoDescricao = 'deVeiculo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednuKmInicial: TDBEdit
      Left = 98
      Top = 224
      Width = 87
      Height = 21
      DataField = 'nukminicial'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 9
    end
    object ednuKmFinal: TDBEdit
      Left = 98
      Top = 248
      Width = 87
      Height = 21
      DataField = 'nukmfinal'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 10
    end
    object btDoctos: TBitBtn
      Left = 98
      Top = 299
      Width = 55
      Height = 52
      Caption = '&Doctos.'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 14
      OnClick = btDoctosClick
    end
    object ednuQtdeItens: TDBEdit
      Left = 98
      Top = 152
      Width = 87
      Height = 21
      DataField = 'nuqtdeitens'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
    end
    object ednmAjudante: TDBEdit
      Left = 98
      Top = 104
      Width = 296
      Height = 21
      DataField = 'nmajudante'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
    end
    object ednuLitrosCombustivel: TDBEdit
      Left = 98
      Top = 272
      Width = 87
      Height = 21
      DataField = 'nulitroscombustivel'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 11
    end
    object eddeRegiao: TDBEdit
      Left = 98
      Top = 128
      Width = 296
      Height = 21
      DataField = 'deregiao'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
    end
    object edcdCarga: TDBCampoCodigo
      Left = 98
      Top = 31
      Width = 503
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 1
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
        '        SELECT DISTINCT '
        '               gp.codigo_grupoPed AS cdCarga,'
        '               gp.observacao      AS deCarga'
        '          FROM grupoPed gp'
        '         WHERE gp.observacao <> '#39#39
        '         UNION'
        '        SELECT DISTINCT '
        '               gp.codigo_grupoPed AS cdCarga,'
        '               '#39'SEM DESCRI'#199#195'O'#39'      AS deCarga'
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
        '&filtro'
        ' ORDER BY t.cdCarga DESC')
      ERPCamposFiltro.Strings = (
        'cdCarga'
        'deCarga')
      ERPCamposFiltroTitulo.Strings = (
        'Carga'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdCarga'
      ERPCampoDescricao = 'deCarga'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmIntegracao.fdConnInteg
      ERPCampoChaveDataType = ftInteger
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 830
    ExplicitWidth = 830
    inherited sbBotoes: TScrollBox
      Width = 830
      ExplicitWidth = 830
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyBordero
    end
  end
end
