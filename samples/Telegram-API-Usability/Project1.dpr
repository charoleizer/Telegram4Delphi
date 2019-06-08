program Project1;

uses
  Vcl.Forms,
  telegram_api_usability in 'telegram_api_usability.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
