
const MAX_S : integer = 10000;
var
  q : array[0..MAX_S] of integer;
  q1, q2 : integer;
  i : integer;

procedure In_Q(x : integer);
  begin
    q[q1] := x; inc(q1); if q1 > MAX_S then q1 := 0;
  end;

procedure Out_Q(var x : integer);
  begin
    x := q[q2]; inc(q2); if q2 > MAX_S then q2 := 0;
  end;

begin
  for i := 1 to 5 do
    In_Q(i);
  while q1 <> q2 do begin
    Out_Q(i);
    write(i, ' ');
  end;
end.