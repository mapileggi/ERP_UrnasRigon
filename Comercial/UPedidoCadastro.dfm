inherited FPedidoCadastro: TFPedidoCadastro
  Caption = 'Pedidos'
  ClientWidth = 815
  ExplicitWidth = 815
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 815
    ExplicitWidth = 815
    object lbcdPedido: TLabel
      Left = 22
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeHrCadastro: TLabel
      Left = 445
      Top = 440
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Hora Cad.:'
    end
    object lbdtCadastro: TLabel
      Left = 286
      Top = 440
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Data Cad.:'
    end
    object lbnmUsuCad: TLabel
      Left = 29
      Top = 440
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbdehrAlteracao: TLabel
      Left = 451
      Top = 464
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Hora Alt.:'
    end
    object lbdtAlteracao: TLabel
      Left = 292
      Top = 464
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Data Alt.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 35
      Top = 464
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Usu'#225'rio Alt.:'
    end
    object lbdtEmissao: TLabel
      Left = 175
      Top = 7
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Emiss'#227'o:'
    end
    object lbcdPedidoTipo: TLabel
      Left = 355
      Top = 7
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Ped.:'
    end
    object lbcdCliente: TLabel
      Left = 22
      Top = 31
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object lbcdPedidoSituacao: TLabel
      Left = 574
      Top = 7
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Situa'#231#227'o:'
    end
    object edcdPedido: TDBCampoCodigo
      Left = 60
      Top = 4
      Width = 90
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      TabStop = True
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
        'SELECT p.cdPedido,'
        '       p.cdPedidoTipo,'
        '       tp.dePedidoTipo,'
        '       p.dtEmissao,'
        '       p.cdempresa,'
        '       e.deRazaoSocial AS nmEmpresa,'
        '       p.cdCliente,'
        '       c.deRazaoSocial AS nmCliente,'
        '       r.deRazaoSocial AS nmRepresentante,'
        '       ci.nmCidade,'
        '       ci.sgEstado'
        '  FROM erp.pedido p'
        ' INNER JOIN erp.empresa       e  ON (e.cdEmpresa = p.cdEmpresa)'
        ' INNER JOIN erp.cliente       c  ON (c.cdCliente = p.cdCliente)'
        ' INNER JOIN erp.cidade        ci ON (ci.cdCidade = c.cdCidade)'
        
          ' INNER JOIN erp.representante r  ON (r.cdRepresentante = p.cdRep' +
          'resentante)'
        
          ' INNER JOIN erp.pedidoTipo    tp ON (tp.cdPedidoTipo = p.cdPedid' +
          'oTipo)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdPedido'
        'dePedidoTipo'
        'dtEmissao'
        'cdEmpresa'
        'nmEmpresa'
        'cdCliente'
        'nmCliente'
        'nmRepresentante'
        'nmCidade'
        'sgEstado')
      ERPCamposFiltroTitulo.Strings = (
        'Pedido'
        'Tipo'
        'Emiss'#227'o'
        'C'#243'd. Empresa'
        'Nome Empresa'
        'C'#243'd. Cliente'
        'Nome Cliente'
        'Representante'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdPedido'
      ERPCampoDescricao = 'cdPedido'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object eddeHrCadastro: TDBEdit
      Left = 500
      Top = 437
      Width = 50
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'dehrcadastro'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object eddtCadastro: TDBDateTime
      Left = 341
      Top = 437
      Width = 87
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 7
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcadastro'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuCad: TDBEdit
      Left = 97
      Top = 437
      Width = 171
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'nmusucad'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object eddehrAlteracao: TDBEdit
      Left = 500
      Top = 461
      Width = 50
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'dehralteracao'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object eddtAlteracao: TDBDateTime
      Left = 341
      Top = 461
      Width = 87
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 10
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtalteracao'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuAlt: TDBEdit
      Left = 97
      Top = 461
      Width = 171
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      DataField = 'nmusualt'
      DataSource = FrBarraBotoes.dsDados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object pcDados: TPageControl
      Left = 0
      Top = 55
      Width = 811
      Height = 376
      ActivePage = tsCobranca
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
      object tsCabecalho: TTabSheet
        Caption = 'Cabe'#231'alho'
        object sbCabecalho: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 348
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object lbcdEmpresa: TLabel
            Left = 35
            Top = 31
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa:'
          end
          object lbdtEntrega: TLabel
            Left = 12
            Top = 55
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Data Entrega:'
          end
          object lbcdRepresentante: TLabel
            Left = 4
            Top = 7
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Representante:'
          end
          object lbcdNatureza: TLabel
            Left = 33
            Top = 79
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Natureza:'
          end
          object eddtEntrega: TDBDateTime
            Left = 82
            Top = 52
            Width = 87
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 2
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtentrega'
            DataSource = FrBarraBotoes.dsDados
          end
          object edcdEmpresa: TDBCampoCodigo
            Left = 82
            Top = 28
            Width = 237
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
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
            ERPCampoDescricao = 'deRazaoSocial'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdRepresentante: TDBCampoCodigo
            Left = 82
            Top = 4
            Width = 352
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPOnEdCampoChaveExit = edcdRepresentanteERPOnEdCampoChaveExit
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT r.cdRepresentante,'
              '       r.deRazaoSocial,'
              '       r.nmFantasia,'
              '       t01.nmCidade,'
              '       t01.sgEstado'
              '  FROM erp.representante r'
              '  LEFT JOIN ('
              '             SELECT cid.cdCidade AS cdCid,'
              '                    cid.nmCidade,'
              '                    cid.sgEstado'
              '               FROM erp.cidade cid '
              '            ) t01 ON (t01.cdCid = r.cdCidade)'
              ' &filtro')
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
            ERPCampoChave = 'cdRepresentante'
            ERPCampoDescricao = 'nmFantasia'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdNatureza: TDBCampoCodigo
            Left = 82
            Top = 76
            Width = 464
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 3
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 65
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPOnEdCampoChaveExit = edcdNaturezaERPOnEdCampoChaveExit
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT t.*'
              '  FROM ('
              '        SELECT p.cdNatureza,'
              '               p.deNatureza,'
              '               p.deNaturezaFiscal,'
              '               p.flNaturezaTipo'
              '          FROM erp.Natureza p'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdNatureza'
              'flNaturezaTipo'
              'deNatureza'
              'deNaturezaFiscal')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Tipo'
              'Descri'#231#227'o'
              'Descri'#231#227'o Fiscal')
            ERPCampoChave = 'cdNatureza'
            ERPCampoDescricao = 'deNatureza'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
        end
      end
      object tsTransportes: TTabSheet
        Caption = 'Transportes'
        ImageIndex = 2
        object sbTransportes: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 348
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object lbcdTipoFrete: TLabel
            Left = 34
            Top = 7
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Frete:'
          end
          object lbcdTransportadora: TLabel
            Left = 8
            Top = 31
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportadora:'
          end
          object edcdTipoFrete: TDBCampoCodigo
            Left = 88
            Top = 4
            Width = 247
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT cdTipoFrete, deTipoFrete'
              '  FROM erp.tipoFrete'
              ' &filtro'
              ' ORDER BY cdTipoFrete')
            ERPCamposFiltro.Strings = (
              'cdTipoFrete'
              'deTipoFrete')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdTipoFrete'
            ERPCampoDescricao = 'deTipoFrete'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftString
          end
          object edcdTransportadora: TDBCampoCodigo
            Left = 88
            Top = 28
            Width = 321
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 65
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPOnEdCampoChaveExit = edcdTransportadoraERPOnEdCampoChaveExit
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
            ERPCampoDescricao = 'deRazaoSocial'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
        end
      end
      object tsFaturamento: TTabSheet
        Caption = 'Faturamento'
        ImageIndex = 1
        object sbFaturamento: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 348
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object lbvlPercComissao: TLabel
            Left = 15
            Top = 56
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '% Comiss'#227'o:'
          end
          object lbvlPercDesconto: TLabel
            Left = 15
            Top = 104
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '% Desconto:'
          end
          object gbPrazos: TGroupBox
            Left = 2
            Top = 0
            Width = 679
            Height = 49
            Caption = ' Prazos '
            TabOrder = 0
            object lbnuPrazo1: TLabel
              Left = 10
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '1:'
            end
            object lbnuPrazo2: TLabel
              Left = 66
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '2:'
            end
            object lbnuPrazo3: TLabel
              Left = 122
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '3:'
            end
            object lbnuPrazo6: TLabel
              Left = 290
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '6:'
            end
            object lbnuPrazo5: TLabel
              Left = 234
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '5:'
            end
            object lbnuPrazo4: TLabel
              Left = 178
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '4:'
            end
            object lbnuPrazo12: TLabel
              Left = 620
              Top = 20
              Width = 16
              Height = 13
              Alignment = taRightJustify
              Caption = '12:'
            end
            object lbnuPrazo11: TLabel
              Left = 564
              Top = 20
              Width = 16
              Height = 13
              Alignment = taRightJustify
              Caption = '11:'
            end
            object lbnuPrazo10: TLabel
              Left = 508
              Top = 20
              Width = 16
              Height = 13
              Alignment = taRightJustify
              Caption = '10:'
            end
            object lbnuPrazo9: TLabel
              Left = 458
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '9:'
            end
            object lbnuPrazo8: TLabel
              Left = 402
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '8:'
            end
            object lbnuPrazo7: TLabel
              Left = 346
              Top = 20
              Width = 10
              Height = 13
              Alignment = taRightJustify
              Caption = '7:'
            end
            object ednuPrazo1: TDBEdit
              Left = 23
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo1'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 0
            end
            object ednuPrazo2: TDBEdit
              Left = 79
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo2'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 1
            end
            object ednuPrazo3: TDBEdit
              Left = 135
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo3'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 2
            end
            object ednuPrazo6: TDBEdit
              Left = 303
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo6'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 5
            end
            object ednuPrazo5: TDBEdit
              Left = 247
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo5'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 4
            end
            object ednuPrazo4: TDBEdit
              Left = 191
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo4'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 3
            end
            object ednuPrazo12: TDBEdit
              Left = 639
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo12'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 11
            end
            object ednuPrazo11: TDBEdit
              Left = 583
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo11'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 10
            end
            object ednuPrazo10: TDBEdit
              Left = 527
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo10'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 9
            end
            object ednuPrazo9: TDBEdit
              Left = 471
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo9'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 8
            end
            object ednuPrazo8: TDBEdit
              Left = 415
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo8'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 7
            end
            object ednuPrazo7: TDBEdit
              Left = 359
              Top = 18
              Width = 30
              Height = 21
              DataField = 'nuprazo7'
              DataSource = FrBarraBotoes.dsDados
              TabOrder = 6
            end
          end
          object edvlPercComissao: TDBEdit
            Left = 80
            Top = 53
            Width = 40
            Height = 21
            DataField = 'vlperccomissao'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 1
          end
          object cbflDescontoPorItem: TDBCheckBox
            Left = 80
            Top = 79
            Width = 110
            Height = 17
            Caption = 'Desconto Por Item'
            DataField = 'fldescontoporitem'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 2
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object edvlPercDesconto: TDBEdit
            Left = 80
            Top = 101
            Width = 40
            Height = 21
            DataField = 'vlpercdesconto'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 3
            OnExit = edvlPercDescontoExit
          end
        end
      end
      object tsCobranca: TTabSheet
        Caption = 'Cobran'#231'a'
        ImageIndex = 4
        object sbCobranca: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 348
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object lbcdConta: TLabel
            Left = 46
            Top = 7
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conta:'
          end
          object lbcdCobrancaTipo: TLabel
            Left = 6
            Top = 31
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Cobran'#231'a:'
          end
          object edcdConta: TDBCampoCodigo
            Left = 80
            Top = 4
            Width = 505
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 40
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
              '               cid.sgEstado,'
              
                '               CAST(c.deConta || '#39' | Banco: '#39' || a.cdBanco || '#39' ' +
                '| Ag.: '#39' || a.nuAgencia || '#39' | N'#186' Conta:'#39' || c.nuConta AS CHARAC' +
                'TER VARYING(500)) AS deContaDet'
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
            ERPCampoDescricao = 'deContaDet'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdCobrancaTipo: TDBCampoCodigo
            Left = 80
            Top = 28
            Width = 279
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 40
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPOnEdCampoChaveExit = edcdCobrancaTipoERPOnEdCampoChaveExit
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT t.*'
              '  FROM ('
              '        SELECT a.cdCobrancaTipo,'
              '                     a.deCobrancaTipo'
              '          FROM erp.cobrancaTipo a'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdCobrancaTipo'
              'deCobrancaTipo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCobrancaTipo'
            ERPCampoDescricao = 'deCobrancaTipo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
        end
      end
      object tsObservacoes: TTabSheet
        Caption = 'Observa'#231#245'es'
        ImageIndex = 5
        object sbObservacoes: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 348
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            803
            348)
          object lbdeObservacoes1: TLabel
            Left = 10
            Top = 7
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o 1:'
          end
          object lbdeObservacoes2: TLabel
            Left = 10
            Top = 74
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o 2:'
          end
          object lbdeObservacoes4: TLabel
            Left = 10
            Top = 208
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o 4:'
          end
          object lbdeObservacoes3: TLabel
            Left = 10
            Top = 141
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o 3:'
          end
          object lbdeObservacoes5: TLabel
            Left = 10
            Top = 275
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observa'#231#227'o 5:'
          end
          object mdeObservacoes1: TDBMemo
            Left = 82
            Top = 3
            Width = 718
            Height = 62
            Anchors = [akLeft, akTop, akRight]
            DataField = 'deobservacoes1'
            DataSource = FrBarraBotoes.dsDados
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object mdeObservacoes2: TDBMemo
            Left = 82
            Top = 70
            Width = 718
            Height = 62
            Anchors = [akLeft, akTop, akRight]
            DataField = 'deobservacoes2'
            DataSource = FrBarraBotoes.dsDados
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object mdeObservacoes4: TDBMemo
            Left = 82
            Top = 204
            Width = 718
            Height = 62
            Anchors = [akLeft, akTop, akRight]
            DataField = 'deobservacoes4'
            DataSource = FrBarraBotoes.dsDados
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object mdeObservacoes3: TDBMemo
            Left = 82
            Top = 137
            Width = 718
            Height = 62
            Anchors = [akLeft, akTop, akRight]
            DataField = 'deobservacoes3'
            DataSource = FrBarraBotoes.dsDados
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object mdeObservacoes5: TDBMemo
            Left = 82
            Top = 271
            Width = 718
            Height = 62
            Anchors = [akLeft, akTop, akRight]
            DataField = 'deobservacoes5'
            DataSource = FrBarraBotoes.dsDados
            ScrollBars = ssVertical
            TabOrder = 4
          end
        end
      end
      object tsItens: TTabSheet
        Caption = 'Itens'
        ImageIndex = 3
        object sbItens: TScrollBox
          Left = 0
          Top = 0
          Width = 803
          Height = 348
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          DesignSize = (
            803
            348)
          object lbnmDependente: TLabel
            Left = 65
            Top = 7
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nome:'
          end
          object lbcdGrauParentesco: TLabel
            Left = 12
            Top = 31
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grau Parentesco:'
          end
          object lbdtNascGrauParent: TLabel
            Left = 36
            Top = 55
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nascimento:'
          end
          object ednmDependente: TDBEdit
            Left = 97
            Top = 4
            Width = 179
            Height = 21
            DataField = 'nmdependente'
            DataSource = FrBarraBotoesItens.dsDadosItens
            TabOrder = 0
          end
          object edcdGrauParentesco: TDBCampoCodigo
            Left = 97
            Top = 28
            Width = 258
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 1
            TabStop = True
            ERPCampoCodigoPK = False
            ERPCharCase = ecNormal
            ERPEdCampoChaveWidth = 30
            ERPEdCampoChaveFontSize = 8
            ERPEdCampoChaveReadOnly = False
            ERPEdCampoChaveOnlyNumbers = False
            ERPEdCampoChaveDBEnabled = True
            ERPEdCampoChaveEnabled = True
            ERPLbDescricaoFontSize = 8
            ERPLbDescricaoTop = 3
            ERPBtProcurarEnabled = True
            ERPSqlPesquisa.Strings = (
              'SELECT *'
              '  FROM erp.grauParentesco'
              ' &filtro'
              ' ORDER BY cdGrauParentesco')
            ERPCamposFiltro.Strings = (
              'cdGrauParentesco'
              'deGrauParentesco')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdGrauParentesco'
            ERPCampoDescricao = 'deGrauParentesco'
            ERPDataSource = FrBarraBotoesItens.dsDadosItens
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object eddtNascGrauParent: TDBDateTime
            Left = 97
            Top = 52
            Width = 87
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 2
            ERPEdCampoDataEnabled = True
            ERPBtAbrirCalendarioEnabled = True
            DataField = 'dtNascimento'
            DataSource = FrBarraBotoesItens.dsDadosItens
          end
          inline FrBarraBotoesItens: TFBarraBotoesItens
            Left = 96
            Top = 79
            Width = 182
            Height = 26
            TabOrder = 3
            ExplicitLeft = 96
            ExplicitTop = 79
          end
          object grDependentes: TDBGrid
            Left = 0
            Top = 120
            Width = 801
            Height = 225
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = FrBarraBotoesItens.dsDadosItens
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'cdcolabdependentes'
                Title.Caption = 'N'#186
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nmdependente'
                Title.Caption = 'Nome'
                Width = 154
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'degrauparentesco'
                Title.Caption = 'Grau Parentesco'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtnascimento'
                Title.Caption = 'Nascimento'
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nmusucad'
                Title.Caption = 'Usu'#225'rio Cad.'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nmusualt'
                Title.Caption = 'Usu'#225'rio Alt.'
                Width = 150
                Visible = True
              end>
          end
        end
      end
    end
    object eddtEmissao: TDBDateTime
      Left = 244
      Top = 4
      Width = 87
      Height = 21
      BevelOuter = bvNone
      Caption = 'eddtEmissao'
      ShowCaption = False
      TabOrder = 1
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtEmissao'
      DataSource = FrBarraBotoes.dsDados
    end
    object edcdPedidoTipo: TDBCampoCodigo
      Left = 405
      Top = 4
      Width = 163
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 2
      TabStop = True
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 30
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT cdPedidoTipo, dePedidoTipo'
        '  FROM erp.pedidoTipo'
        ' &filtro'
        ' ORDER BY cdPedidoTipo')
      ERPCamposFiltro.Strings = (
        'cdPedidoTipo'
        'dePedidoTipo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdPedidoTipo'
      ERPCampoDescricao = 'dePedidoTipo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdCliente: TDBCampoCodigo
      Left = 60
      Top = 28
      Width = 737
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 4
      TabStop = True
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 65
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = False
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPOnEdCampoChaveExit = edcdClienteERPOnEdCampoChaveExit
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT cli.cdCliente,'
        '               cli.flFisJur,'
        '               CAST('
        '                    CASE'
        '                      WHEN cli.flFisJur = '#39'J'#39' THEN'
        '                        REGEXP_REPLACE(cli.deCpfCnpj, '
        
          '                                       '#39'(\d{2})(\d{3})(\d{3})(\d' +
          '{4})(\d{2})'#39', '#39'\1.\2.\3/\4.\5'#39
        '                                      )'
        '                      ELSE'
        '                        REGEXP_REPLACE(cli.deCpfCnpj, '
        
          '                                       '#39'(\d{3})(\d{3})(\d{3})(\d' +
          '{2})'#39', '#39'\1.\2.\3-\4'#39
        '                                      )'
        '                    END AS CHARACTER VARYING(20)'
        '                   ) AS deCpfCnpjMasc,'
        '               cli.deRazaoSocial,'
        '               cli.nmFantasia,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               cli.deRazaoSocial || '#39' - '#39' ||'
        '               cid.nmCidade || '#39'/'#39' ||'
        '               cid.sgEstado AS deCliCid,'
        '               cli.cdRepresentante,'
        '               rep.deRazaoSocial AS nmRepresentante'
        '  FROM erp.cliente cli'
        
          '  LEFT JOIN erp.representante rep ON (rep.cdRepresentante = cli.' +
          'cdRepresentante)'
        
          '  LEFT JOIN erp.cidade        cid ON (cid.cdCidade = cli.cdCidad' +
          'e)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdCliente'
        'deRazaoSocial'
        'nmFantasia'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'Cliente'
        'Raz'#227'o Social'
        'Fantasia'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdcliente'
      ERPCampoDescricao = 'deCliCid'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object edcdPedidoSituacao: TDBCampoCodigo
      Left = 621
      Top = 4
      Width = 170
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 3
      ERPCampoCodigoPK = False
      ERPCharCase = ecNormal
      ERPEdCampoChaveWidth = 30
      ERPEdCampoChaveFontSize = 8
      ERPEdCampoChaveReadOnly = True
      ERPEdCampoChaveOnlyNumbers = False
      ERPEdCampoChaveDBEnabled = True
      ERPEdCampoChaveEnabled = True
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = False
      ERPSqlPesquisa.Strings = (
        'SELECT cdPedidoSituacao, dePedidoSituacao'
        '  FROM erp.pedidoSituacao'
        ' &filtro'
        ' ORDER BY cdPedidoSituacao')
      ERPCamposFiltro.Strings = (
        'cdPedidoSituacao'
        'dePedidoSituacao')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdPedidoSituacao'
      ERPCampoDescricao = 'dePedidoSituacao'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 815
    ExplicitWidth = 815
    inherited sbBotoes: TScrollBox
      Width = 815
      ExplicitWidth = 815
      inherited btImprimir: TBitBtn
        Visible = True
        OnClick = FrBarraBotoesbtImprimirClick
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyPedido
    end
    inherited pmImpressao: TPopupMenu
      object pmiFichaAdm: TMenuItem
        Caption = 'Ficha de Admiss'#227'o'
        OnClick = pmiFichaAdmClick
      end
    end
  end
  object relColabFichaAdm: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'HP Officejet Pro 8610'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42342.711820972200000000
    ReportOptions.LastChange = 42342.711820972200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      ''
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;        '
      ''
      'procedure mLocalDataOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mLocalData.Text := <dbPedido."nmcidadeemp"> + '#39', '#39' + DataExten' +
        'so;                                                             ' +
        '                       '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relColabFichaAdmUserFunction
    Left = 450
    Top = 408
    Datasets = <
      item
        DataSet = dbColabDepend
        DataSetName = 'dbColabDepend'
      end
      item
        DataSet = dbPedido
        DataSetName = 'dbPedido'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 1028.032160000000000000
        Width = 718.110700000000000000
        object TotalPages: TfrxMemoView
          Left = 964.559680000001000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line5: TfrxLineView
          Width = 1046.929133860000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo9: TfrxMemoView
          Left = 639.520246460000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'g. [Page] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object mUsuDataHora: TfrxMemoView
          Width = 641.008254800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 3.779542200000000000
        Top = 487.559370000000000000
        Width = 718.110700000000000000
        DataSet = dbPedido
        DataSetName = 'dbPedido'
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
      end
      object gfPedido: TfrxGroupFooter
        FillType = ftBrush
        Height = 411.968770000000000000
        Top = 555.590910000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Top = 0.779530000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object Memo46: TfrxMemoView
          Top = 22.677180000000000000
          Width = 168.189061810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Exame M'#233'dico Admiss'#227'o:')
          ParentFont = False
        end
        object dbPedidodtexameadmissao: TfrxMemoView
          Left = 170.740260000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtexameadmissao'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."dtexameadmissao"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 257.008040000000000000
          Top = 22.677180000000000000
          Width = 141.732351810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Contrato Experi'#234'ncia:')
          ParentFont = False
        end
        object dbPedidonudiascontratoexp: TfrxMemoView
          Left = 398.630180000000000000
          Top = 22.677180000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'nudiascontratoexp'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."nudiascontratoexp"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 432.645950000000000000
          Top = 22.677180000000000000
          Width = 160.630001810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'dias, prorrog'#225'vel por mais:')
          ParentFont = False
        end
        object dbPedidonudiascontratoexpextra: TfrxMemoView
          Left = 595.165740000000000000
          Top = 22.677180000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataField = 'nudiascontratoexpextra'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."nudiascontratoexpextra"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Top = 45.354360000000000000
          Width = 122.834701810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Local de Trabalho:')
          ParentFont = False
        end
        object dbPedidodesetor: TfrxMemoView
          Left = 117.165430000000000000
          Top = 45.354360000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataField = 'desetor'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."desetor"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Top = 68.031540000000000000
          Width = 58.582691810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fun'#231#227'o:')
          ParentFont = False
        end
        object dbPedidodecargo: TfrxMemoView
          Left = 52.913420000000000000
          Top = 68.031540000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DataField = 'decargo'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."decargo"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 291.023810000000000000
          Top = 68.031540000000000000
          Width = 58.582691810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Sal'#225'rio:')
          ParentFont = False
        end
        object dbPedidovlsalario: TfrxMemoView
          Left = 343.937230000000000000
          Top = 68.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'vlsalario'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."vlsalario"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 427.645950000000000000
          Top = 68.031540000000000000
          Width = 109.606304090000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Vale Transporte:')
          ParentFont = False
        end
        object dbPedidoflusavaletransp: TfrxMemoView
          Left = 538.472790000000000000
          Top = 68.031540000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[IIF(<dbPedido."flusavaletransp"> = '#39'S'#39', '#39'Sim'#39', '#39'N'#227'o'#39')]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 578.268090000000000000
          Top = 68.031540000000000000
          Width = 40.818897637795280000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor:')
          ParentFont = False
        end
        object dbPedidovlvaletransp: TfrxMemoView
          Left = 622.842920000000000000
          Top = 68.031540000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'vlvaletransp'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."vlvaletransp"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Top = 90.708720000000000000
          Width = 103.937051810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo de Sal'#225'rio:')
          ParentFont = False
        end
        object dbPedidodesalariotipo: TfrxMemoView
          Left = 106.488250000000000000
          Top = 90.708720000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'desalariotipo'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."desalariotipo"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Top = 113.385900000000000000
          Width = 137.196857720000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Hor'#225'rio de Trabalho:')
          ParentFont = False
        end
        object dbPedidodeescalaitem: TfrxMemoView
          Left = 136.063080000000000000
          Top = 113.385900000000000000
          Width = 578.268090000000000000
          Height = 18.897650000000000000
          DataField = 'deescalaitem'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."deescalaitem"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Top = 136.063080000000000000
          Width = 177.637795275590600000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Adicional de Insalubridade:')
          ParentFont = False
        end
        object dbPedidoflpercadicinsalub: TfrxMemoView
          Left = 177.637910000000000000
          Top = 136.063080000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'flpercadicinsalub'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."flpercadicinsalub"]')
          ParentFont = False
        end
        object dbPedidovlpercadicinsalub: TfrxMemoView
          Left = 230.551330000000000000
          Top = 136.063080000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'vlpercadicinsalub'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."vlpercadicinsalub"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 260.787570000000000000
          Top = 136.063080000000000000
          Width = 179.527651810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '% - Sobre o m'#237'nimo nacional')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Top = 158.740260000000000000
          Width = 185.952755905511800000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Adicional de Periculosidade:')
          ParentFont = False
        end
        object dbPedidoflpercadicperic: TfrxMemoView
          Left = 181.417440000000000000
          Top = 158.740260000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'flpercadicperic'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."flpercadicperic"]')
          ParentFont = False
        end
        object dbPedidovlpercadicperic: TfrxMemoView
          Left = 234.330860000000000000
          Top = 158.740260000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'vlpercadicperic'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."vlpercadicperic"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 260.787570000000000000
          Top = 158.740260000000000000
          Width = 20.787391810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '%')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 196.542980000000000000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDouble
          Frame.Typ = [ftTop]
        end
        object Memo60: TfrxMemoView
          Top = 215.983920000000000000
          Width = 51.023631810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Anexar:')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Top = 238.110390000000000000
          Width = 330.708851810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'C'#243'pia certid'#227'o nascimento filhos menores de 14 anos.')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Top = 272.126160000000000000
          Width = 406.299451810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'Assumo inteira responsabilidade pelas informa'#231#245'es aqui prestadas' +
              '.')
          ParentFont = False
        end
        object mLocalData: TfrxMemoView
          Top = 306.141930000000000000
          Width = 514.016080000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mLocalDataOnBeforePrint'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'LOCAL E DATA POR EXTENSO')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Left = 151.181200000000000000
          Top = 389.291590000000000000
          Width = 413.858511810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8W = (
            'Assinatura do Funcion'#225'rio')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 235.448980000000000000
          Top = 90.708720000000000000
          Width = 109.606299210000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Jornada Mensal:')
          ParentFont = False
        end
        object dbPedidonuhorasjornada: TfrxMemoView
          Left = 343.937007870000000000
          Top = 90.708720000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'nuhorasjornada'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbPedido."nuhorasjornada"]')
          ParentFont = False
        end
        object Memo65: TfrxMemoView
          Left = 383.071120000000000000
          Top = 90.708720000000000000
          Width = 28.346451810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Hrs')
          ParentFont = False
        end
      end
      object ghPedido: TfrxGroupHeader
        FillType = ftBrush
        Height = 128.504020000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = relColabFichaAdm.chColab1
        Condition = 'dbPedido."cdPedido"'
        StartNewPage = True
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Top = 6.559060000000017000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object dbItensRelacReldeTipoRelacao: TfrxMemoView
          Top = 40.795300000000000000
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dbPedido."nmEmpresa"]')
          ParentFont = False
        end
        object dbPedidodecnpjempmasc: TfrxMemoView
          Top = 68.252010000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CNPJ: [dbPedido."decnpjempmasc"]')
          ParentFont = False
        end
        object dbPedidodeenderecoemp: TfrxMemoView
          Top = 90.929190000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<dbPedido."deenderecoemp">] - [IIF(<dbPedido."nuenderecoemp"> >' +
              ' 0, IntToStr(<dbPedido."nuenderecoemp">),'#39#39')] - [<dbPedido."deba' +
              'irroemp">] - [<dbPedido."nmcidadeemp">]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo22: TfrxMemoView
          Top = 0.338590000000000000
          Width = 718.110700000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -35
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haCenter
          Memo.UTF8W = (
            'Ficha de Admiss'#227'o')
          ParentFont = False
        end
      end
      object chColab1: TfrxChild
        FillType = ftBrush
        Height = 294.803340000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 145.511811020000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do Funcion'#225'rio:')
          ParentFont = False
        end
        object dbPedidonmPedido: TfrxMemoView
          Left = 147.401670000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'nmPedido'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."nmPedido"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 420.307360000000000000
          Width = 39.685041810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'C'#243'd.:')
          ParentFont = False
        end
        object dbPedidocdcodigofolha: TfrxMemoView
          Left = 459.590551181102400000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'cdcodigofolha'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."cdcodigofolha"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 538.134200000000000000
          Width = 103.937051810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Admiss'#227'o:')
          ParentFont = False
        end
        object dbPedidodtadmissao: TfrxMemoView
          Left = 642.519685040000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'dtadmissao'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."dtadmissao"]')
        end
        object Memo4: TfrxMemoView
          Top = 20.897650000000000000
          Width = 95.244096930000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome da M'#227'e:')
          ParentFont = False
        end
        object dbPedidonmmae: TfrxMemoView
          Left = 94.488250000000000000
          Top = 20.897650000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          DataField = 'nmmae'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nmmae"]')
        end
        object Memo5: TfrxMemoView
          Left = 370.393940000000000000
          Top = 20.897650000000000000
          Width = 87.685036930000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do Pai:')
          ParentFont = False
        end
        object dbPedidonmpai: TfrxMemoView
          Left = 459.543600000000000000
          Top = 20.897650000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'nmpai'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nmpai"]')
        end
        object Memo6: TfrxMemoView
          Top = 41.795300000000000000
          Width = 77.480341810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Nasc.:')
          ParentFont = False
        end
        object dbPedidodtnascimento: TfrxMemoView
          Left = 75.590600000000000000
          Top = 41.795300000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtnascimento'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."dtnascimento"]')
        end
        object Memo7: TfrxMemoView
          Left = 159.299320000000000000
          Top = 41.795300000000000000
          Width = 86.929138740000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado Civil:')
          ParentFont = False
        end
        object dbPedidodeestadocivil: TfrxMemoView
          Left = 245.669450000000000000
          Top = 41.795300000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'deestadocivil'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."deestadocivil"]')
        end
        object Memo8: TfrxMemoView
          Left = 336.598640000000000000
          Top = 41.795300000000000000
          Width = 122.078745040000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome do C'#244'njuge:')
          ParentFont = False
        end
        object dbPedidonmconjuge: TfrxMemoView
          Left = 459.543307090000000000
          Top = 41.795300000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'nmconjuge'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nmconjuge"]')
        end
        object Memo10: TfrxMemoView
          Top = 62.692950000000000000
          Width = 67.653545750000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object dbPedidodeendereco: TfrxMemoView
          Left = 64.252010000000000000
          Top = 62.692950000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          DataField = 'deendereco'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."deendereco"]')
        end
        object Memo11: TfrxMemoView
          Left = 302.362400000000000000
          Top = 62.692950000000000000
          Width = 26.078742600000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186':')
          ParentFont = False
        end
        object dbPedidonuendereco: TfrxMemoView
          Left = 325.039580000000000000
          Top = 62.692950000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          DataField = 'nuendereco'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nuendereco"]')
        end
        object Memo12: TfrxMemoView
          Left = 362.055350000000000000
          Top = 62.692950000000000000
          Width = 98.267721420000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Complemento:')
          ParentFont = False
        end
        object dbPedidodecomplemento: TfrxMemoView
          Left = 459.590551181102400000
          Top = 62.692950000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataField = 'decomplemento'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."decomplemento"]')
        end
        object Memo13: TfrxMemoView
          Top = 83.590600000000000000
          Width = 47.244101810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object dbPedidodebairro: TfrxMemoView
          Left = 43.574830000000000000
          Top = 83.590600000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'debairro'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."debairro"]')
        end
        object Memo14: TfrxMemoView
          Left = 274.228510000000000000
          Top = 83.590600000000000000
          Width = 54.803161810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object dbPedidonmcidade: TfrxMemoView
          Left = 325.039370080000000000
          Top = 83.590600000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          DataField = 'nmcidade'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nmcidade"]')
        end
        object Memo15: TfrxMemoView
          Left = 591.386210000000000000
          Top = 83.590600000000000000
          Width = 54.803161810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado:')
          ParentFont = False
        end
        object dbPedidosgestado: TfrxMemoView
          Left = 642.519685039370100000
          Top = 83.590600000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'sgestado'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."sgestado"]')
        end
        object Memo16: TfrxMemoView
          Top = 104.488250000000000000
          Width = 37.417325280000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF:')
          ParentFont = False
        end
        object dbPedidodecpfmasc: TfrxMemoView
          Left = 34.015770000000010000
          Top = 104.488250000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'decpfmasc'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."decpfmasc"]')
        end
        object Memo17: TfrxMemoView
          Left = 217.315090000000000000
          Top = 104.488250000000000000
          Width = 32.125981810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RG:')
          ParentFont = False
        end
        object dbPedidonurg: TfrxMemoView
          Left = 245.669291338582700000
          Top = 104.488250000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'nurg'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nurg"]')
        end
        object Memo18: TfrxMemoView
          Left = 349.598640000000000000
          Top = 104.488250000000000000
          Width = 111.496111810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado Emissor:')
          ParentFont = False
        end
        object dbPedidosgrgestadoemissor: TfrxMemoView
          Left = 459.590551180000000000
          Top = 104.488250000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'sgrgestadoemissor'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."sgrgestadoemissor"]')
        end
        object Memo19: TfrxMemoView
          Left = 548.811380000000000000
          Top = 104.488250000000000000
          Width = 96.377991810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Emiss'#227'o:')
          ParentFont = False
        end
        object dbPedidodtrgemissao: TfrxMemoView
          Left = 642.519685039370100000
          Top = 104.488250000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'dtrgemissao'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."dtrgemissao"]')
        end
        object Memo20: TfrxMemoView
          Top = 125.385900000000000000
          Width = 66.141751810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CTPS N'#186':')
          ParentFont = False
        end
        object dbPedidonuctps: TfrxMemoView
          Left = 60.472480000000000000
          Top = 125.385900000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'nuctps'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nuctps"]')
        end
        object Memo21: TfrxMemoView
          Left = 204.094620000000000000
          Top = 125.385900000000000000
          Width = 43.464571810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'S'#233'rie:')
          ParentFont = False
        end
        object dbPedidodectpsserie: TfrxMemoView
          Left = 245.669450000000000000
          Top = 125.385900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dectpsserie'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."dectpsserie"]')
        end
        object Memo23: TfrxMemoView
          Left = 430.086890000000000000
          Top = 125.385900000000000000
          Width = 32.125981810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'PIS:')
          ParentFont = False
        end
        object dbPedidonupis: TfrxMemoView
          Left = 459.590551181102400000
          Top = 125.385900000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'nupis'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nupis"]')
        end
        object Memo24: TfrxMemoView
          Left = 548.811380000000000000
          Top = 125.385900000000000000
          Width = 96.377991810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Emiss'#227'o:')
          ParentFont = False
        end
        object dbPedidodtctpsemissao: TfrxMemoView
          Left = 642.519685039370100000
          Top = 125.385900000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'dtctpsemissao'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."dtctpsemissao"]')
        end
        object Memo25: TfrxMemoView
          Top = 146.283550000000000000
          Width = 92.598461810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186' Reservista:')
          ParentFont = False
        end
        object dbPedidonureservista: TfrxMemoView
          Left = 90.708720000000000000
          Top = 146.283550000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'nureservista'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nureservista"]')
        end
        object Memo26: TfrxMemoView
          Left = 215.771800000000000000
          Top = 146.283550000000000000
          Width = 92.598461810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'T'#237'tulo Eleitor:')
          ParentFont = False
        end
        object dbPedidonutituloeleitor: TfrxMemoView
          Left = 306.141732280000000000
          Top = 146.283550000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'nutituloeleitor'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nutituloeleitor"]')
        end
        object Memo27: TfrxMemoView
          Left = 487.779840000000000000
          Top = 146.283550000000000000
          Width = 40.818900080000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Zona:')
          ParentFont = False
        end
        object dbPedidonutituloeleitorzona: TfrxMemoView
          Left = 529.732298110000000000
          Top = 146.283550000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'nutituloeleitorzona'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nutituloeleitorzona"]')
        end
        object Memo28: TfrxMemoView
          Left = 596.827150000000000000
          Top = 146.283550000000000000
          Width = 48.755907950000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Se'#231#227'o:')
          ParentFont = False
        end
        object dbPedidonutituloeleitorsecao: TfrxMemoView
          Left = 642.519685039370100000
          Top = 146.283550000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'nutituloeleitorsecao'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nutituloeleitorsecao"]')
        end
        object Memo29: TfrxMemoView
          Top = 167.181200000000000000
          Width = 54.803149610000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CNH N'#186':')
          ParentFont = False
        end
        object dbPedidonucnh: TfrxMemoView
          Left = 54.913420000000000000
          Top = 167.181200000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'nucnh'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nucnh"]')
        end
        object Memo30: TfrxMemoView
          Left = 216.992270000000000000
          Top = 167.181200000000000000
          Width = 87.685041810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Naturalidade:')
          ParentFont = False
        end
        object dbPedidonmcidadenat: TfrxMemoView
          Left = 306.141732280000000000
          Top = 167.181200000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'nmcidadenat'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."nmcidadenat"]')
        end
        object Memo31: TfrxMemoView
          Left = 428.748300000000000000
          Top = 167.181200000000000000
          Width = 98.267716540000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nacionalidade:')
          ParentFont = False
        end
        object dbPedidodenacionalidade: TfrxMemoView
          Left = 529.574817800000000000
          Top = 167.181200000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'denacionalidade'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."denacionalidade"]')
        end
        object Memo32: TfrxMemoView
          Left = 591.031540000000000000
          Top = 167.078540000000000000
          Width = 52.913388270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado:')
          ParentFont = False
        end
        object dbPedidosgestadonat: TfrxMemoView
          Left = 642.519685039370100000
          Top = 167.181200000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'sgestadonat'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."sgestadonat"]')
        end
        object Memo33: TfrxMemoView
          Top = 188.078850000000000000
          Width = 81.259871810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cor da Pele:')
          ParentFont = False
        end
        object dbPedidodecorpele: TfrxMemoView
          Left = 79.370130000000000000
          Top = 188.078850000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'decorpele'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."decorpele"]')
        end
        object Memo34: TfrxMemoView
          Left = 184.196970000000000000
          Top = 188.078850000000000000
          Width = 122.834701810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Grau de Instru'#231#227'o:')
          ParentFont = False
        end
        object dbPedidodegrauinstrucao: TfrxMemoView
          Left = 306.141930000000000000
          Top = 188.078850000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataField = 'degrauinstrucao'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."degrauinstrucao"]')
        end
        object Memo35: TfrxMemoView
          Left = 572.488560000000000000
          Top = 188.078850000000000000
          Width = 71.055120550000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estudante:')
          ParentFont = False
        end
        object dbPedidodeestudante: TfrxMemoView
          Left = 642.519685039370100000
          Top = 188.078850000000000000
          Width = 71.811021180000000000
          Height = 18.897650000000000000
          DataField = 'deestudante'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."deestudante"]')
        end
        object Memo36: TfrxMemoView
          Top = 208.976500000000000000
          Width = 35.905511810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tel.:')
          ParentFont = False
        end
        object dbPedidodefone: TfrxMemoView
          Left = 34.015770000000010000
          Top = 208.976500000000000000
          Width = 94.488188976377960000
          Height = 18.897650000000000000
          DataField = 'defone'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."defone"]')
        end
        object Memo37: TfrxMemoView
          Left = 253.181200000000000000
          Top = 208.976500000000000000
          Width = 54.803161810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Celular:')
          ParentFont = False
        end
        object dbPedidodecelular: TfrxMemoView
          Left = 306.141732280000000000
          Top = 208.976500000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'decelular'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."decelular"]')
        end
        object Memo38: TfrxMemoView
          Left = 480.220780000000000000
          Top = 208.976500000000000000
          Width = 48.755907950000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'E-mail:')
          ParentFont = False
        end
        object dbPedidodeemail: TfrxMemoView
          Left = 529.732298110000000000
          Top = 208.976500000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'deemail'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."deemail"]')
        end
        object Memo39: TfrxMemoView
          Top = 229.874150000000000000
          Width = 51.023631810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Banco:')
          ParentFont = False
        end
        object dbPedidodebanco: TfrxMemoView
          Left = 46.354360000000000000
          Top = 229.874150000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = 'debanco'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            '[dbPedido."debanco"]')
        end
        object Memo40: TfrxMemoView
          Left = 247.008040000000000000
          Top = 229.874150000000000000
          Width = 58.582691810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ag'#234'ncia:')
          ParentFont = False
        end
        object dbPedidonuagencia: TfrxMemoView
          Left = 306.141732280000000000
          Top = 229.874150000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            
              '[IIF(<dbPedido."nudigitoage"> <> '#39#39',<dbPedido."nuagencia"> + '#39'-'#39 +
              ' + <dbPedido."nudigitoage">,<dbPedido."nuagencia">)]')
        end
        object Memo41: TfrxMemoView
          Left = 482.205010000000000000
          Top = 229.874150000000000000
          Width = 46.110238660000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Conta:')
          ParentFont = False
        end
        object dbPedidonuconta: TfrxMemoView
          Left = 529.732298110000000000
          Top = 229.874150000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Memo.UTF8W = (
            
              '[IIF(<dbPedido."nuconta"> > 0, IntToStr(<dbPedido."nuconta">), '#39 +
              #39')][IIF(<dbPedido."nucontadigito"> <> '#39#39', '#39'-'#39' + <dbPedido."nucon' +
              'tadigito">, '#39#39')]')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo42: TfrxMemoView
          Top = 253.228510000000000000
          Width = 100.157521810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Dependentes:')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Top = 275.126160000000000000
          Width = 300.472611810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 302.362400000000000000
          Top = 275.149606300000000000
          Width = 300.472611810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Grau de Parentesco')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 627.401980000000000000
          Top = 275.149606299212600000
          Width = 77.480341810000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nascimento')
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          Left = 147.401670000000000000
          Top = 167.055118110000000000
          Width = 34.015748030000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cat.:')
          ParentFont = False
        end
        object dbPedidodecnhcategoria: TfrxMemoView
          Left = 180.976500000000000000
          Top = 167.055118110000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          DataField = 'decnhcategoria'
          DataSet = dbPedido
          DataSetName = 'dbPedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbPedido."decnhcategoria"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 514.016080000000000000
        Width = 718.110700000000000000
        DataSet = dbColabDepend
        DataSetName = 'dbColabDepend'
        RowCount = 0
        object dbColabDependnmdependente: TfrxMemoView
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataField = 'nmdependente'
          DataSet = dbColabDepend
          DataSetName = 'dbColabDepend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColabDepend."nmdependente"]')
          ParentFont = False
        end
        object dbColabDependdegrauparentesco: TfrxMemoView
          Left = 302.362400000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataField = 'degrauparentesco'
          DataSet = dbColabDepend
          DataSetName = 'dbColabDepend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColabDepend."degrauparentesco"]')
          ParentFont = False
        end
        object dbColabDependdtnascimento: TfrxMemoView
          Left = 627.401980000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'dtnascimento'
          DataSet = dbColabDepend
          DataSetName = 'dbColabDepend'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbColabDepend."dtnascimento"]')
          ParentFont = False
        end
      end
    end
  end
  object dbPedido: TfrxDBDataset
    UserName = 'dbPedido'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdempresa=cdempresa'
      'nmempresa=nmempresa'
      'decnpjempmasc=decnpjempmasc'
      'deenderecoemp=deenderecoemp'
      'nuenderecoemp=nuenderecoemp'
      'debairroemp=debairroemp'
      'nmcidadeemp=nmcidadeemp'
      'cdcodigofolha=cdcodigofolha'
      'cdPedido=cdPedido'
      'nmPedido=nmPedido'
      'cdcolabsituacao=cdcolabsituacao'
      'decolabsituacao=decolabsituacao'
      'dtnascimento=dtnascimento'
      'flsexo=flsexo'
      'dtadmissao=dtadmissao'
      'nmmae=nmmae'
      'nmpai=nmpai'
      'cdestadocivil=cdestadocivil'
      'deestadocivil=deestadocivil'
      'nmconjuge=nmconjuge'
      'nucep=nucep'
      'deendereco=deendereco'
      'nuendereco=nuendereco'
      'decomplemento=decomplemento'
      'debairro=debairro'
      'cdcidade=cdcidade'
      'nmcidade=nmcidade'
      'sgestado=sgestado'
      'decpf=decpf'
      'decpfmasc=decpfmasc'
      'nurg=nurg'
      'sgrgestadoemissor=sgrgestadoemissor'
      'dergorgaoexp=dergorgaoexp'
      'dtrgemissao=dtrgemissao'
      'nuctps=nuctps'
      'dectpsserie=dectpsserie'
      'nupis=nupis'
      'sgctpsestado=sgctpsestado'
      'dtctpsemissao=dtctpsemissao'
      'nureservista=nureservista'
      'nutituloeleitor=nutituloeleitor'
      'nutituloeleitorzona=nutituloeleitorzona'
      'nutituloeleitorsecao=nutituloeleitorsecao'
      'nucnh=nucnh'
      'decnhcategoria=decnhcategoria'
      'nmcidadenat=nmcidadenat'
      'sgestadonat=sgestadonat'
      'denacionalidade=denacionalidade'
      'decorpele=decorpele'
      'degrauinstrucao=degrauinstrucao'
      'deestudante=deestudante'
      'defone=defone'
      'decelular=decelular'
      'deemail=deemail'
      'nuconta=nuconta'
      'nucontadigito=nucontadigito'
      'cdagencia=cdagencia'
      'deagencia=deagencia'
      'nuagencia=nuagencia'
      'nudigitoage=nudigitoage'
      'cdbanco=cdbanco'
      'debanco=debanco'
      'dtexameadmissao=dtexameadmissao'
      'nudiascontratoexp=nudiascontratoexp'
      'nudiascontratoexpextra=nudiascontratoexpextra'
      'cdsetor=cdsetor'
      'desetor=desetor'
      'cdcargo=cdcargo'
      'decargo=decargo'
      'vlsalario=vlsalario'
      'flusavaletransp=flusavaletransp'
      'vlvaletransp=vlvaletransp'
      'cdsalariotipo=cdsalariotipo'
      'desalariotipo=desalariotipo'
      'nuhorasjornada=nuhorasjornada'
      'cdescala=cdescala'
      'deescalaitem=deescalaitem'
      'flpercadicinsalub=flpercadicinsalub'
      'vlpercadicinsalub=vlpercadicinsalub'
      'flpercadicperic=flpercadicperic'
      'vlpercadicperic=vlpercadicperic'
      'imlogoemp=imlogoemp')
    BCDToCurrency = False
    Left = 362
    Top = 408
  end
  object dbColabDepend: TfrxDBDataset
    UserName = 'dbColabDepend'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdPedido=cdPedido'
      'cdcolabdependentes=cdcolabdependentes'
      'nmdependente=nmdependente'
      'cdgrauparentesco=cdgrauparentesco'
      'dtnascimento=dtnascimento'
      'dtcadastro=dtcadastro'
      'hrcadastro=hrcadastro'
      'cdusuariocadastro=cdusuariocadastro'
      'dtalteracao=dtalteracao'
      'hralteracao=hralteracao'
      'cdusuarioalteracao=cdusuarioalteracao'
      'dehrcadastro=dehrcadastro'
      'dehralteracao=dehralteracao'
      'nmusucad=nmusucad'
      'nmusualt=nmusualt'
      'degrauparentesco=degrauparentesco')
    DataSet = DmERP.qyColabDependentes
    BCDToCurrency = False
    Left = 546
    Top = 408
  end
end
