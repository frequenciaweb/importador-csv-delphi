unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  Datasnap.DBClient, ULayout;

type
  TForm2 = class(TForm)
    pnl_topo: TPanel;
    StatusBar1: TStatusBar;
    btn_acao: TButton;
    OpenDialog1: TOpenDialog;
    pnl_central: TPanel;
    MemArquivo: TMemo;
    dbGridDados: TDBGrid;
    DsLayout: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btn_acaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure Importar(Sender: TObject);
    procedure Carregar(Sender: TObject);
    procedure MontarLayOut();
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Layout: TLayout;

implementation

{$R *.dfm}


procedure TForm2.btn_acaoClick(Sender: TObject);
begin
  // Evento foi adicionado no oncreate do form
end;

procedure TForm2.Carregar(Sender: TObject);
begin
   if OpenDialog1.Execute then
   begin
     MemArquivo.Clear;
     MemArquivo.Lines.LoadFromFile(OpenDialog1.FileName);
     btn_acao.OnClick := Importar;
     btn_acao.Caption := 'Importar';

     Layout.Extracao(OpenDialog1.FileName);//realiza a extração do arquivo e popula o dataset

   end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  //Criando o Objeto que vai controlar o layout
  Layout := TLayout.Create('nome-da-tabela');

  btn_acao.Caption := 'Carregar';
  btn_acao.OnClick := Carregar;
  MontarLayOut();
end;

procedure TForm2.Importar(Sender: TObject);
begin

end;

procedure TForm2.MontarLayOut;
begin
  //definindo as colunas do banco e do ClietDataSet dinamico
  layout.DefineColuna('Diretório', 'diretorio');
  layout.DefineColuna('Data e Hora','data');

  //pegando o dataset montado no layout para repassar ao dbgrid
  DsLayout.DataSet := layout.ObterDataSet();
end;

end.

