unit IProdutoInterfaceUnit;

interface

uses ProdutoModelUnit, System.Generics.Collections;

type
  IProdutoInterface = interface
    ['{994C7543-851F-45C5-A86D-DFF6D70D51E5}']
    function BuscarPorCodigo(const Codigo: Integer): TProduto;
    function Listar: TObjectList<TProduto>;
    function Adicionar(const Produto: TProduto): Boolean;
    function Atualizar(const Produto: TProduto): Boolean;
    function Excluir(const Codigo: Integer): Boolean;
  end;

implementation

end.

