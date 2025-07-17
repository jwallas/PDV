unit FrmPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.DBGrids, Vcl.Buttons;

type
  TFormPDV = class(TForm)
    MainMenuPDV: TMainMenu;
    mnuCadastros: TMenuItem;
    mniClientes: TMenuItem;
    mniProdutos: TMenuItem;
    mnuConsultas: TMenuItem;
    mniPedidosRealizados: TMenuItem;
    pnlTopo: TPanel;
    pnlSubtotal: TPanel;
    pnlBotoes: TPanel;
    Label1: TLabel;
    editCodigoProduto: TEdit;
    Label2: TLabel;
    editQuantidade: TEdit;
    Label3: TLabel;
    editValor: TEdit;
    Label4: TLabel;
    editDescricaoDoProduto: TEdit;
    dbGridProdutos: TDBGrid;
    ClientDataSetItens: TClientDataSet;
    DataSourceItens: TDataSource;
    ButtonGravarPedido: TButton;
    ButtonExcluirItem: TButton;
    Label5: TLabel;
    editCodigoCliente: TEdit;
    BitBtnPesquisarClientes: TBitBtn;
    BitBtnCancelarPedido: TBitBtn;
    ButtonSair: TButton;
    ClientDataSetItensCodigo: TStringField;
    ClientDataSetItensDescricao: TStringField;
    ClientDataSetItensQtd: TFloatField;
    ClientDataSetItensUnitario: TFloatField;
    ClientDataSetItensTotal: TFloatField;
    procedure mniClientesClick(Sender: TObject);
    procedure mniProdutosClick(Sender: TObject);
    procedure editCodigoClienteExit(Sender: TObject);
    procedure BitBtnCancelarPedidoClick(Sender: TObject);
    procedure ButtonGravarPedidoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editCodigoProdutoExit(Sender: TObject);
    procedure editValorExit(Sender: TObject);
    procedure ClientDataSetItensCalcFields(DataSet: TDataSet);
    procedure ButtonExcluirItemClick(Sender: TObject);
    procedure ClientDataSetItensAfterDelete(DataSet: TDataSet);
    procedure ClientDataSetItensAfterPost(DataSet: TDataSet);
    procedure dbGridProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ClientDataSetItensQtdChange(Sender: TField);
    procedure dbGridProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    FSubTotal: Double;
    procedure BuscarCliente();
    procedure BuscarProduto();
    procedure CalcularSubTotal();
    function getSubTotal: Double;
    procedure setSubTotal(const Value: Double);
    function getCodigoCliente: Integer;
    function IsCodigoClienteValido() : Boolean;
    function IsCodigoProdutoValido() : Boolean;
    procedure LimparControles();
    procedure LimparControlesProduto();
    procedure setCodigoCliente(const Value: Integer);

    property CodigoCliente: Integer read getCodigoCliente write setCodigoCliente;
    property SubTotal: Double read getSubTotal write setSubTotal;

  public
    { Public declarations }
  end;

var
  FormPDV: TFormPDV;
  qtdLinhas: Integer;

implementation

uses FrmCadastrarCliente, FrmCadastrarProduto,
     ProdutoViewModel, ProdutoControllerUnit,
     ClienteViewModel, ClienteControllerUnit;

var

  ultimoProdutoPesquisado : TProdutoViewModel;
  clienteDefinido : TClienteViewModel;
  codigo: Integer;


{$R *.dfm}


procedure TFormPDV.BitBtnCancelarPedidoClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    LimparControles;
    LimparControlesProduto;
  end;

end;

procedure TFormPDV.BuscarCliente;
var
  clienteController: TClienteController;
begin

  if (editCodigoCliente.Text <> EmptyStr ) then
  begin

    codigo := StrToIntDef(editCodigoCliente.Text,0);

    if (IsCodigoClienteValido) then
    begin

      try

       clienteDefinido   := TClienteViewModel.Create();
       clienteController := TClienteController.Create();

       try

         clienteDefinido := clienteController.BuscarCliente(codigo);

         editCodigoCliente.Text := clienteDefinido.Codigo.ToString();

         if ( clienteDefinido.Codigo.ToString() = EmptyStr ) then
         begin
           ShowMessage( 'Cliente não encontrado' );
           clienteDefinido.Free;
         end;

        except on E: Exception do
           ShowMessage('Ocorreu um erro: ' + E.Message);
        end;
      finally
         clienteController.Free;
       end;
    end
    else ShowMessage( 'Código Inválido' );
  end;

end;

procedure TFormPDV.BuscarProduto;
var
  produtoController: TProdutoController;
begin

  if (editCodigoProduto.Text <> EmptyStr ) then
  begin

    codigo := StrToIntDef(editCodigoProduto.Text,0);

    if (IsCodigoProdutoValido) then
    begin

      try
       ultimoProdutoPesquisado     := produtoController.BuscarProduto(codigo);
       editQuantidade.Text         := '1';
       editDescricaoDoProduto.Text := ultimoProdutoPesquisado.Descricao;
       editValor.Text              := FloatToStrF(ultimoProdutoPesquisado.PrecoVenda,ffNumber, 12, 2);

       if ( ultimoProdutoPesquisado.Descricao = EmptyStr ) then
       begin
         ShowMessage( 'Produto não encontrado' );
         ultimoProdutoPesquisado.Free;
       end;


      except on E: Exception do
         ShowMessage('Ocorreu um erro: ' + E.Message);
      end;

    end
    else
    begin
       ShowMessage( 'Código Inválido' );
       editCodigoProduto.SetFocus();
    end;
  end;

end;

procedure TFormPDV.ButtonExcluirItemClick(Sender: TObject);
begin

    if not ClientDataSetItens.IsEmpty then
    begin
      if MessageDlg('Deseja excluir a linha selecionada?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        ClientDataSetItens.Delete;
    end
    else
      ShowMessage('Nenhum registro para excluir.');

end;

procedure TFormPDV.ButtonGravarPedidoClick(Sender: TObject);
begin
  if Assigned(clienteDefinido) then
  begin

  end;

end;


procedure TFormPDV.CalcularSubTotal;
var
  TotalGeral: Double;
begin
  TotalGeral := 0;
  ClientDataSetItens.DisableControls;
  try
    ClientDataSetItens.First;
    while not ClientDataSetItens.Eof do
    begin
      TotalGeral := TotalGeral + ClientDataSetItens.FieldByName('total').AsFloat;
      ClientDataSetItens.Next;
    end;
  finally
    SubTotal := TotalGeral;
    ClientDataSetItens.EnableControls;
  end;
end;

procedure TFormPDV.ClientDataSetItensAfterDelete(DataSet: TDataSet);
begin
  CalcularSubTotal;
end;

procedure TFormPDV.ClientDataSetItensAfterPost(DataSet: TDataSet);
begin
  CalcularSubTotal;
end;

procedure TFormPDV.ClientDataSetItensCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('Total').AsFloat := DataSet.FieldByName('Qtd').AsFloat * DataSet.FieldByName('Unitario').AsFloat;
end;

procedure TFormPDV.dbGridProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if not (gdSelected in State) then
  begin
    if ClientDataSetItens.RecNo mod 2 = 0 then
      dbGridProdutos.Canvas.Brush.Color := clSilver
    else
      dbGridProdutos.Canvas.Brush.Color := clWhite;

    dbGridProdutos.Canvas.FillRect(Rect);
    dbGridProdutos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
  begin
    // Deixa a seleção padrão
    dbGridProdutos.Canvas.Brush.Color := clHighlight;
    dbGridProdutos.Canvas.Font.Color := clHighlightText;
    dbGridProdutos.Canvas.FillRect(Rect);
    dbGridProdutos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFormPDV.dbGridProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
  begin
    // Se o DataSet está em modo de edição ou inserção
    if ClientDataSetItens.State in [dsEdit, dsInsert] then
    begin
      ClientDataSetItens.Post;  // Força gravação das alterações da linha atual
    end;

    Key := 0;  // Cancela beep do Enter
  end;
end;

procedure TFormPDV.editCodigoClienteExit(Sender: TObject);
begin
  BitBtnCancelarPedido.Visible := Trim(editCodigoCliente.Text) = '';
  BuscarCliente();
end;

procedure TFormPDV.editCodigoProdutoExit(Sender: TObject);
begin
   BuscarProduto;
end;

procedure TFormPDV.editValorExit(Sender: TObject);
var
  totalDoItem: Double;
begin

  if (editDescricaoDoProduto.Text <> EmptyStr) then
  begin

    try

      ClientDataSetItens.Append;
      ClientDataSetItens.FieldByName('Codigo').AsString    := editCodigoProduto.Text;
      ClientDataSetItens.FieldByName('Descricao').AsString := editDescricaoDoProduto.Text;
      ClientDataSetItens.FieldByName('Qtd').AsFloat        := StrToFloatDef(editQuantidade.Text,0);
      ClientDataSetItens.FieldByName('Unitario').AsFloat   := StrToFloatDef(editValor.Text,0);

      totalDoItem := ClientDataSetItens.FieldByName('Qtd').AsFloat * ClientDataSetItens.FieldByName('Unitario').AsFloat;

      ClientDataSetItens.FieldByName('Total').AsFloat      := totalDoItem;
      ClientDataSetItens.Post;

      LimparControlesProduto;

      editCodigoProduto.SetFocus();

     except on E: Exception do

      ShowMessage('Ocorreu um erro: ' + E.Message);


    end;

  end
  else LimparControlesProduto;
end;

procedure TFormPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin

      if not (ActiveControl is TDBGrid) then
      begin
        Key := 0;
        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
  end;
  if key = VK_ESCAPE then
  begin
     if MessageDlg('Deseja realmente sair da aplicação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       close;
     end;
  end;
end;

function TFormPDV.IsCodigoClienteValido: Boolean;
var
  codigo: Integer;
begin
  codigo := StrToIntDef(editCodigoCliente.Text,0);
  result := codigo > 0;
end;

function TFormPDV.IsCodigoProdutoValido: Boolean;
var
  codigo: Integer;
begin
  codigo := StrToIntDef(editCodigoProduto.Text,0);
  result := codigo > 0;
end;

procedure TFormPDV.LimparControles;
begin

  if ClientDataSetItens.Active then
    ClientDataSetItens.EmptyDataSet;

  ultimoProdutoPesquisado.Free;

end;

procedure TFormPDV.LimparControlesProduto;
begin
  editCodigoCliente.Clear;
  editCodigoProduto.Clear;
  editDescricaoDoProduto.Clear;
  editQuantidade.Clear;
  editValor.Clear;
end;

procedure TFormPDV.mniClientesClick(Sender: TObject);
var
  frm: TFormCadastrarCliente;
begin
  frm := TFormCadastrarCliente.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;


procedure TFormPDV.mniProdutosClick(Sender: TObject);
var
  frm: TFormCadastrarProduto;
begin
  frm := TFormCadastrarProduto.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

function TFormPDV.getCodigoCliente: Integer;
begin
  result := CodigoCliente
end;

function TFormPDV.getSubTotal: Double;
begin
  result := FSubTotal;
end;

procedure TFormPDV.setCodigoCliente(const Value: Integer);
begin
   CodigoCliente := Value
end;

procedure TFormPDV.setSubTotal(const Value: Double);
begin
   FSubTotal := Value;
   pnlSubTotal.Caption := FloatToStrF( Value, ffCurrency, 12, 2 );
end;

end.
