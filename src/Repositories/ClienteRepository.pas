unit ClienteRepository;

interface

uses
  IClienteInterfaceUnit, ClienteModelUnit, System.SysUtils, System.Generics.Collections;

type
  TClienteRepository = class(TInterfacedObject, IClientInterface)
  public
    function BuscarPorCodigo(const Codigo: Integer): TCliente;
    function Listar: TObjectList<TCliente>;
    function Adicionar(const Cliente: TCliente): Boolean;
    function Atualizar(const Cliente: TCliente): Boolean;
    function Excluir(const Codigo: Integer): Boolean;

  end;

implementation

{ TClienteRepository }

uses Connection,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf,
     FireDAC.Phys,
     FireDAC.Phys.SQLite,
     FireDAC.Phys.SQLiteDef,
     FireDAC.Stan.Def,
     FireDAC.Stan.Async,
     FireDAC.DApt;

function TClienteRepository.Listar: TObjectList<TCliente>;
var
  Query: TFDQuery;
  Cliente: TCliente;
begin
  Result := TObjectList<TCliente>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT codigo,nome,cidade,uf FROM clientes';
    Query.Open;
    while not Query.Eof do
    begin
      Cliente := TCliente.Create;
      Cliente.Codigo := Query.FieldByName('codigo').AsInteger;
      Cliente.Nome   := Query.FieldByName('nome').AsString;
      Cliente.Cidade := Query.FieldByName('cidade').AsString;
      Cliente.uf     := Query.FieldByName('uf').AsString;
      Result.Add(Cliente);
      Query.Next;
    end;
  finally
    Query.Free;
  end;

end;

function TClienteRepository.Adicionar(const Cliente: TCliente): Boolean;
var
  conn: TFDConnection;
begin

   conn := GetConnection();

   Conn.StartTransaction;
  try
    conn.ExecSQL('INSERT INTO clientes (nome,cidade,uf) VALUES (?, ?, ?)', [ Cliente.nome, Cliente.Cidade, Cliente.UF]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;
end;

function TClienteRepository.Atualizar(const Cliente: TCliente): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('UPDATE clientes SET nome = ?, cidade = ?, uf = ? WHERE codigo = ?', [Cliente.nome, Cliente.Cidade, Cliente.UF, Cliente.Codigo]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;


end;

function TClienteRepository.BuscarPorCodigo(const Codigo: Integer): TCliente;
begin

end;

function TClienteRepository.Excluir(const Codigo: Integer): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('DELETE FROM clientes WHERE Codigo = ?', [Codigo]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;

end;

end.

