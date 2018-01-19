object FCampoCodigoGrid: TFCampoCodigoGrid
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Informe um valor'
  ClientHeight = 25
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    582
    25)
  PixelsPerInch = 96
  TextHeight = 13
  object lbcdCampoCodigo: TLabel
    Left = 57
    Top = 5
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'VALOR:'
  end
  object edcdCampoCodigo: TDBCampoCodigo
    Left = 96
    Top = 2
    Width = 418
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    ERPCampoCodigoPK = False
    ERPCharCase = ecNormal
    ERPEdCampoChaveWidth = 60
    ERPEdCampoChaveFontSize = 8
    ERPEdCampoChaveReadOnly = False
    ERPEdCampoChaveOnlyNumbers = False
    ERPEdCampoChaveDBEnabled = True
    ERPEdCampoChaveEnabled = True
    ERPLbDescricaoFontSize = 8
    ERPLbDescricaoTop = 3
    ERPBtProcurarEnabled = True
    ERPCampoChave = 'CODIGO'
    ERPCampoDescricao = 'DESCRICAO'
    ERPConnection = DmERP.fdConnERP
    ERPCampoChaveDataType = ftInteger
  end
  object btOk: TButton
    Left = 520
    Top = 0
    Width = 60
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Ok'
    ModalResult = 8
    TabOrder = 1
    OnClick = btOkClick
  end
end
