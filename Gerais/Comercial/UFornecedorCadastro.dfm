inherited FFornecedorCadastro: TFFornecedorCadastro
  Caption = 'Fornecedores'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdFornecedor: TLabel
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
      Left = 378
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
      Left = 416
      Top = 258
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
    object lbnuIndInscEst: TLabel
      Left = 304
      Top = 104
      Width = 149
      Height = 13
      Caption = 'Indicador da Incri'#231#227'o Estadual:'
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
    object lbnuCelular: TLabel
      Left = 416
      Top = 131
      Width = 37
      Height = 13
      Caption = 'Celular:'
    end
    object lbnuFax: TLabel
      Left = 576
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
      Left = 399
      Top = 157
      Width = 54
      Height = 13
      Caption = 'E-mail NFe:'
    end
    object lbnmPessoaContato: TLabel
      Left = 15
      Top = 207
      Width = 80
      Height = 13
      Caption = 'Pessoa Contato:'
    end
    object lbnuCep: TLabel
      Left = 430
      Top = 207
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object lbdeEndereco: TLabel
      Left = 46
      Top = 232
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object lbnuEndereco: TLabel
      Left = 437
      Top = 232
      Width = 16
      Height = 13
      Caption = 'N'#186':'
    end
    object lbdeComplemento: TLabel
      Left = 529
      Top = 232
      Width = 69
      Height = 13
      Caption = 'Complemento:'
    end
    object lbdeBairro: TLabel
      Left = 63
      Top = 258
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object lbdeObservacoes: TLabel
      Left = 28
      Top = 286
      Width = 67
      Height = 13
      Caption = 'Observa'#231#245'es:'
    end
    object lbcdFornecedorTipo: TLabel
      Left = 13
      Top = 434
      Width = 82
      Height = 13
      Caption = 'Tipo Fornecedor:'
    end
    object lbdeHomePage: TLabel
      Left = 37
      Top = 182
      Width = 58
      Height = 13
      Caption = 'Home Page:'
    end
    object lbcdMunicipio: TLabel
      Left = 380
      Top = 182
      Width = 73
      Height = 13
      Caption = 'C'#243'd. Munic'#237'pio:'
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
      Left = 455
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
      Left = 455
      Top = 255
      Width = 264
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 22
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
    object edcdFornecedor: TDBCampoCodigo
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
        
          '       CAST(t.deForCid || '#39' - Fone 1: '#39' || COALESCE(t.deFone1, '#39 +
          #39') || '
        
          '       '#39' - Fone 2: '#39' || COALESCE(t.deFone2, '#39#39') AS CHARACTER VAR' +
          'YING(250)) AS deForCidFone'
        '  FROM ('
        '        SELECT f.cdFornecedor,'
        '               f.flFisJur,'
        '               f.deCpfCnpj,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(f.deCpfCnpj) = 14 THEN'
        
          '                        REGEXP_REPLACE(f.deCpfCnpj, '#39'(\d{2})(\d{' +
          '3})(\d{3})(\d{4})(\d{2})'#39', '#39'\1.\2.\3/\4-\5'#39')'
        '                      WHEN LENGTH(f.deCpfCnpj) = 11 THEN'
        
          '                        REGEXP_REPLACE(f.deCpfCnpj, '#39'(\d{3})(\d{' +
          '3})(\d{3})(\d{2})'#39', '#39'\1.\2.\3-\4'#39') '
        '                      ELSE'
        '                        f.deCpfCnpj  '
        '                    END AS CHARACTER VARYING(50)'
        '                   ) AS deCpfCnpjM, '
        '               f.deRazaoSocial,'
        '               f.nmFantasia,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(f.nuFone1) = 11 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone1 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(f.nuFone1) = 10 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone1 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        f.nuFone1  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone1,'
        '               CAST('
        '                    CASE'
        '                      WHEN LENGTH(f.nuFone2) = 11 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone2 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"00000'#39')'
        '                      WHEN LENGTH(f.nuFone2) = 10 THEN'
        
          '                        TO_CHAR(CAST(f.nuFone2 AS DOUBLE PRECISI' +
          'ON),'#39'FM"("00")"0000"-"0000'#39') '
        '                      ELSE'
        '                        f.nuFone2  '
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deFone2,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               f.deRazaoSocial || '#39' - '#39' ||'
        '               cid.nmCidade || '#39'/'#39' ||'
        '               cid.sgEstado AS deForCid'
        '          FROM erp.fornecedor f'
        
          '          LEFT JOIN erp.cidade cid ON (cid.cdCidade = f.cdCidade' +
          ')'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdFornecedor'
        'flFisJur'
        'deCpfCnpjM'
        'deRazaoSocial'
        'nmFantasia'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'F'#237's/Jur'
        'CPF/CNPJ'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdFornecedor'
      ERPCampoDescricao = 'cdFornecedor'
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
    object ednuIndInscEst: TDBCampoCodigo
      Left = 455
      Top = 102
      Width = 266
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 7
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
        'SELECT t.nuIndInscEst,'
        '       t.deIndInscEst'
        '  FROM ('
        
          '        SELECT CAST(1 AS INTEGER) AS nuIndInscEst, CAST('#39'Contrib' +
          'uinte'#39' AS CHARACTER VARYING(30)) AS deIndInscEst'
        '        UNION ALL'
        
          '        SELECT CAST(2 AS INTEGER) AS nuIndInscEst, CAST('#39'Contrib' +
          'uinte Isento'#39' AS CHARACTER VARYING(30)) AS deIndInscEst'
        '        UNION ALL'
        
          '        SELECT CAST(9 AS INTEGER) AS nuIndInscEst, CAST('#39'N'#227'o Con' +
          'tribuinte'#39' AS CHARACTER VARYING(30)) AS deIndInscEst'
        '       ) t'
        ' &filtro'
        ' ORDER BY t.nuIndInscEst')
      ERPCamposFiltro.Strings = (
        'nuIndInscEst'
        'deIndInscEst')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'nuIndInscEst'
      ERPCampoDescricao = 'deIndInscEst'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednuFone1: TDBEdit
      Left = 97
      Top = 128
      Width = 91
      Height = 21
      DataField = 'nufone1'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 8
    end
    object ednuFone2: TDBEdit
      Left = 270
      Top = 128
      Width = 91
      Height = 21
      DataField = 'nufone2'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 9
    end
    object ednuCelular: TDBEdit
      Left = 455
      Top = 128
      Width = 91
      Height = 21
      DataField = 'nuCelular'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 10
    end
    object ednuFax: TDBEdit
      Left = 600
      Top = 128
      Width = 91
      Height = 21
      DataField = 'nufax'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 11
    end
    object eddeEmail: TDBEdit
      Left = 97
      Top = 154
      Width = 264
      Height = 21
      DataField = 'deemail'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 12
    end
    object eddeEmailNfe: TDBEdit
      Left = 455
      Top = 154
      Width = 264
      Height = 21
      DataField = 'deemailnfe'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 13
    end
    object ednmPessoaContato: TDBEdit
      Left = 97
      Top = 204
      Width = 264
      Height = 21
      DataField = 'nmpessoacontato'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 16
    end
    object ednuCep: TDBEdit
      Left = 455
      Top = 204
      Width = 68
      Height = 21
      DataField = 'nucep'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 17
      OnExit = ednuCepExit
    end
    object dedeEndereco: TDBEdit
      Left = 97
      Top = 229
      Width = 264
      Height = 21
      DataField = 'deendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 18
    end
    object ednuEndereco: TDBEdit
      Left = 455
      Top = 229
      Width = 45
      Height = 21
      DataField = 'nuendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 19
    end
    object eddeComplemento: TDBEdit
      Left = 600
      Top = 229
      Width = 119
      Height = 21
      DataField = 'decomplemento'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 20
    end
    object eddeBairro: TDBEdit
      Left = 97
      Top = 255
      Width = 264
      Height = 21
      DataField = 'debairro'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 21
    end
    object mdeObservacoes: TDBMemo
      Left = 97
      Top = 281
      Width = 622
      Height = 144
      DataField = 'deObservacoes'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 23
    end
    object edcdFornecedorTipo: TDBCampoCodigo
      Left = 97
      Top = 431
      Width = 598
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 24
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
        'SELECT cdFornecedorTipo,'
        '       deFornecedorTipo'
        '  FROM erp.fornecedorTipo'
        ' &filtro'
        ' ORDER BY cdFornecedorTipo')
      ERPCamposFiltro.Strings = (
        'cdRepresentante'
        'deRazaoSocial'
        'nmFantasia'
        'nmCidade'
        'sgEstado ')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdFornecedorTipo'
      ERPCampoDescricao = 'deFornecedorTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object cbflAtivo: TDBCheckBox
      Left = 205
      Top = 6
      Width = 76
      Height = 17
      Caption = 'Ativo'
      DataField = 'flativo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 25
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object eddeHomePage: TDBEdit
      Left = 97
      Top = 179
      Width = 264
      Height = 21
      DataField = 'dehomepage'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 14
    end
    object edcdMunicipio: TDBEdit
      Left = 455
      Top = 179
      Width = 68
      Height = 21
      DataField = 'cdmunicipio'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 15
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyFornecedor
    end
  end
end
