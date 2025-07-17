unit ClienteControllerUnit;

interface

uses
  RepositoryFactory,
  IClienteInterfaceUnit,
  ClienteViewModel,
  ClienteModelUnit;

type
  TClienteController = class
  public
    function SalvarCliente(const ClienteViewModel: TClienteViewModel): boolean;
  end;
implementation

function TClienteController.SalvarCliente(const ClienteViewModel: TClienteViewModel): Boolean;
var
  Repositorio: IClientInterface;
  model: TCliente;

begin
// Converte a ViewModel para Model
  model := TCliente.Create;
  try
    model.Nome := ClienteViewModel.Nome;
    model.Cidade := ClienteViewModel.Cidade;
    model.UF := ClienteViewModel.UF;

    Repositorio := TRepositoryFactory.Cliente;
    result := Repositorio.Adicionar(model);

  finally
    model.Free;
  end;


end;

end.
