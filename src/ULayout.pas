unit ULayout;

interface

uses
  Datasnap.DBClient, System.Classes;

Type
  TLayout = class(TComponent)
  private
    contadorColunas: integer;
    DataSet: TClientDataSet;
    vDados: array of array of string;
  public
    function ObterDataSet(): TClientDataSet;
    procedure DefineColuna(titulo, coluna: string);
    procedure Extracao(arquivo: string);
    constructor Create(const Tabela: string);
    destructor Destroy();
  end;

implementation

uses
  Data.DB, System.SysUtils, Vcl.StdCtrls, System.Types, Vcl.Forms;

{ TLayout }

constructor TLayout.Create(const Tabela: string);
begin
  contadorColunas := 0;
end;

procedure TLayout.DefineColuna(titulo, coluna: string);
begin
  // Criando uma matriz de 2 colunas para guardar titulo e nome da coluna
  SetLength(vDados, contadorColunas + 1);
  SetLength(vDados[contadorColunas], 2);
  vDados[contadorColunas, 0] := titulo;
  vDados[contadorColunas, 1] := coluna;
  contadorColunas := contadorColunas + 1;
end;

destructor TLayout.Destroy;
begin
  vDados := nil;
  DataSet.Close;
  DataSet.Destroy;
  FreeAndNil(DataSet);
end;

procedure TLayout.Extracao(arquivo: string);
var
  I, J, cont: integer;
  arquivoCSV: TextFile;
  linha: string;
  saida: TStrings;
begin


  AssignFile(arquivoCSV, arquivo);
  Reset(arquivoCSV);
  Readln(arquivoCSV, linha);
  while not Eoln(arquivoCSV) do
  begin
    DataSet.Insert;

    saida := TStringList.Create;
    ExtractStrings([';'], [], PChar(linha), saida);

    cont := 0;
    for J := 0 to Pred(Length(vDados)) do
    begin
      DataSet.FieldByName(vDados[J][1]).Text := saida[cont];
      cont := cont + 1;
    end;

    Readln(ArquivoCSV, Linha);
    DataSet.post;
     FreeAndNil(saida);
  end;

  CloseFile(arquivoCSV);


end;

function TLayout.ObterDataSet: TClientDataSet;
var
  I: integer;
  campoString: TStringField;
  titulo, coluna: string;
begin
  DataSet := TClientDataSet.Create(self);
  for I := 0 to Pred(Length(vDados)) do
  begin
    titulo := vDados[I, 0];
    coluna := vDados[I, 1];
    campoString := TStringField.Create(self);
    campoString.FieldName := coluna;
    campoString.DisplayLabel := titulo;
    campoString.Size := 150;
    campoString.DataSet := DataSet;
  end;

  DataSet.CreateDataSet;
  Result := DataSet;
end;

end.
