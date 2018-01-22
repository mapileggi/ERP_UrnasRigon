inherited FEscalaCadastro: TFEscalaCadastro
  Caption = 'Escalas'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdEscala: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeEscala: TLabel
      Left = 45
      Top = 31
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object eddeEscala: TDBEdit
      Left = 97
      Top = 28
      Width = 264
      Height = 21
      DataField = 'deEscala'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdEscala: TDBCampoCodigo
      Left = 97
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
        'SELECT cdEscala,'
        '               deEscala'
        '  FROM erp.escala '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdEscala'
        'deEscala')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdEscala'
      ERPCampoDescricao = 'cdEscala'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object gbEscalaItem: TGroupBox
      Left = 3
      Top = 64
      Width = 760
      Height = 361
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Itens da Escala '
      TabOrder = 2
      DesignSize = (
        760
        361)
      object lbdeEscalaItem: TLabel
        Left = 17
        Top = 23
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o Item:'
      end
      inline FrBarraBotoesItens: TFBarraBotoesItens
        Left = 94
        Top = 60
        Width = 182
        Height = 26
        TabOrder = 0
        ExplicitLeft = 94
        ExplicitTop = 60
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
          DataSet = DmERP.qyEscalaItem
        end
      end
      object eddeEscalaItem: TDBEdit
        Left = 94
        Top = 20
        Width = 264
        Height = 21
        DataField = 'deescalaitem'
        DataSource = FrBarraBotoesItens.dsDadosItens
        TabOrder = 1
      end
      object grEscalaItem: TDBGrid
        Left = 3
        Top = 92
        Width = 754
        Height = 266
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
            FieldName = 'cdescalaitem'
            Title.Caption = 'N'#186
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'deescalaitem'
            Title.Caption = 'Descri'#231#227'o'
            Width = 187
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmusucad'
            Title.Caption = 'Usu'#225'rio Cad.'
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nmusualt'
            Title.Caption = 'Usu'#225'rio Alt.'
            Width = 171
            Visible = True
          end>
      end
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyEscala
    end
  end
end
