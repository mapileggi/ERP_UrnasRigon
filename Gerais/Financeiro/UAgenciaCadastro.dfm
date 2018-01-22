inherited FAgenciaCadastro: TFAgenciaCadastro
  Caption = 'Ag'#234'ncias'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdAgencia: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeCnpj: TLabel
      Left = 66
      Top = 79
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'CNPJ:'
    end
    object lbdeAgencia: TLabel
      Left = 45
      Top = 55
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbcdCidade: TLabel
      Left = 392
      Top = 202
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cidade:'
    end
    object lbnuFone1: TLabel
      Left = 40
      Top = 127
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefone 1:'
    end
    object lbnuFone2: TLabel
      Left = 213
      Top = 127
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefone 2:'
    end
    object lbnuFax: TLabel
      Left = 407
      Top = 127
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fax:'
    end
    object lbnuCep: TLabel
      Left = 72
      Top = 151
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'CEP:'
    end
    object lbdeEndereco: TLabel
      Left = 46
      Top = 176
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Endere'#231'o:'
    end
    object lbnuEndereco: TLabel
      Left = 413
      Top = 176
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186':'
    end
    object lbdeComplemento: TLabel
      Left = 505
      Top = 176
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Complemento:'
    end
    object lbdeBairro: TLabel
      Left = 63
      Top = 202
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Bairro:'
    end
    object lbcdBanco: TLabel
      Left = 62
      Top = 103
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Banco:'
    end
    object lbnuDigito: TLabel
      Left = 192
      Top = 31
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'D'#237'gito:'
    end
    object lbnuAgencia: TLabel
      Left = 38
      Top = 31
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Ag'#234'ncia:'
    end
    object eddeCnpj: TDBEdit
      Left = 97
      Top = 76
      Width = 107
      Height = 21
      DataField = 'decnpj'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
    end
    object eddeAgencia: TDBEdit
      Left = 97
      Top = 52
      Width = 264
      Height = 21
      DataField = 'deagencia'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object edcdCidade: TDBCampoCodigo
      Left = 431
      Top = 199
      Width = 264
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 14
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
        '        SELECT cdCidade,'
        '               nmCidade,'
        '               sgEstado,'
        '               CAST(nmCidade || '#39'/'#39' ||'
        '                    sgEstado AS CHARACTER VARYING(250)'
        '                   ) AS deCidEst'
        '          FROM erp.cidade'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdcidade'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Nome'
        'Estado')
      ERPCampoChave = 'cdcidade'
      ERPCampoDescricao = 'deCidEst'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdAgencia: TDBCampoCodigo
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
        '        SELECT a.cdAgencia,'
        '               a.nuAgencia,'
        '               a.deAgencia,'
        '               a.nuDigito,'
        '               b.cdBanco,'
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
      ERPCampoDescricao = 'cdAgencia'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednuFone1: TDBEdit
      Left = 97
      Top = 124
      Width = 91
      Height = 21
      DataField = 'nufone1'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
    end
    object ednuFone2: TDBEdit
      Left = 270
      Top = 124
      Width = 91
      Height = 21
      DataField = 'nufone2'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 7
    end
    object ednuFax: TDBEdit
      Left = 431
      Top = 124
      Width = 91
      Height = 21
      DataField = 'nufax'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 8
    end
    object ednuCep: TDBEdit
      Left = 97
      Top = 148
      Width = 68
      Height = 21
      DataField = 'nucep'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 9
      OnExit = ednuCepExit
    end
    object dedeEndereco: TDBEdit
      Left = 97
      Top = 173
      Width = 264
      Height = 21
      DataField = 'deendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 10
    end
    object ednuEndereco: TDBEdit
      Left = 431
      Top = 173
      Width = 45
      Height = 21
      DataField = 'nuendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 11
    end
    object eddeComplemento: TDBEdit
      Left = 576
      Top = 173
      Width = 119
      Height = 21
      DataField = 'decomplemento'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 12
    end
    object eddeBairro: TDBEdit
      Left = 97
      Top = 199
      Width = 264
      Height = 21
      DataField = 'debairro'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 13
    end
    object edcdBanco: TDBCampoCodigo
      Left = 97
      Top = 100
      Width = 425
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 5
      ERPCampoCodigoPK = False
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
      ERPCampoDescricao = 'deBanco'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftString
    end
    object ednuDigito: TDBEdit
      Left = 225
      Top = 28
      Width = 24
      Height = 21
      DataField = 'nudigito'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object ednuAgencia: TDBEdit
      Left = 97
      Top = 28
      Width = 65
      Height = 21
      DataField = 'nuagencia'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyAgencia
    end
  end
end
