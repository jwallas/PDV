unit Functions;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  System.Rtti, System.TypInfo, Data.DB,
  FireDAC.UI.Intf;

function CreateTable( FConnection: TFDConnection ): boolean;
function CreateIndex( FConnection: TFDConnection) : Boolean;
procedure MapQueryToModel(AQuery: TFDQuery; AModel: TObject);

implementation

uses
  FireDAC.Stan.Factory,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Option,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef;

  function CreateTable( FConnection: TFDConnection ): boolean;
  begin
     // Criar Tabela (se necessário)
    FConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS clientes (' +
      'codigo INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'nome TEXT, cidade TEXT, uf TEXT)');

    FConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS produtos (' +
      'codigo INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'descricao TEXT, precovenda REAL)');

     FConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS pedidos (' +
      'numpedido INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'dataemissao TEXT, codcliente INTEGER, valortotal REAL)' );

      FConnection.ExecSQL(
      'CREATE TABLE IF NOT EXISTS pedidositens (' +
      'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      'numpedido INTEGER, codproduto INTEGER, quant REAL,' +
      'valorunitario REAL, valortotal REAL,' +
      'FOREIGN KEY (numpedido) REFERENCES pedidos(numpedido) ON DELETE CASCADE)' );

      result := true;

  end;

  function CreateIndex( FConnection: TFDConnection) : Boolean;
  begin
    FConnection.ExecSQL( 'CREATE INDEX IF NOT EXISTS idx_codcliente ON pedidos (codcliente)');
    FConnection.ExecSQL( 'CREATE INDEX IF NOT EXISTS idx_numpedido ON pedidositens (numpedido)');
    FConnection.ExecSQL( 'CREATE INDEX IF NOT EXISTS idx_codproduto ON pedidositens (codproduto)');
  end;


procedure MapQueryToModel(AQuery: TFDQuery; AModel: TObject);
var
  RttiCtx: TRttiContext;
  RttiType: TRttiType;
  Prop: TRttiProperty;
  Field: TField;
begin
  RttiCtx := TRttiContext.Create;
  try
    RttiType := RttiCtx.GetType(AModel.ClassType);

    for Prop in RttiType.GetProperties do
    begin
      if Prop.IsWritable then
      begin
        Field := AQuery.FindField(Prop.Name);

        if Assigned(Field) then
        begin
          case Field.DataType of
            ftAutoInc,ftInteger, ftSmallint, ftWord:
              Prop.SetValue(AModel, Field.AsInteger);
            ftFloat, ftBCD, ftFMTBcd:
              Prop.SetValue(AModel, Field.AsFloat);
            ftString, ftWideString, ftWideMemo, ftMemo, ftFixedWideChar:
              Prop.SetValue(AModel, Field.AsString);
            ftBoolean:
              Prop.SetValue(AModel, Field.AsBoolean);
            ftDate, ftTime, ftDateTime:
              Prop.SetValue(AModel, Field.AsDateTime);
          else
            // Trate outros tipos conforme necessidade
          end;
        end;
      end;
    end;

  finally
    RttiCtx.Free;
  end;
end;

end.
