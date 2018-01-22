inherited FColaboradorCadastro: TFColaboradorCadastro
  Caption = 'Colaboradores'
  ClientWidth = 815
  ExplicitWidth = 815
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 815
    ExplicitWidth = 815
    object lbcdColaborador: TLabel
      Left = 62
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbcdCodigoFolha: TLabel
      Left = 369
      Top = 7
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo Folha:'
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
    object lbdtCadastro: TLabel
      Left = 286
      Top = 440
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Data Cad.:'
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
    object lbdehrAlteracao: TLabel
      Left = 451
      Top = 464
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Hora Alt.:'
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
    object lbnmUsuAlt: TLabel
      Left = 35
      Top = 464
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Usu'#225'rio Alt.:'
    end
    object edcdColaborador: TDBCampoCodigo
      Left = 101
      Top = 4
      Width = 262
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
        '        SELECT a.cdColaborador,'
        '               a.nmColaborador,'
        '               a.cdCodigoFolha,'
        '               a.deCpf,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               cs.deColabSituacao,'
        '               a.cdEmpresa,'
        '               e.deRazaoSocial AS nmEmpresa'
        '  FROM erp.Colaborador a'
        '  LEFT JOIN erp.empresa e ON (e.cdEmpresa = a.cdEmpresa)'
        
          '  LEFT JOIN erp.colabSituacao cs ON (cs.cdColabSituacao = a.cdCo' +
          'labSituacao)'
        '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = a.cdCidade)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdColaborador'
        'cdCodigoFolha'
        'nmColaborador'
        'cdEmpresa'
        'nmEmpresa'
        'deColabSituacao'
        'deCpf'
        'nmCidade'
        'sgEstado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'C'#243'd. Folha'
        'Nome'
        'C'#243'd. Emp.'
        'Empresa'
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
    object edcdCodigoFolha: TDBEdit
      Left = 437
      Top = 4
      Width = 38
      Height = 21
      DataField = 'cdcodigofolha'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
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
      TabOrder = 2
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
      TabOrder = 3
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcadastro'
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
      TabOrder = 4
    end
    object eddehrAlteracao: TDBEdit
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
      TabOrder = 5
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
      TabOrder = 6
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtalteracao'
      DataSource = FrBarraBotoes.dsDados
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
      TabOrder = 7
    end
    object pcDados: TPageControl
      Left = 0
      Top = 40
      Width = 811
      Height = 391
      ActivePage = tsDependentes
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 8
      object tsDadosPessoais: TTabSheet
        Caption = 'Dados Pessoais'
        object sbDadosPessoais: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 363
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            803
            363)
          object lbnmColaborador: TLabel
            Left = 64
            Top = 7
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
          end
          object lbnmMae: TLabel
            Left = 346
            Top = 7
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#227'e:'
          end
          object lbnmPai: TLabel
            Left = 594
            Top = 7
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pai:'
          end
          object lbdtNascimento: TLabel
            Left = 36
            Top = 31
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nascimento:'
          end
          object lbflSexo: TLabel
            Left = 223
            Top = 31
            Width = 28
            Height = 13
            Caption = 'Sexo:'
          end
          object lbcdEstadoCivil: TLabel
            Left = 311
            Top = 55
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado Civil:'
          end
          object lbnmConjuge: TLabel
            Left = 568
            Top = 55
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#244'njuge:'
          end
          object lbcdCidadeNatural: TLabel
            Left = 551
            Top = 31
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cid. Natural:'
          end
          object lbdeNacionalidade: TLabel
            Left = 25
            Top = 55
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nacionalidade:'
          end
          object lbcdCorPele: TLabel
            Left = 311
            Top = 31
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cor da Pele:'
          end
          object lbcdGrauInstrucao: TLabel
            Left = 294
            Top = 79
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grau Instru'#231#227'o:'
          end
          object lbcdEmpresa: TLabel
            Left = 50
            Top = 103
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa:'
          end
          object lbcdCargo: TLabel
            Left = 62
            Top = 127
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cargo:'
          end
          object lbcdColabSituacao: TLabel
            Left = 50
            Top = 151
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Situa'#231#227'o:'
          end
          object lbdtAdmissao: TLabel
            Left = 321
            Top = 151
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Admiss'#227'o:'
          end
          object lbcdSetor: TLabel
            Left = 340
            Top = 103
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Setor:'
          end
          object lbvlSalario: TLabel
            Left = 334
            Top = 175
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sal'#225'rio:'
          end
          object lbcdSalarioTipo: TLabel
            Left = 36
            Top = 175
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Sal'#225'rio:'
          end
          object lbcdEscala: TLabel
            Left = 336
            Top = 127
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escala:'
          end
          object vlPercAdicInsalub: TLabel
            Left = 528
            Top = 175
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = '% Adic. Insalub.:'
          end
          object lbvlPercAdicPeric: TLabel
            Left = 681
            Top = 175
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = '% Adic. Peric.:'
          end
          object lbnuDiasContratoExp: TLabel
            Left = 517
            Top = 151
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dias Contrato Exp.:'
          end
          object lbnuDiasContratoExpExtra: TLabel
            Left = 667
            Top = 151
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dias Prorroga'#231#227'o:'
          end
          object lbdtExameAdmissao: TLabel
            Left = 4
            Top = 199
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Exame M'#233'd. Adm.:'
          end
          object lbvlValeTransp: TLabel
            Left = 521
            Top = 199
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Vale Transp.:'
          end
          object lbnuHorasJornada: TLabel
            Left = 21
            Top = 223
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas Jornada:'
          end
          object ednmColaborador: TDBEdit
            Left = 97
            Top = 4
            Width = 194
            Height = 21
            DataField = 'nmcolaborador'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 0
          end
          object ednmMae: TDBEdit
            Left = 372
            Top = 4
            Width = 179
            Height = 21
            DataField = 'nmmae'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 1
          end
          object ednmPai: TDBEdit
            Left = 614
            Top = 4
            Width = 179
            Height = 21
            DataField = 'nmpai'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 2
          end
          object eddtNascimento: TDBDateTime
            Left = 97
            Top = 28
            Width = 87
            Height = 21
            BevelOuter = bvNone
            Caption = 'eddtNascimento'
            ShowCaption = False
            TabOrder = 3
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtNascimento'
            DataSource = FrBarraBotoes.dsDados
          end
          object cbflSexo: TDBComboBox
            Left = 253
            Top = 28
            Width = 38
            Height = 22
            Style = csOwnerDrawFixed
            CharCase = ecUpperCase
            DataField = 'flsexo'
            DataSource = FrBarraBotoes.dsDados
            Items.Strings = (
              'M'
              'F')
            TabOrder = 4
          end
          object edcdEstadoCivil: TDBCampoCodigo
            Left = 372
            Top = 52
            Width = 190
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 8
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT *'
              '  FROM erp.estadoCivil'
              ' &filtro'
              ' ORDER BY cdEstadoCivil')
            ERPCamposFiltro.Strings = (
              'cdEstadoCivil'
              'deEstadoCivil')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdEstadoCivil'
            ERPCampoDescricao = 'deEstadoCivil'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object ednmConjuge: TDBEdit
            Left = 614
            Top = 52
            Width = 179
            Height = 21
            DataField = 'nmconjuge'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 9
          end
          object edcdCidadeNatural: TDBCampoCodigo
            Left = 614
            Top = 28
            Width = 186
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 6
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 40
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
              '        SELECT cdCidade AS cdCidadeNatural,'
              '               nmCidade,'
              '               sgEstado,'
              '               CAST(nmCidade || '#39'/'#39' ||'
              '                    sgEstado AS CHARACTER VARYING(250)'
              '                   ) AS deCidEst'
              '          FROM erp.cidade'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdCidadeNatural'
              'nmcidade'
              'sgestado')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Nome'
              'Estado')
            ERPCampoChave = 'cdCidadeNatural'
            ERPCampoDescricao = 'deCidEst'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object eddeNacionalidade: TDBEdit
            Left = 97
            Top = 52
            Width = 194
            Height = 21
            DataField = 'denacionalidade'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 7
          end
          object lcbcdCorPele: TDBLookupComboBox
            Left = 372
            Top = 28
            Width = 87
            Height = 21
            DataField = 'cdcorpele'
            DataSource = FrBarraBotoes.dsDados
            KeyField = 'cdcorpele'
            ListField = 'decorpele'
            ListSource = dsCorPele
            TabOrder = 5
          end
          object edcdGrauInstrucao: TDBCampoCodigo
            Left = 372
            Top = 76
            Width = 421
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 11
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT cdGrauInstrucao, deGrauInstrucao'
              '  FROM erp.grauInstrucao'
              ' &filtro'
              ' ORDER BY cdGrauInstrucao')
            ERPCamposFiltro.Strings = (
              'cdGrauInstrucao'
              'deGrauInstrucao')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdGrauInstrucao'
            ERPCampoDescricao = 'deGrauInstrucao'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object cbflEstudante: TDBCheckBox
            Left = 97
            Top = 78
            Width = 72
            Height = 17
            Caption = 'Estudante'
            DataField = 'flestudante'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 10
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edcdCargo: TDBCampoCodigo
            Left = 97
            Top = 124
            Width = 234
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 14
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT *'
              '  FROM erp.cargo'
              ' &filtro'
              ' ORDER BY cdCargo')
            ERPCamposFiltro.Strings = (
              'cdCargo'
              'deCargo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCargo'
            ERPCampoDescricao = 'deCargo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdColabSituacao: TDBCampoCodigo
            Left = 97
            Top = 148
            Width = 218
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 16
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT *'
              '  FROM erp.colabSituacao'
              ' &filtro'
              ' ORDER BY cdColabSituacao')
            ERPCamposFiltro.Strings = (
              'cdColabSituacao'
              'deColabSituacao')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdColabSituacao'
            ERPCampoDescricao = 'deColabSituacao'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object eddtAdmissao: TDBDateTime
            Left = 372
            Top = 148
            Width = 87
            Height = 21
            BevelOuter = bvNone
            Caption = 'eddtNascimento'
            ShowCaption = False
            TabOrder = 17
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtadmissao'
            DataSource = FrBarraBotoes.dsDados
          end
          object edcdEmpresa: TDBCampoCodigo
            Left = 97
            Top = 100
            Width = 237
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 12
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT t01.cdEmpresa,'
              '       t01.deRazaoSocial,'
              '       t01.nmFantasia,'
              '       t01.cdCidade,'
              '       t01.nmCidade,'
              '       t01.sgEstado'
              '  FROM ('
              '        SELECT e.cdEmpresa,'
              '               e.deRazaoSocial,'
              '               e.nmFantasia,'
              '               e.cdCidade,'
              '               cid.nmCidade,'
              '               cid.sgEstado'
              '          FROM erp.empresa e'
              
                '          LEFT JOIN erp.cidade cid ON (cid.cdCidade = e.cdCidade' +
                ')'
              '       ) t01 '
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdEmpresa'
              'deCnpj'
              'deRazaoSocial'
              'nmFantasia'
              'nmcidade'
              'sgestado')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'CNPJ'
              'Raz'#227'o Social'
              'Fantasia'
              'Cidade'
              'Estado')
            ERPCampoChave = 'cdEmpresa'
            ERPCampoDescricao = 'deRazaoSocial'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdSetor: TDBCampoCodigo
            Left = 372
            Top = 100
            Width = 254
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 13
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
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
              '         ORDER BY s.deSetor'
              '       ) t '
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdSetor'
              'deSetor')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdSetor'
            ERPCampoDescricao = 'deSetor'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edvlSalario: TDBEdit
            Left = 372
            Top = 172
            Width = 68
            Height = 21
            DataField = 'vlsalario'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 21
          end
          object edcdSalarioTipo: TDBCampoCodigo
            Left = 97
            Top = 172
            Width = 194
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 20
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
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
              '        SELECT cdSalarioTipo,'
              '               deSalarioTipo'
              '          FROM erp.salarioTipo'
              '         ORDER BY cdSalarioTipo'
              '       ) t '
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdSalarioTipo'
              'deSalarioTipo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdSalarioTipo'
            ERPCampoDescricao = 'deSalarioTipo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdEscala: TDBCampoCodigo
            Left = 372
            Top = 124
            Width = 254
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 15
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
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
              '        SELECT cdEscala,'
              '               deEscala'
              '          FROM erp.escala'
              '         ORDER BY cdEscala'
              '       ) t '
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdEscala'
              'deEscala')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdEscala'
            ERPCampoDescricao = 'deEscala'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edPercAdicInsalub: TDBEdit
            Left = 614
            Top = 172
            Width = 38
            Height = 21
            DataField = 'vlpercadicinsalub'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 22
          end
          object edvlPercAdicPeric: TDBEdit
            Left = 755
            Top = 172
            Width = 38
            Height = 21
            DataField = 'vlpercadicperic'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 23
          end
          object ednuDiasContratoExp: TDBEdit
            Left = 614
            Top = 148
            Width = 38
            Height = 21
            DataField = 'nudiascontratoexp'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 18
          end
          object ednuDiasContratoExpExtra: TDBEdit
            Left = 755
            Top = 148
            Width = 38
            Height = 21
            DataField = 'nudiascontratoexpextra'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 19
          end
          object eddtExameAdmissao: TDBDateTime
            Left = 97
            Top = 196
            Width = 87
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 24
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtexameadmissao'
            DataSource = FrBarraBotoes.dsDados
          end
          object cbflUsaValeTransp: TDBCheckBox
            Left = 372
            Top = 199
            Width = 123
            Height = 17
            Caption = 'Usa Vale Transporte'
            DataField = 'flusavaletransp'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 25
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edvlValeTransp: TDBEdit
            Left = 614
            Top = 196
            Width = 68
            Height = 21
            DataField = 'vlvaletransp'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 26
          end
          object ednuHorasJornada: TDBEdit
            Left = 97
            Top = 220
            Width = 38
            Height = 21
            DataField = 'nuhorasjornada'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 27
          end
        end
      end
      object tsEnderecoContato: TTabSheet
        Caption = 'Endere'#231'o/Contato'
        ImageIndex = 2
        object sbEnderecoContato: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 363
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object lbnuCep: TLabel
            Left = 80
            Top = 7
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'CEP:'
          end
          object lbdeEndereco: TLabel
            Left = 218
            Top = 7
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Endere'#231'o:'
          end
          object lbnuEndereco: TLabel
            Left = 700
            Top = 7
            Width = 16
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186':'
          end
          object lbdeComplemento: TLabel
            Left = 34
            Top = 31
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Complemento:'
          end
          object lbdeBairro: TLabel
            Left = 235
            Top = 31
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bairro:'
          end
          object lbcdCidade: TLabel
            Left = 448
            Top = 31
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cidade:'
          end
          object lbnuFone: TLabel
            Left = 57
            Top = 55
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefone:'
          end
          object lbnuCelular: TLabel
            Left = 230
            Top = 55
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Celular:'
          end
          object lbdeEmail: TLabel
            Left = 453
            Top = 55
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-mail:'
          end
          object ednuCep: TDBEdit
            Left = 105
            Top = 4
            Width = 68
            Height = 21
            DataField = 'nucep'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 0
            OnExit = ednuCepExit
          end
          object dedeEndereco: TDBEdit
            Left = 269
            Top = 4
            Width = 412
            Height = 21
            DataField = 'deendereco'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 1
          end
          object ednuEndereco: TDBEdit
            Left = 718
            Top = 4
            Width = 45
            Height = 21
            DataField = 'nuendereco'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 2
          end
          object eddeComplemento: TDBEdit
            Left = 105
            Top = 28
            Width = 119
            Height = 21
            DataField = 'decomplemento'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 3
          end
          object eddeBairro: TDBEdit
            Left = 269
            Top = 28
            Width = 159
            Height = 21
            DataField = 'debairro'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 4
          end
          object edcdCidade: TDBCampoCodigo
            Left = 487
            Top = 28
            Width = 276
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 5
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
              '        SELECT cdCidade,'
              '               nmCidade,'
              '               sgEstado,'
              '               CAST(nmCidade || '#39'/'#39' ||'
              '                    sgEstado AS CHARACTER VARYING(250)'
              '                   ) AS deCidEst'
              '          FROM erp.cidade'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdcidade'
              'nmcidade'
              'sgestado')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Nome'
              'Estado')
            ERPCampoChave = 'cdcidade'
            ERPCampoDescricao = 'deCidEst'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object ednuFone: TDBEdit
            Left = 105
            Top = 52
            Width = 91
            Height = 21
            DataField = 'nufone'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 6
          end
          object ednuCelular: TDBEdit
            Left = 269
            Top = 52
            Width = 91
            Height = 21
            DataField = 'nuCelular'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 7
          end
          object eddeEmail: TDBEdit
            Left = 487
            Top = 52
            Width = 276
            Height = 21
            DataField = 'deemail'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 8
          end
        end
      end
      object tsDocumentos: TTabSheet
        Caption = 'Documentos'
        ImageIndex = 1
        object sbDocumentos: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 363
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object lbdeCpf: TLabel
            Left = 72
            Top = 7
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'CPF:'
          end
          object lbnuReservista: TLabel
            Left = 222
            Top = 7
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Reservista:'
          end
          object lbnuCnh: TLabel
            Left = 428
            Top = 7
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'CNH:'
          end
          object lbnuRG: TLabel
            Left = 77
            Top = 31
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'RG:'
          end
          object lbdeRgOrgaoExp: TLabel
            Left = 233
            Top = 31
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = #211'rg'#227'o Exp.:'
          end
          object lbdtRgEmissao: TLabel
            Left = 567
            Top = 31
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Emiss'#227'o:'
          end
          object lbnuTituloEleitor: TLabel
            Left = 32
            Top = 55
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo Eleitor:'
          end
          object lbnuTituloEleitorZona: TLabel
            Left = 264
            Top = 55
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Zona:'
          end
          object lbnuTituloEleitorSecao: TLabel
            Left = 420
            Top = 55
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Se'#231#227'o:'
          end
          object lbnuPis: TLabel
            Left = 75
            Top = 79
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'PIS:'
          end
          object lbnuCtps: TLabel
            Left = 220
            Top = 79
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carteira Trab.:'
          end
          object lbdeCtpsSerie: TLabel
            Left = 425
            Top = 79
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'S'#233'rie:'
          end
          object lbsgCtpsEstado: TLabel
            Left = 572
            Top = 79
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado:'
          end
          object lbdtCtpsEmissao: TLabel
            Left = 670
            Top = 79
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Emiss'#227'o:'
          end
          object lbnuConta: TLabel
            Left = 47
            Top = 103
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Conta:'
          end
          object lbnuContaDigito: TLabel
            Left = 168
            Top = 103
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'gito:'
          end
          object lbcdAgencia: TLabel
            Left = 250
            Top = 103
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ag'#234'ncia:'
          end
          object lbsgRgEstadoEmissor: TLabel
            Left = 416
            Top = 31
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado:'
          end
          object lbdeCnhCategoria: TLabel
            Left = 548
            Top = 7
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Categ. CNH:'
          end
          object eddeCpf: TDBEdit
            Left = 97
            Top = 4
            Width = 107
            Height = 21
            DataField = 'decpf'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 0
          end
          object ednuReservista: TDBEdit
            Left = 294
            Top = 4
            Width = 107
            Height = 21
            DataField = 'nureservista'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 1
          end
          object ednuCnh: TDBEdit
            Left = 455
            Top = 4
            Width = 87
            Height = 21
            DataField = 'nucnh'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 2
          end
          object ednuRG: TDBEdit
            Left = 97
            Top = 28
            Width = 107
            Height = 21
            DataField = 'nurg'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 4
          end
          object eddeRgOrgaoExp: TDBEdit
            Left = 294
            Top = 28
            Width = 107
            Height = 21
            DataField = 'dergorgaoexp'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 5
          end
          object eddtRgEmissao: TDBDateTime
            Left = 611
            Top = 28
            Width = 87
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 7
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtRgEmissao'
            DataSource = FrBarraBotoes.dsDados
          end
          object ednuTituloEleitor: TDBEdit
            Left = 97
            Top = 52
            Width = 107
            Height = 21
            DataField = 'nuTituloEleitor'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 8
          end
          object ednuTituloEleitorZona: TDBEdit
            Left = 294
            Top = 52
            Width = 107
            Height = 21
            DataField = 'nutituloeleitorzona'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 9
          end
          object ednuTituloEleitorSecao: TDBEdit
            Left = 455
            Top = 52
            Width = 87
            Height = 21
            DataField = 'nutituloeleitorsecao'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 10
          end
          object ednuPis: TDBEdit
            Left = 97
            Top = 76
            Width = 107
            Height = 21
            DataField = 'nupis'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 11
          end
          object ednuCtps: TDBEdit
            Left = 294
            Top = 76
            Width = 107
            Height = 21
            DataField = 'nuCtps'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 12
          end
          object eddeCtpsSerie: TDBEdit
            Left = 455
            Top = 76
            Width = 87
            Height = 21
            DataField = 'deCtpsSerie'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 13
          end
          object cbsgCtpsEstado: TDBComboBox
            Left = 611
            Top = 76
            Width = 44
            Height = 22
            Style = csOwnerDrawFixed
            CharCase = ecUpperCase
            DataField = 'sgctpsestado'
            DataSource = FrBarraBotoes.dsDados
            Items.Strings = (
              'AC'
              'AL'
              'AP'
              'AM'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MT'
              'MS'
              'MG'
              'PR'
              'PB'
              'PA'
              'PE'
              'PI'
              'RJ'
              'RN'
              'RS'
              'RO'
              'RR'
              'SC'
              'SE'
              'SP'
              'TO')
            TabOrder = 14
          end
          object eddtCtpsEmissao: TDBDateTime
            Left = 713
            Top = 76
            Width = 87
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 15
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtctpsemissao'
            DataSource = FrBarraBotoes.dsDados
          end
          object ednuConta: TDBEdit
            Left = 97
            Top = 100
            Width = 65
            Height = 21
            DataField = 'nuconta'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 16
          end
          object ednuContaDigito: TDBEdit
            Left = 201
            Top = 100
            Width = 24
            Height = 21
            DataField = 'nucontadigito'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 17
          end
          object edcdAgencia: TDBCampoCodigo
            Left = 294
            Top = 100
            Width = 425
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 18
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
              '        SELECT a.cdAgencia,'
              '               a.deAgencia,'
              '               a.nuAgencia,'
              '               a.nuDigito,'
              '               a.cdBanco,'
              '               b.deBanco,'
              '               cid.nmCidade,'
              '               cid.sgEstado'
              '  FROM erp.agencia a'
              '  LEFT JOIN erp.banco b ON (b.cdBanco = a.cdBanco)'
              '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = a.cdCidade)'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdAgencia'
              'deAgencia'
              'nuAgencia'
              'nuDigito'
              'cdBanco'
              'deBanco'
              'nmCidade'
              'sgEstado')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Ag'#234'ncia'
              'N'#186' Ag'#234'ncia'
              'D'#237'gito'
              'C'#243'd. Banco'
              'Desc. Banco'
              'Cidade'
              'Estado')
            ERPCampoChave = 'cdAgencia'
            ERPCampoDescricao = 'deAgencia'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object cbsgRgEstadoEmissor: TDBComboBox
            Left = 455
            Top = 28
            Width = 44
            Height = 22
            Style = csOwnerDrawFixed
            CharCase = ecUpperCase
            DataField = 'sgrgestadoemissor'
            DataSource = FrBarraBotoes.dsDados
            Items.Strings = (
              'AC'
              'AL'
              'AP'
              'AM'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MT'
              'MS'
              'MG'
              'PR'
              'PB'
              'PA'
              'PE'
              'PI'
              'RJ'
              'RN'
              'RS'
              'RO'
              'RR'
              'SC'
              'SE'
              'SP'
              'TO')
            TabOrder = 6
          end
          object eddeCnhCategoria: TDBEdit
            Left = 611
            Top = 4
            Width = 65
            Height = 21
            DataField = 'decnhcategoria'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 3
          end
        end
      end
      object tsDependentes: TTabSheet
        Caption = 'Dependentes'
        ImageIndex = 3
        object sbDependentes: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 363
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            803
            363)
          object lbnmDependente: TLabel
            Left = 65
            Top = 7
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
          end
          object lbcdGrauParentesco: TLabel
            Left = 12
            Top = 31
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grau Parentesco:'
          end
          object lbdtNascGrauParent: TLabel
            Left = 36
            Top = 55
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nascimento:'
          end
          object ednmDependente: TDBEdit
            Left = 97
            Top = 4
            Width = 179
            Height = 21
            DataField = 'nmdependente'
            DataSource = FrBarraBotoesItens.dsDadosItens
            TabOrder = 0
          end
          object edcdGrauParentesco: TDBCampoCodigo
            Left = 97
            Top = 28
            Width = 258
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT *'
              '  FROM erp.grauParentesco'
              ' &filtro'
              ' ORDER BY cdGrauParentesco')
            ERPCamposFiltro.Strings = (
              'cdGrauParentesco'
              'deGrauParentesco')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdGrauParentesco'
            ERPCampoDescricao = 'deGrauParentesco'
            ERPDataSource = FrBarraBotoesItens.dsDadosItens
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object eddtNascGrauParent: TDBDateTime
            Left = 97
            Top = 52
            Width = 87
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 2
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtNascimento'
            DataSource = FrBarraBotoesItens.dsDadosItens
          end
          inline FrBarraBotoesItens: TFBarraBotoesItens
            Left = 96
            Top = 79
            Width = 182
            Height = 26
            TabOrder = 3
            ExplicitLeft = 96
            ExplicitTop = 79
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
              end
              inherited btCancelar: TBitBtn
                OnClick = FrBarraBotoesItensbtCancelarClick
              end
              inherited btExluir: TBitBtn
                OnClick = FrBarraBotoesItensbtExluirClick
              end
            end
            inherited dsDadosItens: TDataSource
              DataSet = DmERP.qyColabDependentes
            end
          end
          object grDependentes: TDBGrid
            Left = 0
            Top = 120
            Width = 801
            Height = 240
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = FrBarraBotoesItens.dsDadosItens
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
                FieldName = 'cdcolabdependentes'
                Title.Caption = 'N'#186
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nmdependente'
                Title.Caption = 'Nome'
                Width = 154
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'degrauparentesco'
                Title.Caption = 'Grau Parentesco'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtnascimento'
                Title.Caption = 'Nascimento'
                Width = 82
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
                FieldName = 'nmusualt'
                Title.Caption = 'Usu'#225'rio Alt.'
                Width = 150
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 815
    ExplicitWidth = 815
    inherited sbBotoes: TScrollBox
      Width = 815
      ExplicitWidth = 815
      inherited btImprimir: TBitBtn
        Visible = True
        OnClick = FrBarraBotoesbtImprimirClick
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyColaborador
    end
    inherited pmImpressao: TPopupMenu
      object pmiFichaAdm: TMenuItem
        Caption = 'Ficha de Admiss'#227'o'
        OnClick = pmiFichaAdmClick
      end
    end
  end
  object dsCorPele: TDataSource
    AutoEdit = False
    DataSet = qyCorPele
    Left = 623
    Top = 11
  end
  object qyCorPele: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT cdCorPele,'
      '       deCorPele'
      '  FROM erp.corPele')
    Left = 679
    Top = 11
  end
  object relColabFichaAdm: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;        '
      ''
      'procedure mLocalDataOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mLocalData.Text := <dbColaborador."nmcidadeemp"> + '#39', '#39' + Data' +
        'ExtensoColab;                                                   ' +
        '                                 '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relColabFichaAdmUserFunction
    Left = 450
    Top = 408
    Datasets = <
      item
        DataSet = dbColabDepend
        DataSetName = 'dbColabDepend'
      end
      item
        DataSet = dbColaborador
        DataSetName = 'dbColaborador'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 1028.032160000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 964.559680000001000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line5: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 639.520246460000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mUsuDataHora: TfrxMemoView
          Width = 641.008254800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 3.779542200000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        DataSet = dbColaborador
        DataSetName = 'dbColaborador'
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
      end
      object gfColaborador: TfrxGroupFooter
        FillType = ftBrush
        Height = 411.968770000000000000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Top = 0.779530000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object Memo46: TfrxMemoView
          Top = 22.677180000000000000
          Width = 168.189061810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Exame M'#233'dico Admiss'#227'o:')
          ParentFont = False
        end
        object dbColaboradordtexameadmissao: TfrxMemoView
          Left = 170.740260000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtexameadmissao'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."dtexameadmissao"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 257.008040000000000000
          Top = 22.677180000000000000
          Width = 141.732351810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contrato Experi'#234'ncia:')
          ParentFont = False
        end
        object dbColaboradornudiascontratoexp: TfrxMemoView
          Left = 398.630180000000000000
          Top = 22.677180000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'nudiascontratoexp'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."nudiascontratoexp"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 432.645950000000000000
          Top = 22.677180000000000000
          Width = 160.630001810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'dias, prorrog'#225'vel por mais:')
          ParentFont = False
        end
        object dbColaboradornudiascontratoexpextra: TfrxMemoView
          Left = 595.165740000000000000
          Top = 22.677180000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'nudiascontratoexpextra'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."nudiascontratoexpextra"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Top = 45.354360000000000000
          Width = 122.834701810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local de Trabalho:')
          ParentFont = False
        end
        object dbColaboradordesetor: TfrxMemoView
          Left = 117.165430000000000000
          Top = 45.354360000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataField = 'desetor'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."desetor"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Top = 68.031540000000000000
          Width = 58.582691810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fun'#231#227'o:')
          ParentFont = False
        end
        object dbColaboradordecargo: TfrxMemoView
          Left = 52.913420000000000000
          Top = 68.031540000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DataField = 'decargo'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."decargo"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 291.023810000000000000
          Top = 68.031540000000000000
          Width = 58.582691810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sal'#225'rio:')
          ParentFont = False
        end
        object dbColaboradorvlsalario: TfrxMemoView
          Left = 343.937230000000000000
          Top = 68.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'vlsalario'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."vlsalario"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 427.645950000000000000
          Top = 68.031540000000000000
          Width = 109.606304090000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vale Transporte:')
          ParentFont = False
        end
        object dbColaboradorflusavaletransp: TfrxMemoView
          Left = 538.472790000000000000
          Top = 68.031540000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[IIF(<dbColaborador."flusavaletransp"> = '#39'S'#39', '#39'Sim'#39', '#39'N'#227'o'#39')]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 578.268090000000000000
          Top = 68.031540000000000000
          Width = 40.818897637795280000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor:')
          ParentFont = False
        end
        object dbColaboradorvlvaletransp: TfrxMemoView
          Left = 622.842920000000000000
          Top = 68.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'vlvaletransp'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."vlvaletransp"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Top = 90.708720000000000000
          Width = 103.937051810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo de Sal'#225'rio:')
          ParentFont = False
        end
        object dbColaboradordesalariotipo: TfrxMemoView
          Left = 106.488250000000000000
          Top = 90.708720000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'desalariotipo'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."desalariotipo"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 113.385900000000000000
          Width = 137.196857720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hor'#225'rio de Trabalho:')
          ParentFont = False
        end
        object dbColaboradordeescalaitem: TfrxMemoView
          Left = 136.063080000000000000
          Top = 113.385900000000000000
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          DataField = 'deescalaitem'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."deescalaitem"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Top = 136.063080000000000000
          Width = 177.637795275590600000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Adicional de Insalubridade:')
          ParentFont = False
        end
        object dbColaboradorflpercadicinsalub: TfrxMemoView
          Left = 177.637910000000000000
          Top = 136.063080000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'flpercadicinsalub'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."flpercadicinsalub"]')
          ParentFont = False
        end
        object dbColaboradorvlpercadicinsalub: TfrxMemoView
          Left = 230.551330000000000000
          Top = 136.063080000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'vlpercadicinsalub'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."vlpercadicinsalub"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 260.787570000000000000
          Top = 136.063080000000000000
          Width = 179.527651810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '% - Sobre o m'#237'nimo nacional')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Top = 158.740260000000000000
          Width = 185.952755905511800000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Adicional de Periculosidade:')
          ParentFont = False
        end
        object dbColaboradorflpercadicperic: TfrxMemoView
          Left = 181.417440000000000000
          Top = 158.740260000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'flpercadicperic'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."flpercadicperic"]')
          ParentFont = False
        end
        object dbColaboradorvlpercadicperic: TfrxMemoView
          Left = 234.330860000000000000
          Top = 158.740260000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'vlpercadicperic'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."vlpercadicperic"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 260.787570000000000000
          Top = 158.740260000000000000
          Width = 20.787391810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 196.542980000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object Memo60: TfrxMemoView
          Top = 215.983920000000000000
          Width = 51.023631810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Anexar:')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Top = 238.110390000000000000
          Width = 330.708851810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'C'#243'pia certid'#227'o nascimento filhos menores de 14 anos.')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Top = 272.126160000000000000
          Width = 406.299451810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'Assumo inteira responsabilidade pelas informa'#231#245'es aqui prestadas' +
              '.')
          ParentFont = False
        end
        object mLocalData: TfrxMemoView
          Top = 306.141930000000000000
          Width = 514.016080000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mLocalDataOnBeforePrint'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'LOCAL E DATA POR EXTENSO')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 151.181200000000000000
          Top = 389.291590000000000000
          Width = 413.858511810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Assinatura do Funcion'#225'rio')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 235.448980000000000000
          Top = 90.708720000000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Jornada Mensal:')
          ParentFont = False
        end
        object dbColaboradornuhorasjornada: TfrxMemoView
          Left = 343.937007870000000000
          Top = 90.708720000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'nuhorasjornada'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbColaborador."nuhorasjornada"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 383.071120000000000000
          Top = 90.708720000000000000
          Width = 28.346451810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Hrs')
          ParentFont = False
        end
      end
      object ghColaborador: TfrxGroupHeader
        FillType = ftBrush
        Height = 128.504020000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = relColabFichaAdm.chColab1
        Condition = 'dbColaborador."cdcolaborador"'
        StartNewPage = True
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Top = 6.559060000000017000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object dbItensRelacReldeTipoRelacao: TfrxMemoView
          Top = 40.795300000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dbColaborador."nmEmpresa"]')
          ParentFont = False
        end
        object dbColaboradordecnpjempmasc: TfrxMemoView
          Top = 68.252010000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CNPJ: [dbColaborador."decnpjempmasc"]')
          ParentFont = False
        end
        object dbColaboradordeenderecoemp: TfrxMemoView
          Top = 90.929190000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<dbColaborador."deenderecoemp">] - [IIF(<dbColaborador."nuender' +
              'ecoemp"> > 0, IntToStr(<dbColaborador."nuenderecoemp">),'#39#39')] - [' +
              '<dbColaborador."debairroemp">] - [<dbColaborador."nmcidadeemp">]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo22: TfrxMemoView
          Top = 0.338590000000000000
          Width = 718.110700000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ficha de Admiss'#227'o')
          ParentFont = False
        end
      end
      object chColab1: TfrxChild
        FillType = ftBrush
        Height = 294.803340000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 145.511811020000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do Funcion'#225'rio:')
          ParentFont = False
        end
        object dbColaboradornmcolaborador: TfrxMemoView
          Left = 147.401670000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'nmcolaborador'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."nmcolaborador"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 420.307360000000000000
          Width = 39.685041810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd.:')
          ParentFont = False
        end
        object dbColaboradorcdcodigofolha: TfrxMemoView
          Left = 459.590551181102400000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'cdcodigofolha'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."cdcodigofolha"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 538.134200000000000000
          Width = 103.937051810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Admiss'#227'o:')
          ParentFont = False
        end
        object dbColaboradordtadmissao: TfrxMemoView
          Left = 642.519685040000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'dtadmissao'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."dtadmissao"]')
        end
        object Memo4: TfrxMemoView
          Top = 20.897650000000000000
          Width = 95.244096930000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome da M'#227'e:')
          ParentFont = False
        end
        object dbColaboradornmmae: TfrxMemoView
          Left = 94.488250000000000000
          Top = 20.897650000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'nmmae'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nmmae"]')
        end
        object Memo5: TfrxMemoView
          Left = 370.393940000000000000
          Top = 20.897650000000000000
          Width = 87.685036930000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do Pai:')
          ParentFont = False
        end
        object dbColaboradornmpai: TfrxMemoView
          Left = 459.543600000000000000
          Top = 20.897650000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'nmpai'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nmpai"]')
        end
        object Memo6: TfrxMemoView
          Top = 41.795300000000000000
          Width = 77.480341810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Nasc.:')
          ParentFont = False
        end
        object dbColaboradordtnascimento: TfrxMemoView
          Left = 75.590600000000000000
          Top = 41.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtnascimento'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."dtnascimento"]')
        end
        object Memo7: TfrxMemoView
          Left = 159.299320000000000000
          Top = 41.795300000000000000
          Width = 86.929138740000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado Civil:')
          ParentFont = False
        end
        object dbColaboradordeestadocivil: TfrxMemoView
          Left = 245.669450000000000000
          Top = 41.795300000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'deestadocivil'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."deestadocivil"]')
        end
        object Memo8: TfrxMemoView
          Left = 336.598640000000000000
          Top = 41.795300000000000000
          Width = 122.078745040000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do C'#244'njuge:')
          ParentFont = False
        end
        object dbColaboradornmconjuge: TfrxMemoView
          Left = 459.543307090000000000
          Top = 41.795300000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'nmconjuge'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nmconjuge"]')
        end
        object Memo10: TfrxMemoView
          Top = 62.692950000000000000
          Width = 67.653545750000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object dbColaboradordeendereco: TfrxMemoView
          Left = 64.252010000000000000
          Top = 62.692950000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DataField = 'deendereco'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."deendereco"]')
        end
        object Memo11: TfrxMemoView
          Left = 302.362400000000000000
          Top = 62.692950000000000000
          Width = 26.078742600000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186':')
          ParentFont = False
        end
        object dbColaboradornuendereco: TfrxMemoView
          Left = 325.039580000000000000
          Top = 62.692950000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          DataField = 'nuendereco'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nuendereco"]')
        end
        object Memo12: TfrxMemoView
          Left = 362.055350000000000000
          Top = 62.692950000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Complemento:')
          ParentFont = False
        end
        object dbColaboradordecomplemento: TfrxMemoView
          Left = 459.590551181102400000
          Top = 62.692950000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataField = 'decomplemento'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."decomplemento"]')
        end
        object Memo13: TfrxMemoView
          Top = 83.590600000000000000
          Width = 47.244101810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object dbColaboradordebairro: TfrxMemoView
          Left = 43.574830000000000000
          Top = 83.590600000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'debairro'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."debairro"]')
        end
        object Memo14: TfrxMemoView
          Left = 274.228510000000000000
          Top = 83.590600000000000000
          Width = 54.803161810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object dbColaboradornmcidade: TfrxMemoView
          Left = 325.039370080000000000
          Top = 83.590600000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DataField = 'nmcidade'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nmcidade"]')
        end
        object Memo15: TfrxMemoView
          Left = 591.386210000000000000
          Top = 83.590600000000000000
          Width = 54.803161810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado:')
          ParentFont = False
        end
        object dbColaboradorsgestado: TfrxMemoView
          Left = 642.519685039370100000
          Top = 83.590600000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'sgestado'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."sgestado"]')
        end
        object Memo16: TfrxMemoView
          Top = 104.488250000000000000
          Width = 37.417325280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF:')
          ParentFont = False
        end
        object dbColaboradordecpfmasc: TfrxMemoView
          Left = 34.015770000000010000
          Top = 104.488250000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'decpfmasc'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."decpfmasc"]')
        end
        object Memo17: TfrxMemoView
          Left = 217.315090000000000000
          Top = 104.488250000000000000
          Width = 32.125981810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RG:')
          ParentFont = False
        end
        object dbColaboradornurg: TfrxMemoView
          Left = 245.669291338582700000
          Top = 104.488250000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'nurg'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nurg"]')
        end
        object Memo18: TfrxMemoView
          Left = 349.598640000000000000
          Top = 104.488250000000000000
          Width = 111.496111810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado Emissor:')
          ParentFont = False
        end
        object dbColaboradorsgrgestadoemissor: TfrxMemoView
          Left = 459.590551180000000000
          Top = 104.488250000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'sgrgestadoemissor'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."sgrgestadoemissor"]')
        end
        object Memo19: TfrxMemoView
          Left = 548.811380000000000000
          Top = 104.488250000000000000
          Width = 96.377991810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Emiss'#227'o:')
          ParentFont = False
        end
        object dbColaboradordtrgemissao: TfrxMemoView
          Left = 642.519685039370100000
          Top = 104.488250000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'dtrgemissao'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."dtrgemissao"]')
        end
        object Memo20: TfrxMemoView
          Top = 125.385900000000000000
          Width = 66.141751810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CTPS N'#186':')
          ParentFont = False
        end
        object dbColaboradornuctps: TfrxMemoView
          Left = 60.472480000000000000
          Top = 125.385900000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'nuctps'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nuctps"]')
        end
        object Memo21: TfrxMemoView
          Left = 204.094620000000000000
          Top = 125.385900000000000000
          Width = 43.464571810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'S'#233'rie:')
          ParentFont = False
        end
        object dbColaboradordectpsserie: TfrxMemoView
          Left = 245.669450000000000000
          Top = 125.385900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dectpsserie'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."dectpsserie"]')
        end
        object Memo23: TfrxMemoView
          Left = 430.086890000000000000
          Top = 125.385900000000000000
          Width = 32.125981810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'PIS:')
          ParentFont = False
        end
        object dbColaboradornupis: TfrxMemoView
          Left = 459.590551181102400000
          Top = 125.385900000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'nupis'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nupis"]')
        end
        object Memo24: TfrxMemoView
          Left = 548.811380000000000000
          Top = 125.385900000000000000
          Width = 96.377991810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Emiss'#227'o:')
          ParentFont = False
        end
        object dbColaboradordtctpsemissao: TfrxMemoView
          Left = 642.519685039370100000
          Top = 125.385900000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'dtctpsemissao'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."dtctpsemissao"]')
        end
        object Memo25: TfrxMemoView
          Top = 146.283550000000000000
          Width = 92.598461810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186' Reservista:')
          ParentFont = False
        end
        object dbColaboradornureservista: TfrxMemoView
          Left = 90.708720000000000000
          Top = 146.283550000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'nureservista'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nureservista"]')
        end
        object Memo26: TfrxMemoView
          Left = 215.771800000000000000
          Top = 146.283550000000000000
          Width = 92.598461810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'T'#237'tulo Eleitor:')
          ParentFont = False
        end
        object dbColaboradornutituloeleitor: TfrxMemoView
          Left = 306.141732280000000000
          Top = 146.283550000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'nutituloeleitor'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nutituloeleitor"]')
        end
        object Memo27: TfrxMemoView
          Left = 487.779840000000000000
          Top = 146.283550000000000000
          Width = 40.818900080000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Zona:')
          ParentFont = False
        end
        object dbColaboradornutituloeleitorzona: TfrxMemoView
          Left = 529.732298110000000000
          Top = 146.283550000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'nutituloeleitorzona'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nutituloeleitorzona"]')
        end
        object Memo28: TfrxMemoView
          Left = 596.827150000000000000
          Top = 146.283550000000000000
          Width = 48.755907950000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Se'#231#227'o:')
          ParentFont = False
        end
        object dbColaboradornutituloeleitorsecao: TfrxMemoView
          Left = 642.519685039370100000
          Top = 146.283550000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'nutituloeleitorsecao'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nutituloeleitorsecao"]')
        end
        object Memo29: TfrxMemoView
          Top = 167.181200000000000000
          Width = 54.803149610000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CNH N'#186':')
          ParentFont = False
        end
        object dbColaboradornucnh: TfrxMemoView
          Left = 54.913420000000000000
          Top = 167.181200000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'nucnh'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nucnh"]')
        end
        object Memo30: TfrxMemoView
          Left = 216.992270000000000000
          Top = 167.181200000000000000
          Width = 87.685041810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Naturalidade:')
          ParentFont = False
        end
        object dbColaboradornmcidadenat: TfrxMemoView
          Left = 306.141732280000000000
          Top = 167.181200000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'nmcidadenat'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."nmcidadenat"]')
        end
        object Memo31: TfrxMemoView
          Left = 428.748300000000000000
          Top = 167.181200000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nacionalidade:')
          ParentFont = False
        end
        object dbColaboradordenacionalidade: TfrxMemoView
          Left = 529.574817800000000000
          Top = 167.181200000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'denacionalidade'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."denacionalidade"]')
        end
        object Memo32: TfrxMemoView
          Left = 591.031540000000000000
          Top = 167.078540000000000000
          Width = 52.913388270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado:')
          ParentFont = False
        end
        object dbColaboradorsgestadonat: TfrxMemoView
          Left = 642.519685039370100000
          Top = 167.181200000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'sgestadonat'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."sgestadonat"]')
        end
        object Memo33: TfrxMemoView
          Top = 188.078850000000000000
          Width = 81.259871810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cor da Pele:')
          ParentFont = False
        end
        object dbColaboradordecorpele: TfrxMemoView
          Left = 79.370130000000000000
          Top = 188.078850000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'decorpele'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."decorpele"]')
        end
        object Memo34: TfrxMemoView
          Left = 184.196970000000000000
          Top = 188.078850000000000000
          Width = 122.834701810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Grau de Instru'#231#227'o:')
          ParentFont = False
        end
        object dbColaboradordegrauinstrucao: TfrxMemoView
          Left = 306.141930000000000000
          Top = 188.078850000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataField = 'degrauinstrucao'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."degrauinstrucao"]')
        end
        object Memo35: TfrxMemoView
          Left = 572.488560000000000000
          Top = 188.078850000000000000
          Width = 71.055120550000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estudante:')
          ParentFont = False
        end
        object dbColaboradordeestudante: TfrxMemoView
          Left = 642.519685039370100000
          Top = 188.078850000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'deestudante'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."deestudante"]')
        end
        object Memo36: TfrxMemoView
          Top = 208.976500000000000000
          Width = 35.905511810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tel.:')
          ParentFont = False
        end
        object dbColaboradordefone: TfrxMemoView
          Left = 34.015770000000010000
          Top = 208.976500000000000000
          Width = 94.488188976377960000
          Height = 18.897650000000000000
          DataField = 'defone'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."defone"]')
        end
        object Memo37: TfrxMemoView
          Left = 253.181200000000000000
          Top = 208.976500000000000000
          Width = 54.803161810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Celular:')
          ParentFont = False
        end
        object dbColaboradordecelular: TfrxMemoView
          Left = 306.141732280000000000
          Top = 208.976500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'decelular'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."decelular"]')
        end
        object Memo38: TfrxMemoView
          Left = 480.220780000000000000
          Top = 208.976500000000000000
          Width = 48.755907950000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'E-mail:')
          ParentFont = False
        end
        object dbColaboradordeemail: TfrxMemoView
          Left = 529.732298110000000000
          Top = 208.976500000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'deemail'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."deemail"]')
        end
        object Memo39: TfrxMemoView
          Top = 229.874150000000000000
          Width = 51.023631810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Banco:')
          ParentFont = False
        end
        object dbColaboradordebanco: TfrxMemoView
          Left = 46.354360000000000000
          Top = 229.874150000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = 'debanco'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            '[dbColaborador."debanco"]')
        end
        object Memo40: TfrxMemoView
          Left = 247.008040000000000000
          Top = 229.874150000000000000
          Width = 58.582691810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ag'#234'ncia:')
          ParentFont = False
        end
        object dbColaboradornuagencia: TfrxMemoView
          Left = 306.141732280000000000
          Top = 229.874150000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            
              '[IIF(<dbColaborador."nudigitoage"> <> '#39#39',<dbColaborador."nuagenc' +
              'ia"> + '#39'-'#39' + <dbColaborador."nudigitoage">,<dbColaborador."nuage' +
              'ncia">)]')
        end
        object Memo41: TfrxMemoView
          Left = 482.205010000000000000
          Top = 229.874150000000000000
          Width = 46.110238660000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Conta:')
          ParentFont = False
        end
        object dbColaboradornuconta: TfrxMemoView
          Left = 529.732298110000000000
          Top = 229.874150000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Memo.UTF8W = (
            
              '[IIF(<dbColaborador."nuconta"> > 0, IntToStr(<dbColaborador."nuc' +
              'onta">), '#39#39')][IIF(<dbColaborador."nucontadigito"> <> '#39#39', '#39'-'#39' + <' +
              'dbColaborador."nucontadigito">, '#39#39')]')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo42: TfrxMemoView
          Top = 253.228510000000000000
          Width = 100.157521810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dependentes:')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Top = 275.126160000000000000
          Width = 300.472611810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 302.362400000000000000
          Top = 275.149606300000000000
          Width = 300.472611810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Grau de Parentesco')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 627.401980000000000000
          Top = 275.149606299212600000
          Width = 77.480341810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nascimento')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 147.401670000000000000
          Top = 167.055118110000000000
          Width = 34.015748030000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cat.:')
          ParentFont = False
        end
        object dbColaboradordecnhcategoria: TfrxMemoView
          Left = 180.976500000000000000
          Top = 167.055118110000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'decnhcategoria'
          DataSet = dbColaborador
          DataSetName = 'dbColaborador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColaborador."decnhcategoria"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 514.016080000000000000
        Width = 718.110700000000000000
        DataSet = dbColabDepend
        DataSetName = 'dbColabDepend'
        RowCount = 0
        object dbColabDependnmdependente: TfrxMemoView
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataField = 'nmdependente'
          DataSet = dbColabDepend
          DataSetName = 'dbColabDepend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColabDepend."nmdependente"]')
          ParentFont = False
        end
        object dbColabDependdegrauparentesco: TfrxMemoView
          Left = 302.362400000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataField = 'degrauparentesco'
          DataSet = dbColabDepend
          DataSetName = 'dbColabDepend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColabDepend."degrauparentesco"]')
          ParentFont = False
        end
        object dbColabDependdtnascimento: TfrxMemoView
          Left = 627.401980000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtnascimento'
          DataSet = dbColabDepend
          DataSetName = 'dbColabDepend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColabDepend."dtnascimento"]')
          ParentFont = False
        end
      end
    end
  end
  object dbColaborador: TfrxDBDataset
    UserName = 'dbColaborador'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdempresa=cdempresa'
      'nmempresa=nmempresa'
      'decnpjempmasc=decnpjempmasc'
      'deenderecoemp=deenderecoemp'
      'nuenderecoemp=nuenderecoemp'
      'debairroemp=debairroemp'
      'nmcidadeemp=nmcidadeemp'
      'cdcodigofolha=cdcodigofolha'
      'cdcolaborador=cdcolaborador'
      'nmcolaborador=nmcolaborador'
      'cdcolabsituacao=cdcolabsituacao'
      'decolabsituacao=decolabsituacao'
      'dtnascimento=dtnascimento'
      'flsexo=flsexo'
      'dtadmissao=dtadmissao'
      'nmmae=nmmae'
      'nmpai=nmpai'
      'cdestadocivil=cdestadocivil'
      'deestadocivil=deestadocivil'
      'nmconjuge=nmconjuge'
      'nucep=nucep'
      'deendereco=deendereco'
      'nuendereco=nuendereco'
      'decomplemento=decomplemento'
      'debairro=debairro'
      'cdcidade=cdcidade'
      'nmcidade=nmcidade'
      'sgestado=sgestado'
      'decpf=decpf'
      'decpfmasc=decpfmasc'
      'nurg=nurg'
      'sgrgestadoemissor=sgrgestadoemissor'
      'dergorgaoexp=dergorgaoexp'
      'dtrgemissao=dtrgemissao'
      'nuctps=nuctps'
      'dectpsserie=dectpsserie'
      'nupis=nupis'
      'sgctpsestado=sgctpsestado'
      'dtctpsemissao=dtctpsemissao'
      'nureservista=nureservista'
      'nutituloeleitor=nutituloeleitor'
      'nutituloeleitorzona=nutituloeleitorzona'
      'nutituloeleitorsecao=nutituloeleitorsecao'
      'nucnh=nucnh'
      'decnhcategoria=decnhcategoria'
      'nmcidadenat=nmcidadenat'
      'sgestadonat=sgestadonat'
      'denacionalidade=denacionalidade'
      'decorpele=decorpele'
      'degrauinstrucao=degrauinstrucao'
      'deestudante=deestudante'
      'defone=defone'
      'decelular=decelular'
      'deemail=deemail'
      'nuconta=nuconta'
      'nucontadigito=nucontadigito'
      'cdagencia=cdagencia'
      'deagencia=deagencia'
      'nuagencia=nuagencia'
      'nudigitoage=nudigitoage'
      'cdbanco=cdbanco'
      'debanco=debanco'
      'dtexameadmissao=dtexameadmissao'
      'nudiascontratoexp=nudiascontratoexp'
      'nudiascontratoexpextra=nudiascontratoexpextra'
      'cdsetor=cdsetor'
      'desetor=desetor'
      'cdcargo=cdcargo'
      'decargo=decargo'
      'vlsalario=vlsalario'
      'flusavaletransp=flusavaletransp'
      'vlvaletransp=vlvaletransp'
      'cdsalariotipo=cdsalariotipo'
      'desalariotipo=desalariotipo'
      'nuhorasjornada=nuhorasjornada'
      'cdescala=cdescala'
      'deescalaitem=deescalaitem'
      'flpercadicinsalub=flpercadicinsalub'
      'vlpercadicinsalub=vlpercadicinsalub'
      'flpercadicperic=flpercadicperic'
      'vlpercadicperic=vlpercadicperic'
      'imlogoemp=imlogoemp')
    DataSet = DmERP.qyColaboradorRel
    BCDToCurrency = False
    Left = 362
    Top = 408
  end
  object dbColabDepend: TfrxDBDataset
    UserName = 'dbColabDepend'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdcolaborador=cdcolaborador'
      'cdcolabdependentes=cdcolabdependentes'
      'nmdependente=nmdependente'
      'cdgrauparentesco=cdgrauparentesco'
      'dtnascimento=dtnascimento'
      'dtcadastro=dtcadastro'
      'hrcadastro=hrcadastro'
      'cdusuariocadastro=cdusuariocadastro'
      'dtalteracao=dtalteracao'
      'hralteracao=hralteracao'
      'cdusuarioalteracao=cdusuarioalteracao'
      'dehrcadastro=dehrcadastro'
      'dehralteracao=dehralteracao'
      'nmusucad=nmusucad'
      'nmusualt=nmusualt'
      'degrauparentesco=degrauparentesco')
    DataSet = DmERP.qyColabDependentes
    BCDToCurrency = False
    Left = 370
    Top = 360
  end
end
