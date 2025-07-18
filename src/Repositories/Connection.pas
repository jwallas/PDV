unit Connection;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  System.Rtti, System.TypInfo, Data.DB,
  FireDAC.UI.Intf, Functions;

function GetConnection: TFDConnection;

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

var
  FConnection: TFDConnection;
  DriverLink: TFDPhysSQLiteDriverLink;


function GetConnection: TFDConnection;
begin
  if not Assigned(FConnection) then
  begin
    // Registrar Driver
    DriverLink := TFDPhysSQLiteDriverLink.Create(nil);

    // Criar Conexão
    FConnection := TFDConnection.Create(nil);
    FConnection.DriverName := 'SQLite';
    FConnection.Params.Database := 'PDV.db';
    FConnection.Params.Add('LockingMode=Normal');
    FConnection.LoginPrompt := False;
    FConnection.Connected := True;

    FConnection.ExecSQL('PRAGMA foreign_keys = ON;');

    CreateTable(FConnection);
    CreateIndex(FConnection);

  end;

  Result := FConnection;
end;

end.

