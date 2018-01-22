inherited FPatrimonioManutencaoCadastro: TFPatrimonioManutencaoCadastro
  Caption = 'Manuten'#231#245'es de Patrim'#244'nio'
  ClientWidth = 830
  ExplicitWidth = 830
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 830
    ExplicitWidth = 830
    object lbcdPatrimonioManutencao: TLabel
      Left = 50
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbcdPatrimonio: TLabel
      Left = 33
      Top = 33
      Width = 54
      Height = 13
      Caption = 'Patrim'#244'nio:'
    end
    object lbdeManutencao: TLabel
      Left = 37
      Top = 107
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object lbcdSituacao: TLabel
      Left = 204
      Top = 7
      Width = 45
      Height = 13
      Caption = 'Situa'#231#227'o:'
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
    object lbdtManutencao: TLabel
      Left = 6
      Top = 57
      Width = 81
      Height = 13
      Caption = 'Dt. Manuten'#231#227'o:'
    end
    object lbdtAvisarEm: TLabel
      Left = 198
      Top = 57
      Width = 51
      Height = 13
      Caption = 'Avisar Em:'
    end
    object lbdeResponsavel: TLabel
      Left = 22
      Top = 81
      Width = 65
      Height = 13
      Caption = 'Respons'#225'vel:'
    end
    object lbdtTermino: TLabel
      Left = 370
      Top = 57
      Width = 42
      Height = 13
      Caption = 'T'#233'rmino:'
    end
    object edcdPatrimonio: TDBCampoCodigo
      Left = 89
      Top = 30
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
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdPatrimonioManutencao: TDBCampoCodigo
      Left = 89
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
        'SELECT t01.*'
        '  FROM ('
        '        SELECT pm.cdPatrimonioManutencao,'
        '               pm.cdSituacao,'
        '               CAST('
        '                    CASE'
        '                      WHEN pm.cdSituacao = 1 THEN'
        '                        '#39'Em Aberto'#39
        '                      WHEN pm.cdSituacao = 2 THEN'
        '                        '#39'Em Progresso'#39
        '                      WHEN pm.cdSituacao = 3 THEN'
        '                        '#39'Cancelada'#39
        '                      WHEN pm.cdSituacao = 4 THEN'
        '                        '#39'Finalizada'#39
        '                      ELSE'
        '                        NULL'
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deSituacao,'
        '               pm.cdPatrimonio,               '
        '               p.nuPatrimonio,'
        '               p.dePatrimonio,'
        '               p.cdPatrimonioTipo,'
        '               pt.dePatrimonioTipo,'
        '               p.dtAquisicao,'
        '               p.cdSetor,'
        '               s.deSetor,'
        '               pm.dtManutencao,'
        '               pm.dtAvisarEm, '
        '               pm.deResponsavel,'
        '               pm.deManutencao,'
        '               pm.dtTermino'
        '          FROM erp.patrimonioManutencao pm'
        
          '          LEFT JOIN erp.patrimonio     p  ON (p.cdPatrimonio = p' +
          'm.cdPatrimonio)'
        
          '          LEFT JOIN erp.patrimonioTipo pt ON (pt.cdPatrimonioTip' +
          'o = p.cdPatrimonioTipo)'
        
          '          LEFT JOIN erp.setor          s  ON (s.cdSetor = p.cdSe' +
          'tor)'
        '  ORDER BY pm.cdPatrimonioManutencao, pm.dtManutencao'
        '       ) t01 '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdPatrimonioManutencao'
        'deSituacao'
        'cdPatrimonio'
        'nuPatrimonio'
        'dePatrimonio'
        'dePatrimonioTipo'
        'deSetor'
        'dtManutencao'
        'dtAvisarEm')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Situa'#231#227'o'
        'C'#243'd. Patr.'
        'N'#186' Patrim'#244'nio'
        'Descri'#231#227'o'
        'Tipo'
        'Setor'
        'Dt. Manuten'#231#227'o'
        'Dt. Aviso')
      ERPCampoChave = 'cdPatrimonioManutencao'
      ERPCampoDescricao = 'cdPatrimonioManutencao'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object mdeManutencao: TDBMemo
      Left = 89
      Top = 102
      Width = 734
      Height = 112
      Anchors = [akLeft, akTop, akRight]
      DataField = 'demanutencao'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 6
    end
    object lcbcdSituacao: TDBLookupComboBox
      Left = 251
      Top = 4
      Width = 107
      Height = 21
      DataField = 'cdsituacao'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdsituacao'
      ListField = 'desituacao'
      ListSource = DmERP.dsPatrimonioSituacao
      TabOrder = 7
      TabStop = False
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
      TabOrder = 8
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
      TabOrder = 9
    end
    object eddtManutencao: TDBDateTime
      Left = 89
      Top = 54
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 2
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtmanutencao'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddtAvisarEm: TDBDateTime
      Left = 251
      Top = 54
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 3
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtavisarem'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddtTermino: TDBDateTime
      Left = 414
      Top = 54
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 4
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dttermino'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddeResponsavel: TDBEdit
      Left = 89
      Top = 78
      Width = 249
      Height = 21
      DataField = 'deresponsavel'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
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
      DataSet = DmERP.qyPatrimonioManut
    end
  end
end
