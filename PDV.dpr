program PDV;

uses
  Vcl.Forms,
  FrmPDV in 'src\Views\FrmPDV.pas' {FormPDV},
  ClienteModelUnit in 'src\Models\ClienteModelUnit.pas',
  ProdutoModelUnit in 'src\Models\ProdutoModelUnit.pas',
  PedidoModelUnit in 'src\Models\PedidoModelUnit.pas',
  PedidoItemModelUnit in 'src\Models\PedidoItemModelUnit.pas',
  Connection in 'src\Repositories\Connection.pas',
  Functions in 'src\Repositories\Functions.pas',
  IClienteInterfaceUnit in 'src\Interfaces\IClienteInterfaceUnit.pas',
  IProdutoInterfaceUnit in 'src\Interfaces\IProdutoInterfaceUnit.pas',
  IPedidoInterfaceUnit in 'src\Interfaces\IPedidoInterfaceUnit.pas',
  RepositoryFactory in 'src\Repositories\RepositoryFactory.pas',
  ClienteRepository in 'src\Repositories\ClienteRepository.pas',
  ProdutoRepository in 'src\Repositories\ProdutoRepository.pas',
  PedidoRepository in 'src\Repositories\PedidoRepository.pas',
  PedidoItemRepository in 'src\Repositories\PedidoItemRepository.pas',
  IPedidoItemInterfaceUnit in 'src\Interfaces\IPedidoItemInterfaceUnit.pas',
  ClienteControllerUnit in 'src\Controllers\ClienteControllerUnit.pas',
  FrmCadastrarCliente in 'src\Views\FrmCadastrarCliente.pas' {FormCadastrarCliente},
  ClienteViewModel in 'src\ViewsModels\ClienteViewModel.pas',
  ProdutoViewModel in 'src\ViewsModels\ProdutoViewModel.pas',
  PedidoViewModel in 'src\ViewsModels\PedidoViewModel.pas',
  PedidoItemViewModel in 'src\ViewsModels\PedidoItemViewModel.pas',
  FrmCadastrarProduto in 'src\Views\FrmCadastrarProduto.pas' {FormCadastrarProduto},
  ProdutoControllerUnit in 'src\Controllers\ProdutoControllerUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPDV, FormPDV);
  Application.CreateForm(TFormCadastrarCliente, FormCadastrarCliente);
  Application.CreateForm(TFormCadastrarProduto, FormCadastrarProduto);
  Application.Run;
end.
