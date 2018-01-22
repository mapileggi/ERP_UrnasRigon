inherited FItemSubGrupoCadastro: TFItemSubGrupoCadastro
  Caption = 'SubGrupos de Item'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdItemGrupo: TLabel
      Left = 62
      Top = 7
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Grupo:'
    end
    object lbdeItemSubGrupo: TLabel
      Left = 45
      Top = 57
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbcdItemSubGrupo: TLabel
      Left = 19
      Top = 33
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Subgrupo:'
    end
    object eddeItemSubGrupo: TDBEdit
      Left = 97
      Top = 54
      Width = 343
      Height = 21
      DataField = 'deItemSubGrupo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object edcdItemGrupo: TDBCampoCodigo
      Left = 97
      Top = 4
      Width = 343
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 0
      ERPCampoCodigoPK = True
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
        '        SELECT cdItemGrupo,'
        '               deItemGrupo'
        '          FROM erp.ItemGrupo'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdItemGrupo'
        'deItemGrupo')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdItemGrupo'
      ERPCampoDescricao = 'deItemGrupo'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object grDados: TDBGrid
      Left = 3
      Top = 96
      Width = 437
      Height = 386
      Anchors = [akLeft, akTop, akBottom]
      DataSource = FrBarraBotoes.dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cditemsubgrupo'
          Title.Caption = 'Subgrupo'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deitemsubgrupo'
          Title.Caption = 'Descri'#231#227'o'
          Width = 350
          Visible = True
        end>
    end
    object edcdItemSubGrupo: TDBEdit
      Left = 97
      Top = 30
      Width = 65
      Height = 21
      DataField = 'cditemsubgrupo'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 1
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyItemSubGrupo
    end
  end
end
