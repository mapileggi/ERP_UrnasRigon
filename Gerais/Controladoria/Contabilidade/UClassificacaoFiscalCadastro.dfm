inherited FClassificacaoFiscalCadastro: TFClassificacaoFiscalCadastro
  Caption = 'Classifica'#231#245'es Fiscais'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdClassifFiscal: TLabel
      Left = 66
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeClassifFiscal: TLabel
      Left = 180
      Top = 33
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbnuClassifFiscal: TLabel
      Left = 38
      Top = 33
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Classifica'#231#227'o:'
    end
    object eddeClassifFiscal: TDBEdit
      Left = 232
      Top = 30
      Width = 531
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'declassiffiscal'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object edcdClassifFiscal: TDBCampoCodigo
      Left = 105
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
        '        SELECT a.cdClassifFiscal,'
        '               a.nuClassifFiscal,'
        '               a.deClassifFiscal'
        '          FROM erp.classifFiscal a'
        '         ORDER BY a.cdClassifFiscal'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdClassifFiscal'
        'nuClassifFiscal'
        'deClassifFiscal')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Classifica'#231#227'o'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdClassifFiscal'
      ERPCampoDescricao = 'cdClassifFiscal'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednuClassifFiscal: TDBEdit
      Left = 105
      Top = 30
      Width = 65
      Height = 21
      DataField = 'nuclassiffiscal'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object pcDadosClassifFiscal: TPageControl
      Left = 1
      Top = 57
      Width = 762
      Height = 425
      ActivePage = tsTributacao
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      object tsTributacao: TTabSheet
        Caption = 'Tributa'#231#227'o'
        ExplicitLeft = 0
        object sbTributacao: TScrollBox
          Left = 0
          Top = 0
          Width = 754
          Height = 397
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          ExplicitWidth = 748
          ExplicitHeight = 398
          DesignSize = (
            754
            397)
          object lbvlIpi: TLabel
            Left = 53
            Top = 3
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor IPI:'
          end
          object lbdeIpiClasse: TLabel
            Left = 46
            Top = 27
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Classe IPI:'
          end
          object lbcdIpiTipo: TLabel
            Left = 57
            Top = 51
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo IPI:'
          end
          object lbcdIpiCodigo: TLabel
            Left = 44
            Top = 75
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo IPI:'
          end
          object lbcdIpiEnquadramento: TLabel
            Left = 1
            Top = 99
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = 'Enquadramento IPI:'
          end
          object lbcdPisCodigo: TLabel
            Left = 45
            Top = 123
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Pis:'
          end
          object lbcdCofinsCodigo: TLabel
            Left = 28
            Top = 147
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Cofins:'
          end
          object lbvlPercMva: TLabel
            Left = 60
            Top = 171
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = '% Mva:'
          end
          object lbnuCest: TLabel
            Left = 69
            Top = 219
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'CEST:'
          end
          object lbvlPercIpi: TLabel
            Left = 66
            Top = 243
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = '% IPI:'
          end
          object lbvlPercIcmsReducao: TLabel
            Left = 198
            Top = 219
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = '% Redu'#231#227'o ICMS:'
          end
          object lbPercPis: TLabel
            Left = 255
            Top = 243
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = '% Pis:'
          end
          object lbvlPercCofins: TLabel
            Left = 435
            Top = 219
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = '% Cofins:'
          end
          object lbdeExTipi: TLabel
            Left = 393
            Top = 246
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo EX da TIPI:'
          end
          object edvlIpi: TDBEdit
            Left = 100
            Top = 0
            Width = 68
            Height = 21
            DataField = 'vlipi'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 0
          end
          object eddeIpiClasse: TDBEdit
            Left = 100
            Top = 24
            Width = 68
            Height = 21
            DataField = 'deipiclasse'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 1
          end
          object edcdIpiTipo: TDBCampoCodigo
            Left = 100
            Top = 48
            Width = 200
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 2
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT a.cdIpiTipo,'
              '                     a.deIpiTipo'
              '          FROM erp.ipiTipo a'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdIpiTipo'
              'deIpiTipo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdIpiTipo'
            ERPCampoDescricao = 'deIpiTipo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdIpiCodigo: TDBCampoCodigo
            Left = 100
            Top = 72
            Width = 200
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 3
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT a.cdIpiCodigo,'
              '                     a.deIpiCodigo'
              '          FROM erp.ipiCodigo a'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdIpiCodigo'
              'deIpiCodigo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdIpiCodigo'
            ERPCampoDescricao = 'deIpiCodigo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdIpiEnquadramento: TDBCampoCodigo
            Left = 100
            Top = 96
            Width = 651
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 4
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT a.cdIpiEnquadramento,'
              '                     a.deIpiEnquadramento'
              '          FROM erp.ipiEnquadramento a'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdIpiEnquadramento'
              'deIpiEnquadramento')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdIpiEnquadramento'
            ERPCampoDescricao = 'deIpiEnquadramento'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdPisCodigo: TDBCampoCodigo
            Left = 100
            Top = 120
            Width = 200
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT a.cdPisCodigo,'
              '                     a.dePisCodigo'
              '          FROM erp.pisCodigo a'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdPisCodigo'
              'dePisCodigo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdPisCodigo'
            ERPCampoDescricao = 'dePisCodigo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edcdCofinsCodigo: TDBCampoCodigo
            Left = 100
            Top = 144
            Width = 651
            Height = 21
            BevelOuter = bvNone
            ShowCaption = False
            TabOrder = 6
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
              'SELECT t.*'
              '  FROM ('
              '        SELECT a.cdCofinsCodigo,'
              '                     a.deCofinsCodigo'
              '          FROM erp.cofinsCodigo a'
              '       ) t'
              ' &filtro')
            ERPCamposFiltro.Strings = (
              'cdCofinsCodigo'
              'deCofinsCodigo')
            ERPCamposFiltroTitulo.Strings = (
              'C'#243'digo'
              'Descri'#231#227'o')
            ERPCampoChave = 'cdCofinsCodigo'
            ERPCampoDescricao = 'deCofinsCodigo'
            ERPDataSource = FrBarraBotoes.dsDados
            ERPConnection = DmERP.fdConnERP
            ERPCampoChaveDataType = ftInteger
          end
          object edvlPercMva: TDBEdit
            Left = 100
            Top = 168
            Width = 68
            Height = 21
            DataField = 'vlpercmva'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 7
          end
          object cbflCalculaStCnae: TDBCheckBox
            Left = 100
            Top = 194
            Width = 115
            Height = 17
            Caption = 'Calcula ST CNAE'
            DataField = 'flcalculastcnae'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 8
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object ednuCest: TDBEdit
            Left = 100
            Top = 216
            Width = 68
            Height = 21
            DataField = 'nucest'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 9
          end
          object edvlPercIpi: TDBEdit
            Left = 100
            Top = 240
            Width = 68
            Height = 21
            DataField = 'vlpercipi'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 10
          end
          object edvlPercIcmsReducao: TDBEdit
            Left = 288
            Top = 216
            Width = 68
            Height = 21
            DataField = 'vlpercicmsreducao'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 11
          end
          object vlPercPis: TDBEdit
            Left = 288
            Top = 240
            Width = 68
            Height = 21
            DataField = 'vlpercpis'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 12
          end
          object edvlPercCofins: TDBEdit
            Left = 485
            Top = 216
            Width = 68
            Height = 21
            DataField = 'vlperccofins'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 13
          end
          object cbflAbatePisCofins: TDBCheckBox
            Left = 100
            Top = 266
            Width = 225
            Height = 17
            Caption = 'Abate Pis/Cofins dos T'#237'tulos (Lei 10.485)'
            DataField = 'flabatepiscofins'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 15
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cdflImprimeNota: TDBCheckBox
            Left = 100
            Top = 282
            Width = 115
            Height = 17
            Caption = 'Imprime Nota Fiscal'
            DataField = 'flimprimenota'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 16
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object cbflUtilizaDnf: TDBCheckBox
            Left = 100
            Top = 298
            Width = 115
            Height = 17
            Caption = 'Utilizada na DNF'
            DataField = 'flutilizadnf'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 17
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object eddeExTipi: TDBEdit
            Left = 485
            Top = 243
            Width = 68
            Height = 21
            DataField = 'deextipi'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 14
          end
        end
      end
      object tsTaxasIBPT: TTabSheet
        Caption = 'Taxas IBPT'
        ImageIndex = 1
        object sbTaxasIBPT: TScrollBox
          Left = 0
          Top = 0
          Width = 754
          Height = 397
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 748
          ExplicitHeight = 398
          DesignSize = (
            754
            397)
          object cbflUtilizaIbpt: TDBCheckBox
            Left = 20
            Top = 3
            Width = 115
            Height = 17
            Caption = 'Utiliza IBPT'
            DataField = 'flutilizaibpt'
            DataSource = FrBarraBotoes.dsDados
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object grClasFisTaxaIbpt: TDBGrid
            Left = 0
            Top = 25
            Width = 754
            Height = 371
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsClasFisTaxaIbpt
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'sgestado'
                Title.Caption = 'Estado'
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vlpercnacional'
                Title.Caption = 'Nacional'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vlpercimportacao'
                Title.Caption = 'Importado'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vlpercestadual'
                Title.Caption = 'Estadual'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'vlpercmunicipal'
                Title.Caption = 'Municipal'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtvigenciaini'
                Title.Caption = 'Data Inicial'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dtvigenciafim'
                Title.Caption = 'Data Final'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'deversao'
                Title.Caption = 'Vers'#227'o'
                Width = 80
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited sbBotoes: TScrollBox
      inherited btImprimir: TBitBtn
        ExplicitLeft = 385
      end
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyClassifFiscal
    end
  end
  object dsClasFisTaxaIbpt: TDataSource
    DataSet = DmERP.qyClasFisTaxaIbpt
    Left = 477
    Top = 8
  end
end
