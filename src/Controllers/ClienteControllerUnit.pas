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
    function BuscarCliente(Codigo: Integer): TClienteViewModel;
    function SalvarCliente(const ClienteViewModel: TClienteViewModel): boolean;
  end;

implementation

var
  Repositorio: IClientInterface;

function TClienteController.BuscarCliente(Codigo: Integer): TClienteViewModel;
var
  viewModel : TClienteViewModel;
  model: TCliente;
begin

   Repositorio := TRepositoryFactory.Cliente;
   model := Repositorio.BuscarPorCodigo(Codigo);

   viewModel := TClienteViewModel.Create;
   viewModel.Codigo := Codigo;
   viewModel.Nome := model.Nome;
   viewModel.Cidade := model.Cidade;
   viewModel.Cidade := model.UF;

   result := viewModel;

end;

function TClienteController.SalvarCliente(const ClienteViewModel: TClienteViewModel): Boolean;
var

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
