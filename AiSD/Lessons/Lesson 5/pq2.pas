Program zzz;
type 
  Node = record
    x, y, z : integer;  
  end;

const 
  INF = 1000000000;

var
  a, b : array [0..1001, 0..1001] of integer;
  p : array [0..1001, 0..1001] of boolean;
  k : array[1..10000] of Node;
  k1 : integer;
  n, m, i, j, x, y : integer; 
  t : Node;

procedure In_K(x : Node);
  var i : integer; 
  begin
    inc(k1); i := k1;
    while (i > 1) and (k[i div 2].z > x.z) do
    begin
      k[i] := k[i div 2]; i := i div 2; // i := i shr 1;
    end;
    k[i] := x;
  end;
  
procedure Out_K(var x : Node);
  var i: integer;
    t : Node;
  begin
    x := k[1]; i := 1; 
    t := k[k1]; dec(k1);
    while (2 * i + 1 <= k1) and (k[2 * i + 1].z < t.z) or
      (2 * i <= k1) and (k[2 * i].z < t.z) do
       if (2 * i = k1) or 
       (2 * i < k1) and (k[2 * i].z < k[2 * i + 1].z) then begin
         k[i] := k[2 * i];  i := 2 * i;
       end
       else begin
         k[i] := k[2 * i + 1];  i := 2 * i + 1;
       end;
    k[i] := t;
  end;

begin
  read(n, m);
  for i := 1 to n do
    for j := 1 to m do begin
      read(a[i, j]); b[i, j] := INF;
    end;
  for i := 0 to n + 1 do begin
    p[i][0] := true; p[i][m + 1] := true;
  end;
  for j := 0 to m + 1 do begin
    p[0][j] := true; p[n + 1][j] := true;
  end;
  t.x := 1; t.y := 1; t.z := a[1, 1]; b[1, 1] := a[1, 1]; In_K(t);
  while k1 > 0 do begin
    Out_K(t); x := t.x; y := t.y;
    if (p[x, y] = false) begin
      
    end;
  end;
  
  
  
  
  
  
  
  
  
  
  
  
end.