object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Importador'
  ClientHeight = 509
  ClientWidth = 1094
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_topo: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 1088
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 144
    ExplicitWidth = 185
    object btn_acao: TButton
      AlignWithMargins = True
      Left = 977
      Top = 4
      Width = 107
      Height = 33
      Align = alRight
      Caption = 'Carregar Arquivo'
      TabOrder = 0
      OnClick = btn_acaoClick
      ExplicitLeft = 992
      ExplicitTop = 9
      ExplicitHeight = 25
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 490
    Width = 1094
    Height = 19
    Panels = <>
    ExplicitLeft = 200
    ExplicitTop = 216
    ExplicitWidth = 0
  end
  object pnl_central: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 1088
    Height = 437
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 184
    ExplicitTop = 136
    ExplicitWidth = 185
    ExplicitHeight = 41
    object MemArquivo: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 576
      Height = 429
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitHeight = 435
    end
    object dbGridDados: TDBGrid
      AlignWithMargins = True
      Left = 586
      Top = 4
      Width = 498
      Height = 429
      Align = alClient
      DataSource = DsLayout
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 744
    Top = 224
  end
  object DsLayout: TDataSource
    Left = 688
    Top = 312
  end
end
