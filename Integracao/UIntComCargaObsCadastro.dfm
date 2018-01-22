inherited FIntComCargaObsCadastro: TFIntComCargaObsCadastro
  Caption = 'Observa'#231#245'es da Carga'
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    object lbcdCarga: TLabel
      Left = 58
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdeObservacao: TLabel
      Left = 28
      Top = 36
      Width = 67
      Height = 13
      Caption = 'Observa'#231#245'es:'
    end
    object edcdCarga: TDBCampoCodigo
      Left = 97
      Top = 4
      Width = 658
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
        'SELECT cdCarga, '
        '       deCarga,'
        '       deObservacao'
        '  FROM erp.intComCargaObs'
        ' &filtro'
        ' ORDER BY cdCarga DESC')
      ERPCamposFiltro.Strings = (
        'cdCarga'
        'deCarga')
      ERPCamposFiltroTitulo.Strings = (
        'Carga'
        'Descri'#231#227'o')
      ERPCampoChave = 'cdCarga'
      ERPCampoDescricao = 'deCarga'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object mdeObservacao: TDBMemo
      Left = 97
      Top = 31
      Width = 650
      Height = 435
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'deobservacao'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    inherited dsDados: TDataSource
      DataSet = DmERP.qyIntComCargaObs
    end
  end
end
