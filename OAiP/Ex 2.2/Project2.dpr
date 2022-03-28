program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const
  n=15;

type
  mas=array[1..n,1..n] of string;
  TDirArray= array[1..4] of Integer;
  TDirection = (Up,Down,Left,Right);

//Проверка является ли строка цулым числом
function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X) and (X>=0); //Проверка является ли число ЦЕЛЫМ
end;

//Вывод русских символов
function rus (mes: string) : string;
var
  i: integer;
begin
  for i := 1 to length (mes) do
    case mes[i] of
      'А'..'П', 'а'..'п', 'Р'..'Я': mes[i] := chr (ord (mes[i]) -64) ;
      'р'..'я': mes[i] := chr (ord (mes[i])-16);
    end;
  rus := mes;
end;

//Подготовка русских символов ко вводу
function ReadRus(mes: string) : string;
var
  i: integer;
begin
  for i := 1 to length (mes) do
    case mes[i] of
      'а'..'п': mes[i] := chr (ord (mes[i])+16);
    end;
  ReadRus := mes;
end;

//Функция составляет массив изменений шага. Указывается направление движения
//и является ли данное направление первым
function GetDirArray(dir:TDirection; first:boolean): TDirArray;
begin
  //Если направление первое - то сначала будет шаг потом стоим потом шаг по данной оси
  if first then
  begin
    result[1]:=1;
    result[2]:=0;
    result[3]:=1;
    result[4]:=0;
  end
  //Иначе наоборот
  else
  begin
    result[1]:=0;
    result[2]:=1;
    result[3]:=0;
    result[4]:=1;
  end;

  //Если двигаемся на уменшение координаты - первый шаг - отрицательный
  if (dir = Up) Or (dir=Left) then
  begin
    result[1]:=result[1]*(-1);
    result[2]:=result[2]*(-1);
  end
  //Иначе второй, и не важно на 3 или 4 месте он в массиве ведь 0*(-1)=0
  else
  begin
    result[3]:=result[3]*(-1);
    result[4]:=result[4]*(-1);
  end
end;


//Функция возвращает разложеннуэ в строку часть матрицы А начиная от позиции i,j с шагом по i - di
// по j - dj. Длина полученого участка - count
function GetLine(var A:mas;var i,j:integer;di,dj,count:integer):string;
var
  k:integer;
begin
  result:='';
  for k:=1 to count do             //Для каждого рассматриваемого символа
  begin
    i:=i+di;                       //Изменяем
    j:=j+dj;                       //i и j
    result:=result+A[i,j];         //Дописываем к результату
  end;
end;


//Функция кодирует массив А разлаживая его по цепочке
function Code(A:mas;DirI,DirJ:TDirArray):string;
var
  i,j:integer;
  k:integer;
begin
  i:=(n+1) div 2;                 // Начальные
  j:=(n+1) div 2;                 // координаты
  result:=A[i,j];

  //Рассмотрим спираль как фигуру состоящую из 5-х (для массива 11х11) контуров будем разворачивать каждый в цикле
  for k:=0 to (n-3) div 2 do
  begin
    result:=result+GetLine(A,i,j,DirI[1],DirJ[1],2*k+1);   // Первые две стороны контура
    result:=result+GetLine(A,i,j,DirI[2],DirJ[2],2*k+1);   // имеют меншую длинну
    result:=result+GetLine(A,i,j,DirI[3],DirJ[3],2*k+2);   // Ещё две
    result:=result+GetLine(A,i,j,DirI[4],DirJ[4],2*k+2);   // большую
  end;
    result:=result+GetLine(A,i,j,DirI[1],DirJ[1],n-1)       //Последняя линия не вошла в спираль  - добавим её

end;

//Записывает строку в матрицу по строкам
function LineToMarix(str:string):mas;
var
  i,j:integer;
begin
  for i:=1 to n do
    for j:=1 to n do
      result[i,j]:=str[n*(i-1)+j];  // номер строки - целая часть от деления на n, cстолбец - остаток
end;

//Возвращает случайную пару направлений
procedure RandomDirectionPair(out FirstD,SecondD:TDirection);
var
  TempD:TDirection;
begin
//Одно из направлений вверх или вниз
  if Round(Random(2))-1=0 then
    FirstD:=Up
  else
    FirstD:=Down;

//Второе влево или вправо
  if Round(Random(2))-1=0 then
    SecondD:=Left
  else
    SecondD:=Right;

//Какое-то из них первое
  if Round(Random(2))-1=0 then
  begin
    TempD:=SecondD;
    SecondD:=FirstD;
    FirstD:=TempD;
  end;

end;

//Полное кодирование строки s на DirCount проходов
function AllCode(s:string;DirCount:integer):string;
var
  i:integer;
  Directions:array of array[0..1] of TDirection;
  Di,Dj:TDirArray;
  TempD1,TempD2:TDirection;
  tstr:string;
begin
  SetLength(Directions,DirCount);    //Иниц. динамический массив направлений

  for i:=0 to DirCount-1 do
  begin
    //Получаем случаюную пару направлений и записыв. в массив
    RandomDirectionPair(TempD1,TempD2);
    Directions[i][0]:=TempD1;
    Directions[i][1]:=TempD2;

    //Определяем какое из направлений по Ox, какое по Oy и получаем массивы смещений
    if (TempD1 = Up) Or (TempD1 = Down) then
    begin
      Di:=GetDirArray(TempD1,true);
      Dj:=GetDirArray(TempD2,false)
    end
    else
    begin
      Dj:=GetDirArray(TempD1,true);
      Di:=GetDirArray(TempD2,false)
    end;

    //Кодируем на текущй паре повторений
    s:=Code(LineToMarix(s),Di,Dj);
  end;

  //Дописывем число итераций в итоговую строку
  tstr:=IntToStr(DirCount);
  s:=s+IntToStr(Length(tstr));
  s:=s+tstr;

  //Дописываем направления в итоговую строку
  for i:=0 to DirCount-1 do
    s:=s+IntToStr(Ord(Directions[i][0]))+IntToStr(Ord(Directions[i][1]));

  result:=s;
end;


//Функция добавляет в матрицу А символы из строки s, начиная с позиции ss. Вставка в матрицу начиная от позиции i,j
//с шагом по i - di по j - dj. Длина всталяемого участка - count
procedure SetLine(var A:mas;var i,j:integer;di,dj,count:integer;s:string;ss:integer);
var
  k:integer;
begin
  for k:=1 to count do             //Для каждого рассматриваемого символа
  begin
    i:=i+di;                       //Изменяем
    j:=j+dj;                       //i и j
    A[i,j]:=s[ss+k];               //Дописываем к результату
  end;
end;

function DeCode(s:string;DirI,DirJ:TDirArray):mas;
var
  i,j,ss:integer;
  k:integer;
  A:mas;
begin
  i:=(n+1) div 2;                 // Начальные
  j:=(n+1) div 2;                 // координаты
  A[i,j]:=s[1];
  ss:=1;

  //Рассмотрим спираль как фигуру состоящую из 4-х (для массива 11х11) контуров будем разворачивать каждый в цикле
  for k:=0 to (n-3) div 2 do
  begin
    SetLine(A,i,j,DirI[1],DirJ[1],2*k+1,s,ss);   // Первые две стороны контура
    ss:=ss+2*k+1;
    SetLine(A,i,j,DirI[2],DirJ[2],2*k+1,s,ss);   // имеют меншую длинну
    ss:=ss+2*k+1;
    SetLine(A,i,j,DirI[3],DirJ[3],2*k+2,s,ss);   // Ещё две
    ss:=ss+2*k+2;
    SetLine(A,i,j,DirI[4],DirJ[4],2*k+2,s,ss);   // большую
    ss:=ss+2*k+2;
  end;
  SetLine(A,i,j,DirI[1],DirJ[1],n-1,s,ss);        //Последняя линия не вошла в спираль  - добавим её

  result:=A;
end;

//Разворачиваем матрицу в строку
function MatrixToLine(A:mas):string;
var
  i,j:integer;
begin
  result:='';
  for i:=1 to n do
    for j:=1 to n  do
      result:=result+A[i,j];
end;

//Проверка является ли строка допустимым закодированным текстом
function ChekForDecode(s:string):boolean;
var
  i,DirCount:integer;
begin
  result:=true;
  DirCount:=0;

  if (length(s) < n*n+1) or                 //Если в строке нет числа проходов
     ( Not ( s[n*n+1] in ['1'..'9'])) or    //Или записано не число
     (length(s) < n*n+1+StrToInt(s[n*n+1])) //Или чило проход неверной длины
   then result:=false;

  if result then
  //Проверяем явл ли число проходов числом
  for i:=n*n+2 to StrToInt(s[n*n+1]) do
    if Not(s[i] in ['0'..'9']) then  result:=false;

  if result then
  begin
    DirCount:=StrToInt(copy(s,n*n+2,StrToInt(s[n*n+1])));
    if length(s)<n*n+1+StrToInt(s[n*n+1]) + DirCount*2 then
      //Проверяем записаны ли все направления
      result:=false;
  end;

  //Проверяем правильны ли записанные направления
  if result then
    for i:=n*n+1+StrToInt(s[n*n+1])+1 to n*n+1+StrToInt(s[n*n+1])+DirCount*2 do
      if Not(s[i] in ['0'..'3']) then result:=false;

end;


//Полное раскодирование строки s на DirCount проходов
function AllDeCode(s:string):string;
var
  i,DirStart,DirCount:integer;
  Di,Dj:TDirArray;
  TempD1,TempD2:TDirection;
  Dirstr:string;
begin
  DirStart:=n*n+2+StrToInt(s[n*n+1]);               //Символ с которого записаны направления

  //Считывание DirCount
  Dirstr:='';
  for i:=n*n+2 to DirStart-1 do
    Dirstr:=Dirstr+s[i];
  DirCount:= StrToInt(Dirstr);
  Dirstr:=Copy(s,DirStart,DirCount*2);

  for i:=DirCount downto 1 do
  begin
    //Получаем пару направлений и записыв. в массив
    TempD1:=TDirection(StrToInt(Dirstr[i*2-1]));
    TempD2:=TDirection(StrToInt(Dirstr[i*2]));

    //Определяем какое из направлений по Ox, какое по Oy и получаем массивы смещений
    if (TempD1 = Up) Or (TempD1 = Down) then
    begin
      Di:=GetDirArray(TempD1,true);
      Dj:=GetDirArray(TempD2,false)
    end
    else
    begin
      Dj:=GetDirArray(TempD1,true);
      Di:=GetDirArray(TempD2,false)
    end;

    //Кодируем на текущй паре повторений
    s:=MatrixToLine(DeCode(s,Di,Dj));
  end;

  result:=s;
end;

//Придание строке длины в n*n символов
function CutStr(s:string):string;
var
  i,len:integer;
begin
  //Задание строке длинны 121
  len:=Length(s);
  Setlength(s,n*n);
  //Заполняем добавленне символы пустым символом, стирая случайные смволы там ранящиеся
  for i:=len+1 to n*n do
    s[i]:=char(0);
  CutStr:=s;
end;

//Загрузка строки (при необходимости из файла filename);
function LoadString(filename:string):string;
var
  tofile,s:string;
  f:TextFile;
  ok:boolean;
begin
  ok:=false; //Признак удачного ввода
  while not ok do
  begin
    Write(rus('Считать из файла? (Y/N): '));
    Readln(tofile);

    //Из файла
    if tofile='Y' then
    begin
      AssignFile(f,filename);
      {$I-}   //Так если файла не будет просто IOResult вернёт не 0,а не вылетит исключение
      Reset(f);
      {$I+}
      //Ошибка при открытии файла
      if IOResult <> 0 then
        Writeln(rus('Невеный ввод. Попробуйте еще раз'))
      else
      //Файл открыт без проблем
      begin
        Readln(f,s);
        CloseFile(f);
        ok:=true;
      end;
    end

    //Ввод из консоли
    else if tofile='N' then
    begin
      Writeln(rus('Ручной ввод: '));
      Readln(s);
      s:=ReadRus(s);
      ok:=true;
    end

    //Введено не Y не N
    else
      Writeln(rus('Невеный ввод. Попробуйте еще раз'));

    //Проверка на возможность декодиравания
    if ok and (filename='decode.txt') and (Not ChekForDecode(s)) then
    begin
      Writeln(rus('Неверный формат текста для кодирования'));
      ok:=ChekForDecode(s);
    end
  end;

  if filename='code.txt' then
    s:=CutStr(s);
  if tofile='Y' then
  begin
    Writeln(rus('Считана строка:'));
    Writeln(rus(s));
  end;
  LoadString:=s;
end;

var
  s,com,dc:string;
  DirCount:integer;
  f:TextFile;
begin
  Randomize;

  while true do
  begin
    Write(rus('Действие кодирование(code)/раскодирование(decode): '));
    Readln(com);
    if com='code' then
    begin
      s:=LoadString('code.txt');
      if Length(s)< 200 then
      begin
        Writeln(rus('Слишком короткая строка'));
        Readln;
        Exit;
      end;
      Writeln;

      //Поучаем число проходов
      Write(rus('Число проходов: '));
      Readln(dc);
      //Проверка на ввод допустимого значения
      while Not IsInteger(dc) do
      begin
        Writeln(rus('Неверный ввод.'));
        Write(rus('Число проходов: '));
        Readln(dc);
      end;

      DirCount:=StrToInt(dc);
      //Кодирование
      s:= AllCode(s,DirCount);

      Writeln(rus('Результат кодирования:'));
      Writeln(rus(s));
      Writeln;

      //Сохранение
      Write(rus('Сохранить в файл? (Y/N): '));
      Readln(com);
      if com = 'Y' then
      begin
        AssignFile(f,'decode.txt');
        Rewrite(f);
        Writeln(f,s);
        CloseFile(f);
        Writeln(rus('Кодированная запись сохранена.'));
      end;
    end
    else if com= 'decode' then
    begin
      s:=LoadString('decode.txt');
      Writeln;

      //Декодирование
      s:=AllDecode(s);
      Writeln(rus('Раскодированный текст:'));
      Writeln(rus(s));
    end;

    Writeln('----------------------------------------------------------');
    Writeln;
  end;
end.
