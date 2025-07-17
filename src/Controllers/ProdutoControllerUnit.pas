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
    function SalvarProduto(const ProdutoViewModel: TProdutoViewModel): boolean;
  end;
implementation

function TProdutoController.SalvarProduto(const ProdutoViewModel: TProdutoViewModel): Boolean;
var
  Repositorio: IProdutoInterface;
  model: TProduto;

begin
// Converte a ViewModel para Model
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
