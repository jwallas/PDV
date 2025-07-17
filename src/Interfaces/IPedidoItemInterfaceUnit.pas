unit IPedidoItemInterfaceUnit;

interface

uses PedidoItemModelUnit, System.Generics.Collections;

type
  IPedidoItemInterface = interface
    ['{6FC9A8FB-7407-4CAB-85CA-264AA2491892}']
    function BuscarPorCodigo(const NumPedido: Integer): TPedidoItem;
    function Listar: TObjectList<TPedidoItem>;
    function Adicionar(const Pedido: TPedidoItem): Boolean;
    function Atualizar(const Pedido: TPedidoItem): Boolean;
    function Excluir(const NumPedido: Integer): Boolean;
  end;
implementation

end.
