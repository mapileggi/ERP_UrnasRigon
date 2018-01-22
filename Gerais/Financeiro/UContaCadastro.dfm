inherited FContaCadastro: TFContaCadastro
  Caption = 'Contas'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdConta: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeConta: TLabel
      Left = 45
      Top = 55
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbnuDigito: TLabel
      Left = 176
      Top = 31
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'D'#237'gito:'
    end
    object lbcdAgencia: TLabel
      Left = 53
      Top = 79
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ag'#234'ncia:'
    end
    object lbnuConta: TLabel
      Left = 47
      Top = 31
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Conta:'
    end
    object eddeConta: TDBEdit
      Left = 97
      Top = 52
      Width = 264
      Height = 21
      DataField = 'deConta'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object edcdConta: TDBCampoCodigo
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
        '        SELECT c.cdConta,'
        '               c.deConta,'
        '               c.nuConta,'
        '               c.nuDigito,'
        '               a.cdAgencia,'
        '               a.deAgencia,'
        '               a.cdBanco,'
        '               b.deBanco,'
        '               cid.nmCidade,'
        '               cid.sgEstado'
        '  FROM erp.conta c'
        '  LEFT JOIN erp.agencia a ON (a.cdAgencia = c.cdAgencia)'
        '  LEFT JOIN erp.banco b ON (b.cdBanco = a.cdBanco)'
        '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = a.cdCidade)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdConta'
        'deConta'
        'nuConta'
        'nuDigito'
        'cdAgencia'
        'deAgencia'
        'cdBanco'
        'deBanco'
        'nmCidade'
        'sgEstado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Conta'
        'N'#186' Conta'
        'D'#237'gito'
        'C'#243'd. Ag'#234'ncia'
        'Desc. Ag'#234'ncia'
        'C'#243'd. Banco'
        'Desc. Banco'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdConta'
      ERPCampoDescricao = 'cdConta'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednuDigito: TDBEdit
      Left = 209
      Top = 28
      Width = 24
      Height = 21
      DataField = 'nudigito'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object edcdAgencia: TDBCampoCodigo
      Left = 97
      Top = 76
      Width = 425
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 4
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
        '        SELECT a.cdAgencia,'
        '               a.deAgencia,'
        '               a.nuAgencia,'
        '               a.nuDigito,'
        '               a.cdBanco,'
        '               b.deBanco,'
        '               cid.nmCidade,'
        '               cid.sgEstado'
        '  FROM erp.agencia a'
        '  LEFT JOIN erp.banco b ON (b.cdBanco = a.cdBanco)'
        '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = a.cdCidade)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdAgencia'
        'deAgencia'
        'nuAgencia'
        'nuDigito'
        'cdBanco'
        'deBanco'
        'nmCidade'
        'sgEstado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Ag'#234'ncia'
        'N'#186' Ag'#234'ncia'
        'D'#237'gito'
        'C'#243'd. Banco'
        'Desc. Banco'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdAgencia'
      ERPCampoDescricao = 'deAgencia'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednuConta: TDBEdit
      Left = 97
      Top = 28
      Width = 65
      Height = 21
      DataField = 'nuconta'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyConta
    end
  end
end
