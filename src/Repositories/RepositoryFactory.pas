unit RepositoryFactory;

interface

uses
  IClienteInterfaceUnit,
  IProdutoInterfaceUnit,
  IPedidoInterfaceUnit,
  IPedidoItemInterfaceUnit,
  ClienteRepository,
  ProdutoRepository,
  PedidoRepository,
  PedidoItemRepository;

type
  TRepositoryFactory = class
  public
    class function Cliente: IClientInterface;
    class function Produto: IProdutoInterface;
    class function Pedido: IPedidoInterface;
    class function PedidoItem: IPedidoItemInterface;
  end;

implementation

{ TRepositoryFactory }

class function TRepositoryFactory.Cliente: IClientInterface;
begin
  Result := TClienteRepository.Create;
end;

class function TRepositoryFactory.Produto: IProdutoInterface;
begin
  Result := TProdutoRepository.Create;
end;

class function TRepositoryFactory.Pedido: IPedidoInterface;
begin
  Result := TPedidoRepository.Create;
end;

class function TRepositoryFactory.PedidoItem: IPedidoItemInterface;
begin
  Result := TPedidoItemRepository.Create;
end;

end.

