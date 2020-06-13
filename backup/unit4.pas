unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Windows, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }

procedure TForm4.Button2Click(Sender: TObject);
begin
 Close;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
 ShellExecute(Handle, nil, 'https://github.com/modenov', nil, nil, SW_SHOW);
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
 ShellExecute(Handle, nil, 'https://modenov.ru/', nil, nil, SW_SHOW);
end;

end.

