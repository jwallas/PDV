unit PedidoItemViewModel;

interface

type
  TPedidoItemViewModel = class
  private

    FID: Integer;
    FNumPedido: Integer;
    FCodProduto: Integer;
    FQuant: Double;
    FValorUnit: Double;
    FValorTotal: Double;
  published
    property ID: Integer read FID write FID;
    property NumPedido: Integer read FNumPedido write FNumPedido;
    property CodProduto: Integer read FCodProduto write FCodProduto;
    property Quant: Double read FQuant write FQuant;
    property ValorUnit: Double read FValorUnit write FValorUnit;
    property ValorTotal: Double read FValorTotal write FValorTotal;
   end;

implementation

end.
