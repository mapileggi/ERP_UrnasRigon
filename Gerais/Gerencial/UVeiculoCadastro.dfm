inherited FVeiculoCadastro: TFVeiculoCadastro
  Caption = 'Cadastro de Ve'#237'culos'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdVeiculo: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdePlaca: TLabel
      Left = 66
      Top = 57
      Width = 29
      Height = 13
      Caption = 'Placa:'
    end
    object lbcdVeiculoTipo: TLabel
      Left = 71
      Top = 32
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object eddePlaca: TDBEdit
      Left = 97
      Top = 54
      Width = 91
      Height = 21
      CharCase = ecUpperCase
      DataField = 'deplaca'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object edcdVeiculo: TDBCampoCodigo
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
        '        SELECT v.cdVeiculo,'
        '               v.dePlaca'
        '          FROM erp.veiculo v'
        '       ) t01 '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdVeiculo'
        'dePlaca')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Placa')
      ERPCampoChave = 'cdVeiculo'
      ERPCampoDescricao = 'cdVeiculo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdVeiculoTipo: TDBCampoCodigo
      Left = 97
      Top = 29
      Width = 266
      Height = 21
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
        'SELECT t.cdVeiculoTipo,'
        '       t.deVeiculoTipo'
        '  FROM ('
        
          '        SELECT CAST(1 AS INTEGER) AS cdVeiculoTipo, CAST('#39'Carro'#39 +
          ' AS CHARACTER VARYING(30)) AS deVeiculoTipo'
        '        UNION ALL'
        
          '        SELECT CAST(2 AS INTEGER) AS cdVeiculoTipo, CAST('#39'Caminh' +
          #227'o'#39' AS CHARACTER VARYING(30)) AS deVeiculoTipo'
        '        UNION ALL'
        
          '        SELECT CAST(3 AS INTEGER) AS cdVeiculoTipo, CAST('#39'Caminh' +
          'onete'#39' AS CHARACTER VARYING(30)) AS deVeiculoTipo'
        '        UNION ALL'
        
          '        SELECT CAST(4 AS INTEGER) AS cdVeiculoTipo, CAST('#39'Carret' +
          'a'#39' AS CHARACTER VARYING(30)) AS deVeiculoTipo'
        '        UNION ALL'
        
          '        SELECT CAST(5 AS INTEGER) AS cdVeiculoTipo, CAST('#39'Moto'#39' ' +
          'AS CHARACTER VARYING(30)) AS deVeiculoTipo'
        '       ) t'
        ' &filtro'
        ' ORDER BY t.cdVeiculoTipo')
      ERPCamposFiltro.Strings = (
        'cdVeiculoTipo'
        'deVeiculoTipo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdVeiculoTipo'
      ERPCampoDescricao = 'deVeiculoTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyVeiculo
    end
  end
end
