inherited FPatrimonioCadastro: TFPatrimonioCadastro
  Caption = 'Patrim'#244'nios'
  ClientWidth = 747
  ExplicitWidth = 747
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited sbDados: TScrollBox
    Width = 747
    ExplicitWidth = 747
    object lbcdPatrimonio: TLabel
      Left = 50
      Top = 7
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object lbdePatrimonio: TLabel
      Left = 37
      Top = 58
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object lbdtAquisicao: TLabel
      Left = 12
      Top = 107
      Width = 75
      Height = 13
      Caption = 'Data Aquisi'#231#227'o:'
    end
    object lbnuPatrimonio: TLabel
      Left = 18
      Top = 83
      Width = 69
      Height = 13
      Caption = 'N'#186' Patrim'#244'nio:'
    end
    object lbnmUsuCad: TLabel
      Left = 259
      Top = 7
      Width = 66
      Height = 13
      Caption = 'Usu'#225'rio Cad.:'
    end
    object lbnmUsuAlt: TLabel
      Left = 513
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Usu'#225'rio Alt.:'
    end
    object lbdeObservacao: TLabel
      Left = 25
      Top = 164
      Width = 62
      Height = 13
      Caption = 'Observa'#231#227'o:'
    end
    object lbcdSetor: TLabel
      Left = 57
      Top = 133
      Width = 30
      Height = 13
      Caption = 'Setor:'
    end
    object lbcdPatrimonioTipo: TLabel
      Left = 10
      Top = 33
      Width = 77
      Height = 13
      Caption = 'Tipo Patrim'#244'nio:'
    end
    object edcdPatrimonio: TDBCampoCodigo
      Left = 88
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
        'SELECT t01.*'
        '  FROM ('
        '        SELECT p.cdPatrimonio,'
        '               p.nuPatrimonio,'
        '               p.dePatrimonio,'
        '               p.cdPatrimonioTipo,'
        '               pt.dePatrimonioTipo,'
        '               p.dtAquisicao,'
        '               p.cdSetor,'
        '               s.deSetor,'
        '               CAST(p.dePatrimonio || '#39' - N'#186' '#39' ||'
        '                    p.nuPatrimonio AS CHARACTER VARYING(250)'
        '                   ) AS deDescPatr '
        '          FROM erp.patrimonio p'
        
          '          LEFT JOIN erp.patrimonioTipo pt ON (pt.cdPatrimonioTip' +
          'o = p.cdPatrimonioTipo)'
        
          '          LEFT JOIN erp.setor          s  ON (s.cdSetor = p.cdSe' +
          'tor)'
        '       ) t01 '
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdPatrimonio'
        'dePatrimonio'
        'nuPatrimonio'
        'dePatrimonioTipo'
        'deSetor')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o'
        'N'#186' Patrim'#244'nio'
        'Tipo Patrim'#244'nio'
        'Setor')
      ERPCampoChave = 'cdPatrimonio'
      ERPCampoDescricao = 'cdPatrimonio'
      ERPDataSource = FrBarraBotoes.dsDados
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object ednmUsuCad: TDBEdit
      Left = 325
      Top = 4
      Width = 166
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
      TabOrder = 7
    end
    object ednmUsuAlt: TDBEdit
      Left = 574
      Top = 4
      Width = 166
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
      TabOrder = 8
    end
    object eddePatrimonio: TDBEdit
      Left = 88
      Top = 55
      Width = 411
      Height = 21
      DataField = 'depatrimonio'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 2
    end
    object ednuPatrimonio: TDBEdit
      Left = 88
      Top = 80
      Width = 129
      Height = 21
      DataField = 'nupatrimonio'
      DataSource = FrBarraBotoes.dsDados
      TabOrder = 3
    end
    object lcbcdSetor: TDBLookupComboBox
      Left = 88
      Top = 130
      Width = 129
      Height = 21
      DataField = 'cdsetor'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdsetor'
      ListField = 'desetor'
      ListSource = dsSetor
      TabOrder = 5
    end
    object lcbcdPatrimonioTipo: TDBLookupComboBox
      Left = 88
      Top = 30
      Width = 177
      Height = 21
      DataField = 'cdpatrimoniotipo'
      DataSource = FrBarraBotoes.dsDados
      KeyField = 'cdpatrimoniotipo'
      ListField = 'depatrimoniotipo'
      ListSource = dsPatrimonioTipoPesq
      TabOrder = 1
    end
    object eddtAquisicao: TDBDateTime
      Left = 88
      Top = 105
      Width = 87
      Height = 21
      BevelOuter = bvNone
      ShowCaption = False
      TabOrder = 4
      ERPEdCampoDataEnabled = True
      ERPBtAbrirCalendarioEnabled = True
      DataField = 'dtaquisicao'
      DataSource = FrBarraBotoes.dsDados
    end
    object mdeObservacao: TDBMemo
      Left = 88
      Top = 157
      Width = 652
      Height = 164
      DataField = 'deobservacao'
      DataSource = FrBarraBotoes.dsDados
      ScrollBars = ssBoth
      TabOrder = 6
    end
  end
  inherited FrBarraBotoes: TFBarraBotoes
    Width = 747
    ExplicitWidth = 747
    inherited sbBotoes: TScrollBox
      Width = 747
      ExplicitWidth = 747
    end
    inherited dsDados: TDataSource
      DataSet = DmERP.qyPatrimonio
    end
  end
  object dsSetor: TDataSource
    AutoEdit = False
    DataSet = qySetor
    Left = 207
    Top = 153
  end
  object dsPatrimonioTipoPesq: TDataSource
    AutoEdit = False
    DataSet = DmERP.qyPatrimonioTipoPesq
    Left = 271
    Top = 209
  end
  object qySetor: TFDQuery
    Connection = DmERP.fdConnERP
    SQL.Strings = (
      'SELECT t.*'
      '  FROM ('
      '        SELECT s.cdSetor,'
      '               s.deSetor'
      '          FROM erp.setor s'
      '         ORDER BY s.cdSetor'
      '       ) t'
      ' &filtro')
    Left = 259
    Top = 149
    MacroData = <
      item
        Value = ''
        Name = 'FILTRO'
      end>
  end
end
