unit FrmCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormCadastrarProduto = class(TForm)
    lblNome: TLabel;
    edtDescricao: TEdit;
    lblCPF: TLabel;
    BitBtnGravar: TBitBtn;
    BitBtnCancelar: TBitBtn;
    edtPreco: TEdit;
    procedure BitBtnGravarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastrarProduto: TFormCadastrarProduto;

implementation

uses ProdutoControllerUnit, ProdutoViewModel;

{$R *.dfm}

procedure TFormCadastrarProduto.BitBtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFormCadastrarProduto.BitBtnGravarClick(Sender: TObject);
var
  produto : TProdutoViewModel;
  produtoController: TProdutoController;
  resultado: Boolean;
begin

   produto := TProdutoViewModel.Create();
   try
     produto.Descricao := Trim(edtDescricao.Text);
     produto.PrecoVenda := StrToFloatDef(edtPreco.Text,0);

     resultado := false;

     produtoController := TProdutoController.Create;

     if ( produto.Descricao = '' ) or ( produto.PrecoVenda = 0 )   then
     begin
       ShowMessage( 'É Necessário informar todos os dados' );
       edtDescricao.SetFocus();
     end
     else resultado := produtoController.SalvarProduto(produto);

     if resultado then
     begin
       edtDescricao.Clear;
       edtPreco.Clear;
       edtDescricao.SetFocus();
       ShowMessage( 'Produto cadastrado com sucesso!' );
     end;

   finally
     produto.Free;
   end;

end;

end.
