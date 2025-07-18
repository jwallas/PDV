object FormListaDePedidos: TFormListaDePedidos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Lista de Pedidos '
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object PanelBotoes: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtnSair: TBitBtn
      Left = 534
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object dbGridPedidos: TDBGrid
    Left = 0
    Top = 66
    Width = 624
    Height = 328
    Align = alTop
    DataSource = DataSourcePedidos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'numpedido'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataemissao'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codcliente'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valortotal'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object PanelFiltro: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 66
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 255
      Top = 13
      Width = 187
      Height = 15
      Caption = 'Digite o c'#243'digo ou nome do cliente'
    end
    object RadioGroupFiltro: TRadioGroup
      Left = 0
      Top = 0
      Width = 249
      Height = 57
      Caption = 'Pesquisar por?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'C'#243'digo'
        'Nome')
      TabOrder = 0
      StyleName = 'Windows'
    end
    object editPesquisa: TEdit
      Left = 255
      Top = 34
      Width = 354
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = editPesquisaChange
    end
  end
  object ClientDataSetPedidos: TClientDataSet
    PersistDataPacket.Data = {
      7F0000009619E0BD0100000018000000050000000000030000007F00096E756D
      70656469646F04000100000000000B64617461656D697373616F040006000000
      00000A636F64636C69656E746504000100000000000A76616C6F72746F74616C
      0800040000000000046E6F6D6501004900000001000557494454480200020014
      000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'numpedido'
        DataType = ftInteger
      end
      item
        Name = 'dataemissao'
        DataType = ftDate
      end
      item
        Name = 'codcliente'
        DataType = ftInteger
      end
      item
        Name = 'valortotal'
        DataType = ftFloat
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 48
    Top = 192
    object ClientDataSetPedidosnumpedido: TIntegerField
      DisplayLabel = 'Pedido'
      DisplayWidth = 15
      FieldName = 'numpedido'
    end
    object ClientDataSetPedidosdataemissao: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 15
      FieldName = 'dataemissao'
    end
    object ClientDataSetPedidoscodcliente: TIntegerField
      DisplayLabel = 'Codigo do Cliente'
      DisplayWidth = 20
      FieldName = 'codcliente'
    end
    object ClientDataSetPedidosnome: TStringField
      DisplayLabel = 'Nome do Cliente'
      DisplayWidth = 30
      FieldName = 'nome'
    end
    object ClientDataSetPedidosvalortotal: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'valortotal'
    end
  end
  object DataSourcePedidos: TDataSource
    DataSet = ClientDataSetPedidos
    Left = 48
    Top = 264
  end
end
