object FormPDV: TFormPDV
  Left = 0
  Top = 0
  Caption = 'PDV'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenuPDV
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 102
      Height = 15
      Caption = 'C'#243'digo do Produto'
    end
    object Label2: TLabel
      Left = 527
      Top = 16
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label3: TLabel
      Left = 663
      Top = 16
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    object Label4: TLabel
      Left = 160
      Top = 16
      Width = 114
      Height = 15
      Caption = 'Descri'#231#227'o do Produto'
    end
    object EditCodigo: TEdit
      Left = 16
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object EditQuantidade: TEdit
      Left = 527
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 663
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 160
      Top = 37
      Width = 353
      Height = 23
      TabOrder = 3
    end
  end
  object pnlSubtotal: TPanel
    Left = 0
    Top = 490
    Width = 800
    Height = 50
    Align = alBottom
    Caption = 'SUBTOTAL R$ 0,00'
    TabOrder = 1
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 540
    Width = 800
    Height = 60
    Align = alBottom
    TabOrder = 2
  end
  object StringGridPedidos: TStringGrid
    Left = 0
    Top = 73
    Width = 800
    Height = 417
    Align = alClient
    FixedCols = 0
    TabOrder = 3
  end
  object MainMenuPDV: TMainMenu
    Left = 72
    Top = 208
    object mnuCadastros: TMenuItem
      Caption = 'Cadastros'
      object mniClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mniClientesClick
      end
      object mniProdutos: TMenuItem
        Caption = 'Produtos'
      end
    end
    object mnuConsultas: TMenuItem
      Caption = 'Consultas'
      object mniPedidosRealizados: TMenuItem
        Caption = 'Pedidos Realizados'
      end
    end
  end
end
