program Importador;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {Form2},
  ULayout in 'ULayout.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
