unit FrmListaDePedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Buttons;

type
  TFormListaDePedidos = class(TForm)
    PanelBotoes: TPanel;
    dbGridPedidos: TDBGrid;
    PanelFiltro: TPanel;
    RadioGroupFiltro: TRadioGroup;
    editPesquisa: TEdit;
    Label1: TLabel;
    ClientDataSetPedidos: TClientDataSet;
    DataSourcePedidos: TDataSource;
    ClientDataSetPedidosnumpedido: TIntegerField;
    ClientDataSetPedidosdataemissao: TDateField;
    ClientDataSetPedidoscodcliente: TIntegerField;
    ClientDataSetPedidosvalortotal: TFloatField;
    ClientDataSetPedidosnome: TStringField;
    BitBtnSair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure editPesquisaChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ListarPedidos();
    procedure FiltrarPorCodigo(Codigo: string);
    procedure FiltrarPorNome(nome: String);
  public
    { Public declarations }
  end;

var
  FormListaDePedidos: TFormListaDePedidos;

implementation

{$R *.dfm}

uses PedidoControllerUnit, PedidoQueriesUnit, System.Generics.Collections;

{ TForm1 }

procedure TFormListaDePedidos.editPesquisaChange(Sender: TObject);
begin

  if editPesquisa.Text = EmptyStr then
     ClientDataSetPedidos.Filtered := False
  else
  begin
    if (RadioGroupFiltro.ItemIndex = 0 ) then
       FiltrarPorCodigo(EditPesquisa.Text)
    else
      FiltrarPorNome(EditPesquisa.Text)
  end;

end;

procedure TFormListaDePedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_ESCAPE then
  begin
     if MessageDlg('Deseja realmente sair da tela?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       close;
     end;
  end;
end;

procedure TFormListaDePedidos.FormShow(Sender: TObject);
begin
  ListarPedidos;
end;

procedure TFormListaDePedidos.ListarPedidos;
var
  PedidoController: TPedidoController;
  queries : TObjectList<TPedidoQueries>;
  I: Integer;
begin

  try

   PedidoController := TPedidoController.Create();

   try

     queries := PedidoController.ListarPedidos();

     for I := 0 to queries.Count -1 do
     begin
        ClientDataSetPedidos.Append;
        ClientDataSetPedidos.FieldByName('numpedido').AsInteger    := queries[I].NumPedido;
        ClientDataSetPedidos.FieldByName('dataemissao').AsString   := queries[I].DataEmissao;
        ClientDataSetPedidos.FieldByName('codcliente').AsInteger   := queries[I].CodCliente;
        ClientDataSetPedidos.FieldByName('nome').AsString          := queries[I].Nome;
        ClientDataSetPedidos.FieldByName('valortotal').AsFloat     := queries[I].ValorTotal;

     end


    except on E: Exception do
       ShowMessage('Ocorreu um erro: ' + E.Message);
    end;
  finally
     PedidoController.Free;
   end;

end;

procedure TFormListaDePedidos.FiltrarPorCodigo(Codigo: string);
begin
  ClientDataSetPedidos.Filter := 'codcliente = ' + Codigo;
  ClientDataSetPedidos.Filtered := True;
end;

procedure TFormListaDePedidos.FiltrarPorNome(nome: String);
begin
  ClientDataSetPedidos.Filter := 'UPPER(nome) LIKE ''%' + UpperCase(Nome) + '%''';
  ClientDataSetPedidos.Filtered := True;
end;


end.
