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
    BitBtnCancelar: TBitBtn;
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
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

procedure TFormCadastrarCliente.BitBtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

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
     end
     else resultado := clienteController.SalvarCliente(cliente);

     if resultado then
     begin
       edtNome.Clear;
       edtCidade.Clear;
       edtUF.Clear;
     end;

   finally
     cliente.Free;
   end;
end;

end.
