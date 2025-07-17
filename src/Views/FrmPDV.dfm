object FormPDV: TFormPDV
  Left = 0
  Top = 0
  ActiveControl = editCodigoCliente
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pedidos'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenuPDV
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 113
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 56
      Width = 102
      Height = 15
      Caption = 'C'#243'digo do Produto'
    end
    object Label2: TLabel
      Left = 527
      Top = 56
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label3: TLabel
      Left = 663
      Top = 56
      Width = 71
      Height = 15
      Caption = 'Valor Unit'#225'rio'
    end
    object Label4: TLabel
      Left = 160
      Top = 56
      Width = 114
      Height = 15
      Caption = 'Descri'#231#227'o do Produto'
    end
    object Label5: TLabel
      Left = 16
      Top = 6
      Width = 96
      Height = 15
      Caption = 'C'#243'digo do Cliente'
    end
    object editCodigoProduto: TEdit
      Left = 16
      Top = 77
      Width = 121
      Height = 23
      TabOrder = 3
      OnExit = editCodigoProdutoExit
    end
    object editQuantidade: TEdit
      Left = 527
      Top = 77
      Width = 121
      Height = 23
      TabOrder = 5
    end
    object editValor: TEdit
      Left = 663
      Top = 77
      Width = 121
      Height = 23
      TabOrder = 6
      OnExit = editValorExit
    end
    object editDescricaoDoProduto: TEdit
      Left = 160
      Top = 77
      Width = 353
      Height = 23
      TabStop = False
      ReadOnly = True
      TabOrder = 4
    end
    object editCodigoCliente: TEdit
      Left = 16
      Top = 27
      Width = 121
      Height = 23
      TabOrder = 0
      OnExit = editCodigoClienteExit
    end
    object BitBtnPesquisarClientes: TBitBtn
      Left = 160
      Top = 25
      Width = 114
      Height = 25
      Caption = '&Pesquisar Clientes'
      TabOrder = 1
    end
    object BitBtnCancelarPedido: TBitBtn
      Left = 288
      Top = 25
      Width = 114
      Height = 25
      Caption = '&Cancelar Pedido'
      TabOrder = 2
      OnClick = BitBtnCancelarPedidoClick
    end
  end
  object pnlSubtotal: TPanel
    Left = 0
    Top = 490
    Width = 800
    Height = 50
    Align = alBottom
    Caption = 'SUBTOTAL R$ 0,00'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 540
    Width = 800
    Height = 60
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 546
    object ButtonGravarPedido: TButton
      Left = 469
      Top = 16
      Width = 100
      Height = 25
      Caption = '&Gravar Pedido'
      TabOrder = 0
      OnClick = ButtonGravarPedidoClick
    end
    object ButtonExcluirItem: TButton
      Left = 575
      Top = 16
      Width = 100
      Height = 25
      Caption = '&Excluir Item'
      TabOrder = 1
      OnClick = ButtonExcluirItemClick
    end
    object ButtonSair: TButton
      Left = 684
      Top = 16
      Width = 100
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
    end
  end
  object dbGridProdutos: TDBGrid
    Left = 0
    Top = 113
    Width = 800
    Height = 377
    Align = alClient
    DataSource = DataSourceItens
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbGridProdutosDrawColumnCell
    OnKeyDown = dbGridProdutosKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        ReadOnly = True
        Visible = True
      end>
  end
  object MainMenuPDV: TMainMenu
    Left = 48
    Top = 128
    object mnuCadastros: TMenuItem
      Caption = 'Cadastros'
      object mniClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mniClientesClick
      end
      object mniProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = mniProdutosClick
      end
    end
    object mnuConsultas: TMenuItem
      Caption = 'Consultas'
      object mniPedidosRealizados: TMenuItem
        Caption = 'Pedidos Realizados'
      end
    end
  end
  object ClientDataSetItens: TClientDataSet
    PersistDataPacket.Data = {
      7E0000009619E0BD0100000018000000050000000000030000007E0006436F64
      69676F0100490000000100055749445448020002001400094465736372696361
      6F01004900000001000557494454480200020014000351746408000400000000
      0008556E69746172696F080004000000000005546F74616C0800040000000000
      0000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Unitario'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterPost = ClientDataSetItensAfterPost
    AfterDelete = ClientDataSetItensAfterDelete
    OnCalcFields = ClientDataSetItensCalcFields
    Left = 48
    Top = 192
    object ClientDataSetItensCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object ClientDataSetItensDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 70
      FieldName = 'Descricao'
      Size = 75
    end
    object ClientDataSetItensQtd: TFloatField
      FieldName = 'Qtd'
      OnChange = ClientDataSetItensQtdChange
    end
    object ClientDataSetItensUnitario: TFloatField
      DisplayLabel = 'Unit'#225'rio'
      FieldName = 'Unitario'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object ClientDataSetItensTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
      Calculated = True
    end
  end
  object DataSourceItens: TDataSource
    DataSet = ClientDataSetItens
    Left = 48
    Top = 264
  end
end
