unit FrmCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFormCadastrarCliente = class(TForm)
    lblNome: TLabel;
    edtNome: TEdit;
    lblCPF: TLabel;
    edtCidade: TEdit;
    lblNascimento: TLabel;
    edtUF: TEdit;
    BitBtnOK: TBitBtn;
    BitBtnSair: TBitBtn;
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastrarCliente: TFormCadastrarCliente;

implementation

uses ClienteControllerUnit, ClienteViewModel;

{$R *.dfm}

procedure TFormCadastrarCliente.BitBtnOKClick(Sender: TObject);
var
  cliente : TClienteViewModel;
  clienteController: TClienteController;
  resultado: Boolean;
begin

   cliente := TClienteViewModel.Create();
   try
     cliente.Nome := Trim(edtNome.Text);
     cliente.Cidade := Trim(edtCidade.Text);
     cliente.UF := Trim(edtUF.Text);

     if ( cliente.Nome = '' ) or ( cliente.Cidade = '' ) or (cliente.UF = '' )  then
     begin
       ShowMessage( 'É Necessário informar todos os dados' );
       edtNome.SetFocus;
     end
     else resultado := clienteController.SalvarCliente(cliente);

     if resultado then
     begin
       edtNome.Clear;
       edtCidade.Clear;
       edtUF.Clear;
       edtNome.SetFocus;
       ShowMessage( 'Cliente cadastrado com sucesso!' );
     end;

   finally
     cliente.Free;
   end;
end;

procedure TFormCadastrarCliente.BitBtnSairClick(Sender: TObject);
begin
  close;
end;

end.
