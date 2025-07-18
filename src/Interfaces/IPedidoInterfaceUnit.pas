unit IPedidoInterfaceUnit;

interface

uses PedidoModelUnit, PedidoQueriesUnit, System.Generics.Collections;

type
  IPedidoInterface = interface
    ['{5CA6AA11-4538-41A1-ABD5-0BFFE73F1CD6}']
    function BuscarPorPedido(const NumPedido: Integer): TPedido;
    function BuscarPorCliente(const Codigo: Integer):TPedido;
    function BuscarUltimoPedido() : TPedido;
    function Listar: TObjectList<TPedidoQueries>;
    function Adicionar(const Pedido: TPedido): Boolean;
    function Atualizar(const Pedido: TPedido): Boolean;
    function Excluir(const NumPedido: Integer): Boolean;
  end;

implementation

end.

