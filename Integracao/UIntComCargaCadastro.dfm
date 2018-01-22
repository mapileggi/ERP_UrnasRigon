inherited FIntComCargaCadastro: TFIntComCargaCadastro
  Caption = 'Cargas'
  ClientWidth = 785
  ExplicitWidth = 785
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 785
    ExplicitWidth = 785
    object lbcdCarga: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeObservacao: TLabel
      Left = 409
      Top = 176
      Width = 66
      Height = 26
      Alignment = taRightJustify
      Caption = 'Observa'#231#245'es Relat'#243'rio:'
      WordWrap = True
    end
    object lbcdVeiculo: TLabel
      Left = 58
      Top = 79
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ve'#237'culo:'
    end
    object lbcdMotorista: TLabel
      Left = 46
      Top = 103
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motorista:'
    end
    object lbnmAjudante: TLabel
      Left = 47
      Top = 127
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ajudante:'
    end
    object lbdtSaida: TLabel
      Left = 47
      Top = 151
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Sa'#237'da:'
    end
    object lbnmUsuCad: TLabel
      Left = 29
      Top = 440
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 35
      Top = 464
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Usu'#225'rio Alt.:'
    end
    object lbdtCadastro: TLabel
      Left = 286
      Top = 440
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Data Cad.:'
    end
    object lbdtAlteracao: TLabel
      Left = 292
      Top = 464
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Data Alt.:'
    end
    object lbdeHrCadastro: TLabel
      Left = 445
      Top = 440
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Hora Cad.:'
    end
    object lbdeHrSlteracao: TLabel
      Left = 451
      Top = 464
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Hora Alt.:'
    end
    object lbdeObsSistema: TLabel
      Left = 29
      Top = 176
      Width = 66
      Height = 26
      Alignment = taRightJustify
      Caption = 'Observa'#231#245'es Sistema:'
      WordWrap = True
    end
    object lbnuPintura: TLabel
      Left = 225
      Top = 151
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Pintura:'
    end
    object lbcdSituacao: TLabel
      Left = 50
      Top = 31
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
    end
    object lbcdPrioridade: TLabel
      Left = 43
      Top = 55
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prioridade:'
    end
    object edcdCarga: TDBCampoCodigo
      Left = 97
      Top = 4
      Width = 658
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
        'SELECT  a.cdCarga, '
        '       a.deCarga,'
        '       CAST('
        '            CASE'
        '              WHEN a.cdSituacao = 1 THEN'
        '                '#39'Cadastrada'#39
        '              WHEN a.cdSituacao = 2 THEN'
        '                '#39'Em Produ'#231#227'o'#39
        '              WHEN a.cdSituacao = 3 THEN'
        '                '#39'Finalizada'#39
        '            END AS CHARACTER VARYING(20)'
        '           ) AS deSituacao,'
        '       CAST('
        '            CASE'
        '              WHEN a.cdPrioridade = 1 THEN'
        '                '#39'Normal'#39
        '              WHEN a.cdPrioridade = 2 THEN'
        '                '#39'Aten'#231#227'o'#39
        '              WHEN a.cdPrioridade = 3 THEN'
        '                '#39'Urgente'#39
        '            END AS CHARACTER VARYING(20)'
        '           ) AS dePrioridade,'
        '       a.dtSaida,'
        '       m.nmMotorista,'
        '       a.nmAjudante,'
        '       v.dePlaca,'
        '       a.cdSituacao'
        '  FROM erp.intComCarga a'
        '  LEFT JOIN erp.motorista m  ON (m.cdMotorista = a.cdMotorista)'
        '  LEFT JOIN erp.veiculo   v  ON (v.cdVeiculo = a.cdVeiculo)'
        ') t'
        ' &filtro'
        ' ORDER BY t.cdSituacao, t.dtSaida')
      ERPCamposFiltro.Strings = (
        'cdCarga'
        'deCarga'
        'deSituacao'
        'dePrioridade'
        'dtSaida'
        'nmMotorista'
        'nmAjudante'
        'dePlaca')
      ERPCamposFiltroTitulo.Strings = (
        'Carga'
        'Descri'#231#227'o'
        'Situa'#231#227'o'
        'Prioridade'
        'Data Sa'#237'da'
        'Motorista'
        'Ajudante'
        'Placa')
      ERPCampoChave = 'cdCarga'
      ERPCampoDescricao = 'deCarga'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object mdeObservacao: TDBMemo
      Left = 477
      Top = 172
      Width = 300
      Height = 77
      Anchors = [akLeft, akTop, akRight]
      DataField = 'deobservacao'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 9
    end
    object edcdVeiculo: TDBCampoCodigo
      Left = 97
      Top = 76
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
    object edcdMotorista: TDBCampoCodigo
      Left = 97
      Top = 100
      Width = 503
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
    object ednmAjudante: TDBEdit
      Left = 97
      Top = 124
      Width = 296
      Height = 21
      DataField = 'nmajudante'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
    end
    object eddtSaida: TDBDateTime
      Left = 97
      Top = 148
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 6
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtsaida'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuCad: TDBEdit
      Left = 97
      Top = 437
      Width = 171
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'nmusucad'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object ednmUsuAlt: TDBEdit
      Left = 97
      Top = 461
      Width = 171
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'nmusualt'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object eddtCadastro: TDBDateTime
      Left = 341
      Top = 437
      Width = 87
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 12
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcadastro'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddtAlteracao: TDBDateTime
      Left = 341
      Top = 461
      Width = 87
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 13
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtalteracao'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddeHrCadastro: TDBEdit
      Left = 500
      Top = 437
      Width = 50
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'dehrcadastro'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object eddeHrSlteracao: TDBEdit
      Left = 500
      Top = 461
      Width = 50
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'dehralteracao'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object mdeObsSistema: TDBMemo
      Left = 97
      Top = 172
      Width = 300
      Height = 77
      DataField = 'deobssistema'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 8
    end
    object ednuPintura: TDBEdit
      Left = 280
      Top = 148
      Width = 44
      Height = 21
      DataField = 'nupintura'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 7
    end
    object lcbcdSituacao: TDBLookupComboBox
      Left = 97
      Top = 28
      Width = 89
      Height = 21
      DataField = 'cdsituacao'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdsituacao'
      ListField = 'desituacao'
      ListSource = dsSituacao
      TabOrder = 1
    end
    object lcbcdPrioridade: TDBLookupComboBox
      Left = 97
      Top = 52
      Width = 89
      Height = 21
      DataField = 'cdprioridade'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdprioridade'
      ListField = 'deprioridade'
      ListSource = dsPrioridade
      TabOrder = 2
    end
    object cbflSetorLixa: TDBCheckBox
      Left = 344
      Top = 150
      Width = 65
      Height = 17
      Caption = 'Cristiano'
      DataField = 'flsetorlixa'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 16
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbflSetorFaturamento: TDBCheckBox
      Left = 424
      Top = 150
      Width = 89
      Height = 17
      Caption = 'Faturamento'
      DataField = 'flsetorfaturamento'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 17
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbflSetorExpedicao: TDBCheckBox
      Left = 526
      Top = 150
      Width = 75
      Height = 17
      Caption = 'Motoristas'
      DataField = 'flsetorexpedicao'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 18
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object gbCargasAlerta: TGroupBox
      Left = 3
      Top = 251
      Width = 775
      Height = 176
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Alertas da Carga '
      TabOrder = 19
      DesignSize = (
        775
        176)
      object ldeCargaAlerta: TLabel
        Left = 59
        Top = 18
        Width = 33
        Height = 26
        Alignment = taRightJustify
        Caption = 'Msg. Alerta:'
        WordWrap = True
      end
      inline FrBarraBotoesItens: TFBarraBotoesItens
        Left = 94
        Top = 98
        Width = 182
        Height = 26
        TabOrder = 1
        ExplicitLeft = 94
        ExplicitTop = 98
        inherited sbBotoes: TScrollBox
          inherited btAnterior: TBitBtn
            OnClick = FrBarraBotoesItensbtAnteriorClick
          end
          inherited btProximo: TBitBtn
            OnClick = FrBarraBotoesItensbtProximoClick
          end
          inherited btNovo: TBitBtn
            OnClick = FrBarraBotoesItensbtNovoClick
          end
          inherited btAlterar: TBitBtn
            OnClick = FrBarraBotoesItensbtAlterarClick
          end
          inherited btSalvar: TBitBtn
            OnClick = FrBarraBotoesItensbtSalvarClick
            ExplicitLeft = 98
            ExplicitTop = -2
          end
          inherited btCancelar: TBitBtn
            OnClick = FrBarraBotoesItensbtCancelarClick
          end
          inherited btExluir: TBitBtn
            OnClick = FrBarraBotoesItensbtExluirClick
          end
        end
        inherited dsDadosItens: TDataSource
          DataSet = DmERP.qyIntComCargaAlerta
          OnStateChange = FrBarraBotoesItensdsDadosItensStateChange
        end
      end
      object mdeCargaAlerta: TDBMemo
        Left = 94
        Top = 18
        Width = 677
        Height = 76
        Anchors = [akLeft, akTop, akRight]
        DataField = 'decargaalerta'
        DataSource = FrBarraBotoesItens.dsDadosItens
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object grDependentes: TDBGrid
        Left = 4
        Top = 128
        Width = 767
        Height = 43
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = FrBarraBotoesItens.dsDadosItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cdcargaalerta'
            Title.Caption = 'N'#186
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'decargaalerta'
            Title.Caption = 'Descri'#231#227'o do Alerta'
            Width = 408
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmusucad'
            Title.Caption = 'Usu'#225'rio Cad.'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtcadastro'
            Title.Caption = 'Data Cadastro'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dehrcadastro'
            Title.Caption = 'Hr. Cadastro'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmusualt'
            Title.Caption = 'Usu'#225'rio Alt.'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dehralteracao'
            Title.Caption = 'Hr Altera'#231#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtalteracao'
            Title.Caption = 'Data Altera'#231#227'o'
            Width = 90
            Visible = True
          end>
      end
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 785
    ExplicitWidth = 785
    inherited sbBotoes: TScrollBox
      Width = 785
      ExplicitWidth = 785
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyIntComCarga
    end
  end
  object qySituacao: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      
        '        SELECT CAST(1 AS INTEGER) AS cdSituacao, CAST('#39'Cadastrad' +
        'a'#39' AS CHARACTER VARYING(20)) AS deSituacao'
      '        UNION ALL'
      
        '        SELECT CAST(2 AS INTEGER) AS cdSituacao, CAST('#39'Em Produ'#231 +
        #227'o'#39' AS CHARACTER VARYING(20)) AS deSituacao'
      '        UNION ALL'
      
        '        SELECT CAST(3 AS INTEGER) AS cdSituacao, CAST('#39'Finalizad' +
        'a'#39' AS CHARACTER VARYING(20)) AS deSituacao'
      '       ) t'
      ' ORDER BY t.cdSituacao')
    Left = 653
    Top = 96
  end
  object dsSituacao: TDataSource
    AutoEdit = False
    DataSet = qySituacao
    OnStateChange = FrBarraBotoesdsDadosStateChange
    Left = 591
    Top = 97
  end
  object qyPrioridade: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      
        '        SELECT CAST(1 AS INTEGER) AS cdPrioridade, CAST('#39'Normal'#39 +
        ' AS CHARACTER VARYING(20)) AS dePrioridade'
      '        UNION ALL'
      
        '        SELECT CAST(2 AS INTEGER) AS cdPrioridade, CAST('#39'Aten'#231#227'o' +
        #39' AS CHARACTER VARYING(20)) AS dePrioridade'
      '        UNION ALL'
      
        '        SELECT CAST(3 AS INTEGER) AS cdPrioridade, CAST('#39'Urgente' +
        #39' AS CHARACTER VARYING(20)) AS dePrioridade'
      '       ) t'
      ' ORDER BY t.cdPrioridade')
    Left = 661
    Top = 144
  end
  object dsPrioridade: TDataSource
    AutoEdit = False
    DataSet = qyPrioridade
    OnStateChange = FrBarraBotoesdsDadosStateChange
    Left = 599
    Top = 145
  end
end
