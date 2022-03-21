
const MAX_S : integer = 10000;
var
  st : array[0..MAX_S] of integer;
  st1 : integer;
  i : integer;

procedure In_S(x : integer);
  begin
    st[st1] := x; inc(st1);
  end;

procedure Out_S(var x : integer);
  begin
    dec(st1);
    x := st[st1];
  end;

begin
  for i := 1 to 5 do
    In_S(i);
  while st1 > 0 do begin
    Out_S(i);
    write(i, ' ');
  end;
end.