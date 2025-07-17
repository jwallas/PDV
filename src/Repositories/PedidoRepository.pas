unit PedidoRepository;

interface

uses
  IPedidoInterfaceUnit, PedidoModelUnit, System.SysUtils, System.Generics.Collections;

type
  TPedidoRepository = class(TInterfacedObject, IPedidoInterface)
  public
    function BuscarPorCodigo(const NumPedido: Integer): TPedido;
    function Listar: TObjectList<TPedido>;
    function Adicionar(const Pedido: TPedido): Boolean;
    function Atualizar(const Pedido: TPedido): Boolean;
    function Excluir(const NumPedido: Integer): Boolean;

  end;

implementation

{ TPedidoRepository }

uses Connection,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf,
     FireDAC.Phys,
     FireDAC.Phys.SQLite,
     FireDAC.Phys.SQLiteDef,
     FireDAC.Stan.Def,
     FireDAC.Stan.Async,
     FireDAC.DApt;

function TPedidoRepository.Listar: TObjectList<TPedido>;
var
  Query: TFDQuery;
  Pedido: TPedido;
begin

  Result := TObjectList<TPedido>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT numpedido,dataemissao,codcliente,valortotal FROM pedidos';
    Query.Open;
    while not Query.Eof do
    begin

      Pedido := TPedido.Create;
      Pedido.NumPedido := Query.FieldByName('numpedido').AsInteger;
      Pedido.DataEmissao := Query.FieldByName('dataemissao').AsDateTime;
      Pedido.CodCliente := Query.FieldByName('codcliente').AsInteger;
      Pedido.ValorTotal := Query.FieldByName('valortotal').AsFloat;

      Result.Add(Pedido);
      Query.Next;
    end;
  finally
    Query.Free;
  end;

end;

function TPedidoRepository.Adicionar(const Pedido: TPedido): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('INSERT INTO pedidos (dataemissao,codcliente,valortotal) VALUES (?, ?, ?)', [Pedido.DataEmissao,Pedido.CodCliente, Pedido.ValorTotal]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;

end;

function TPedidoRepository.Atualizar(const Pedido: TPedido): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('UPDATE pedidos SET dataemissao = ?, codcliente = ?, valortotal = ? WHERE numpedido = ?', [Pedido.DataEmissao,Pedido.CodCliente, Pedido.ValorTotal,Pedido.NumPedido]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;

end;

function TPedidoRepository.BuscarPorCodigo(const NumPedido: Integer): TPedido;
begin

end;

function TPedidoRepository.Excluir(const NumPedido: Integer): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('DELETE FROM pedidos WHERE numpedido = ?', [NumPedido]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;
end;

end.

