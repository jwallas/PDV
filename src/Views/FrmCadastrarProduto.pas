unit FrmCadastrarProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    lblNome: TLabel;
    edtDescricao: TEdit;
    lblCPF: TLabel;
    BitBtnOK: TBitBtn;
    BitBtnCancelar: TBitBtn;
    edtPreco: TEdit;
    procedure BitBtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ProdutoControllerUnit, ProdutoViewModel;

{$R *.dfm}

procedure TForm1.BitBtnOKClick(Sender: TObject);
var
  produto : TProdutoViewModel;
  produtoController: TProdutoController;
  resultado: Boolean;
begin

   produto := TProdutoViewModel.Create();
   try
     produto.Descricao := Trim(edtDescricao.Text);
     produto.PrecoVenda := StrToFloat(edtPreco.Text);

     if ( produto.Descricao = '' ) or ( produto.PrecoVenda = 0 )   then
     begin
       ShowMessage( 'É Necessário informar todos os dados' );
     end
     else resultado := produtoController.SalvarProduto(produto);

     if resultado then
     begin
       edtDescricao.Clear;
       edtPreco.Clear;
     end;

   finally
     produto.Free;
   end;

end;

end.
