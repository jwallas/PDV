unit FrmPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.DBGrids;

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
    EditCodigo: TEdit;
    Label2: TLabel;
    EditQuantidade: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    StringGridPedidos: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure mniClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPDV: TFormPDV;
  qtdLinhas: Integer;

implementation

uses FrmCadastrarCliente;

{$R *.dfm}

procedure TFormPDV.FormCreate(Sender: TObject);
begin
 // Definindo o número de colunas e linhas
  StringGridPedidos.ColCount := 5;
  StringGridPedidos.RowCount := 2;

  // Definindo o cabeçalho (linha 0)
  StringGridPedidos.Cells[0, 0] := 'Código';
  StringGridPedidos.Cells[1, 0] := 'Descrição';
  StringGridPedidos.Cells[2, 0] := 'Quantidade';
  StringGridPedidos.Cells[3, 0] := 'Valor Unitário';
  StringGridPedidos.Cells[4, 0] := 'Valor Total';

  qtdLinhas := 2

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

end.
