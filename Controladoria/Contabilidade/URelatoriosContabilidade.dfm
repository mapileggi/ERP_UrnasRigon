object FRelatoriosContabilidade: TFRelatoriosContabilidade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios da Contabilidade'
  ClientHeight = 382
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcRelatorios: TPageControl
    Left = 0
    Top = 0
    Width = 479
    Height = 330
    ActivePage = tsDocumentosBordero
    Align = alClient
    TabOrder = 0
    object tsDocumentosBordero: TTabSheet
      Caption = 'Documentos do Bordero'
      object sbRDB: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbRDBFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          DesignSize = (
            471
            302)
          object lbRDBdtEmissao: TLabel
            Left = 26
            Top = 164
            Width = 67
            Height = 13
            Caption = 'Emiss'#227'o Doc.:'
          end
          object lbRDBdtEmissaoA: TLabel
            Left = 213
            Top = 164
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRDBnmFornecedor: TLabel
            Left = 34
            Top = 261
            Width = 59
            Height = 13
            Caption = 'Fornecedor:'
          end
          object lbRDBdtCompetenciaA: TLabel
            Left = 212
            Top = 140
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRDBdtCompetencia: TLabel
            Left = 33
            Top = 140
            Width = 60
            Height = 13
            Caption = 'Comp. Doc.:'
          end
          object lbRDBcdBordero: TLabel
            Left = 51
            Top = 20
            Width = 42
            Height = 13
            Caption = 'Bordero:'
          end
          object lbRDBcdMotorista: TLabel
            Left = 44
            Top = 44
            Width = 49
            Height = 13
            Caption = 'Motorista:'
          end
          object lbRDBcdVeiculo: TLabel
            Left = 56
            Top = 68
            Width = 37
            Height = 13
            Caption = 'Ve'#237'culo:'
          end
          object lbRDBdtSaida: TLabel
            Left = 63
            Top = 92
            Width = 30
            Height = 13
            Caption = 'Sa'#237'da:'
          end
          object lbRDBdtSaidaA: TLabel
            Left = 212
            Top = 92
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRDBdtRetornoA: TLabel
            Left = 212
            Top = 116
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRDBdtRetorno: TLabel
            Left = 50
            Top = 116
            Width = 43
            Height = 13
            Caption = 'Retorno:'
          end
          object lbRDBcdDocumentoTipo: TLabel
            Left = 12
            Top = 212
            Width = 81
            Height = 13
            Caption = 'Tipo Documento:'
          end
          object lbRDBcdDespesaTipo: TLabel
            Left = 25
            Top = 236
            Width = 68
            Height = 13
            Caption = 'Tipo Despesa:'
          end
          object lbRDBcdEmpresa: TLabel
            Left = 48
            Top = 188
            Width = 45
            Height = 13
            Caption = 'Empresa:'
          end
          object edRDBdtEmissaoIni: TDateTimePicker
            Left = 94
            Top = 161
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 9
          end
          object edRDBdtEmissaoFim: TDateTimePicker
            Left = 225
            Top = 161
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 10
          end
          object edRDBnmFornecedor: TEdit
            Left = 94
            Top = 258
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 14
          end
          object edRDBdtCompetenciaFim: TDateTimePicker
            Left = 225
            Top = 137
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 8
          end
          object edRDBdtCompetenciaIni: TDateTimePicker
            Left = 94
            Top = 137
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 7
          end
          object edRDBcdBordero: TDBCampoCodigo
            Left = 94
            Top = 17
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRDBcdMotorista: TDBCampoCodigo
            Left = 94
            Top = 41
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT m.cdMotorista,'
              '                     m.nmMotorista'
              '          FROM erp.motorista m'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdMotorista'
              'nmMotorista')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Nome')
            ERPCampoChave = 'cdMotorista'
            ERPCampoDescricao = 'nmMotorista'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRDBcdVeiculo: TDBCampoCodigo
            Left = 94
            Top = 65
            Width = 364
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT v.cdVeiculo,'
              '               CAST('
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
              '                   ) AS deVeiculoTipo,'
              '               v.dePlaca,'
              
                '               CAST(REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
                #39'\1-\2'#39') AS CHARACTER VARYING(15)) AS dePlacaM, '
              '               CAST('
              
                '                    REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
                #39'\1-\2'#39') || '#39' - '#39' ||               '
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
              '                   ) AS deVeiculo'
              '          FROM erp.veiculo v'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdVeiculo'
              'deVeiculoTipo'
              'dePlacaM')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Tipo'
              'Placa')
            ERPCampoChave = 'cdVeiculo'
            ERPCampoDescricao = 'deVeiculo'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRDBdtSaidaIni: TDateTimePicker
            Left = 94
            Top = 89
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 3
          end
          object edRDBdtSaidaFim: TDateTimePicker
            Left = 225
            Top = 89
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 4
          end
          object edRDBdtRetornoFim: TDateTimePicker
            Left = 225
            Top = 113
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 6
          end
          object edRDBdtRetornoIni: TDateTimePicker
            Left = 94
            Top = 113
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 5
          end
          object edRDBcdDocumentoTipo: TDBCampoCodigo
            Left = 94
            Top = 209
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 12
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRDBcdDespesaTipo: TDBCampoCodigo
            Left = 94
            Top = 233
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRDBcdEmpresa: TDBCampoCodigo
            Left = 94
            Top = 185
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
        end
      end
    end
    object tsRelacaoDocumentos: TTabSheet
      Caption = 'Rela'#231#227'o de Documentos'
      ImageIndex = 1
      object sbRRD: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbRRDFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          DesignSize = (
            471
            302)
          object lbRRDdtEmissao: TLabel
            Left = 26
            Top = 68
            Width = 67
            Height = 13
            Caption = 'Emiss'#227'o Doc.:'
          end
          object lbRRDdtEmissaoA: TLabel
            Left = 213
            Top = 68
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbRRDnmFornecedor: TLabel
            Left = 29
            Top = 140
            Width = 59
            Height = 13
            Caption = 'Fornecedor:'
          end
          object lbRRDdtCompetencia: TLabel
            Left = 33
            Top = 19
            Width = 60
            Height = 13
            Caption = 'Comp. Doc.:'
          end
          object lbRRDcdDocumentoTipo: TLabel
            Left = 12
            Top = 92
            Width = 81
            Height = 13
            Caption = 'Tipo Documento:'
          end
          object lbRRDcdDespesaTipo: TLabel
            Left = 25
            Top = 116
            Width = 68
            Height = 13
            Caption = 'Tipo Despesa:'
          end
          object lbRRDcdEmpresa: TLabel
            Left = 48
            Top = 44
            Width = 45
            Height = 13
            Caption = 'Empresa:'
          end
          object edRRDdtEmissaoIni: TDateTimePicker
            Left = 94
            Top = 65
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 2
          end
          object edRRDdtEmissaoFim: TDateTimePicker
            Left = 225
            Top = 65
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 3
          end
          object edRRDnmFornecedor: TEdit
            Left = 94
            Top = 138
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
          object edRRDdtCompetencia: TDateTimePicker
            Left = 94
            Top = 16
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            TabOrder = 0
          end
          object edRRDcdDocumentoTipo: TDBCampoCodigo
            Left = 94
            Top = 89
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRRDcdDespesaTipo: TDBCampoCodigo
            Left = 94
            Top = 113
            Width = 364
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edRRDcdEmpresa: TDBCampoCodigo
            Left = 94
            Top = 41
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object cbRRDflContabiliza: TCheckBox
            Left = 94
            Top = 164
            Width = 97
            Height = 17
            Caption = 'Contabiliza'
            Checked = True
            State = cbChecked
            TabOrder = 7
          end
        end
      end
    end
    object tsExtratoViagem: TTabSheet
      Caption = 'Extrato Viagem'
      ImageIndex = 2
      object sbREV: TScrollBox
        Left = 0
        Top = 0
        Width = 471
        Height = 302
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object gbREVFiltros: TGroupBox
          Left = 0
          Top = 0
          Width = 471
          Height = 302
          Align = alClient
          Caption = ' Filtros: '
          TabOrder = 0
          DesignSize = (
            471
            302)
          object lbREVcdBordero: TLabel
            Left = 51
            Top = 20
            Width = 42
            Height = 13
            Caption = 'Bordero:'
          end
          object lbREVcdMotorista: TLabel
            Left = 44
            Top = 44
            Width = 49
            Height = 13
            Caption = 'Motorista:'
          end
          object lbREVcdVeiculo: TLabel
            Left = 56
            Top = 68
            Width = 37
            Height = 13
            Caption = 'Ve'#237'culo:'
          end
          object lbREVdtSaida: TLabel
            Left = 63
            Top = 92
            Width = 30
            Height = 13
            Caption = 'Sa'#237'da:'
          end
          object lbREVdtSaidaA: TLabel
            Left = 212
            Top = 92
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbREVdtRetornoA: TLabel
            Left = 212
            Top = 116
            Width = 6
            Height = 13
            Caption = 'a'
          end
          object lbREVdtRetorno: TLabel
            Left = 50
            Top = 116
            Width = 43
            Height = 13
            Caption = 'Retorno:'
          end
          object edREVcdBordero: TDBCampoCodigo
            Left = 94
            Top = 17
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 0
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
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edREVcdMotorista: TDBCampoCodigo
            Left = 94
            Top = 41
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT m.cdMotorista,'
              '                     m.nmMotorista'
              '          FROM erp.motorista m'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdMotorista'
              'nmMotorista')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Nome')
            ERPCampoChave = 'cdMotorista'
            ERPCampoDescricao = 'nmMotorista'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edREVcdVeiculo: TDBCampoCodigo
            Left = 94
            Top = 65
            Width = 364
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT v.cdVeiculo,'
              '               CAST('
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
              '                   ) AS deVeiculoTipo,'
              '               v.dePlaca,'
              
                '               CAST(REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
                #39'\1-\2'#39') AS CHARACTER VARYING(15)) AS dePlacaM, '
              '               CAST('
              
                '                    REGEXP_REPLACE(v.dePlaca, '#39'(\w{3})(\d{4})'#39', ' +
                #39'\1-\2'#39') || '#39' - '#39' ||               '
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
              '                   ) AS deVeiculo'
              '          FROM erp.veiculo v'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdVeiculo'
              'deVeiculoTipo'
              'dePlacaM')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Tipo'
              'Placa')
            ERPCampoChave = 'cdVeiculo'
            ERPCampoDescricao = 'deVeiculo'
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edREVdtSaidaIni: TDateTimePicker
            Left = 94
            Top = 89
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 3
          end
          object edREVdtSaidaFim: TDateTimePicker
            Left = 225
            Top = 89
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 4
          end
          object edREVdtRetornoFim: TDateTimePicker
            Left = 225
            Top = 113
            Width = 111
            Height = 21
            Date = 42342.685951053240000000
            Time = 42342.685951053240000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 6
          end
          object edREVdtRetornoIni: TDateTimePicker
            Left = 94
            Top = 113
            Width = 111
            Height = 21
            Date = 42342.685948726850000000
            Time = 42342.685948726850000000
            ShowCheckbox = True
            Checked = False
            TabOrder = 5
          end
        end
      end
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 330
    Width = 479
    Height = 52
    Align = alBottom
    TabOrder = 1
    object btImprimir: TBitBtn
      Left = 1
      Top = 1
      Width = 55
      Height = 50
      Align = alLeft
      Caption = '&Imprimir'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btImprimirClick
    end
    object btFechar: TBitBtn
      Left = 56
      Top = 1
      Width = 55
      Height = 50
      Align = alLeft
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btFecharClick
    end
  end
  object relDocBordero: TfrxReport
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
      'begin'
      ''
      'end.')
    OnUserFunction = relDocBorderoUserFunction
    Left = 218
    Top = 336
    Datasets = <
      item
        DataSet = dbDocBordero
        DataSetName = 'frxDBDocBordero'
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
        Top = 483.779840000000000000
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
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
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
        Height = 15.118120000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        DataSet = dbDocBordero
        DataSetName = 'frxDBDocBordero'
        RowCount = 0
        Stretched = True
        object frxDBRelListaProdITEM: TfrxMemoView
          Left = 11.338590000000000000
          Width = 283.464750000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDocBordero."nmFornecedor"]')
          ParentFont = False
        end
        object frxDBRelListaProdNUQTD: TfrxMemoView
          Left = 324.819110000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDocBordero."deNumDocumento"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 428.866419999999800000
          Width = 68.031539999999990000
          Height = 13.606299210000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDocBordero."dtEmissao"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 511.016080000000000000
          Width = 75.590600000000000000
          Height = 13.606299210000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDocBordero."vlDocumento"]')
          ParentFont = False
        end
      end
      object ghTipoDespesa: TfrxGroupHeader
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        Child = relDocBordero.Child1
        Condition = 'frxDBDocBordero."cddespesatipo"'
        object frxDBDocBorderodedespesatipo: TfrxMemoView
          Left = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'dedespesatipo'
          DataSet = dbDocBordero
          DataSetName = 'frxDBDocBordero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDocBordero."dedespesatipo"]')
          ParentFont = False
        end
      end
      object gfTipoDespesa: TfrxGroupFooter
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo27: TfrxMemoView
          Left = 261.228510000000000000
          Top = 0.377952755905539600
          Width = 241.889920000000000000
          Height = 13.606299210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total [frxDBDocBordero."dedespesatipo"]:')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 504.165647240000000000
          Top = 0.377952755905539600
          Width = 83.149616060000000000
          Height = 13.606299210000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDocBordero."vlDocumento">,MasterData1)]')
          ParentFont = False
        end
      end
      object ghMotorista: TfrxGroupHeader
        FillType = ftBrush
        Height = 147.401670000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDocBordero."cdbordero"'
        StartNewPage = True
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 79.370130000000000000
          Width = 71.811070000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Motorista:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Top = 16.236240000000000000
          Width = 718.110700000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'BORDERO DE VIAGEM '
            'N'#186' [frxDBDocbordero."cdBordero"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo2: TfrxMemoView
          Left = 79.370130000000000000
          Top = 79.370130000000000000
          Width = 272.126160000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDocBordero."nmMotorista"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 366.614410000000000000
          Top = 79.370130000000000000
          Width = 71.811070000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Ve'#237'culo:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 438.425480000000000000
          Top = 79.370130000000000000
          Width = 272.126160000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDocBordero."dePlaca"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 7.559060000000000000
          Top = 98.267780000000000000
          Width = 71.811070000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'KM Inicial:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 79.370130000000000000
          Top = 98.267780000000000000
          Width = 272.126160000000000000
          Height = 18.897640240000000000
          DisplayFormat.ThousandSeparator = '.'
          DisplayFormat.FormatStr = '#,##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDocBordero."nuKmInicial"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 366.614410000000000000
          Top = 98.267780000000000000
          Width = 71.811070000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'KM Final:')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 438.425480000000000000
          Top = 98.267780000000000000
          Width = 272.126160000000000000
          Height = 18.897640240000000000
          DisplayFormat.ThousandSeparator = '.'
          DisplayFormat.FormatStr = '#,##'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDocBordero."nuKmFinal"]')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 7.559060000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Sa'#237'da:')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 79.370130000000000000
          Top = 117.165430000000000000
          Width = 272.126160000000000000
          Height = 18.897640240000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDocBordero."dtSaida"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 366.614410000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Retorno:')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 438.425480000000000000
          Top = 117.165430000000000000
          Width = 272.126160000000000000
          Height = 18.897640240000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDocBordero."dtRetorno"]')
          ParentFont = False
        end
      end
      object gfMotorista: TfrxGroupFooter
        FillType = ftBrush
        Height = 79.370120240000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        object Line6: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          Left = 396.850649999999900000
          Top = 0.755905509999990900
          Width = 105.826840000000000000
          Height = 13.606299210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 503.724707240000000000
          Top = 0.755905509999990900
          Width = 83.149616060000000000
          Height = 13.606299210000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDocBordero."vlDocumento">,MasterData1)]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 408.189240000000000000
          Top = 54.692950000000050000
          Width = 272.126160000000000000
          Height = 18.897640240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDocBordero."nmMotorista"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 389.291590000000000000
          Top = 52.913420000000030000
          Width = 306.141930000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 15.118110236220470000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          Left = 11.338590000000000000
          Top = 0.000000000000056843
          Width = 109.606370000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 324.661348980000000000
          Width = 98.267758030000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'N'#250'mero Doc.')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 428.976353539999700000
          Width = 68.031500939999990000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 510.881880000000000000
          Width = 75.590560940000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
    end
  end
  object dbDocBordero: TfrxDBDataset
    UserName = 'frxDBDocBordero'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdbordero=cdbordero'
      'cdmotorista=cdmotorista'
      'nmmotorista=nmmotorista'
      'cdveiculo=cdveiculo'
      'deplaca=deplaca'
      'deveiculo=deveiculo'
      'dtsaida=dtsaida'
      'dtretorno=dtretorno'
      'nukminicial=nukminicial'
      'nukmfinal=nukmfinal'
      'dtcompetencia=dtcompetencia'
      'cdempresa=cdempresa'
      'nmempresa=nmempresa'
      'cdfornecedor=cdfornecedor'
      'nmfornecedor=nmfornecedor'
      'denumdocumento=denumdocumento'
      'dtemissao=dtemissao'
      'vldocumento=vldocumento'
      'cddocumentotipo=cddocumentotipo'
      'dedocumentotipo=dedocumentotipo'
      'cddespesatipo=cddespesatipo'
      'dedespesatipo=dedespesatipo')
    DataSet = DmERP.qyBorderoRel
    BCDToCurrency = False
    Left = 146
    Top = 336
  end
  object dbRelacaoDoc: TfrxDBDataset
    UserName = 'frxDBRelacaoDoc'
    CloseDataSource = False
    FieldAliases.Strings = (
      'dtcompetencia=dtcompetencia'
      'decomp=decomp'
      'cdempresa=cdempresa'
      'nmempresa=nmempresa'
      'cdfornecedor=cdfornecedor'
      'nmfornecedor=nmfornecedor'
      'denumdocumento=denumdocumento'
      'dtemissao=dtemissao'
      'vldocumento=vldocumento'
      'cddocumentotipo=cddocumentotipo'
      'dedocumentotipo=dedocumentotipo'
      'cddespesatipo=cddespesatipo'
      'dedespesatipo=dedespesatipo'
      'deobservacoes=deobservacoes')
    DataSet = DmERP.qyDocumentoRel
    BCDToCurrency = False
    Left = 314
    Top = 336
  end
  object relRelacaoDoc: TfrxReport
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
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Frac(<Line> / 2) = 0.5 then '
      '    mCor.Color :=$00EBEBEB '
      '  else '
      '    mCor.Color := clWhite;  '
      'end;'
      ''
      'procedure MasterData2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Frac(<Line> / 2) = 0.5 then '
      '    mCor2.Color :=$00EBEBEB '
      '  else '
      '    mCor2.Color := clWhite;  '
      'end;'
      ''
      'procedure mUsuDataHoraOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  mUsuDataHora.Text := UsuarioDataHoraImpressao;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnUserFunction = relRelacaoDocUserFunction
    Left = 386
    Top = 336
    Datasets = <
      item
        DataSet = dbRelacaoDoc
        DataSetName = 'frxDBRelacaoDoc'
      end
      item
        DataSet = dbRelacDocObs
        DataSetName = 'frxDBRelacDocObs'
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
        Top = 597.165740000000000000
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
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
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
        Height = 15.118120000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dbRelacaoDoc
        DataSetName = 'frxDBRelacaoDoc'
        RowCount = 0
        Stretched = True
        object mCor: TfrxMemoView
          Width = 718.110700000000000000
          Height = 15.118110240000000000
        end
        object frxDBRelListaProdITEM: TfrxMemoView
          Left = 11.338590000000000000
          Width = 313.700990000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelacaoDoc."nmFornecedor"]')
          ParentFont = False
        end
        object frxDBRelListaProdNUQTD: TfrxMemoView
          Left = 326.819110000000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelacaoDoc."deNumDocumento"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 426.866420000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<frxDBRelacaoDoc."dtemissao"> = nil, '#39#39', DateToStr(<frxDBRe' +
              'lacaoDoc."dtemissao">))]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 496.677490000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBRelacaoDoc."vlDocumento"]')
          ParentFont = False
        end
      end
      object ghTipoDocumento: TfrxGroupHeader
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 18.897637800000000000
        ParentFont = False
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        Child = relRelacaoDoc.chCabecalho
        Condition = 'frxDBRelacaoDoc."cddocumentotipo"'
        object frxDBDocBorderodedespesatipo: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = dbRelacaoDoc
          DataSetName = 'frxDBRelacaoDoc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelacaoDoc."deDocumentoTipo"]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          Top = 0.377952755905511800
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object gfTipoDocumento: TfrxGroupFooter
        FillType = ftBrush
        Height = 15.118120000000000000
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Width = 718.110236220472400000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo27: TfrxMemoView
          Left = 73.031540000000000000
          Top = 0.377952760000000000
          Width = 415.748300000000000000
          Height = 13.606299210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total [frxDBRelacaoDoc."dedocumentotipo"]:')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 489.827057240000000000
          Top = 0.377952760000027800
          Width = 83.149616060000000000
          Height = 13.606299210000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelacaoDoc."vlDocumento">,MasterData1)]')
          ParentFont = False
        end
      end
      object ghEmpresa: TfrxGroupHeader
        FillType = ftBrush
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelacaoDoc."cdempresa"'
        StartNewPage = True
        object picLogoEmp: TfrxPictureView
          Left = 7.559060000000000000
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          Top = 7.236240000000000000
          Width = 718.110700000000000000
          Height = 41.574820240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Documentos Entregues'
            '[frxDBRelacaoDoc."nmEmpresa"]')
          ParentFont = False
        end
      end
      object gfEmpresa: TfrxGroupFooter
        FillType = ftBrush
        Height = 18.897640240000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        Child = relRelacaoDoc.chObservacoes
        object Line6: TfrxLineView
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          Left = 382.512060000000000000
          Top = 0.755905510000000000
          Width = 105.826840000000000000
          Height = 13.606299210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object SysMemo10: TfrxSysMemoView
          Left = 489.386117240000000000
          Top = 0.755905509999990900
          Width = 83.149616060000000000
          Height = 13.606299210000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBRelacaoDoc."vlDocumento">,MasterData1)]')
          ParentFont = False
        end
      end
      object chCabecalho: TfrxChild
        FillType = ftBrush
        Height = 17.007874020000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          Left = 11.338590000000000000
          Top = 0.377952760000000000
          Width = 313.700990000000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 326.661348980000000000
          Top = 0.377952755905511800
          Width = 98.267758030000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'N'#250'mero Doc.')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 426.976353540000000000
          Top = 0.377952755905511800
          Width = 68.031500940000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Emiss'#227'o')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 496.543290000000000000
          Top = 0.377952755905511800
          Width = 75.590560940000000000
          Height = 13.228346460000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 15.118120000000010000
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Width = 718.110236220000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object chObservacoes: TfrxChild
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        Child = relRelacaoDoc.chAssinatura
        Stretched = True
        object Subreport1: TfrxSubreport
          Left = 1.779530000000000000
          Top = 18.897650000000000000
          Width = 714.331170000000000000
          Height = 18.897650000000000000
          Page = relRelacaoDoc.Page2
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118110236220470000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Observa'#231#245'es:')
          ParentFont = False
        end
      end
      object chAssinatura: TfrxChild
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 449.764070000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 33.795300000000000000
          Width = 718.110700000000000000
          Height = 49.133880240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Escrit'#243'rio Cont'#225'bil')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 180.417440000000000000
          Top = 34.015770000000030000
          Width = 355.275820000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ghCompetencia: TfrxGroupHeader
        FillType = ftBrush
        Height = 37.795290240000000000
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBRelacaoDoc."decomp"'
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Width = 706.772110000000000000
          Height = 34.015760240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              'Foram entregues ao Escrit'#243'rio Cont'#225'bil a seguinte rela'#231#227'o de doc' +
              'umentos referente a compet'#234'ncia [frxDBRelacaoDoc."decomp"]:')
          ParentFont = False
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 17.007874020000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        DataSet = dbRelacDocObs
        DataSetName = 'frxDBRelacDocObs'
        RowCount = 0
        Stretched = True
        object mCor2: TfrxMemoView
          Width = 718.110700000000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
        end
        object frxDBRelacDocObsdeobservacoes: TfrxMemoView
          Top = -0.000000000000000208
          Width = 718.110700000000000000
          Height = 13.606299210000000000
          StretchMode = smMaxHeight
          DataField = 'deobservacoes'
          DataSet = dbRelacDocObs
          DataSetName = 'frxDBRelacDocObs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelacDocObs."deobservacoes"]')
          ParentFont = False
        end
      end
    end
  end
  object vtObsRelacDoc: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 384
    Top = 290
    Data = {03000000000000000000}
    object vtObsRelacDocdeObservacoes: TStringField
      FieldName = 'deObservacoes'
      Size = 4000
    end
  end
  object dbRelacDocObs: TfrxDBDataset
    UserName = 'frxDBRelacDocObs'
    CloseDataSource = False
    FieldAliases.Strings = (
      'deObservacoes=deobservacoes')
    DataSet = vtObsRelacDoc
    BCDToCurrency = False
    Left = 306
    Top = 288
  end
  object dbExtratoViagem: TfrxDBDataset
    UserName = 'frxDBExtratoViagem'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cdbordero=cdbordero'
      'cdmotorista=cdmotorista'
      'nmmotorista=nmmotorista'
      'nmajudante=nmajudante'
      'deregiao=deregiao'
      'cdveiculo=cdveiculo'
      'cdgrupoveicmotor=cdgrupoveicmotor'
      'deplaca=deplaca'
      'deveiculo=deveiculo'
      'dtsaida=dtsaida'
      'dtretorno=dtretorno'
      'nuqtddias=nuqtddias'
      'nukminicial=nukminicial'
      'nukmfinal=nukmfinal'
      'nuqtdkmperc=nuqtdkmperc'
      'nuqtdeitens=nuqtdeitens'
      'nulitroscombustivel=nulitroscombustivel'
      'vldespesa=vldespesa'
      'vldespcombust=vldespcombust'
      'vldespesatot=vldespesatot'
      'vlkmporlitro=vlkmporlitro'
      'vlcustoporkm=vlcustoporkm'
      'vlcustoporitens=vlcustoporitens')
    DataSet = DmERP.qyExtratoViagem
    BCDToCurrency = False
    Left = 130
    Top = 272
  end
  object relExtratoViagem: TfrxReport
    Version = '5.3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
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
      'begin'
      ''
      'end.')
    OnUserFunction = relExtratoViagemUserFunction
    Left = 218
    Top = 272
    Datasets = <
      item
        DataSet = dbExtratoViagem
        DataSetName = 'frxDBExtratoViagem'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 404.409710000000000000
        Width = 1046.929810000000000000
        object TotalPages: TfrxMemoView
          Left = 964.559680000000000000
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
        object mUsuDataHora: TfrxMemoView
          Width = 641.008254800000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'mUsuDataHoraOnBeforePrint'
          DataSet = FIntComRelatorios.dbRelListaPreco
          DataSetName = 'frxDBRelListaPreco'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 66.141775000000000000
          Width = 914.646260000000000000
          Height = 71.811070000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Extrato de Viagem')
          ParentFont = False
          VAlign = vaCenter
        end
        object picLogoEmp: TfrxPictureView
          Width = 128.504020000000000000
          Height = 71.811070000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 18.897637800000000000
        Top = 117.165430000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          Top = 0.377952760000000000
          Width = 58.582669840000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Sa'#237'da')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 60.787399130000000000
          Top = 0.377952760000000000
          Width = 56.692842600000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Dias Viag.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 223.110219130000000000
          Top = 0.377952760000000000
          Width = 68.031439920000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Despesas')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 16.897650000000000000
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo5: TfrxMemoView
          Left = 118.504020000000000000
          Top = 0.377952760000000000
          Width = 59.338582680000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Qtde. Itens')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 179.756030000000000000
          Top = 0.377952760000000000
          Width = 41.574722600000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Km')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 292.897637800000000000
          Top = 0.377952760000000000
          Width = 68.031439920000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Combust'#237'vel')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 363.953000000000000000
          Top = 0.377952760000000000
          Width = 68.031439920000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'T. Despesas')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 433.874015750000000000
          Top = 0.377952760000000000
          Width = 73.700787400000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo por Km')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 509.575140000000000000
          Top = 0.377952760000000000
          Width = 81.259847400000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Custo por Item')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 593.504330000000000000
          Top = 0.377952760000000000
          Width = 43.464547400000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Lts')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 638.858690000000000000
          Top = 0.377952760000000000
          Width = 39.685017400000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'M'#233'dia')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 681.204695120000000000
          Top = 0.377952760000000000
          Width = 109.606299210000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Motorista')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 792.322805350000000000
          Top = 0.377952760000000000
          Width = 141.732307870000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Regi'#227'o')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 936.322829760000000000
          Top = 0.377952760000000000
          Width = 109.606304090000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Ajudante')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118110240000000000
        ParentFont = False
        Top = 241.889920000000000000
        Width = 1046.929810000000000000
        DataSet = dbExtratoViagem
        DataSetName = 'frxDBExtratoViagem'
        RowCount = 0
        object frxDBExtratoViagemdtsaida: TfrxMemoView
          Width = 58.582669840000000000
          Height = 15.118110240000000000
          DataField = 'dtsaida'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBExtratoViagem."dtsaida"]')
          ParentFont = False
        end
        object frxDBExtratoViagemnuqtddias: TfrxMemoView
          Left = 60.811023620000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          DataField = 'nuqtddias'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."nuqtddias"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 118.527644490000000000
          Width = 59.338582680000000000
          Height = 15.118110240000000000
          DataField = 'nuqtdeitens'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."nuqtdeitens"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 179.779654490000000000
          Width = 41.574793390000000000
          Height = 15.118110240000000000
          DataField = 'nuqtdkmperc'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."nuqtdkmperc"]')
          ParentFont = False
        end
        object frxDBExtratoViagemvldespesa: TfrxMemoView
          Left = 223.110219130000000000
          Width = 68.031493620000000000
          Height = 15.118110240000000000
          DataField = 'vldespesa'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."vldespesa"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 292.897637800000000000
          Width = 68.031493620000000000
          Height = 15.118110240000000000
          DataField = 'vldespcombust'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."vldespcombust"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 363.953000000000000000
          Width = 68.031493620000000000
          Height = 15.118110240000000000
          DataField = 'vldespesatot'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."vldespesatot"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 433.874015750000000000
          Width = 73.700787400000000000
          Height = 15.118110240000000000
          DataField = 'vlcustoporkm'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."vlcustoporkm"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 509.575140000000000000
          Width = 81.259847400000000000
          Height = 15.118110240000000000
          DataField = 'vlcustoporitens'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."vlcustoporitens"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 593.504330000000000000
          Width = 43.464547400000000000
          Height = 15.118110240000000000
          DataField = 'nulitroscombustivel'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."nulitroscombustivel"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 638.858690000000000000
          Width = 39.685017400000000000
          Height = 15.118110240000000000
          DataField = 'vlkmporlitro'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBExtratoViagem."vlkmporlitro"]')
          ParentFont = False
        end
        object frxDBExtratoViagemnmmotorista: TfrxMemoView
          Left = 681.094930000000000000
          Width = 109.606370000000000000
          Height = 15.118110240000000000
          DataField = 'nmmotorista'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBExtratoViagem."nmmotorista"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 936.322829760000000000
          Width = 109.606370000000000000
          Height = 15.118110240000000000
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBExtratoViagem."nmajudante"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 792.480830000000000000
          Width = 141.732307870000000000
          Height = 15.118110240000000000
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBExtratoViagem."deRegiao"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 196.535560000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBExtratoViagem."cdveiculo"'
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Placa:')
          ParentFont = False
        end
        object frxDBExtratoViagemdeplaca: TfrxMemoView
          Left = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'deplaca'
          DataSet = dbExtratoViagem
          DataSetName = 'frxDBExtratoViagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBExtratoViagem."deplaca"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 17.007874020000000000
        Top = 279.685220000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 62.811070000000000000
          Top = 0.755905510000000000
          Width = 56.692950000000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."nuqtddias">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 120.637795280000000000
          Top = 0.755905510000000000
          Width = 59.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."nuqtdeitens">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 181.866141730000000000
          Top = 0.755905510000000000
          Width = 41.574800710000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."nuqtdkmperc">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 224.976377950000000000
          Top = 0.755905510000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vldespesa">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 294.897637800000000000
          Top = 0.755905510000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vldespcombust">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 365.953000000000000000
          Top = 0.755905510000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vldespesatot">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo7: TfrxSysMemoView
          Left = 435.874015750000000000
          Top = 0.755905510000000000
          Width = 73.700787400000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vlcustoporkm">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo8: TfrxSysMemoView
          Left = 511.464566930000000000
          Top = 0.755905510000000000
          Width = 81.259842520000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vlcustoporitens">,MasterData1)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 14.677180000000000000
          Top = 0.755905510000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totais:')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 1046.929810000000000000
        object SysMemo11: TfrxSysMemoView
          Left = 62.811070000000000000
          Top = 0.755905510000000000
          Width = 56.692950000000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."nuqtddias">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo12: TfrxSysMemoView
          Left = 120.637795280000000000
          Top = 0.755905510000000000
          Width = 59.338582680000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."nuqtdeitens">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo13: TfrxSysMemoView
          Left = 181.866141730000000000
          Top = 0.755905510000000000
          Width = 41.574800710000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."nuqtdkmperc">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo14: TfrxSysMemoView
          Left = 224.976377950000000000
          Top = 0.755905510000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vldespesa">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo15: TfrxSysMemoView
          Left = 294.897637800000000000
          Top = 0.755905510000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vldespcombust">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo16: TfrxSysMemoView
          Left = 365.953000000000000000
          Top = 0.755905510000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vldespesatot">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo17: TfrxSysMemoView
          Left = 435.874015750000000000
          Top = 0.755905510000000000
          Width = 73.700787400000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vlcustoporkm">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo18: TfrxSysMemoView
          Left = 511.464566930000000000
          Top = 0.755905510000000000
          Width = 81.259842520000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBExtratoViagem."vlcustoporitens">,MasterData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 7.118120000000000000
          Top = 0.755905510000000000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Totais G.:')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Width = 1046.929810000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
end
