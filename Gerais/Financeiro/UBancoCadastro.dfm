inherited FBancoCadastro: TFBancoCadastro
  Caption = 'Bancos'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdBanco: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeBanco: TLabel
      Left = 45
      Top = 33
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object eddeBanco: TDBEdit
      Left = 97
      Top = 30
      Width = 520
      Height = 21
      DataField = 'debanco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdBanco: TDBCampoCodigo
      Left = 97
      Top = 4
      Width = 91
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      ERPCampoCodigoPK = True
      ERPCharCase = ecUpperCase
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
        '        SELECT b.cdBanco,'
        '               b.deBanco'
        '          FROM erp.banco b'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdBanco'
        'deBanco')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdBanco'
      ERPCampoDescricao = 'cdBanco'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftString
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyBanco
    end
  end
end
