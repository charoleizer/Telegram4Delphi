unit telegram_api_usability;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    Button1: TButton;
    RESTResponse1: TRESTResponse;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  //https://api.telegram.org/bot816598649:AAFBT6epXzrhCi8cdn0PrQ8dk-eDOhKtwU4/getme
  //https://api.telegram.org/bot816598649:AAFBT6epXzrhCi8cdn0PrQ8dk-eDOhKtwU4/getUpdates
  //https://api.telegram.org/bot816598649:AAFBT6epXzrhCi8cdn0PrQ8dk-eDOhKtwU4/sendMessage?chat_id=744289911&text=Teste-Delphi
  RESTClient1.BaseURL := 'https://api.telegram.org/bot816598649:AAFBT6epXzrhCi8cdn0PrQ8dk-eDOhKtwU4/sendMessage?chat_id=744289911&text=Teste-Delphi';
  RESTRequest1.Execute;
  ShowMessage(RESTResponse1.JSONValue.GetValue<String>('ok'));
end;

end.
