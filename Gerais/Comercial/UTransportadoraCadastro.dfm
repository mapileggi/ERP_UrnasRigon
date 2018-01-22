inherited FTransportadoraCadastro: TFTransportadoraCadastro
  Caption = 'Transportadoras'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdTransportadora: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeCpfCnpj: TLabel
      Left = 183
      Top = 33
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ:'
    end
    object lbdeRazaoSocial: TLabel
      Left = 31
      Top = 59
      Width = 64
      Height = 13
      Caption = 'Raz'#227'o Social:'
    end
    object lbnmFantasia: TLabel
      Left = 354
      Top = 59
      Width = 75
      Height = 13
      Caption = 'Nome Fantasia:'
    end
    object lbflFisJur: TLabel
      Left = 25
      Top = 33
      Width = 70
      Height = 13
      Caption = 'F'#237'sico/Jur'#237'dico:'
    end
    object lbcdCidade: TLabel
      Left = 392
      Top = 234
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object lbnuInscEst: TLabel
      Left = 4
      Top = 106
      Width = 91
      Height = 13
      Caption = 'Inscri'#231#227'o Estadual:'
    end
    object lbnuFone1: TLabel
      Left = 40
      Top = 131
      Width = 55
      Height = 13
      Caption = 'Telefone 1:'
    end
    object lbnuFone2: TLabel
      Left = 213
      Top = 131
      Width = 55
      Height = 13
      Caption = 'Telefone 2:'
    end
    object lbnuFax: TLabel
      Left = 407
      Top = 131
      Width = 22
      Height = 13
      Caption = 'Fax:'
    end
    object lbdeEmail: TLabel
      Left = 63
      Top = 157
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object lbdeEmailNfe: TLabel
      Left = 375
      Top = 157
      Width = 54
      Height = 13
      Caption = 'E-mail NFe:'
    end
    object lbnmPessoaContato: TLabel
      Left = 15
      Top = 183
      Width = 80
      Height = 13
      Caption = 'Pessoa Contato:'
    end
    object lbnuCep: TLabel
      Left = 406
      Top = 183
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object lbdeEndereco: TLabel
      Left = 46
      Top = 208
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object lbnuEndereco: TLabel
      Left = 413
      Top = 208
      Width = 16
      Height = 13
      Caption = 'N'#186':'
    end
    object lbdeComplemento: TLabel
      Left = 505
      Top = 208
      Width = 69
      Height = 13
      Caption = 'Complemento:'
    end
    object lbdeBairro: TLabel
      Left = 63
      Top = 234
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object lbdeObservacoes: TLabel
      Left = 28
      Top = 262
      Width = 67
      Height = 13
      Caption = 'Observa'#231#245'es:'
    end
    object eddeCpfCnpj: TDBEdit
      Left = 237
      Top = 30
      Width = 107
      Height = 21
      DataField = 'decpfcnpj'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object eddeRazaoSocial: TDBEdit
      Left = 97
      Top = 56
      Width = 247
      Height = 21
      DataField = 'derazaosocial'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object ednmFantasia: TDBEdit
      Left = 431
      Top = 56
      Width = 264
      Height = 21
      DataField = 'nmfantasia'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object cbflFisJur: TDBComboBox
      Left = 97
      Top = 30
      Width = 40
      Height = 21
      CharCase = ecUpperCase
      DataField = 'flfisjur'
      DataSource = FrBarraBotoes.dsDados
      Items.Strings = (
        'F'
        'J')
      TabOrder = 4
      OnExit = cbflFisJurExit
    end
    object edcdCidade: TDBCampoCodigo
      Left = 431
      Top = 231
      Width = 264
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 18
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
    object edcdTransportadora: TDBCampoCodigo
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
        'SELECT t.*,'
        
          '       CAST(t.deTranspCid || '#39' - Fone 1: '#39' || COALESCE(t.deFone1' +
          ', '#39#39') || '
        
          '       '#39' - Fone 2: '#39' || COALESCE(t.deFone2, '#39#39') AS CHARACTER VAR' +
          'YING(250)) AS deTranspCidFone'
        '  FROM ('
        '        SELECT t.cdTransportadora,'
        '               t.flFisJur,'
        '               t.deCpfCnpj,'
        '               t.deRazaoSocial,'
        '               t.nmFantasia,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(t.nuFone1) = 11 THEN'
        
          '                        TO_CHAR(CAST(t.nuFone1 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(t.nuFone1) = 10 THEN'
        
          '                        TO_CHAR(CAST(t.nuFone1 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        t.nuFone1  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone1,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(t.nuFone2) = 11 THEN'
        
          '                        TO_CHAR(CAST(t.nuFone2 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(t.nuFone2) = 10 THEN'
        
          '                        TO_CHAR(CAST(t.nuFone2 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        t.nuFone2  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone2,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               t.deRazaoSocial || '#39' - '#39' ||'
        '               cid.nmCidade || '#39'/'#39' ||'
        '               cid.sgEstado AS deTranspCid'
        '  FROM erp.transportadora t'
        '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = t.cdCidade)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdTransportadora'
        'flFisJur'
        'deCpfCnpj'
        'deRazaoSocial'
        'nmFantasia'
        'nmCidade'
        'sgEstado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'F'#237's/Jur'
        'CPF/CNPJ'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdTransportadora'
      ERPCampoDescricao = 'cdTransportadora'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object cbflIsentoInscEst: TDBCheckBox
      Left = 97
      Top = 81
      Width = 153
      Height = 17
      Caption = 'Isento Inscri'#231#227'o Estadual'
      DataField = 'flIsentoInscEst'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object denuInscEst: TDBEdit
      Left = 97
      Top = 103
      Width = 91
      Height = 21
      DataField = 'nuinscest'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
    end
    object ednuFone1: TDBEdit
      Left = 97
      Top = 128
      Width = 91
      Height = 21
      DataField = 'nufone1'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 7
    end
    object ednuFone2: TDBEdit
      Left = 270
      Top = 128
      Width = 91
      Height = 21
      DataField = 'nufone2'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 8
    end
    object ednuFax: TDBEdit
      Left = 431
      Top = 128
      Width = 91
      Height = 21
      DataField = 'nufax'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 9
    end
    object eddeEmail: TDBEdit
      Left = 97
      Top = 154
      Width = 264
      Height = 21
      DataField = 'deemail'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 10
    end
    object eddeEmailNfe: TDBEdit
      Left = 431
      Top = 154
      Width = 264
      Height = 21
      DataField = 'deemailnfe'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 11
    end
    object ednmPessoaContato: TDBEdit
      Left = 97
      Top = 180
      Width = 264
      Height = 21
      DataField = 'nmpessoacontato'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 12
    end
    object ednuCep: TDBEdit
      Left = 431
      Top = 180
      Width = 68
      Height = 21
      DataField = 'nucep'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 13
      OnExit = ednuCepExit
    end
    object dedeEndereco: TDBEdit
      Left = 97
      Top = 205
      Width = 264
      Height = 21
      DataField = 'deendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 14
    end
    object ednuEndereco: TDBEdit
      Left = 431
      Top = 205
      Width = 45
      Height = 21
      DataField = 'nuendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 15
    end
    object eddeComplemento: TDBEdit
      Left = 576
      Top = 205
      Width = 119
      Height = 21
      DataField = 'decomplemento'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 16
    end
    object eddeBairro: TDBEdit
      Left = 97
      Top = 231
      Width = 264
      Height = 21
      DataField = 'debairro'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 17
    end
    object mdeObservacoes: TDBMemo
      Left = 97
      Top = 257
      Width = 598
      Height = 144
      DataField = 'deObservacoes'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 19
    end
    object cbflAtivo: TDBCheckBox
      Left = 205
      Top = 6
      Width = 76
      Height = 17
      Caption = 'Ativo'
      DataField = 'flativo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 20
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyTransportadora
    end
  end
end
