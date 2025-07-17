unit ProdutoViewModel;

interface

type
  TProdutoViewModel = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Double;
  published
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: String read FDescricao write FDescricao;
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
  end;

implementation

end.
