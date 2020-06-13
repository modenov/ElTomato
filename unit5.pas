unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, Forms, Controls, Graphics, Dialogs,
  ComCtrls, Unit4, Menus;

type

  { TForm5 }

  TForm5 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    SaveDialog1: TSaveDialog;
    StatusBar1: TStatusBar;
    SynEdit1: TSynEdit;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private

  public

  end;

var
  Form5: TForm5;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.MenuItem2Click(Sender: TObject);
begin
  synedit1.SelectAll;
  synedit1.ClearAll;
end;

procedure TForm5.MenuItem3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  synedit1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm5.MenuItem5Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.MenuItem7Click(Sender: TObject);
begin
  synedit1.Undo;
end;

procedure TForm5.MenuItem8Click(Sender: TObject);
begin
  synedit1.Redo;
end;

procedure TForm5.MenuItem20Click(Sender: TObject);
begin
  form4.ShowModal;
end;

procedure TForm5.MenuItem10Click(Sender: TObject);
begin
  synedit1.CutToClipboard;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  try
  synedit1.Lines.LoadFromFile('logeltomato.txt');
  except
  synedit1.Lines.SaveToFile('logeltomato.txt');
  end;
  synedit1.Lines.Add('');
  synedit1.Lines.Add('============ НАЧАЛО ЛОГА ЗА '+FormatDateTime('DD MMMM YYYY ГОДА', Now)+' ============');
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
  try
  synedit1.Lines.Add('============ КОНЕЦ ЛОГА ЗА '+FormatDateTime('DD MMMM YYYY ГОДА', Now)+' ============');
  synedit1.Lines.SaveToFile('logeltomato.txt');
  except
  Showmessage('Не удалось выполнить сохранение файла лога.'+#13+#13+'Убедитесь, что носитель, на котором запущена программа El Tomato, не повреждён и не защищён от записи.');
  end;
end;

procedure TForm5.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TForm5.MenuItem11Click(Sender: TObject);
begin
  synedit1.CopyToClipboard;
end;

procedure TForm5.MenuItem12Click(Sender: TObject);
begin
  synedit1.CopyToClipboard;
end;

procedure TForm5.MenuItem13Click(Sender: TObject);
begin
  synedit1.SelectAll;
end;

procedure TForm5.MenuItem15Click(Sender: TObject);
begin
  synedit1.SelectAll;
  synedit1.CutToClipboard;
end;

procedure TForm5.MenuItem16Click(Sender: TObject);
begin
  synedit1.SelectAll;
  synedit1.CopyToClipboard;
end;

procedure TForm5.MenuItem17Click(Sender: TObject);
begin
  synedit1.SelectAll;
  synedit1.PasteFromClipboard;
end;

end.

