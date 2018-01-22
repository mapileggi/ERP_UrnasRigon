inherited FCobrancaCadastro: TFCobrancaCadastro
  Caption = 'Cobran'#231'as'
  ClientWidth = 790
  ExplicitWidth = 790
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 790
    ExplicitWidth = 790
    object lbcdCobranca: TLabel
      Left = 42
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbcdCliente: TLabel
      Left = 42
      Top = 34
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object lbdeTextoCobranca: TLabel
      Left = 17
      Top = 86
      Width = 62
      Height = 13
      Caption = 'Referente a:'
    end
    object lbvlCobranca: TLabel
      Left = 51
      Top = 59
      Width = 28
      Height = 13
      Caption = 'Valor:'
    end
    object lbcdSituacao: TLabel
      Left = 204
      Top = 7
      Width = 45
      Height = 13
      Caption = 'Situa'#231#227'o:'
    end
    object lbnmUsuCad: TLabel
      Left = 355
      Top = 7
      Width = 66
      Height = 13
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 575
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Usu'#225'rio Alt.:'
    end
    object edcdCliente: TDBCampoCodigo
      Left = 81
      Top = 31
      Width = 702
      Height = 21
      Anchors = [akLeft, akTop, akRight]
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
        'SELECT t.*,'
        
          '       CAST(t.deCliCid || '#39' - Fone 1: '#39' || COALESCE(t.deFone1, '#39 +
          #39') || '
        '            '#39' - Fone 2: '#39' || COALESCE(t.deFone2, '#39#39') ||'
        
          '            '#39' - Rep.: '#39' || t.cdRepresentante || '#39' - '#39' || t.nmRep' +
          'resentante AS CHARACTER VARYING(1000)'
        '           ) AS deCliCidFone'
        '  FROM ('
        '        SELECT cli.cdCliente,'
        '               cli.flFisJur,'
        '               cli.deCpfCnpj,'
        '               cli.deRazaoSocial,'
        '               cli.nmFantasia,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(cli.nuFone1) = 11 THEN'
        
          '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
          'SION),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(cli.nuFone1) = 10 THEN'
        
          '                        TO_CHAR(CAST(cli.nuFone1 AS DOUBLE PRECI' +
          'SION),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        cli.nuFone1  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone1,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(cli.nuFone2) = 11 THEN'
        
          '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
          'SION),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(cli.nuFone2) = 10 THEN'
        
          '                        TO_CHAR(CAST(cli.nuFone2 AS DOUBLE PRECI' +
          'SION),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        cli.nuFone2  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone2,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               cli.deRazaoSocial || '#39' - '#39' ||'
        '               cid.nmCidade || '#39'/'#39' ||'
        '               cid.sgEstado AS deCliCid,'
        '               cli.cdRepresentante,'
        '               rep.deRazaoSocial AS nmRepresentante'
        '  FROM erp.cliente cli'
        
          '  LEFT JOIN erp.representante rep ON (rep.cdRepresentante = cli.' +
          'cdRepresentante)'
        
          '  LEFT JOIN erp.cidade        cid ON (cid.cdCidade = cli.cdCidad' +
          'e)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdCliente'
        'deRazaoSocial'
        'nmFantasia'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'Cliente'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdcliente'
      ERPCampoDescricao = 'deCliCidFone'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdCobranca: TDBCampoCodigo
      Left = 81
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
        'SELECT c.*,'
        '       t01.deRazaoSocial,'
        '       t01.nmFantasia,'
        '       t01.nmCidade,'
        '       t01.sgEstado'
        '  FROM erp.cobranca c'
        '  LEFT JOIN ('
        '             SELECT cli.cdCliente AS cdCli,'
        '                    cli.deRazaoSocial,'
        '                    cli.nmFantasia,'
        '                    cid.cdCidade AS cdCid,'
        '                    cid.nmCidade,'
        '                    cid.sgEstado'
        '               FROM erp.cliente cli'
        
          '               LEFT JOIN erp.cidade cid ON (cid.cdCidade = cli.c' +
          'dCidade)'
        '            ) t01 ON (t01.cdCli = c.cdCliente)'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdCobranca'
        'cdCliente'
        'deRazaoSocial'
        'nmFantasia'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'Cobran'#231'a'
        'Cliente'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdCobranca'
      ERPCampoDescricao = 'cdCobranca'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object mdeTextoCobranca: TDBMemo
      Left = 81
      Top = 81
      Width = 702
      Height = 112
      Anchors = [akLeft, akTop, akRight]
      DataField = 'detextocobranca'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 3
    end
    object edvlCobranca: TDBEdit
      Left = 81
      Top = 56
      Width = 68
      Height = 21
      DataField = 'vlcobranca'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object lcbcdSituacao: TDBLookupComboBox
      Left = 250
      Top = 4
      Width = 94
      Height = 21
      DataField = 'cdsituacao'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdsituacao'
      ListField = 'desituacao'
      ListSource = DmERP.dsCobrancaSituacao
      TabOrder = 5
    end
    object gbContatos: TGroupBox
      Left = 7
      Top = 199
      Width = 776
      Height = 283
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Contatos: '
      TabOrder = 4
      DesignSize = (
        776
        283)
      object lbnmPessoaContato: TLabel
        Left = 138
        Top = 20
        Width = 80
        Height = 13
        Caption = 'Pessoa Contato:'
      end
      object lbdtContato: TLabel
        Left = 10
        Top = 20
        Width = 27
        Height = 13
        Caption = 'Data:'
      end
      object lbObsContato: TLabel
        Left = 14
        Top = 44
        Width = 23
        Height = 13
        Caption = 'Obs:'
      end
      object lbdtRetorno: TLabel
        Left = 486
        Top = 20
        Width = 69
        Height = 13
        Caption = 'Data Retorno:'
      end
      object lbhrRetorno: TLabel
        Left = 654
        Top = 20
        Width = 69
        Height = 13
        Caption = 'Hora Retorno:'
      end
      object ednmPessoaContato: TDBEdit
        Left = 222
        Top = 17
        Width = 179
        Height = 21
        DataField = 'nmcontato'
        DataSource = FrBarraBotoesItens.dsDadosItens
        TabOrder = 1
      end
      object mObsContato: TDBMemo
        Left = 39
        Top = 43
        Width = 728
        Height = 79
        Anchors = [akLeft, akTop, akRight]
        DataField = 'deobscontato'
        DataSource = FrBarraBotoesItens.dsDadosItens
        ScrollBars = ssBoth
        TabOrder = 5
      end
      object cbflRetornar: TDBCheckBox
        Left = 409
        Top = 19
        Width = 73
        Height = 17
        Caption = 'Retornar?'
        DataField = 'flretornar'
        DataSource = FrBarraBotoesItens.dsDadosItens
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = cbflRetornarClick
      end
      object grCobrancaContato: TDBGrid
        Left = 7
        Top = 160
        Width = 760
        Height = 117
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = FrBarraBotoesItens.dsDadosItens
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cdcobrancacontato'
            Title.Caption = 'N'#186
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtcontato'
            Title.Caption = 'Data'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmcontato'
            Title.Caption = 'Pessoa Contato'
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'deobscontato'
            Title.Caption = 'Observa'#231#227'o'
            Width = 218
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'flretornar'
            Title.Caption = 'Retornar?'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtretorno'
            Title.Caption = 'Data Retorno'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dehrretornogrid'
            Title.Caption = 'Hora Retorno'
            Width = 72
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
      object eddtContato: TDBDateTime
        Left = 39
        Top = 17
        Width = 87
        Height = 21
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 0
        ERPEdCampoDataEnabled = True
        ERPBtAbrirCalendarioEnabled = True
        DataField = 'dtcontato'
        DataSource = FrBarraBotoesItens.dsDadosItens
      end
      object eddtRetorno: TDBDateTime
        Left = 556
        Top = 17
        Width = 87
        Height = 21
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 3
        ERPEdCampoDataEnabled = True
        ERPBtAbrirCalendarioEnabled = True
        DataField = 'dtretorno'
        DataSource = FrBarraBotoesItens.dsDadosItens
      end
      inline FrBarraBotoesItens: TFBarraBotoesItens
        Left = 39
        Top = 127
        Width = 182
        Height = 26
        TabOrder = 7
        ExplicitLeft = 39
        ExplicitTop = 127
        inherited sbBotoes: TScrollBox
          inherited btNovo: TBitBtn
            OnClick = FrBarraBotoesItensbtNovoClick
          end
          inherited btAlterar: TBitBtn
            OnClick = FrBarraBotoesItensbtAlterarClick
          end
          inherited btSalvar: TBitBtn
            OnClick = FrBarraBotoesItensbtSalvarClick
          end
          inherited btExluir: TBitBtn
            OnClick = FrBarraBotoesItensbtExluirClick
          end
        end
        inherited dsDadosItens: TDataSource
          DataSet = DmERP.qyCobrancaContato
        end
      end
      object edhrRetorno: TDBEdit
        Left = 726
        Top = 17
        Width = 41
        Height = 21
        DataField = 'dehrretorno'
        DataSource = FrBarraBotoesItens.dsDadosItens
        TabOrder = 4
      end
    end
    object ednmUsuCad: TDBEdit
      Left = 421
      Top = 4
      Width = 147
      Height = 21
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
      TabOrder = 6
    end
    object ednmUsuAlt: TDBEdit
      Left = 636
      Top = 4
      Width = 147
      Height = 21
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
      TabOrder = 7
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 790
    ExplicitWidth = 790
    inherited sbBotoes: TScrollBox
      Width = 790
      ExplicitWidth = 790
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyCobranca
    end
  end
end
