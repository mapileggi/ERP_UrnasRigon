inherited FCobrancaTipoCadastro: TFCobrancaTipoCadastro
  Caption = 'Tipos de Cobran'#231'as'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdCobrancaTipo: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeCobrancaTipoSigla: TLabel
      Left = 69
      Top = 55
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sigla:'
    end
    object lbdeCobrancaTipo: TLabel
      Left = 45
      Top = 31
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbnuDiasAcrescimo: TLabel
      Left = 5
      Top = 79
      Width = 90
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dias de Acr'#233'scimo:'
    end
    object eddeCobrancaTipoSigla: TDBEdit
      Left = 97
      Top = 52
      Width = 48
      Height = 21
      DataField = 'decobrancatiposigla'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object eddeCobrancaTipo: TDBEdit
      Left = 97
      Top = 28
      Width = 264
      Height = 21
      DataField = 'deCobrancaTipo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdCobrancaTipo: TDBCampoCodigo
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
        'SELECT t.*'
        '  FROM ('
        '        SELECT a.cdCobrancaTipo,'
        '                     a.deCobrancaTipo'
        '          FROM erp.cobrancaTipo a'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdCobrancaTipo'
        'deCobrancaTipo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdCobrancaTipo'
      ERPCampoDescricao = 'cdCobrancaTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednuDiasAcrescimo: TDBEdit
      Left = 97
      Top = 76
      Width = 48
      Height = 21
      DataField = 'nudiasacrescimo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object cbflContabilidade: TDBCheckBox
      Left = 97
      Top = 102
      Width = 97
      Height = 17
      Caption = 'Contabilidade'
      DataField = 'flcontabilidade'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbflFluxoCaixa: TDBCheckBox
      Left = 97
      Top = 118
      Width = 123
      Height = 17
      Caption = 'Entra Fluxo de Caixa'
      DataField = 'flFluxoCaixa'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbflEntraConcialiacao: TDBCheckBox
      Left = 97
      Top = 134
      Width = 136
      Height = 17
      Caption = 'Entra na Concialial'#231#227'o'
      DataField = 'flentraconcialiacao'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited sbBotoes: TScrollBox
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyCobrancaTipo
    end
  end
end
