unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type
  TArrayIntegers64 = array of int64;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    procedure GenerateRandomNumbers(pNo: word; pFrom, pTo: int64; var pArrayInt64: TArrayIntegers64);
    function GenerateRandomNumber(pFrom, pTo: int64): int64;
    function GenerateRandomIP(pTemplate: string = ''): string;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: word;

begin
  Randomize;

  for i := 0 to 10 do
  begin
    Memo1.Append(RandomRange(1, 100).ToString);
  end;

  Memo1.Append('--------');

  for i := 0 to 10 do
  begin
    Memo1.Append(RandomRange(1, 100).ToString);
  end;
end;

procedure TForm1.GenerateRandomNumbers(pNo: word; pFrom, pTo: int64; var pArrayInt64: TArrayIntegers64);
var
  i: word;

begin
  SetLength(pArrayInt64, pNo);

  Randomize;
  for i := Low(pArrayInt64) to High(pArrayInt64) do
  begin
    pArrayInt64[i] := RandomRange(pFrom, pTo);
  end;
end;

function TForm1.GenerateRandomNumber(pFrom, pTo: int64): int64;
begin
  Randomize;
  Result := RandomRange(pFrom, pTo);
end;

function TForm1.GenerateRandomIP(pTemplate: string = ''): string;
begin
  if Length(pTemplate) = 0 then
  begin
    Result := GenerateRandomNumber(0, 256).ToString + '.' + GenerateRandomNumber(0, 256).ToString + '.' + GenerateRandomNumber(0, 256).ToString + '.' + GenerateRandomNumber(0, 256).ToString;
    exit;
  end;

  //*.1*2.??1.1?1
end;

end.