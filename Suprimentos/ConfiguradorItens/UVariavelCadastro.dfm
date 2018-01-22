inherited FVariavelCadastro: TFVariavelCadastro
  Caption = 'Vari'#225'veis'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdVariavel: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbdeVariavel: TLabel
      Left = 45
      Top = 33
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object eddeVariavel: TDBEdit
      Left = 97
      Top = 30
      Width = 343
      Height = 21
      DataField = 'deVariavel'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
    object edcdVariavel: TDBCampoCodigo
      Left = 97
      Top = 4
      Width = 67
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      ERPCampoCodigoPK = True
      ERPCharCase = ecUpperCase
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
        '        SELECT cdVariavel,'
        '               deVariavel'
        '          FROM erp.Variavel'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdVariavel'
        'deVariavel')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdVariavel'
      ERPCampoDescricao = 'cdVariavel'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object gbVariavelItens: TGroupBox
      Left = 3
      Top = 64
      Width = 752
      Height = 410
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Itens: '
      TabOrder = 2
      DesignSize = (
        752
        410)
      object lbdeValor: TLabel
        Left = 64
        Top = 20
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor:'
      end
      object lbdeMascara: TLabel
        Left = 21
        Top = 44
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor M'#225'scara:'
      end
      object lbvlPrecoPadrao: TLabel
        Left = 24
        Top = 68
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pre'#231'o Padr'#227'o:'
      end
      object eddeValor: TDBEdit
        Left = 94
        Top = 17
        Width = 343
        Height = 21
        DataField = 'devalor'
        DataSource = FrBarraBotoesItens.dsDadosItens
        TabOrder = 0
      end
      object grVariavelItens: TDBGrid
        Left = 3
        Top = 128
        Width = 746
        Height = 279
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
            FieldName = 'cdvariavelitem'
            Title.Caption = 'C'#243'd. Item'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'devalor'
            Title.Caption = 'Valor'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'demascara'
            Title.Caption = 'Valor Masc.'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlprecopadrao'
            Title.Caption = 'Pre'#231'o Padr'#227'o'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dtcadastro'
            Title.Caption = 'Data Cad.'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dehrcadastro'
            Title.Caption = 'Hora Cad.'
            Width = 65
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
            FieldName = 'dtalteracao'
            Title.Caption = 'Data Alt.'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dehralteracao'
            Title.Caption = 'Hora Alt.'
            Width = 65
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
      inline FrBarraBotoesItens: TFBarraBotoesItens
        Left = 94
        Top = 94
        Width = 182
        Height = 26
        TabOrder = 3
        ExplicitLeft = 94
        ExplicitTop = 94
        inherited sbBotoes: TScrollBox
          inherited btNovo: TBitBtn
            OnClick = FrBarraBotoesItensbtNovoClick
          end
          inherited btAlterar: TBitBtn
            OnClick = FrBarraBotoesItensbtAlterarClick
          end
          inherited btSalvar: TBitBtn
            OnClick = FrBarraBotoesItensbtSalvarClick
          end
          inherited btExluir: TBitBtn
            OnClick = FrBarraBotoesItensbtExluirClick
          end
        end
        inherited dsDadosItens: TDataSource
          DataSet = DmERP.qyVariavelItens
        end
      end
      object eddeMascara: TDBEdit
        Left = 94
        Top = 41
        Width = 343
        Height = 21
        DataField = 'demascara'
        DataSource = FrBarraBotoesItens.dsDadosItens
        TabOrder = 1
      end
      object edvlPrecoPadrao: TDBEdit
        Left = 94
        Top = 65
        Width = 64
        Height = 21
        DataField = 'vlprecopadrao'
        DataSource = FrBarraBotoesItens.dsDadosItens
        TabOrder = 2
      end
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyVariavel
    end
  end
end
