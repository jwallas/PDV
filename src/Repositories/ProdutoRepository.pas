unit ProdutoRepository;

interface

uses
  IProdutoInterfaceUnit, ProdutoModelUnit, System.SysUtils, System.Generics.Collections;

type
  TProdutoRepository = class(TInterfacedObject, IProdutoInterface)
  public
    function BuscarPorCodigo(const Codigo: Integer): TProduto;
    function Listar: TObjectList<TProduto>;
    function Adicionar(const Produto: TProduto): Boolean;
    function Atualizar(const Produto: TProduto): Boolean;
    function Excluir(const Codigo: Integer): Boolean;

  end;

implementation

{ TProdutoRepository }

uses Connection,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf,
     FireDAC.Phys,
     FireDAC.Phys.SQLite,
     FireDAC.Phys.SQLiteDef,
     FireDAC.Stan.Def,
     FireDAC.Stan.Async,
     FireDAC.DApt;

function TProdutoRepository.Listar: TObjectList<TProduto>;
var
  Query: TFDQuery;
  Produto: TProduto;
begin
  Result := TObjectList<TProduto>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT codigo,descricao,precovenda FROM produtos';
    Query.Open;
    while not Query.Eof do
    begin
      Produto := TProduto.Create;
      Produto.Codigo := Query.FieldByName('codigo').AsInteger;
      Produto.Descricao := Query.FieldByName('descricao').AsString;
      Produto.PrecoVenda := Query.FieldByName('precovenda').AsFloat;

      Result.Add(Produto);
      Query.Next;
    end;
  finally
    Query.Free;
  end;

end;

function TProdutoRepository.Adicionar(const Produto: TProduto): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('INSERT INTO produtos (descricao,precovenda) VALUES (?, ?)', [Produto.Descricao,Produto.PrecoVenda]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;

end;

function TProdutoRepository.Atualizar(const Produto: TProduto): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('UPDATE produtos SET descricao = ?, precovenda = ? WHERE codigo = ?', [Produto.Descricao, Produto.PrecoVenda,Produto.Codigo]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;

end;

function TProdutoRepository.BuscarPorCodigo(const Codigo: Integer): TProduto;
begin

end;

function TProdutoRepository.Excluir(const Codigo: Integer): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('DELETE FROM produtos WHERE Codigo = ?', [Codigo]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;
end;

end.

