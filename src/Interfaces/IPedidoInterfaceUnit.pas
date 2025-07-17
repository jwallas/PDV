unit IPedidoInterfaceUnit;

interface

uses PedidoModelUnit, System.Generics.Collections;

type
  IPedidoInterface = interface
    ['{B31430DE-F538-463F-A744-64C0CE025B50}']
    function BuscarPorCodigo(const NumPedido: Integer): TPedido;
    function Listar: TObjectList<TPedido>;
    function Adicionar(const Pedido: TPedido): Boolean;
    function Atualizar(const Pedido: TPedido): Boolean;
    function Excluir(const NumPedido: Integer): Boolean;
  end;

implementation

end.

