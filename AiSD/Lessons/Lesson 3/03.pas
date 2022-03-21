var
  data, next: array [0..10000] of integer;
  first, last, firstE: integer;
  i: integer;

procedure NewL(var x: integer);
begin
  x := firstE;
  firstE := next[firstE];
end;

procedure DisposeL(x: integer);
begin;
  next[x] := firstE; firstE := x;
end;

procedure Print(p: integer);
begin
  while p <> -1 do
  begin
    write(data[p], ' '); p := next[p]; 
  end;
end;

procedure Insert_Front(var p1: integer; var p2: integer; x: integer);
var
  temp: integer;
begin
  NewL(temp); data[temp] := x; next[temp] := p1; p1 := temp;
  if p2 = -1 then p2 := temp;
end;

procedure Insert_Back(var p1: integer; var p2: integer; x: integer);
var
  temp: integer;
begin
  NewL(temp); data[temp] := x; next[temp] := -1;
  if p2 = -1 then begin
    p2 := temp; p1 := temp;
  end
  else
    next[p2] := temp; p2 := temp;
end;

procedure Del_Front(var p1: integer; var p2: integer);
var
  temp: integer;
begin
  temp := p1; p1 := next[p1]; DisposeL(temp);
  if p1 = -1 then p2 := -1;
end;

begin
  for i := 0 to 10000 - 1 do
    next[i] := i + 1;
  next[10000] := -1;
  first := -1; last := -1; firstE := 0; 
  for i := 0 to 4 do
    Insert_Front(first, last, i);   
  Print(first); writeln;
  for i := 5 to 9 do
    Insert_Back(first, last, i);   
  Print(first); writeln;
  Del_Front(first, last);
  Print(first); writeln;
end.