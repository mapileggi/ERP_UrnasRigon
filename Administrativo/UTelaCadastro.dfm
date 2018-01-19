inherited FTelaCadastro: TFTelaCadastro
  Caption = 'Telas'
  ClientWidth = 819
  ExplicitWidth = 819
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 819
    ExplicitWidth = 819
    object lbcdTela: TLabel
      Left = 50
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeTituloPai: TLabel
      Left = 15
      Top = 34
      Width = 72
      Height = 13
      Caption = 'Item Menu Pai:'
    end
    object lbdeTituloTela: TLabel
      Left = 9
      Top = 59
      Width = 78
      Height = 13
      Caption = 'Item Menu Tela:'
    end
    object lbnmUsuCad: TLabel
      Left = 259
      Top = 7
      Width = 66
      Height = 13
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 511
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Usu'#225'rio Alt.:'
    end
    object lbnmForm: TLabel
      Left = 29
      Top = 84
      Width = 58
      Height = 13
      Caption = 'Classe Tela:'
    end
    object edcdTela: TDBCampoCodigo
      Left = 88
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
        'SELECT z.*'
        '  FROM ('
        '        SELECT t.cdTela,'
        '               t.deTituloPai,'
        '               t.deTituloTela,'
        '               t.flAtivo,'
        '               t.nmForm'
        '          FROM erp.tela t'
        '        ORDER BY t.cdTela DESC'
        '       ) z '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdTela'
        'deTituloPai'
        'deTituloTela'
        'nmForm'
        'flAtivo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Item Menu Pai'
        'Item Tela'
        'Classe Form'
        'Ativo')
      ERPCampoChave = 'cdTela'
      ERPCampoDescricao = 'cdTela'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednmUsuCad: TDBEdit
      Left = 325
      Top = 4
      Width = 166
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
      TabOrder = 1
    end
    object ednmUsuAlt: TDBEdit
      Left = 572
      Top = 4
      Width = 166
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
      TabOrder = 2
    end
    object cbflAtivo: TDBCheckBox
      Left = 197
      Top = 6
      Width = 56
      Height = 17
      Caption = 'Ativo'
      DataField = 'flativo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object eddeTituloPai: TDBEdit
      Left = 88
      Top = 31
      Width = 150
      Height = 21
      DataField = 'detitulopai'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
    end
    object eddeTituloTela: TDBEdit
      Left = 88
      Top = 56
      Width = 150
      Height = 21
      DataField = 'detitulotela'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
    end
    object ednmForm: TDBEdit
      Left = 88
      Top = 81
      Width = 150
      Height = 21
      DataField = 'nmform'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
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
      DataSet = DmERP.qyTela
    end
  end
end
