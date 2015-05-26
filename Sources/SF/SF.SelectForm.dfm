object SelectForm: TSelectForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Select By Name...'
  ClientHeight = 384
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object EditSearch: TEdit
    Left = 5
    Top = 5
    Width = 355
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = EditSearchChange
  end
  object ListObjects: TCheckListBox
    Left = 5
    Top = 33
    Width = 355
    Height = 270
    OnClickCheck = ListObjectsClickCheck
    ItemHeight = 15
    TabOrder = 1
    OnClick = ListObjectsClick
  end
  object ButtonSelectAll: TButton
    Left = 5
    Top = 325
    Width = 115
    Height = 25
    Caption = 'Select All'
    TabOrder = 2
    OnClick = ButtonSelectAllClick
  end
  object ButtonHide: TButton
    Left = 5
    Top = 355
    Width = 115
    Height = 25
    Caption = 'Hide Selection'
    TabOrder = 3
    OnClick = ButtonHideClick
  end
  object ButtonClear: TButton
    Left = 245
    Top = 325
    Width = 115
    Height = 25
    Caption = 'Clear Selection'
    TabOrder = 4
    OnClick = ButtonClearClick
  end
  object ButtonUnhide: TButton
    Left = 125
    Top = 355
    Width = 115
    Height = 25
    Caption = 'Unhide Selection'
    TabOrder = 5
    OnClick = ButtonUnhideClick
  end
  object ButtonCopy: TButton
    Left = 245
    Top = 355
    Width = 115
    Height = 25
    Caption = 'Copy To Clipboard'
    TabOrder = 6
    OnClick = ButtonCopyClick
  end
  object ButtonInvert: TButton
    Left = 125
    Top = 325
    Width = 115
    Height = 25
    Caption = 'Invert Selecetion'
    TabOrder = 7
    OnClick = ButtonInvertClick
  end
  object CheckCase: TCheckBox
    Left = 245
    Top = 305
    Width = 115
    Height = 17
    Caption = 'Case Sensitive'
    TabOrder = 8
    OnClick = CheckCaseClick
  end
  object CheckPartial: TCheckBox
    Left = 125
    Top = 305
    Width = 105
    Height = 17
    Caption = 'Partial Match'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = CheckPartialClick
  end
  object CheckMultiSearch: TCheckBox
    Left = 5
    Top = 305
    Width = 115
    Height = 17
    Caption = 'Multi Search'
    Checked = True
    State = cbChecked
    TabOrder = 10
    OnClick = CheckMultiSearchClick
  end
end
