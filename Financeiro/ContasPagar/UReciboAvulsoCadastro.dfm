inherited FReciboAvulsoCadastro: TFReciboAvulsoCadastro
  Caption = 'ReciboAvulsoes'
  ClientWidth = 815
  OnShow = FormShow
  ExplicitWidth = 815
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 815
    ExplicitWidth = 815
    object lbcdReciboAvulso: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeHrCadastro: TLabel
      Left = 445
      Top = 420
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Hora Cad.:'
      Visible = False
      ExplicitTop = 440
    end
    object lbdtCadastro: TLabel
      Left = 286
      Top = 420
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Data Cad.:'
      Visible = False
      ExplicitTop = 440
    end
    object lbnmUsuCad: TLabel
      Left = 29
      Top = 420
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Usu'#225'rio Cad.:'
      Visible = False
      ExplicitTop = 440
    end
    object lbdeHrSlteracao: TLabel
      Left = 451
      Top = 444
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Hora Alt.:'
      Visible = False
      ExplicitTop = 464
    end
    object lbdtAlteracao: TLabel
      Left = 292
      Top = 444
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Data Alt.:'
      Visible = False
      ExplicitTop = 464
    end
    object lbnmUsuAlt: TLabel
      Left = 35
      Top = 444
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Caption = 'Usu'#225'rio Alt.:'
      Visible = False
      ExplicitTop = 464
    end
    object lbcdEmpresa: TLabel
      Left = 50
      Top = 103
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empresa:'
    end
    object lbvlReciboAvulso: TLabel
      Left = 67
      Top = 127
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor:'
    end
    object lbcdCidade: TLabel
      Left = 58
      Top = 176
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cidade:'
    end
    object lbdeEndereco: TLabel
      Left = 46
      Top = 80
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Endere'#231'o:'
    end
    object lbnmRecebedor: TLabel
      Left = 64
      Top = 56
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
    end
    object lbdtReciboAvulso: TLabel
      Left = 68
      Top = 152
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data:'
    end
    object lbcdColaborador: TLabel
      Left = 32
      Top = 32
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Colaborador:'
    end
    object lbdeCpfCnpj: TLabel
      Left = 348
      Top = 56
      Width = 52
      Height = 13
      Caption = 'CPF/CNPJ:'
    end
    object lbdeReciboAvulso: TLabel
      Left = 33
      Top = 202
      Width = 62
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Referente a:'
      ParentBiDiMode = False
    end
    object edcdReciboAvulso: TDBCampoCodigo
      Left = 97
      Top = 4
      Width = 92
      Height = 21
      BevelOuter = bvNone
      Enabled = False
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
        '        SELECT a.cdReciboAvulso,'
        '               a.deReciboAvulso,'
        '               a.vlReciboAvulso,'
        '               a.dtReciboAvulso,'
        '               a.nmRecebedor,'
        '              CAST(CASE'
        '              WHEN LENGTH(a.deCpfCnpj) = 14 THEN'
        '                REGEXP_REPLACE(a.deCpfCnpj, '
        
          '                               '#39'(\d{2})(\d{3})(\d{3})(\d{4})(\d{' +
          '2})'#39', '#39'\1.\2.\3/\4-\5'#39
        '                              )'
        '              ELSE'
        '                REGEXP_REPLACE(a.deCpfCnpj, '
        
          '                               '#39'(\d{3})(\d{3})(\d{3})(\d{2})'#39', '#39 +
          '\1.\2.\3.-\4'#39
        '                              ) '
        '            END AS CHARACTER VARYING(30)'
        '           ) AS deCpfCnpjMasc,'
        '               a.deEndereco,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               a.cdEmpresa,'
        '               e.deRazaoSocial AS nmEmpresa'
        '          FROM erp.reciboAvulso a'
        
          '          LEFT JOIN erp.empresa       e   ON (e.cdEmpresa = a.cd' +
          'Empresa)'
        
          '          LEFT JOIN erp.cidade        cid ON (cid.cdCidade = a.c' +
          'dCidade)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdReciboAvulso'
        'deReciboAvulso'
        'vlReciboAvulso'
        'dtReciboAvulso'
        'nmRecebedor'
        'deCpfCnpjMasc'
        'deEndereco'
        'nmEmpresa')
      ERPCamposFiltroTitulo.Strings = (
        'Recibo N'#186
        'Referente a'
        'Valor'
        'Data Recibo'
        'Recebedor'
        'CPF/CNPJ'
        'Endere'#231'o'
        'Empresa')
      ERPCampoChave = 'cdReciboAvulso'
      ERPCampoDescricao = 'cdReciboAvulso'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object eddeHrCadastro: TDBEdit
      Left = 500
      Top = 417
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
      TabOrder = 10
      Visible = False
    end
    object eddtCadastro: TDBDateTime
      Left = 341
      Top = 417
      Width = 87
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 11
      Visible = False
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtcadastro'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuCad: TDBEdit
      Left = 97
      Top = 417
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
      TabOrder = 12
      Visible = False
    end
    object eddeHrSlteracao: TDBEdit
      Left = 500
      Top = 441
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
      TabOrder = 13
      Visible = False
    end
    object eddtAlteracao: TDBDateTime
      Left = 341
      Top = 441
      Width = 87
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      ShowCaption = False
      TabOrder = 14
      Visible = False
      ERPEdCampoDataEnabled = False
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtalteracao'
      DataSource = FrBarraBotoes.dsDados
    end
    object ednmUsuAlt: TDBEdit
      Left = 97
      Top = 441
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
      TabOrder = 15
      Visible = False
    end
    object edcdEmpresa: TDBCampoCodigo
      Left = 97
      Top = 101
      Width = 237
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 5
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
    object edvlReciboAvulso: TDBEdit
      Left = 97
      Top = 125
      Width = 68
      Height = 21
      DataField = 'vlreciboavulso'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 6
    end
    object edcdCidade: TDBCampoCodigo
      Left = 97
      Top = 173
      Width = 276
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 8
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
    object dedeEndereco: TDBEdit
      Left = 97
      Top = 77
      Width = 412
      Height = 21
      DataField = 'deendereco'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 4
    end
    object ednmRecebedor: TDBEdit
      Left = 97
      Top = 53
      Width = 194
      Height = 21
      DataField = 'nmrecebedor'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object eddtReciboAvulso: TDBDateTime
      Left = 97
      Top = 149
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 7
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtreciboavulso'
      DataSource = FrBarraBotoes.dsDados
    end
    object edcdColaborador: TDBCampoCodigo
      Left = 97
      Top = 29
      Width = 412
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
      ERPOnEdCampoChaveExit = edcdColaboradorERPOnEdCampoChaveExit
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT cdColaborador,'
        '               nmColaborador'
        '          FROM erp.colaborador'
        '      ORDER BY nmColaborador '
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdColaborador'
        'nmColaborador')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Nome')
      ERPCampoChave = 'cdColaborador'
      ERPCampoDescricao = 'nmColaborador'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object eddeCpfCnpj: TDBEdit
      Left = 402
      Top = 53
      Width = 107
      Height = 21
      DataField = 'decpfcnpj'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
      OnExit = eddeCpfCnpjExit
    end
    object mdeReciboAvulso: TDBMemo
      Left = 97
      Top = 197
      Width = 691
      Height = 204
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'dereciboavulso'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 9
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 815
    ExplicitWidth = 815
    inherited sbBotoes: TScrollBox
      Width = 815
      ExplicitWidth = 815
      inherited btAnterior: TBitBtn
        Visible = False
      end
      inherited btProximo: TBitBtn
        Visible = False
      end
      inherited btNovo: TBitBtn
        Visible = False
      end
      inherited btAlterar: TBitBtn
        Visible = False
      end
      inherited btSalvar: TBitBtn
        Caption = '&Imprimir'
      end
      inherited btCancelar: TBitBtn
        Visible = False
      end
      inherited btExluir: TBitBtn
        Visible = False
      end
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyReciboAvulso
    end
    inherited pmImpressao: TPopupMenu
      object pmiFichaAdm: TMenuItem
        Caption = 'Ficha de Admiss'#227'o'
      end
    end
  end
  object relReciboAvulso: TfrxReport
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
      'end;'
      ''
      'procedure mLocalDataOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  mLocalData.Text := <dbReciboAvulso."nmcidade"> + '#39', '#39' + DataEx' +
        'tenso;  '
      'end;'
      ''
      'procedure mValorExtensoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mValorExtenso.Text :=ValorExtenso;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relReciboAvulsoUserFunction
    Left = 450
    Top = 408
    Datasets = <
      item
        DataSet = dbReciboAvulso
        DataSetName = 'dbReciboAvulso'
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
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 483.779852200000000000
        Top = 45.354360000000000000
        Width = 718.110700000000000000
        DataSet = dbReciboAvulso
        DataSetName = 'dbReciboAvulso'
        PrintIfDetailEmpty = True
        RowCount = 0
        Stretched = True
        object Shape1: TfrxShapeView
          Left = 1.779530000000000000
          Top = 3.897649999999992000
          Width = 714.331170000000000000
          Height = 34.015770000000010000
        end
        object Shape2: TfrxShapeView
          Left = 1.889763780000000000
          Top = 41.574830000000030000
          Width = 714.331170000000000000
          Height = 438.425018660000000000
        end
        object mUsuDataHora: TfrxMemoView
          Left = 183.417440000000000000
          Top = 457.323130000000000000
          Width = 527.622354800000100000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'USUARIO - DATA - HORA DE IMPRESS'#195'O')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo9: TfrxMemoView
          Left = 257.787716460000000000
          Top = 11.338590000000010000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
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
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000015000
          Width = 98.267780000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RECIBO')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 120.944960000000000000
          Top = 11.338590000000010000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'N'#186)
          ParentFont = False
        end
        object dbReciboAvulsocdReciboAvulso: TfrxMemoView
          Left = 151.181200000000000000
          Top = 11.338590000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = dbReciboAvulso
          DataSetName = 'dbReciboAvulso'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbReciboAvulso."cdReciboAvulso"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 441.102350000000000000
          Top = 11.338582680000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object dbReciboAvulsovlreciboavulso: TfrxMemoView
          Left = 572.709030000000000000
          Top = 11.338582680000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataSet = dbReciboAvulso
          DataSetName = 'dbReciboAvulso'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[dbReciboAvulso."vlreciboavulso"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 5.779530000000000000
          Top = 45.354360000000030000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Recebi (emos) de ')
          ParentFont = False
        end
        object dbReciboAvulsonmempresa: TfrxMemoView
          Left = 118.944960000000000000
          Top = 45.354360000000030000
          Width = 594.519685039370100000
          Height = 18.897650000000000000
          DataField = 'nmempresa'
          DataSet = dbReciboAvulso
          DataSetName = 'dbReciboAvulso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbReciboAvulso."nmempresa"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 5.779530000000000000
          Top = 71.811070000000030000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'A quantia de ')
          ParentFont = False
        end
        object mValorExtenso: TfrxMemoView
          Left = 5.779530000000000000
          Top = 98.267780000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mValorExtensoOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'VALOR EXTENSO')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 5.779530000000000000
          Top = 124.724490000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Correspondente a:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 5.779530000000000000
          Top = 151.181200000000000000
          Width = 706.772110000000000000
          Height = 139.842610000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbReciboAvulso."dereciboavulso"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 5.779530000000000000
          Top = 298.582870000000100000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'e para clareza firmo (amos) o presente.')
          ParentFont = False
        end
        object mLocalData: TfrxMemoView
          Left = 5.779530000000000000
          Top = 325.039580000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mLocalDataOnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'LOCAL E DATA')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 5.779530000000000000
          Top = 362.834880000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'Assinatura:_____________________________________________________' +
              '____________________________________')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 5.779530000000000000
          Top = 396.850650000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object dbReciboAvulsonmrecebedor: TfrxMemoView
          Left = 70.031540000000010000
          Top = 396.850650000000000000
          Width = 423.307360000000000000
          Height = 18.897650000000000000
          DataField = 'nmrecebedor'
          DataSet = dbReciboAvulso
          DataSetName = 'dbReciboAvulso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbReciboAvulso."nmrecebedor"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 500.897960000000000000
          Top = 396.850650000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'CPF/CNPJ:')
          ParentFont = False
        end
        object dbReciboAvulsodecpfcnpjmasc: TfrxMemoView
          Left = 576.488560000000000000
          Top = 396.850650000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'decpfcnpjmasc'
          DataSet = dbReciboAvulso
          DataSetName = 'dbReciboAvulso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbReciboAvulso."decpfcnpjmasc"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 5.779530000000000000
          Top = 427.086890000000100000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object dbReciboAvulsodeendereco: TfrxMemoView
          Left = 70.034645670000000000
          Top = 427.086890000000100000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          DataField = 'deendereco'
          DataSet = dbReciboAvulso
          DataSetName = 'dbReciboAvulso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[dbReciboAvulso."deendereco"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 5.779530000000000000
          Top = 457.323130000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '* Funcion'#225'rio que imprimiu o recibo: ')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 3.779530000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'dbReciboAvulso."cdCodigo"'
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 11.338590000000000000
        Top = 551.811380000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          Top = 7.779530000000023000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object dbReciboAvulso: TfrxDBDataset
    UserName = 'dbReciboAvulso'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdCodigo=cdCodigo'
      'cdReciboAvulso=cdReciboAvulso'
      'deReciboAvulso=dereciboavulso'
      'vlReciboAvulso=vlreciboavulso'
      'dtReciboAvulso=dtreciboavulso'
      'nmRecebedor=nmrecebedor'
      'deCpfCnpjMasc=decpfcnpjmasc'
      'deEndereco=deendereco'
      'cdEmpresa=cdempresa'
      'nmEmpresa=nmempresa'
      'nmCidade=nmcidade')
    DataSet = vtReciboAvulso
    BCDToCurrency = False
    Left = 362
    Top = 408
  end
  object vtReciboAvulso: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 360
    Top = 360
    Data = {03000000000000000000}
    object vtReciboAvulsocdCodigo: TIntegerField
      FieldName = 'cdCodigo'
    end
    object vtReciboAvulsocdReciboAvulso: TIntegerField
      FieldName = 'cdReciboAvulso'
    end
    object vtReciboAvulsodeReciboAvulso: TStringField
      FieldName = 'deReciboAvulso'
      Size = 4000
    end
    object vtReciboAvulsovlReciboAvulso: TFloatField
      FieldName = 'vlReciboAvulso'
    end
    object vtReciboAvulsodtReciboAvulso: TDateField
      FieldName = 'dtReciboAvulso'
    end
    object vtReciboAvulsonmRecebedor: TStringField
      FieldName = 'nmRecebedor'
      Size = 250
    end
    object vtReciboAvulsodeCpfCnpjMasc: TStringField
      FieldName = 'deCpfCnpjMasc'
      Size = 30
    end
    object vtReciboAvulsodeEndereco: TStringField
      FieldName = 'deEndereco'
      Size = 500
    end
    object vtReciboAvulsocdEmpresa: TIntegerField
      FieldName = 'cdEmpresa'
    end
    object vtReciboAvulsonmEmpresa: TStringField
      FieldName = 'nmEmpresa'
      Size = 250
    end
    object vtReciboAvulsonmCidade: TStringField
      FieldName = 'nmCidade'
      Size = 250
    end
  end
end
