inherited FTipoPatrimonioCadastro: TFTipoPatrimonioCadastro
  Caption = 'Tipos de Patrim'#244'nio'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdPatrimonioTipo: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdePatrimonioTipo: TLabel
      Left = 45
      Top = 33
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object eddePatrimonioTipo: TDBEdit
      Left = 97
      Top = 30
      Width = 343
      Height = 21
      DataField = 'depatrimoniotipo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdPatrimonioTipo: TDBCampoCodigo
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
        'SELECT t01.*'
        '  FROM ('
        '        SELECT pt.cdPatrimonioTipo,'
        '               pt.dePatrimonioTipo'
        '          FROM erp.patrimonioTipo pt'
        '       ) t01 '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdPatrimonioTipo'
        'dePatrimonioTipo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdPatrimonioTipo'
      ERPCampoDescricao = 'cdPatrimonioTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyPatrimonioTipo
    end
  end
end
