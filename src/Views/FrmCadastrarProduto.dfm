object FormCadastrarProduto: TFormCadastrarProduto
  Left = 0
  Top = 0
  ActiveControl = edtDescricao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Cadastrar Produto'
  ClientHeight = 127
  ClientWidth = 389
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
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object lblCPF: TLabel
    Left = 20
    Top = 53
    Width = 81
    Height = 15
    Caption = 'Pre'#231'o de Venda'
  end
  object edtDescricao: TEdit
    Left = 120
    Top = 23
    Width = 265
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object BitBtnGravar: TBitBtn
    Left = 222
    Top = 90
    Width = 75
    Height = 25
    Caption = '&Gravar'
    Default = True
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtnGravarClick
  end
  object BitBtnCancelar: TBitBtn
    Left = 309
    Top = 90
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Sair'
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtnCancelarClick
  end
  object edtPreco: TEdit
    Left = 120
    Top = 52
    Width = 121
    Height = 23
    TabOrder = 1
  end
end
