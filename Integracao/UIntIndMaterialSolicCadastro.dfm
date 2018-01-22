inherited FIntIndMaterialSolicCadastro: TFIntIndMaterialSolicCadastro
  Caption = 'Sa'#237'da de Material'
  ClientWidth = 790
  ExplicitWidth = 790
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 790
    ExplicitWidth = 790
    object lbcdMaterialSolicitacao: TLabel
      Left = 42
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbcdSolicitante: TLabel
      Left = 26
      Top = 78
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Solicitante:'
    end
    object lbnmUsuCad: TLabel
      Left = 201
      Top = 7
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbdtCadastro: TLabel
      Left = 456
      Top = 7
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Cad.:'
    end
    object lbdeHrCadastro: TLabel
      Left = 616
      Top = 7
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Cad.:'
    end
    object lbDuploClicExcluir: TLabel
      Left = 3
      Top = 190
      Width = 484
      Height = 19
      Caption = 'Duplo clic na linha da grid para excluir o material solicitado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbnmSolicitante: TLabel
      Left = 20
      Top = 102
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Solic.:'
    end
    object edcdMaterialSolicitacao: TDBCampoCodigo
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
        'SELECT t.*   '
        '  FROM ('
        '        SELECT a.cdMaterialSolicitacao,               '
        '               a.cdSolicitante,'
        '               c.nmColaborador AS nmSolicitante'
        '          FROM erp.intIndMaterialSolicitacao a'
        
          '          LEFT JOIN erp.colaborador c ON (c.cdColaborador = a.cd' +
          'Solicitante)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdMaterialSolicitacao'
        'cdSolicitante'
        'nmSolicitante')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'C'#243'd. Solicitante'
        'Nome Solicitante')
      ERPCampoChave = 'cdMaterialSolicitacao'
      ERPCampoDescricao = 'cdMaterialSolicitacao'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdSolicitante: TDBCampoCodigo
      Left = 81
      Top = 75
      Width = 702
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
      ERPOnEdCampoChaveExit = edcdSolicitanteERPOnEdCampoChaveExit
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT cdColaborador AS cdSolicitante,'
        '               nmColaborador AS nmSolicitante'
        '          FROM erp.colaborador'
        '      ORDER BY nmColaborador '
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdSolicitante'
        'nmSolicitante')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Nome')
      ERPCampoChave = 'cdSolicitante'
      ERPCampoDescricao = 'nmSolicitante'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object btAdicionaMat: TBitBtn
      Left = 81
      Top = 130
      Width = 55
      Height = 52
      Caption = '&Materiais'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 4
      OnClick = btAdicionaMatClick
    end
    object grMaterialMovSai: TDBGrid
      Left = 3
      Top = 215
      Width = 772
      Height = 259
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsMaterialMovSai
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grMaterialMovSaiDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cdmaterialmovimento'
          Title.Caption = 'C'#243'd. Mov.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cdmaterial'
          Title.Caption = 'C'#243'd. Material'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dematerial'
          Title.Caption = 'Desc. Material'
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nuqtde'
          Title.Caption = 'Qtde.'
          Width = 60
          Visible = True
        end>
    end
    object ednmUsuCad: TDBEdit
      Left = 269
      Top = 4
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
      TabOrder = 6
    end
    object eddtCadastro: TDBDateTime
      Left = 511
      Top = 4
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 7
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcadastro'
      DataSource = FrBarraBotoes.dsDados
    end
    object eddeHrCadastro: TDBEdit
      Left = 671
      Top = 4
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
      TabOrder = 8
    end
    object ednmSolicitante: TDBEdit
      Left = 81
      Top = 99
      Width = 224
      Height = 21
      DataField = 'nmSolicitante'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object rgflTipoSolicitacao: TDBRadioGroup
      Left = 81
      Top = 32
      Width = 168
      Height = 39
      Caption = ' Tipo de Solicita'#231#227'o: '
      Columns = 2
      DataField = 'fltiposolicitacao'
      DataSource = FrBarraBotoes.dsDados
      Items.Strings = (
        'Interno'
        'Externo')
      TabOrder = 1
      Values.Strings = (
        'I'
        'E')
      OnClick = rgflTipoSolicitacaoClick
      OnExit = rgflTipoSolicitacaoExit
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 790
    ExplicitWidth = 790
    inherited sbBotoes: TScrollBox
      Width = 790
      ExplicitWidth = 790
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyIntIndMaterialSolic
    end
  end
  object dsMaterialMovSai: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyIntIndMaterialMovSai
    Left = 207
    Top = 201
  end
end
