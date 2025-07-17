unit ProdutoControllerUnit;

interface

uses
  RepositoryFactory,
  IProdutoInterfaceUnit,
  ProdutoViewModel,
  ProdutoModelUnit;

type
  TProdutoController = class
  public
    function BuscarProduto(Codigo: Integer): TProdutoViewModel;
    function SalvarProduto(const ProdutoViewModel: TProdutoViewModel): boolean;
  end;

implementation

var
  Repositorio: IProdutoInterface;

function TProdutoController.BuscarProduto(Codigo: Integer): TProdutoViewModel;
var
  viewModel : TProdutoViewModel;
  model: TProduto;
begin

   Repositorio := TRepositoryFactory.Produto;
   model := Repositorio.BuscarPorCodigo(Codigo);

   viewModel := TProdutoViewModel.Create;
   viewModel.Codigo := Codigo;
   viewModel.Descricao := model.Descricao;
   viewModel.PrecoVenda := model.PrecoVenda;

   result := viewModel;

end;

function TProdutoController.SalvarProduto(const ProdutoViewModel: TProdutoViewModel): Boolean;
var
  model: TProduto;
begin

  model := TProduto.Create;
  try
    model.Descricao := ProdutoViewModel.Descricao;
    model.PrecoVenda := ProdutoViewModel.PrecoVenda;

    Repositorio := TRepositoryFactory.Produto;
    result := Repositorio.Adicionar(model);

  finally
    model.Free;
  end;


end;

end.
