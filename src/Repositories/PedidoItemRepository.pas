unit PedidoItemRepository;

interface

uses IPedidoItemInterfaceUnit, PedidoItemModelUnit, System.SysUtils, System.Generics.Collections;

type
  TPedidoItemRepository = class(TInterfacedObject, IPedidoItemInterface)
  public
    function BuscarPorCodigo(const NumPedido: Integer): TPedidoItem;
    function Listar: TObjectList<TPedidoItem>;
    function Adicionar(const PedidoItem: TPedidoItem): Boolean;
    function Atualizar(const PedidoItem: TPedidoItem): Boolean;
    function Excluir(const Id: Integer): Boolean;

  end;

implementation

{ TPedidoItemRepository }

uses Connection,
     FireDAC.Comp.Client,
     FireDAC.Stan.Intf,
     FireDAC.Phys,
     FireDAC.Phys.SQLite,
     FireDAC.Phys.SQLiteDef,
     FireDAC.Stan.Def,
     FireDAC.Stan.Async,
     FireDAC.DApt;

function TPedidoItemRepository.Listar: TObjectList<TPedidoItem>;
var
  Query: TFDQuery;
  PedidoItem: TPedidoItem;
begin

  Result := TObjectList<TPedidoItem>.Create;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := 'SELECT id,numpedido,codproduto,quant,valorunitario,valortotal FROM pedidos';
    Query.Open;
    while not Query.Eof do
    begin

      PedidoItem := TPedidoItem.Create;
      PedidoItem.ID := Query.FieldByName('id').AsInteger;
      PedidoItem.NumPedido := Query.FieldByName('numpedido').AsInteger;
      PedidoItem.CodProduto := Query.FieldByName('codigoproduto').AsInteger;
      PedidoItem.Quant := Query.FieldByName('quant').AsFloat;
      PedidoItem.ValorUnit := Query.FieldByName('valorunitario').AsFloat;
      PedidoItem.ValorTotal := Query.FieldByName('valortotal').AsFloat;

      Result.Add(PedidoItem);
      Query.Next;
    end;
  finally
    Query.Free;
  end;

end;

function TPedidoItemRepository.Adicionar(const PedidoItem: TPedidoItem): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('INSERT INTO pedidositens (numpedido,codproduto,quant,valorunitario,valortotal) VALUES (?, ?, ?, ?, ?)', [PedidoItem.NumPedido, PedidoItem.CodProduto,PedidoItem.Quant,PedidoItem.ValorUnit,PedidoItem.ValorTotal]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;

end;

function TPedidoItemRepository.Atualizar(const PedidoItem: TPedidoItem): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('UPDATE pedidositens SET numpedido = ?, codproduto = ?, quant = ?, valorunitario = ?, valortotal = ? WHERE id = ?', [PedidoItem.NumPedido,PedidoItem.CodProduto, PedidoItem.Quant,PedidoItem.ValorUnit,PedidoItem.ValorTotal,PedidoItem.ID]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;

end;

function TPedidoItemRepository.BuscarPorCodigo(
  const NumPedido: Integer): TPedidoItem;
begin

end;

function TPedidoItemRepository.Excluir(const Id: Integer): Boolean;
var
  conn: TFDConnection;
begin

  conn := GetConnection();
  Conn.StartTransaction;
  try
    conn.ExecSQL('DELETE FROM pedidositens WHERE id = ?', [Id]);
    Conn.Commit;
    Result := true;
  except
    Conn.Rollback;
    Result := false;
    raise;
  end;
end;

end.

