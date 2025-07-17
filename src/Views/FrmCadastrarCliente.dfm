object FormCadastrarCliente: TFormCadastrarCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastrar Cliente'
  ClientHeight = 147
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblNome: TLabel
    Left = 20
    Top = 26
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object lblCPF: TLabel
    Left = 20
    Top = 50
    Width = 40
    Height = 15
    Caption = 'Cidade:'
  end
  object lblNascimento: TLabel
    Left = 20
    Top = 80
    Width = 17
    Height = 15
    Caption = 'UF:'
  end
  object edtNome: TEdit
    Left = 100
    Top = 23
    Width = 285
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edtCidade: TEdit
    Left = 100
    Top = 50
    Width = 285
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edtUF: TEdit
    Left = 100
    Top = 77
    Width = 69
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object BitBtnOK: TBitBtn
    Left = 222
    Top = 114
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtnOKClick
  end
  object BitBtnCancelar: TBitBtn
    Left = 309
    Top = 114
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtnCancelarClick
  end
end
