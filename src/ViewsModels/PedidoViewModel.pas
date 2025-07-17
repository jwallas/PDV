unit PedidoViewModel;

interface

type
  TPedido = class
  private
    FNumPedido: Integer;
    FDataEmissao: TDate;
    FCodCliente: Integer;
    FValorTotal: Double;
  published
    property NumPedido: Integer read FNumPedido write FNumPedido;
    property DataEmissao: TDate read FDataEmissao write FDataEmissao;
    property CodCliente: Integer read FCodCliente write FCodCliente;
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

implementation

end.
