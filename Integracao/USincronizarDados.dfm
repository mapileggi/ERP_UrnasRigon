object FSincronizarDados: TFSincronizarDados
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Sincronizar Dados'
  ClientHeight = 488
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    783
    488)
  PixelsPerInch = 96
  TextHeight = 13
  object btSalvar: TBitBtn
    Left = 723
    Top = 3
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = '&Salvar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 0
    OnClick = btSalvarClick
  end
  object btFechar: TBitBtn
    Left = 723
    Top = 105
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = '&Fechar'
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentDoubleBuffered = True
    Spacing = 0
    TabOrder = 1
    OnClick = btFecharClick
  end
  object mLog: TMemo
    Left = 0
    Top = 163
    Width = 782
    Height = 325
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object gbDwVendas: TGroupBox
    Left = 255
    Top = 0
    Width = 306
    Height = 159
    Caption = ' Data Warehouse Vendas '
    TabOrder = 3
    object lbdtEmissaoNfs: TLabel
      Left = 7
      Top = 125
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Emiss. NFS:'
    end
    object lbdtEmissaoNfsA: TLabel
      Left = 192
      Top = 125
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object eddtEmissaoNfsIni: TDateTimePicker
      Left = 91
      Top = 122
      Width = 93
      Height = 21
      Date = 42342.685948726850000000
      Time = 42342.685948726850000000
      TabOrder = 0
    end
    object eddtEmissaoNfsFim: TDateTimePicker
      Left = 205
      Top = 122
      Width = 93
      Height = 21
      Date = 42342.685951053240000000
      Time = 42342.685951053240000000
      TabOrder = 1
    end
    object cbDwCidades: TCheckBox
      Left = 11
      Top = 18
      Width = 70
      Height = 17
      Caption = 'Cidades'
      TabOrder = 2
    end
    object cbDwClientes: TCheckBox
      Left = 11
      Top = 34
      Width = 70
      Height = 17
      Caption = 'Clientes'
      TabOrder = 3
    end
    object cbDwRep: TCheckBox
      Left = 11
      Top = 50
      Width = 109
      Height = 17
      Caption = 'Representantes'
      TabOrder = 4
    end
    object cbDwVariaveis: TCheckBox
      Left = 11
      Top = 66
      Width = 75
      Height = 17
      Caption = 'Vari'#225'veis'
      TabOrder = 5
    end
    object cbDwVariavelItens: TCheckBox
      Left = 11
      Top = 82
      Width = 108
      Height = 17
      Caption = 'Itens das Vari'#225'veis'
      TabOrder = 6
    end
    object cbDwGrupoItens: TCheckBox
      Left = 11
      Top = 98
      Width = 109
      Height = 17
      Caption = 'Grupo de Itens'
      TabOrder = 7
    end
    object cbDwSubgrupoItens: TCheckBox
      Left = 133
      Top = 18
      Width = 108
      Height = 17
      Caption = 'Subgrupo de Itens'
      TabOrder = 8
    end
    object cbDwItens: TCheckBox
      Left = 133
      Top = 34
      Width = 70
      Height = 17
      Caption = 'Itens'
      TabOrder = 9
    end
    object cbDwItensCombinacao: TCheckBox
      Left = 133
      Top = 50
      Width = 131
      Height = 17
      Caption = 'Combina'#231#245'es de Itens'
      TabOrder = 10
    end
    object cbDwTempo: TCheckBox
      Left = 133
      Top = 66
      Width = 70
      Height = 17
      Caption = 'Tempo'
      TabOrder = 11
    end
    object cbDwVendas: TCheckBox
      Left = 133
      Top = 82
      Width = 70
      Height = 17
      Caption = 'Vendas'
      TabOrder = 12
    end
  end
  object gbDadosERP: TGroupBox
    Left = 5
    Top = 0
    Width = 246
    Height = 159
    Caption = ' Dados ERP '
    TabOrder = 4
    object cbCidade: TCheckBox
      Left = 8
      Top = 18
      Width = 70
      Height = 17
      Caption = 'Cidades'
      TabOrder = 0
    end
    object cbFornecedorTipo: TCheckBox
      Left = 8
      Top = 82
      Width = 77
      Height = 17
      Caption = 'Tipo Fornec.'
      TabOrder = 1
    end
    object cbRepresentantes: TCheckBox
      Left = 8
      Top = 50
      Width = 109
      Height = 17
      Caption = 'Representantes'
      TabOrder = 2
      OnClick = cbRepresentantesClick
    end
    object cbFornecedores: TCheckBox
      Left = 8
      Top = 98
      Width = 109
      Height = 17
      Caption = 'Fornecedores'
      TabOrder = 3
      OnClick = cbFornecedoresClick
    end
    object cbClientes: TCheckBox
      Left = 8
      Top = 34
      Width = 70
      Height = 17
      Caption = 'Clientes'
      TabOrder = 4
      OnClick = cbClientesClick
    end
    object cbClassifFiscal: TCheckBox
      Left = 127
      Top = 34
      Width = 115
      Height = 17
      Caption = 'Classifica'#231#227'o Fiscal'
      TabOrder = 5
    end
    object cbTransportadora: TCheckBox
      Left = 8
      Top = 66
      Width = 95
      Height = 17
      Caption = 'Transportadora'
      TabOrder = 6
      OnClick = cbTransportadoraClick
    end
    object cbItens: TCheckBox
      Left = 127
      Top = 50
      Width = 70
      Height = 17
      Caption = 'Itens'
      TabOrder = 7
    end
    object cbItensVariaveis: TCheckBox
      Left = 127
      Top = 66
      Width = 108
      Height = 17
      Caption = 'Itens das Vari'#225'veis'
      TabOrder = 8
    end
    object cbNaturezaOper: TCheckBox
      Left = 127
      Top = 18
      Width = 109
      Height = 17
      Caption = 'Natureza Oper.'
      TabOrder = 9
    end
  end
  object btAtualizarDwVendas: TButton
    Left = 723
    Top = 54
    Width = 55
    Height = 52
    Anchors = [akTop, akRight]
    Caption = 'Atualizar DW Vendas'
    TabOrder = 5
    WordWrap = True
    OnClick = btAtualizarDwVendasClick
  end
end
