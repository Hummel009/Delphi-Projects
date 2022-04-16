object Form2: TForm2
  Left = 1336
  Top = 267
  Width = 497
  Height = 500
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
  object btnSave: TButton
    Left = 0
    Top = 416
    Width = 241
    Height = 57
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object btnLoad: TButton
    Left = 248
    Top = 416
    Width = 241
    Height = 57
    Caption = 'Load'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnLoadClick
  end
  object scrlbx1: TScrollBox
    Left = 0
    Top = 0
    Width = 489
    Height = 409
    TabOrder = 2
    object mmoHistory: TMemo
      Left = -4
      Top = 4
      Width = 469
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
  end
  object dlgOpen1: TOpenDialog
    Left = 248
    Top = 592
  end
  object dlgSave1: TSaveDialog
    Top = 592
  end
end
