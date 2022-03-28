program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

//Проверка является ли строка цулым числом
function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X) and (X>0); //Проверка является ли число ЦЕЛЫМ
end;

//Рассчитаем число и сами комбинации
procedure solve(n:integer;history:string; var count:integer);
begin

  //Сначала, если это вохможно пробем добавить и
  if (n>=2) then
  begin
    //Если только и и влазит - вывод
    if (n=2) then
    begin
      Writeln(history+char(ord('и')-64));  //Извращения над кодом символа - для нормального вывода кирилицы в консоль
      count:=count+1;                      //Число найденных комбинаций +1
    end

    //Иначе рассматриваем остаток рекурсивно
    else
      solve(n-2,history+char(ord('и')-64),count);
  end;

  //Теперь попробуем встасить ш
  if (n>=3) then
  begin
    //Только ш и влазит - вывод
    if (n=3) then
    begin
      Writeln(history+char(ord('ш')-16));
      count:=count+1;           //Число найденных комбинаций +1
    end

    //Еще еть что вставлять - реурсивно
    else
      solve(n-3,history+char(ord('ш')-16),count);
  end;
end;

var
  count,n: integer;
  str:string;
begin
  write('Chislo simvolov: ');
  readln(str);
  while Not IsInteger(str) do
  begin
    Writeln('Nedopuctymu vvod.');
    write('Chislo simvolov: ');
    readln(str)
  end;
  writeln;
  Writeln('Kombinacii:');
  solve(StrToInt(str),'',count);
  writeln;
  writeln('Chislo kombinaciy: ',count);
  readln;
end.

