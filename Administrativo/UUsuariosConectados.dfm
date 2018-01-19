object FUsuariosConectados: TFUsuariosConectados
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Usu'#225'rios Conectados'
  ClientHeight = 555
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnCampos: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 103
    Align = alTop
    TabOrder = 0
    DesignSize = (
      939
      103)
    object lbAvisoChat: TLabel
      Left = 4
      Top = 79
      Width = 465
      Height = 19
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Duplo clique no usu'#225'rio listado abaixo para iniciar o Chat'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
      ExplicitTop = 107
    end
    object gbFiltros: TGroupBox
      Left = 4
      Top = 1
      Width = 932
      Height = 75
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Filtros: '
      TabOrder = 0
      DesignSize = (
        932
        75)
      object lbdtConexao: TLabel
        Left = 16
        Top = 19
        Width = 101
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Conex'#227'o Ativa:'
      end
      object lbdtConexaoA: TLabel
        Left = 236
        Top = 19
        Width = 6
        Height = 13
        Caption = 'a'
      end
      object lbcdUsuario: TLabel
        Left = 22
        Top = 42
        Width = 95
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usu'#225'rio Conectado:'
      end
      object eddtConexaoIni: TDateTimePicker
        Left = 118
        Top = 16
        Width = 111
        Height = 21
        Date = 42342.685948726850000000
        Time = 42342.685948726850000000
        ShowCheckbox = True
        TabOrder = 0
      end
      object eddtConexaoFim: TDateTimePicker
        Left = 249
        Top = 16
        Width = 111
        Height = 21
        Date = 42342.685951053240000000
        Time = 42342.685951053240000000
        ShowCheckbox = True
        TabOrder = 1
      end
      object btConsultar: TBitBtn
        Left = 819
        Top = 14
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Consultar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 5
        OnClick = btConsultarClick
      end
      object btFechar: TBitBtn
        Left = 873
        Top = 14
        Width = 55
        Height = 52
        Anchors = [akTop, akRight]
        Caption = '&Fechar'
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentDoubleBuffered = True
        Spacing = 0
        TabOrder = 6
        OnClick = btFecharClick
      end
      object edcdUsuario: TDBCampoCodigo
        Left = 118
        Top = 40
        Width = 292
        Height = 21
        BevelOuter = bvNone
        ShowCaption = False
        TabOrder = 2
        ERPCampoCodigoPK = False
        ERPCharCase = ecNormal
        ERPEdCampoChaveWidth = 47
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
          '        SELECT cdUsuario,'
          '               nmUsuario'
          '          FROM erp.usuario'
          '         ORDER BY cdUsuario'
          '       ) t'
          ' &filtro')
        ERPCamposFiltro.Strings = (
          'cdUsuario'
          'nmUsuario')
        ERPCamposFiltroTitulo.Strings = (
          'C'#243'digo'
          'Nome')
        ERPCampoChave = 'cdUsuario'
        ERPCampoDescricao = 'nmUsuario'
        ERPConnection = DmERP.fdConnERP
        ERPCampoChaveDataType = ftInteger
      end
      object cbSomenteUltimaConexaoDia: TCheckBox
        Left = 416
        Top = 33
        Width = 185
        Height = 17
        Caption = 'Somente '#218'ltima Conex'#227'o do Dia'
        TabOrder = 4
      end
      object cbSomenteUsuariosAtivMoment: TCheckBox
        Left = 416
        Top = 17
        Width = 217
        Height = 17
        Caption = 'Somente Usu'#225'rios Ativos no Momento'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 103
    Width = 939
    Height = 452
    Align = alClient
    TabOrder = 1
    object grDados: TDBGrid
      Left = 1
      Top = 1
      Width = 937
      Height = 450
      Align = alClient
      DataSource = dsDados
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = grDadosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cdUsuario'
          Title.Caption = 'C'#243'd. Usu'#225'rio'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmUsuario'
          Title.Caption = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nmComputador'
          Title.Caption = 'Computador'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'deIp'
          Title.Caption = 'End. IP'
          Width = 100
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'dtConexao'
          Title.Caption = 'Data Conex'#227'o'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'hrConexao'
          Title.Caption = 'Hora Conex'#227'o'
          Width = 80
          Visible = True
        end>
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = vtUsuariosConectados
    Left = 55
    Top = 185
  end
  object vtUsuariosConectados: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 160
    Top = 184
    Data = {03000000000000000000}
    object vtUsuariosConectadoscdUsuarioConexao: TIntegerField
      FieldName = 'cdUsuarioConexao'
    end
    object vtUsuariosConectadoscdUsuario: TIntegerField
      FieldName = 'cdUsuario'
    end
    object vtUsuariosConectadosnmUsuario: TStringField
      FieldName = 'nmUsuario'
      Size = 250
    end
    object vtUsuariosConectadosnmComputador: TStringField
      FieldName = 'nmComputador'
      Size = 50
    end
    object vtUsuariosConectadosdeIp: TStringField
      FieldName = 'deIp'
    end
    object vtUsuariosConectadosdtConexao: TDateField
      FieldName = 'dtConexao'
    end
    object vtUsuariosConectadoshrConexao: TStringField
      FieldName = 'hrConexao'
      Size = 10
    end
  end
end
