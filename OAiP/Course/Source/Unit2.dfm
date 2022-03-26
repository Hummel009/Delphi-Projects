object Form2: TForm2
  Left = 1385
  Top = 199
  Width = 497
  Height = 676
  AutoSize = True
  Caption = 'History'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmoHistory: TMemo
    Left = 0
    Top = 0
    Width = 489
    Height = 585
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'mmoHistory')
    ParentFont = False
    TabOrder = 0
  end
  object btn11: TButton
    Left = 0
    Top = 592
    Width = 241
    Height = 57
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn11Click
  end
  object btn1: TButton
    Left = 248
    Top = 592
    Width = 241
    Height = 57
    Caption = 'Load'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn1Click
  end
  object dlgOpen1: TOpenDialog
    Left = 248
    Top = 592
  end
  object dlgSave1: TSaveDialog
    Top = 592
  end
end
