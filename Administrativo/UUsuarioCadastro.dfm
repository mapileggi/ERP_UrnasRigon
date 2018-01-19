inherited FUsuarioCadastro: TFUsuarioCadastro
  Caption = 'Usu'#225'rios'
  ClientWidth = 819
  ExplicitWidth = 819
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 819
    ExplicitWidth = 819
    object lbcdUsuario: TLabel
      Left = 42
      Top = 6
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbnmUsuario: TLabel
      Left = 48
      Top = 30
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
    end
    object lbdeSenha: TLabel
      Left = 192
      Top = 54
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object lbdeLogin: TLabel
      Left = 50
      Top = 54
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Login:'
    end
    object lbdeEmail: TLabel
      Left = 47
      Top = 78
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail:'
    end
    object lbcdSetor: TLabel
      Left = 49
      Top = 102
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Setor:'
    end
    object Label1: TLabel
      Left = 13
      Top = 156
      Width = 214
      Height = 23
      Caption = 'Permiss'#245'es de acesso:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbcdColaborador: TLabel
      Left = 16
      Top = 126
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Colaborador:'
    end
    object lbdeHrCadastro: TLabel
      Left = 584
      Top = 54
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Cad.:'
    end
    object lbdtCadastro: TLabel
      Left = 584
      Top = 30
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Cad.:'
    end
    object lbnmUsuCad: TLabel
      Left = 571
      Top = 6
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbdeHrSlteracao: TLabel
      Left = 590
      Top = 126
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Alt.:'
    end
    object lbdtAlteracao: TLabel
      Left = 590
      Top = 102
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Alt.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 577
      Top = 78
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio Alt.:'
    end
    object edcdUsuario: TDBCampoCodigo
      Left = 80
      Top = 3
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
        '        SELECT u.cdUsuario,'
        '               u.nmUsuario,'
        '               u.deLogin,'
        '               u.deSenha,'
        '               u.deEmail,'
        '               u.flAtivo,'
        '               u.cdSetor,'
        '               s.deSetor'
        '          FROM erp.usuario u'
        '          LEFT JOIN erp.setor s ON (s.cdSetor = u.cdSetor)'
        '       ) t '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdUsuario'
        'nmUsuario'
        'deLogin')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Nome'
        'Login')
      ERPCampoChave = 'cdUsuario'
      ERPCampoDescricao = 'cdUsuario'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object cbflAtivo: TDBCheckBox
      Left = 189
      Top = 5
      Width = 52
      Height = 17
      Caption = 'Ativo'
      DataField = 'flativo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object ednmUsuario: TDBEdit
      Left = 80
      Top = 27
      Width = 247
      Height = 21
      DataField = 'nmusuario'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object eddeLogin: TDBEdit
      Left = 80
      Top = 51
      Width = 100
      Height = 21
      CharCase = ecLowerCase
      DataField = 'delogin'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object eddeSenha: TDBEdit
      Left = 227
      Top = 51
      Width = 100
      Height = 21
      DataField = 'desenha'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
    end
    object eddeEmail: TDBEdit
      Left = 80
      Top = 75
      Width = 247
      Height = 21
      DataField = 'deemail'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
    end
    object lcbcdSetor: TDBLookupComboBox
      Left = 80
      Top = 99
      Width = 111
      Height = 21
      DataField = 'cdsetor'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdsetor'
      ListField = 'desetor'
      ListSource = dsSetor
      TabOrder = 6
    end
    object gbTelasDisponiveis: TGroupBox
      Left = 13
      Top = 188
      Width = 324
      Height = 295
      Anchors = [akLeft, akTop, akBottom]
      Caption = ' Telas Dispon'#237'veis '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      DesignSize = (
        324
        295)
      object grTelasDisponiveis: TDBGrid
        Left = 5
        Top = 18
        Width = 314
        Height = 271
        TabStop = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsTelasDisponiveis
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cdtela'
            Title.Caption = 'C'#243'digo'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'detitulopai'
            Title.Caption = 'Item Menu Pai'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'detitulotela'
            Title.Caption = 'Tela'
            Width = 149
            Visible = True
          end>
      end
    end
    object gbUsuarioTela: TGroupBox
      Left = 400
      Top = 188
      Width = 411
      Height = 295
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Telas do Usu'#225'rio '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      DesignSize = (
        411
        295)
      object grUsuarioTela: TDBGrid
        Left = 5
        Top = 18
        Width = 400
        Height = 271
        TabStop = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsUsuarioTela
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cdtela'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'detitulopai'
            ReadOnly = True
            Title.Caption = 'Item Menu Pai'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'detitulotela'
            ReadOnly = True
            Title.Caption = 'Tela'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flativo'
            Title.Caption = 'Ativo'
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flcadastrar'
            Title.Caption = 'Cad.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flalterar'
            Title.Caption = 'Alt.'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flexcluir'
            Title.Caption = 'Exc.'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flexibequadroaviso'
            Title.Caption = 'Exibe Quadro Aviso'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'flexibemensagem'
            Title.Caption = 'Exibe Msg.'
            Width = 69
            Visible = True
          end>
      end
    end
    object btAdicionar: TBitBtn
      Left = 341
      Top = 226
      Width = 55
      Height = 52
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 10
      OnClick = btAdicionarClick
    end
    object btRemover: TBitBtn
      Left = 341
      Top = 277
      Width = 55
      Height = 52
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 11
      OnClick = btRemoverClick
    end
    object edcdColaborador: TDBCampoCodigo
      Left = 80
      Top = 123
      Width = 336
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 7
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
        '        SELECT a.cdColaborador,'
        '               a.nmColaborador,'
        '               a.deCpf,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               cs.deColabSituacao'
        '  FROM erp.Colaborador a'
        
          '  LEFT JOIN erp.colabSituacao cs ON (cs.cdColabSituacao = a.cdCo' +
          'labSituacao)'
        '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = a.cdCidade)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdColaborador'
        'nmColaborador'
        'deColabSituacao'
        'deCpf'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Nome'
        'Situa'#231#227'o'
        'CPF'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdColaborador'
      ERPCampoDescricao = 'nmColaborador'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object eddeHrCadastro: TDBEdit
      Left = 639
      Top = 51
      Width = 50
      Height = 21
      TabStop = False
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
      TabOrder = 12
    end
    object eddtCadastro: TDBDateTime
      Left = 639
      Top = 27
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 13
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcadastro'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuCad: TDBEdit
      Left = 639
      Top = 3
      Width = 171
      Height = 21
      TabStop = False
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
      TabOrder = 14
    end
    object eddeHrSlteracao: TDBEdit
      Left = 639
      Top = 123
      Width = 50
      Height = 21
      TabStop = False
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
    object eddtAlteracao: TDBDateTime
      Left = 639
      Top = 99
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 16
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtalteracao'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuAlt: TDBEdit
      Left = 639
      Top = 75
      Width = 171
      Height = 21
      TabStop = False
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
      TabOrder = 17
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 819
    ExplicitWidth = 819
    inherited sbBotoes: TScrollBox
      Width = 819
      ExplicitWidth = 819
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyUsuario
    end
  end
  object dsSetor: TDataSource
    AutoEdit = False
    DataSet = qySetor
    Left = 359
    Top = 81
  end
  object dsTelasDisponiveis: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyTelasDisponiveis
    Left = 103
    Top = 329
  end
  object dsUsuarioTela: TDataSource
    DataSet = DmERP.qyUsuarioTela
    Left = 199
    Top = 329
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
    Left = 403
    Top = 85
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
end
