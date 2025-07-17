unit ClienteModelUnit;

interface

type
  TCliente = class
  private
    FCodigo: Integer;
    FNome: string;
    FCidade: string;
    FUF: String;
  published
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property UF: String read FUF write FUF;
  end;

implementation

end.
