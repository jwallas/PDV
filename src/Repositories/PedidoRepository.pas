unit PedidoRepository;

interface

uses
  IPedidoInterfaceUnit, PedidoModelUnit, PedidoQueriesUnit,
  System.SysUtils, System.Generics.Collections, System.DateUtils;

type
  TPedidoRepository = class(TInterfacedObject, IPedidoInterface)
  public
    function BuscarPorPedido(const NumPedido: Integer): TPedido;
    function BuscarPorCliente(const Codigo: Integer): TPedido;
    function BuscarUltimoPedido(): TPedido;
    function Listar: TObjectList<TPedidoQueries>;
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
     FireDAC.DApt,
     Functions;

function TPedidoRepository.Listar: TObjectList<TPedidoQueries>;
var
  Query: TFDQuery;
  Pedido: TPedidoQueries;
begin

  Result := TObjectList<TPedidoQueries>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT p.numpedido, p.dataemissao AS dataemissao, p.codcliente, c.nome, p.valortotal ' +
                      'FROM pedidos p ' +
                      'INNER JOIN clientes c ON p.codcliente = c.codigo order by p.numpedido ';
    Query.Open;
    while not Query.Eof do
    begin

      Pedido := TPedidoQueries.Create;
      Pedido.NumPedido := Query.FieldByName('numpedido').AsInteger;

      Pedido.DataEmissao := Query.FieldByName('dataemissao').AsString;

      Pedido.CodCliente := Query.FieldByName('codcliente').AsInteger;
      Pedido.Nome := Query.FieldByName('nome').AsString;
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

function TPedidoRepository.BuscarPorCliente(const Codigo: Integer): TPedido;
var
  Query: TFDQuery;
  Pedido : TPedido;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT * FROM pedidos where codcliente = :codcliente';
    Query.ParamByName('codcliente').AsInteger := Codigo;
    Query.Open;

    Pedido := TPedido.Create;
    if not Query.IsEmpty then
    begin
      MapQueryToModel(Query, Pedido);
    end;
    Result := Pedido;
  finally
    Query.Free;
  end;

end;

function TPedidoRepository.BuscarPorPedido(const NumPedido: Integer): TPedido;
var
  Query: TFDQuery;
  Pedido : TPedido;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT * FROM pedidos where numpedido = :numpedido';
    Query.ParamByName('numpedido').AsInteger := NumPedido;
    Query.Open;

    Pedido := TPedido.Create;
    if not Query.IsEmpty then
    begin
      MapQueryToModel(Query, Pedido);
    end;
    Result := Pedido;
  finally
    Query.Free;
  end;

end;

function TPedidoRepository.BuscarUltimoPedido: TPedido;
var
  Query: TFDQuery;
  Pedido : TPedido;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT numpedido FROM pedidos ORDER BY numpedido DESC limit 1';
    Query.Open;

    Pedido := TPedido.Create;
    if not Query.IsEmpty then
    begin
      MapQueryToModel(Query, Pedido);
    end;
    Result := Pedido;
  finally
    Query.Free;
  end;

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

