object FFormCadastro: TFFormCadastro
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'TITULO DA TELA'
  ClientHeight = 545
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbDados: TScrollBox
    Left = 0
    Top = 56
    Width = 770
    Height = 489
    Align = alClient
    TabOrder = 0
  end
  inline FrBarraBotoes: TFBarraBotoes
    Left = 0
    Top = 0
    Width = 770
    Height = 56
    Align = alTop
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 770
    inherited sbBotoes: TScrollBox
      Width = 770
      ExplicitWidth = 770
      inherited btProximo: TBitBtn
        OnClick = FrBarraBotoesbtProximoClick
      end
      inherited btNovo: TBitBtn
        OnClick = FrBarraBotoesbtNovoClick
      end
      inherited btAlterar: TBitBtn
        OnClick = FrBarraBotoesbtAlterarClick
      end
      inherited btSalvar: TBitBtn
        OnClick = FrBarraBotoesbtSalvarClick
      end
      inherited btExluir: TBitBtn
        OnClick = FrBarraBotoesbtExluirClick
      end
      inherited btFechar: TBitBtn
        OnClick = FrBarraBotoesbtFecharClick
      end
    end
    inherited dsDados: TDataSource
      OnStateChange = FrBarraBotoesdsDadosStateChange
    end
  end
end
