unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, mmsystem, ComCtrls, Windows, Unit2, Unit3, Unit4, Unit5, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ImageList1: TImageList;
    Label2: TLabel;
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
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Timer3: TTimer;
    work: TButton;
    relax: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure relaxClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure workClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Time: LongInt;
  WorkInt: Integer;
  RelaxInt: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
var
  H,M,S: Byte;
  begin Dec(Time);
   S := Time mod 60;
   M := Time div 60 mod 60;
   H := Time div 3600;
   label1.Caption:=IntToStr(H) + ':' + IntToStr(M) + ':' + IntToStr(S);
   button1.enabled:=true;
   button1.Caption:='Стоп';
   label2.visible:=false;
   if Time = 0 then begin
    relaxClick(Sender);
    Timer1.Enabled:=false;
    Time:=RelaxInt;
    Timer2.Enabled:=true;
    label2.visible:=true;
    StatusBar1.SimpleText:=' Отдых! Встаньте, разомнитесь, переключите внимание на другие вещи. Об окончании паузы вас оповестит звук.';
    Label1.Font.Color:=clGray;
    form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — === ПЕРЕРЫВ '+FloatToStr(RelaxInt/60)+' МИНУТ! === ');
   end;
  end;

procedure TForm1.Timer2Timer(Sender: TObject);
  var
  H,M,S: Byte;
  begin Dec(Time);
   S := Time mod 60;
   M := Time div 60 mod 60;
   H := Time div 3600;
   label1.Caption:=IntToStr(H) + ':' + IntToStr(M) + ':' + IntToStr(S);
   button1.enabled:=false;
   if Time = 0 then begin
    workClick(Sender);
    Timer2.Enabled:=false;
    Time:=WorkInt;
    Timer1.Enabled:=true;
    StatusBar1.SimpleText:=' И снова в бой, снова за работу! Я верю, сегодня вы свернёте горы!';
    Label1.Font.Color:=clRed;
    form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — === РАБОТА НА '+FloatToStr(WorkInt/60)+' МИНУТ! === ');
   end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
form1.Caption:='El Tomato by Modenov — ['+FormatDateTime('dd.mm.yyyy г., hh:nn:ss', Now)+', работа: '+FloatToStr(WorkInt/60)+' мин., перерыв: '+FloatToStr(RelaxInt/60)+' мин.]';
end;

procedure TForm1.workClick(Sender: TObject);
begin
    try
  sndPlaySound('work.wav', SND_ASYNC);
 except
  sysutils.beep();
 end;
 if MenuItem46.Checked = true then form3.ShowModal;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 button2.Enabled:=true;
 if button1.Caption='Старт!'then
 begin
  Timer1Timer(Self);
  Timer1.Enabled:=true;
  Label1.Font.Color:=clRed;
  StatusBar1.SimpleText:=' Теперь окно программы можно свернуть. Об отходе на отдых вас оповестит звук.';
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Работа на '+label1.Caption+' минут;');
  end else begin
    button1.Caption:='Старт!';
    timer1.Enabled:=false;
    timer2.Enabled:=false;
    Label1.Font.Color:=clActiveBorder;
    StatusBar1.SimpleText:=' Пауза, значит. Окей:) Как будете готовы продолжить — вы знаете, что делать.';
    form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Пауза в работе на '+label1.Caption+' минуте;');
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   timer1.Enabled:=false;
   timer2.Enabled:=false;
   Label1.Font.Color:=clActiveBorder;
   Time:=WorkInt;
   StatusBar1.SimpleText:=' Таймер сброшен.';
   button2.Enabled:=false;
   button1.Enabled:=true;
   button1.Caption:='Старт!';
   label2.visible:=false;
   form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Сброс таймера на '+label1.Caption+' минуте;');
   Label1.Caption:='Начинай творить';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  WorkInt:=1500;
  RelaxInt:=300;
  Time:=WorkInt;
  Timer3Timer(Self);
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  RelaxInt:=900;
  Time:=RelaxInt;
  MenuItem17.checked:=true;
  MenuItem18.checked:=false;
  MenuItem19.checked:=false;
  label2.visible:=false;
  RelaxInt:=300;
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  WorkInt:=1500;
  Time:=WorkInt;
  MenuItem10.checked:=true;
  MenuItem16.checked:=false;
  MenuItem15.checked:=false;
  MenuItem11.checked:=false;
  MenuItem12.checked:=false;
  MenuItem13.checked:=false;
  MenuItem14.checked:=false;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Рабочий таймер установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  WorkInt:=1800;
  Time:=WorkInt;
  MenuItem11.checked:=true;
  MenuItem16.checked:=false;
  MenuItem15.checked:=false;
  MenuItem10.checked:=false;
  MenuItem12.checked:=false;
  MenuItem13.checked:=false;
  MenuItem14.checked:=false;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Рабочий таймер установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  WorkInt:=2400;
  Time:=WorkInt;
  MenuItem12.checked:=true;
  MenuItem16.checked:=false;
  MenuItem15.checked:=false;
  MenuItem10.checked:=false;
  MenuItem11.checked:=false;
  MenuItem13.checked:=false;
  MenuItem14.checked:=false;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Рабочий таймер установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  WorkInt:=3000;
  Time:=WorkInt;
  MenuItem13.checked:=true;
  MenuItem16.checked:=false;
  MenuItem15.checked:=false;
  MenuItem10.checked:=false;
  MenuItem11.checked:=false;
  MenuItem12.checked:=false;
  MenuItem14.checked:=false;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Рабочий таймер установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  WorkInt:=3600;
  Time:=WorkInt;
  MenuItem14.checked:=true;
  MenuItem16.checked:=false;
  MenuItem15.checked:=false;
  MenuItem10.checked:=false;
  MenuItem11.checked:=false;
  MenuItem12.checked:=false;
  MenuItem13.checked:=false;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Рабочий таймер установлен на '+FloatToStr(WorkInt/60)+' минут;');
 end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
 WorkInt:=1200;
 Time:=WorkInt;
 MenuItem15.checked:=true;
 MenuItem16.checked:=false;
 MenuItem10.checked:=false;
 MenuItem11.checked:=false;
 MenuItem12.checked:=false;
 MenuItem13.checked:=false;
 MenuItem14.checked:=false;
 form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Рабочий таймер установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  WorkInt:=900;
  Time:=WorkInt;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Рабочий таймер установлен на '+FloatToStr(WorkInt/60)+' минут;');
  MenuItem16.checked:=true;
  MenuItem15.checked:=false;
  MenuItem10.checked:=false;
  MenuItem11.checked:=false;
  MenuItem12.checked:=false;
  MenuItem13.checked:=false;
  MenuItem14.checked:=false;
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  RelaxInt:=300;
  MenuItem17.checked:=true;
  MenuItem18.checked:=false;
  MenuItem19.checked:=false;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Таймер отдыха установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  RelaxInt:=600;
  MenuItem17.checked:=false;
  MenuItem18.checked:=true;
  MenuItem19.checked:=false;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Таймер отдыха установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem19Click(Sender: TObject);
begin
  RelaxInt:=900;
  MenuItem17.checked:=false;
  MenuItem18.checked:=false;
  MenuItem19.checked:=true;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Таймер отдыха установлен на '+FloatToStr(WorkInt/60)+' минут;');
end;

procedure TForm1.MenuItem20Click(Sender: TObject);
begin
  Time:=Time+600;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Таймер увеличен на 10 минут ('+label1.Caption+');');
end;

procedure TForm1.MenuItem21Click(Sender: TObject);
begin
  Time:=Time-600;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Таймер уменьшен на 10 минут ('+label1.Caption+');');
end;

procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  form5.showmodal;
end;

procedure TForm1.MenuItem26Click(Sender: TObject);
begin
     ShellExecute(Handle, nil, 'https://github.com/modenov', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem27Click(Sender: TObject);
begin
     ShellExecute(Handle, nil, 'https://t.me/vovusique', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem29Click(Sender: TObject);
begin
     ShellExecute(Handle, nil, 'https://github.com/modenov', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem30Click(Sender: TObject);
begin
     ShellExecute(Handle, nil, 'https://losttapes.ru/', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem34Click(Sender: TObject);
begin
     ShellExecute(Handle, nil, 'https://vk.com/vmodenov', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem37Click(Sender: TObject);
begin
     form4.ShowModal;
end;

procedure TForm1.MenuItem40Click(Sender: TObject);
begin
   ShellExecute(Handle, nil, 'https://ru.wikipedia.org/wiki/%D0%9C%D0%B5%D1%82%D0%BE%D0%B4_%D0%BF%D0%BE%D0%BC%D0%B8%D0%B4%D0%BE%D1%80%D0%B0', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem42Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://insitory.ru/pomodoro.html', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem44Click(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'https://habr.com/company/smartprogress/blog/295274/', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem46Click(Sender: TObject);
begin
 if MenuItem46.Checked = true then
 MenuItem46.Checked:=false else
 MenuItem46.Checked:=true;
end;

procedure TForm1.MenuItem47Click(Sender: TObject);
begin
   ShellExecute(Handle, nil, 'https://modenov.ru/', nil, nil, SW_SHOW);
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
    Time:=Time+60;
    form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Таймер увеличен на одну минуту ('+label1.Caption+');');
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Time:=Time-60;
  form5.SynEdit1.Lines.Add(FormatDateTime('dddd, dd.mm.yyyy г., hh:nn:ss', Now)+' — Таймер уменьшен на одну минуту ('+label1.Caption+');');
end;

procedure TForm1.relaxClick(Sender: TObject);
begin
 try
sndPlaySound('relax.wav', SND_ASYNC);
except
 sysutils.beep();
end;
 if MenuItem46.Checked = true then form2.ShowModal;
end;

end.

