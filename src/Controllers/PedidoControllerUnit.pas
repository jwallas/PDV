unit PedidoControllerUnit;

interface

uses
  RepositoryFactory,
  IPedidoInterfaceUnit,
  IPedidoItemInterfaceUnit,
  PedidoViewModel,
  PedidoItemViewModel,
  PedidoModelUnit,
  PedidoItemModelUnit,
  PedidoQueriesUnit,
  System.Generics.Collections;

type
  TPedidoController = class
  public
    function BuscarPedidoNumero(NumPedido: Integer): TPedidoViewModel;
    function BuscarPedidoCliente(CodigoCliente: Integer): TPedidoViewModel;
    function ListarPedidos(): TObjectList<TPedidoQueries>;
    function SalvarPedido(const PedidoViewModel: TPedidoViewModel;  const ItensViewModel:  TObjectList<TPedidoItemViewModel>): boolean;
  end;

implementation

var
  Repositorio: IPedidoInterface;

function TPedidoController.BuscarPedidoCliente(
  CodigoCliente: Integer): TPedidoViewModel;
var
  viewModel : TPedidoViewModel;
  model: TPedido;
begin

   Repositorio := TRepositoryFactory.Pedido;
   model := Repositorio.BuscarPorPedido(CodigoCliente);

   viewModel := TPedidoViewModel.Create;
   viewModel.NumPedido := model.NumPedido;
   viewModel.DataEmissao := model.DataEmissao;
   viewModel.CodCliente := model.CodCliente;
   viewModel.ValorTotal := model.ValorTotal;

   result := viewModel;

end;

function TPedidoController.BuscarPedidoNumero(NumPedido: Integer): TPedidoViewModel;
var
  viewModel : TPedidoViewModel;
  model: TPedido;
begin

   Repositorio := TRepositoryFactory.Pedido;
   model := Repositorio.BuscarPorPedido(NumPedido);

   viewModel := TPedidoViewModel.Create;
   viewModel.NumPedido := model.NumPedido;
   viewModel.DataEmissao := model.DataEmissao;
   viewModel.CodCliente := model.CodCliente;
   viewModel.ValorTotal := model.ValorTotal;

   result := viewModel;

end;

function TPedidoController.ListarPedidos: TObjectList<TPedidoQueries>;
begin
   Repositorio := TRepositoryFactory.Pedido;
   result := Repositorio.Listar();
end;

function TPedidoController.SalvarPedido(const PedidoViewModel: TPedidoViewModel; const ItensViewModel:  TObjectList<TPedidoItemViewModel>): Boolean;
var
  modelPedido: TPedido;
  modelItens: TPedidoItem;
  RepositorioItem: IPedidoItemInterface;
  item : Integer;
begin

  modelPedido := TPedido.Create;
  ;
  try
    modelPedido.NumPedido   := PedidoViewModel.NumPedido;
    modelPedido.DataEmissao := PedidoViewModel.DataEmissao;
    modelPedido.CodCliente  := PedidoViewModel.CodCliente;
    modelPedido.ValorTotal  := PedidoviewModel.ValorTotal;

    Repositorio := TRepositoryFactory.Pedido;
    result := Repositorio.Adicionar(modelPedido);

    if (result ) then
    begin

      modelPedido := Repositorio.BuscarUltimoPedido();

      for item := 0 to ItensViewModel.Count -1 do
      begin

         modelItens  := TPedidoItem.Create;

         try
           modelItens.NumPedido  := modelPedido.NumPedido;
           modelItens.CodProduto := ItensViewModel[item].CodProduto;
           modelItens.Quant      := ItensViewModel[item].Quant;
           modelItens.ValorUnit  := ItensViewModel[item].ValorUnit;
           modelItens.ValorTotal := ItensViewModel[item].ValorTotal;

           RepositorioItem := TRepositoryFactory.PedidoItem;
           result := RepositorioItem.Adicionar(modelItens);

         finally
           modelItens.Free;
         end;

      end;

    end;

  finally
    modelPedido.Free;
  end;


end;

end.
