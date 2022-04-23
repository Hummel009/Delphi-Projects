object FormHist: TFormHist
  Left = 535
  Top = 256
  Width = 825
  Height = 364
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
  object lblInfo: TLabel
    Left = 312
    Top = 288
    Width = 475
    Height = 42
    Caption = 'Reopen history to see changes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object scrlbx: TScrollBox
    Left = 0
    Top = 0
    Width = 817
    Height = 273
    TabOrder = 0
    object mmoHistory: TMemo
      Left = -4
      Top = 4
      Width = 797
      Height = 1920
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
  object btnClearFile: TButton
    Left = 0
    Top = 280
    Width = 273
    Height = 57
    Caption = 'clear and close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnClearFileClick
  end
end
