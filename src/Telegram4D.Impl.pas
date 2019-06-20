unit Telegram4D.Impl;

interface

uses
  System.JSON,
  REST.Client;

type
  TTelegram4DObject = class
    baseURL: String;
    botToken: String;
    chat_id: String;
  end;

  ITelegram4D = interface
  ['{E00CF1E9-CD38-42A9-9C8E-1B2DB901D38A}']
    function getTelegram4DObject: TTelegram4DObject;
    function getMe: TJSONValue;
    function sendMessage(TextMessage: String): TJSONValue;
  end;

  TTelegram4DImpl = class(TInterfacedObject, ITelegram4D)
    function getTelegram4DObject: TTelegram4DObject;
    function getMe: TJSONValue;
    function sendMessage(TextMessage: String): TJSONValue;

  private
    FTelegram4DObject: TTelegram4DObject;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;

  public
    property Telegram4DObject: TTelegram4DObject read getTelegram4DObject write FTelegram4DObject;

    constructor Create; reintroduce;
    destructor Destroy; override;
  end;

implementation

uses
  System.Classes;


{ TTelegram4DImpl }

constructor TTelegram4DImpl.Create;
begin
  inherited Create;
  FTelegram4DObject    := TTelegram4DObject.Create;
  RESTClient           := TRESTClient.Create('');
  RESTResponse         := TRESTResponse.Create(nil);
  RESTRequest          := TRESTRequest.Create(nil);
  RESTRequest.Client   := RESTClient;
  RESTRequest.Response := RESTResponse;
end;



destructor TTelegram4DImpl.Destroy;
begin
  RESTRequest.Free;
  RESTResponse.Free;
  RESTClient.Free;
  FTelegram4DObject.Free;
  inherited;
end;



function TTelegram4DImpl.getTelegram4DObject: TTelegram4DObject;
begin
  Result := FTelegram4DObject;
end;



function TTelegram4DImpl.getMe: TJSONValue;
const
  _ENDPOINT = '/getMe';
begin
  RESTClient.BaseURL :=
    FTelegram4DObject.baseURL +
    FTelegram4DObject.botToken + _ENDPOINT;

  RESTRequest.Execute;
  Result := RESTResponse.JSONValue;
end;



function TTelegram4DImpl.sendMessage(TextMessage: String): TJSONValue;
const
  _ENDPOINT = '/sendMessage?';
  _CHAT_ID =  'chat_id=';
  _TEXT = 'text=';
  _AND = '&';
begin
  { TODO : Implement to request with all parameters }
  RESTClient.BaseURL :=
    FTelegram4DObject.baseURL +
    FTelegram4DObject.botToken +
    _ENDPOINT + _CHAT_ID + FTelegram4DObject.chat_id + _AND +
    _TEXT + TextMessage;

  RESTRequest.Execute;
  Result := RESTResponse.JSONValue;
end;

end.
