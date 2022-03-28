program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils,Math;
const
  PCount=10;
type
  mas=array[1..2,1..PCount]of real;

//2 point distance
function Dist(x1,x2,y2:real):real;
begin
  result:=sqrt(sqr(x2-x1)+y2*y2);
end;

//max distance
function MaxForPoint(P:mas;x:real):real;
var
  i:integer;
  temp:real;
begin
  result:=Dist(x,P[1,1],P[2,1]);
  for i := 2 to PCount do
  begin
    temp:=Dist(x,P[1,i],P[2,i]);
    if temp>result then          //save max
      result:=temp;
  end;//for
end;

//Пошук кропкі на інтэрвале first-last па кропках P з дакладнасцю eps.
//У dist вяртаецца адлегласць для гэтай кропкі
function Solve(first,last:real; P:mas; eps:real; var dist:real):real;
var
  x,minx,min,max:real;
begin
  x:=first;
  min:=MaxForPoint(P,x);
  minx:=x;

  // Пераглядаем усе кропкі на інтэрвале
  while x < last do
  begin
    max:=MaxForPoint(P,x);

    //Калі гэта вяліка менш папярэдняй - перазапіс
    if max<min then
    begin
      min:=max;
      minx:=x;
    end;//if
    x:=x+eps;

  end;//while

  //Вывад
  result:=minx;
  dist:=min;
end;

//borders of search
procedure FindFirstLast(P:mas;var min,max:real);
var
  i:integer;
begin
  min:=P[1,1];
  max:=P[1,1];

  //Шукаем макс і мін ў масіве P[1]
  for i:=2 to PCount do
  begin
    if P[1,i]<min then
      min:=P[1,i];

    if P[1,i]>max then
      max:=P[1,i];
  end
end;

//Вяртае колькі сімбалаў неабходна для вываду пры дакладнасці eps
function Dim(eps:real):integer;
var
  t:integer;
begin
  t:=Ceil(-ln(eps)/ln(10));  // -log10 eps

  if t<=0 then result:=0
  else result:=t;
end;

var
  eps:real;
  eps1:real;
  first,last:real;
  distan,x:real;
  Points:mas=((145,33,33,122,78,126,125,114,126,138),(112,168,162,58,98,82,93,-58,-28,-62));
begin
  Writeln('Vvedite tochnost: ');
  Readln(eps);

  FindFirstLast(Points,first,last);

  //Спачатку праходзім усю дыстанцыю з вялікім крокам, потом менш і менш, пакль крок не стане раўным eps
  eps1:=(last-first)/100;
  while eps>eps do
  begin
    x:=Solve(first,last,Points,eps1,distan);
    first:=x-eps1/2;
    last:=x+eps1/2;
    eps1:=eps1/100;
  end;

  //Апошні праход з дакладнасцю eps
  x:=Solve(first,last,Points,eps,distan);


  Writeln('Tochka: (',x:(Dim(eps)+length(inttostr(trunc(x)))+1):Dim(eps),',0)');
  Writeln('Rasstoyanie: ',distan:6:2);

  readln;
end.
