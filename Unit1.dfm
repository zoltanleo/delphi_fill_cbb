object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 118
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 37
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object cbb: TComboBox
    Left = 8
    Top = 8
    Width = 281
    Height = 23
    TabOrder = 0
    Text = 'cbb'
    OnChange = cbbChange
  end
  object Edit1: TEdit
    Left = 166
    Top = 87
    Width = 89
    Height = 23
    TabOrder = 1
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 261
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object MDS: TMemTableEh
    Params = <>
    Left = 40
    Top = 8
  end
end
