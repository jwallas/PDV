unit PedidoQueriesUnit;

interface


type
  TPedidoQueries = class
  private
    FNumPedido: Integer;
    FDataEmissao: String;
    FCodCliente: Integer;
    FValorTotal: Double;
    FNome: string;
  published
    property NumPedido: Integer read FNumPedido write FNumPedido;
    property DataEmissao: String read FDataEmissao write FDataEmissao;
    property CodCliente: Integer read FCodCliente write FCodCliente;
    property Nome: string read FNome write FNome;
    property ValorTotal: Double read FValorTotal write FValorTotal;
  end;

implementation

end.
