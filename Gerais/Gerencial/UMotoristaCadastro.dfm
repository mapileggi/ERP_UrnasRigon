inherited FMotoristaCadastro: TFMotoristaCadastro
  Caption = 'Motoristas'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdMotorista: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbnmMotorista: TLabel
      Left = 64
      Top = 33
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lbdeCpf: TLabel
      Left = 72
      Top = 57
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'CPF:'
    end
    object ednmMotorista: TDBEdit
      Left = 97
      Top = 30
      Width = 343
      Height = 21
      DataField = 'nmmotorista'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdMotorista: TDBCampoCodigo
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
        '        SELECT m.cdMotorista,'
        '               m.nmMotorista'
        '          FROM erp.motorista m'
        '         ORDER BY m.cdMotorista'
        '       ) t '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdMotorista'
        'nmMotorista')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdMotorista'
      ERPCampoDescricao = 'cdMotorista'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object eddeCpf: TDBEdit
      Left = 97
      Top = 54
      Width = 107
      Height = 21
      DataField = 'decpf'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyMotorista
    end
  end
end
