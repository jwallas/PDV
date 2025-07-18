unit PedidoModelUnit;

interface

type
  TPedido = class
  private
    FNumPedido: Integer;
    FDataEmissao: string;
    FCodCliente: Integer;
    FValorTotal: Double;
  published
    property NumPedido: Integer read FNumPedido write FNumPedido;
    property DataEmissao: string read FDataEmissao write FDataEmissao;
    property CodCliente: Integer read FCodCliente write FCodCliente;
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

implementation

end.
