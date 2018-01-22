object FAlteracaoRegistroPonto: TFAlteracaoRegistroPonto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Altera'#231#227'o do Registro de Ponto'
  ClientHeight = 534
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBotoes: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 54
    Align = alTop
    TabOrder = 0
    object btSalvar: TBitBtn
      Left = 56
      Top = 1
      Width = 55
      Height = 52
      Align = alLeft
      Caption = '&Salvar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 0
      OnClick = btSalvarClick
    end
    object btFechar: TBitBtn
      Left = 111
      Top = 1
      Width = 55
      Height = 52
      Align = alLeft
      Caption = '&Fechar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 1
      OnClick = btFecharClick
    end
    object btConsultar: TBitBtn
      Left = 1
      Top = 1
      Width = 55
      Height = 52
      Align = alLeft
      Caption = 'Consultar'
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentDoubleBuffered = True
      Spacing = 0
      TabOrder = 2
      WordWrap = True
      OnClick = btConsultarClick
    end
  end
  object sbDados: TScrollBox
    Left = 0
    Top = 54
    Width = 939
    Height = 480
    Align = alClient
    TabOrder = 1
    ExplicitTop = 59
    DesignSize = (
      935
      476)
    object lbHorariosRegistrados: TLabel
      Left = 7
      Top = 58
      Width = 177
      Height = 19
      Alignment = taRightJustify
      Caption = 'Hor'#225'rios Registrados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbcdColaborador: TLabel
      Left = 16
      Top = 7
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Colaborador:'
    end
    object lbdtPonto: TLabel
      Left = 52
      Top = 31
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data:'
    end
    object lbInserirHorario: TLabel
      Left = 495
      Top = 80
      Width = 379
      Height = 152
      Caption = 
        'Para inserir um hor'#225'rio faltante, clique na grid de hor'#225'rios reg' +
        'istrados ao lado selecionado o '#250'ltimo hor'#225'rio registrado e ent'#227'o' +
        ' aperte a flechinha para baixo do teclado e informe a data, hora' +
        ', tipo de registro (E ou S) e uma observa'#231#227'o se necess'#225'rio. Ap'#243's' +
        ' preencher, clique no bot'#227'o "Salvar".'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object lbApagarHorario: TLabel
      Left = 495
      Top = 267
      Width = 379
      Height = 171
      Caption = 
        'Para apagar um hor'#225'rio registrado de forma errada, selecione o h' +
        'or'#225'rio desejado na grid de hor'#225'rios registrados ao lado e aperte' +
        ' "Delete" no teclado. O sistema far'#225' uma pergunta de confirma'#231#227'o' +
        ' de exclus'#227'o do registro. Clique em sim para finalizar a exclus'#227 +
        'o ou em n'#227'o para cancelar.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object grDados: TDBGrid
      Left = 3
      Top = 83
      Width = 486
      Height = 390
      Anchors = [akLeft, akTop, akBottom]
      DataSource = dsDados
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = grDadosKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'dtPonto'
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hrponto'
          Title.Caption = 'Hor'#225'rio'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'flentsai'
          PickList.Strings = (
            'E'
            'S')
          Title.Alignment = taCenter
          Title.Caption = 'Ent/Sai'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deobservacoes'
          Title.Caption = 'Observa'#231#245'es'
          Width = 335
          Visible = True
        end>
    end
    object edcdColaborador: TDBCampoCodigo
      Left = 80
      Top = 4
      Width = 336
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
      ERPLbDescricaoFontSize = 8
      ERPLbDescricaoTop = 3
      ERPBtProcurarEnabled = True
      ERPSqlPesquisa.Strings = (
        'SELECT t.*'
        '  FROM ('
        '        SELECT a.cdColaborador,'
        '               a.nmColaborador,'
        '               a.deCpf,'
        '               cid.nmCidade,'
        '               cid.sgEstado,'
        '               cs.deColabSituacao'
        '  FROM erp.Colaborador a'
        
          '  LEFT JOIN erp.colabSituacao cs ON (cs.cdColabSituacao = a.cdCo' +
          'labSituacao)'
        '  LEFT JOIN erp.cidade cid ON (cid.cdCidade = a.cdCidade)'
        '       ) t'
        ' &filtro')
      ERPCamposFiltro.Strings = (
        'cdColaborador'
        'nmColaborador'
        'deColabSituacao'
        'deCpf'
        'nmcidade'
        'sgestado')
      ERPCamposFiltroTitulo.Strings = (
        'C'#243'digo'
        'Nome'
        'Situa'#231#227'o'
        'CPF'
        'Cidade'
        'Estado')
      ERPCampoChave = 'cdColaborador'
      ERPCampoDescricao = 'nmColaborador'
      ERPConnection = DmERP.fdConnERP
      ERPCampoChaveDataType = ftInteger
    end
    object eddtPonto: TDateTimePicker
      Left = 80
      Top = 28
      Width = 93
      Height = 21
      Date = 42342.685948726850000000
      Time = 42342.685948726850000000
      TabOrder = 2
    end
  end
  object dsDados: TDataSource
    DataSet = DmERP.qyColabPonto
    OnStateChange = dsDadosStateChange
    Left = 463
    Top = 9
  end
end
