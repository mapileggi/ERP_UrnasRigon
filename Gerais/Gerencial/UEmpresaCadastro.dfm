inherited FEmpresaCadastro: TFEmpresaCadastro
  Caption = 'Empresas'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdEmpresa: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeCnpj: TLabel
      Left = 66
      Top = 33
      Width = 29
      Height = 13
      Caption = 'CNPJ:'
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
    object lbcdCidade: TLabel
      Left = 392
      Top = 137
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object lbnuInscEst: TLabel
      Left = 338
      Top = 33
      Width = 91
      Height = 13
      Caption = 'Inscri'#231#227'o Estadual:'
    end
    object lbnuFone1: TLabel
      Left = 40
      Top = 85
      Width = 55
      Height = 13
      Caption = 'Telefone 1:'
    end
    object lbnuFone2: TLabel
      Left = 213
      Top = 85
      Width = 55
      Height = 13
      Caption = 'Telefone 2:'
    end
    object lbnuCelular: TLabel
      Left = 392
      Top = 85
      Width = 37
      Height = 13
      Caption = 'Celular:'
    end
    object lbnuFax: TLabel
      Left = 552
      Top = 85
      Width = 22
      Height = 13
      Caption = 'Fax:'
    end
    object lbnuCep: TLabel
      Left = 72
      Top = 163
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object lbdeEndereco: TLabel
      Left = 46
      Top = 111
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object lbnuEndereco: TLabel
      Left = 413
      Top = 111
      Width = 16
      Height = 13
      Caption = 'N'#186':'
    end
    object lbdeComplemento: TLabel
      Left = 505
      Top = 111
      Width = 69
      Height = 13
      Caption = 'Complemento:'
    end
    object lbdeBairro: TLabel
      Left = 63
      Top = 137
      Width = 32
      Height = 13
      Caption = 'Bairro:'
    end
    object imLogo: TImage
      Left = 97
      Top = 187
      Width = 152
      Height = 105
      Stretch = True
    end
    object eddeCnpj: TDBEdit
      Left = 97
      Top = 30
      Width = 107
      Height = 21
      DataField = 'decnpj'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
      OnExit = eddeCnpjExit
    end
    object eddeRazaoSocial: TDBEdit
      Left = 97
      Top = 56
      Width = 247
      Height = 21
      DataField = 'derazaosocial'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object ednmFantasia: TDBEdit
      Left = 431
      Top = 56
      Width = 264
      Height = 21
      DataField = 'nmfantasia'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
    end
    object edcdCidade: TDBCampoCodigo
      Left = 431
      Top = 134
      Width = 264
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 13
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
    object edcdEmpresa: TDBCampoCodigo
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
        'SELECT t01.cdEmpresa,'
        '       t01.deRazaoSocial,'
        '       t01.nmFantasia,'
        '       t01.cdCidade,'
        '       t01.nmCidade,'
        '       t01.sgEstado'
        '  FROM ('
        '        SELECT e.cdEmpresa,'
        '               e.deRazaoSocial,'
        '               e.nmFantasia,'
        '               e.cdCidade,'
        '               cid.nmCidade,'
        '               cid.sgEstado'
        '          FROM erp.empresa e'
        
          '          LEFT JOIN erp.cidade cid ON (cid.cdCidade = e.cdCidade' +
          ')'
        '       ) t01 '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdEmpresa'
        'deCnpj'
        'deRazaoSocial'
        'nmFantasia'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'CNPJ'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdEmpresa'
      ERPCampoDescricao = 'cdEmpresa'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object denuInscEst: TDBEdit
      Left = 431
      Top = 30
      Width = 91
      Height = 21
      DataField = 'nuinscest'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object ednuFone1: TDBEdit
      Left = 97
      Top = 82
      Width = 91
      Height = 21
      DataField = 'nufone1'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 5
    end
    object ednuFone2: TDBEdit
      Left = 270
      Top = 82
      Width = 91
      Height = 21
      DataField = 'nufone2'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
    end
    object ednuCelular: TDBEdit
      Left = 431
      Top = 82
      Width = 91
      Height = 21
      DataField = 'nuCelular'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 7
    end
    object ednuFax: TDBEdit
      Left = 576
      Top = 82
      Width = 91
      Height = 21
      DataField = 'nufax'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 8
    end
    object ednuCep: TDBEdit
      Left = 97
      Top = 160
      Width = 68
      Height = 21
      DataField = 'nucep'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 14
    end
    object dedeEndereco: TDBEdit
      Left = 97
      Top = 108
      Width = 264
      Height = 21
      DataField = 'deendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 9
    end
    object ednuEndereco: TDBEdit
      Left = 431
      Top = 108
      Width = 45
      Height = 21
      DataField = 'nuendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 10
    end
    object eddeComplemento: TDBEdit
      Left = 576
      Top = 108
      Width = 119
      Height = 21
      DataField = 'decomplemento'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 11
    end
    object eddeBairro: TDBEdit
      Left = 97
      Top = 134
      Width = 264
      Height = 21
      DataField = 'debairro'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 12
    end
    object btAlterarLogo: TBitBtn
      Left = 97
      Top = 298
      Width = 55
      Height = 52
      Caption = '&Logo'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 15
      OnClick = btAlterarLogoClick
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited sbBotoes: TScrollBox
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyEmpresa
      OnDataChange = FrBarraBotoesdsDadosDataChange
    end
  end
  object odCarregarLogo: TOpenDialog
    Filter = '*.jpg||*.jpeg'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Escolha o logo da Empresa'
    Left = 280
    Top = 272
  end
end
