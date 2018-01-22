inherited FSetorCadastro: TFSetorCadastro
  Caption = 'Setores'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdSetor: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeSetor: TLabel
      Left = 65
      Top = 33
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Setor:'
    end
    object lbcdSetorAnterior: TLabel
      Left = 23
      Top = 128
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Setor Anterior:'
    end
    object eddeSetor: TDBEdit
      Left = 97
      Top = 30
      Width = 343
      Height = 21
      DataField = 'desetor'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdSetor: TDBCampoCodigo
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
      ERPCampoDescricao = 'cdSetor'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object cbflControlaBaixa: TDBCheckBox
      Left = 97
      Top = 56
      Width = 116
      Height = 17
      Caption = 'Controla Baixa'
      DataField = 'flcontrolabaixa'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edcdSetorAnterior: TDBCampoCodigo
      Left = 97
      Top = 125
      Width = 343
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 6
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
        '        SELECT s.cdSetor AS cdSetorAnterior,'
        '               s.deSetor,'
        '               s.flControlaBaixa'
        '          FROM erp.setor s'
        '         ORDER BY s.deSetor'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdSetorAnterior'
        'deSetor'
        'flControlaBaixa')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o'
        'Controla Baixa')
      ERPCampoChave = 'cdSetorAnterior'
      ERPCampoDescricao = 'deSetor'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object cbflEhSetorExpedicao: TDBCheckBox
      Left = 97
      Top = 104
      Width = 152
      Height = 17
      Caption = #201' Setor de Expedi'#231#227'o'
      DataField = 'flehsetorexpedicao'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbflEhSetorEmbalagem: TDBCheckBox
      Left = 97
      Top = 88
      Width = 152
      Height = 17
      Caption = #201' Setor de Embalagem'
      DataField = 'flehsetorembalagem'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbflEhSetorMontagem: TDBCheckBox
      Left = 97
      Top = 72
      Width = 152
      Height = 17
      Caption = #201' Setor de Montagem'
      DataField = 'flehsetormontagem'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qySetor
    end
  end
end
