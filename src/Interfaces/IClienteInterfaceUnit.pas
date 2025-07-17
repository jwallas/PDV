unit IClienteInterfaceUnit;

interface

uses ClienteModelUnit, System.Generics.Collections;

type
  IClientInterface = interface
    ['{9D87496E-2C5A-4604-8900-CDF7586650E9}']
    function BuscarPorCodigo(const Codigo: Integer): TCliente;
    function Listar: TObjectList<TCliente>;
    function Adicionar(const Cliente: TCliente): Boolean;
    function Atualizar(const Cliente: TCliente): Boolean;
    function Excluir(const Codigo: Integer): Boolean;
  end;

implementation

end.
