const MAX_S : integer = 10000;
var
  dx, dy : array[0..3] of integer;
  a : array [0..1001, 0..1001] of integer;
  n, m, x1, y1, x2, y2, x, y : integer;
  q : array[0..MAX_S] of integer;
  q1, q2 : integer;
  i, j : integer;

procedure In_Q(x : integer);
  begin
    
    q[q1] := x; inc(q1); 
    if q1 > MAX_S then q1 := 0;
  end;

procedure Out_Q(var x : integer);
  begin
    
    x := q[q2]; inc(q2); 
    if q2 > MAX_S then q2 := 0;
  
  end;

begin
  read(n, m, x1, y1, x2, y2);
  for i := 1 to n do
    for j := 1 to m do
      read(a[i, j]);
  for i := 0 to n + 1 do begin
    a[i][0] := 1; a[i][m + 1] := 1;
  end;
  for j := 0 to m + 1 do begin
    a[0][j] := 1; a[n + 1][j] := 1;
  end;
  dx[0] := -1; dx[1] := 0; dx[2] := 1; dx[3] := 0;
  dy[0] := 0; dy[1] := 1; dy[2] := 0; dy[3] := -1;
  a[x1, y1] := 2; In_Q(x1); In_Q(y1);
  while q1 <> q2 do begin
    Out_Q(x); Out_Q(y);
    for i := 0 to 3 do
      if a[x + dx[i], y + dy[i]] = 0 then begin
        a[x + dx[i], y + dy[i]] := a[x, y] + 1;
        In_Q(x + dx[i]); In_Q(y + dy[i]);
      end;
  end;
  if a[x2, y2] = 0 then 
    write('No solution')
  else begin
    writeln(a[x2, y2] - 2);
  end;
end.
(*
5 5 5 3 2 5
0 0 0 0 0
1 1 0 1 0
0 0 0 1 1
0 1 1 1 0
0 0 0 0 0
*)