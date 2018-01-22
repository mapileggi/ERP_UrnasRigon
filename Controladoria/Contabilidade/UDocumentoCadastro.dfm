inherited FDocumentoCadastro: TFDocumentoCadastro
  Caption = 'Documentos'
  ClientWidth = 790
  ExplicitWidth = 790
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 790
    ExplicitWidth = 790
    object lbcdDocumento: TLabel
      Left = 54
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbcdEmpresa: TLabel
      Left = 46
      Top = 56
      Width = 45
      Height = 13
      Caption = 'Empresa:'
    end
    object lbdtEmissao: TLabel
      Left = 23
      Top = 199
      Width = 68
      Height = 13
      Caption = 'Data Emiss'#227'o:'
    end
    object lbvlDocumento: TLabel
      Left = 63
      Top = 225
      Width = 28
      Height = 13
      Caption = 'Valor:'
    end
    object lbcdDocumentoTipo: TLabel
      Left = 10
      Top = 80
      Width = 81
      Height = 13
      Caption = 'Tipo Documento:'
    end
    object lbcdDespesaTipo: TLabel
      Left = 23
      Top = 104
      Width = 68
      Height = 13
      Caption = 'Tipo Despesa:'
    end
    object lbcdFornecedor: TLabel
      Left = 32
      Top = 128
      Width = 59
      Height = 13
      Caption = 'Fornecedor:'
    end
    object lbdtCompetencia: TLabel
      Left = 25
      Top = 32
      Width = 66
      Height = 13
      Caption = 'Compet'#234'ncia:'
    end
    object lbnmUsuCad: TLabel
      Left = 331
      Top = 7
      Width = 66
      Height = 13
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 567
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Usu'#225'rio Alt.:'
    end
    object lbdeNumDocumento: TLabel
      Left = 18
      Top = 176
      Width = 73
      Height = 13
      Caption = 'N'#186' Documento:'
    end
    object lbcdBordero: TLabel
      Left = 49
      Top = 269
      Width = 42
      Height = 13
      Caption = 'Bordero:'
    end
    object lbdeObservacoes: TLabel
      Left = 24
      Top = 296
      Width = 67
      Height = 13
      Caption = 'Observa'#231#245'es:'
    end
    object edcdEmpresa: TDBCampoCodigo
      Left = 93
      Top = 53
      Width = 649
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 2
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
        'deRazaoSocial'
        'nmFantasia')
      ERPCamposFiltroTitulo.Strings = (
        'Empresa'
        'Raz'#227'o Social'
        'Fantasia')
      ERPCampoChave = 'cdEmpresa'
      ERPCampoDescricao = 'deRazaoSocial'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdDocumento: TDBCampoCodigo
      Left = 93
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
        '        SELECT d.cdDocumento,'
        
          '               CAST(TO_CHAR(d.dtCompetencia, '#39'mm/yyyy'#39') AS CHARA' +
          'CTER VARYING(10)) AS deComp,'
        '               e.deRazaoSocial AS nmEmpresa,'
        
          '               COALESCE(f.deRazaoSocial, d.nmFornecedor) AS nmFo' +
          'rnecedor,'
        '               dt.deDocumentoTipo,'
        '               det.deDespesaTipo,'
        '               d.vlDocumento,'
        '               d.dtEmissao'
        '          FROM erp.documento d'
        
          '          LEFT JOIN erp.empresa       e   ON (e.cdEmpresa = d.cd' +
          'Empresa)'
        
          '          LEFT JOIN erp.fornecedor    f   ON (f.cdFornecedor = d' +
          '.cdFornecedor)'
        
          '          LEFT JOIN erp.documentoTipo dt  ON (dt.cdDocumentoTipo' +
          ' = d.cdDocumentoTipo)'
        
          '          LEFT JOIN erp.despesaTipo   det ON (det.cdDespesaTipo ' +
          '= d.cdDespesaTipo)'
        '       ) t'
        ' &filtro'
        '  ORDER BY t.cdDocumento DESC')
      ERPCamposFiltro.Strings = (
        'cdDocumento'
        'deComp'
        'nmEmpresa'
        'nmFornecedor'
        'deDocumentoTipo'
        'deDespesaTipo'
        'dtEmissao'
        'vlDocumento')
      ERPCamposFiltroTitulo.Strings = (
        'Documento'
        'Compet'#234'ncia'
        'Empresa'
        'Fornecedor'
        'Tipo Documento'
        'Tipo Despesa'
        'Emiss'#227'o'
        'Valor')
      ERPCampoChave = 'cdDocumento'
      ERPCampoDescricao = 'cdDocumento'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edvlDocumento: TDBEdit
      Left = 93
      Top = 222
      Width = 68
      Height = 21
      DataField = 'vldocumento'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 9
    end
    object eddtEmissao: TDBDateTime
      Left = 93
      Top = 197
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 8
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtemissao'
      DataSource = FrBarraBotoes.dsDados
    end
    object edcdDocumentoTipo: TDBCampoCodigo
      Left = 93
      Top = 77
      Width = 308
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 3
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
        '        SELECT dt.cdDocumentoTipo,'
        '               dt.deDocumentoTipo'
        '          FROM erp.documentoTipo dt'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdDocumentoTipo'
        'deDocumentoTipo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdDocumentoTipo'
      ERPCampoDescricao = 'deDocumentoTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdDespesaTipo: TDBCampoCodigo
      Left = 93
      Top = 101
      Width = 308
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
        '        SELECT dt.cdDespesaTipo,'
        '               dt.deDespesaTipo'
        '          FROM erp.despesaTipo dt'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdDespesaTipo'
        'deDespesaTipo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdDespesaTipo'
      ERPCampoDescricao = 'deDespesaTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdFornecedor: TDBCampoCodigo
      Left = 93
      Top = 125
      Width = 649
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 5
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 65
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPOnEdCampoChaveExit = edcdFornecedorERPOnEdCampoChaveExit
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
      ERPCampoChave = 'cdFornecedor'
      ERPCampoDescricao = 'deRazaoSocial'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object eddtCompetencia: TDBDateTime
      Left = 93
      Top = 29
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 1
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcompetencia'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuCad: TDBEdit
      Left = 397
      Top = 4
      Width = 155
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'nmusucad'
      DataSource = FrBarraBotoes.dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object ednmUsuAlt: TDBEdit
      Left = 627
      Top = 4
      Width = 155
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'nmusualt'
      DataSource = FrBarraBotoes.dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
    end
    object eddeNumDocumento: TDBEdit
      Left = 93
      Top = 173
      Width = 91
      Height = 21
      DataField = 'denumdocumento'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 7
    end
    object edcdBordero: TDBCampoCodigo
      Left = 93
      Top = 266
      Width = 459
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 11
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
        'SELECT t.*,'
        '             CAST(t.nmMotorista || '#39': '#39' || '
        '                       t.deVeiculo AS CHARACTER VARYING(250)'
        '                      ) AS deBordero'
        '  FROM ('
        '        SELECT b.cdBordero,'
        '               m.nmMotorista,                 '
        '               CAST('
        
          '                   REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', '#39 +
          '\1-\2'#39') || '#39' - '#39' ||'
        '                    CASE'
        '                      WHEN v.cdVeiculoTipo = 1 THEN'
        '                        '#39'Carro'#39' '
        '                      WHEN v.cdVeiculoTipo = 2 THEN'
        '                        '#39'Caminh'#227'o'#39
        '                      WHEN v.cdVeiculoTipo = 3 THEN'
        '                        '#39'Caminhonete'#39
        '                      WHEN v.cdVeiculoTipo = 4 THEN'
        '                        '#39'Carreta'#39
        '                      WHEN v.cdVeiculoTipo = 5 THEN'
        '                        '#39'Moto'#39' '
        '                    END AS CHARACTER VARYING(30)'
        '                   ) AS deVeiculo,'
        '               b.dtSaida,'
        '               b.dtRetorno'
        '          FROM erp.bordero b'
        
          '          LEFT JOIN erp.motorista m  ON (m.cdMotorista = b.cdMot' +
          'orista)'
        
          '          LEFT JOIN erp.veiculo   v  ON (v.cdVeiculo = b.cdVeicu' +
          'lo)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdBordero'
        'nmMotorista'
        'deVeiculo'
        'dtSaida'
        'dtRetorno')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Motorista'
        'Ve'#237'culo'
        'Dt. Sa'#237'da'
        'Dt. Retorno')
      ERPCampoChave = 'cdBordero'
      ERPCampoDescricao = 'deBordero'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object cbflContabiliza: TDBCheckBox
      Left = 93
      Top = 246
      Width = 76
      Height = 17
      Caption = 'Contabiliza'
      DataField = 'flcontabiliza'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 10
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object mdeObservacoes: TDBMemo
      Left = 93
      Top = 291
      Width = 689
      Height = 191
      DataField = 'deObservacoes'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 12
    end
    object ednmFornecedor: TDBEdit
      Left = 93
      Top = 149
      Width = 459
      Height = 21
      DataField = 'nmfornecedor'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 790
    ExplicitWidth = 790
    inherited sbBotoes: TScrollBox
      Width = 790
      ExplicitWidth = 790
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyDocumento
    end
  end
end
