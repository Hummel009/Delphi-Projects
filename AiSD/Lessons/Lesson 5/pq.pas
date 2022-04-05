Program zzz;
var
  k : array[1..10000] of integer;
  k1 : integer;
  n, i, x : integer; 
procedure In_K(x : integer);
  var i : integer; 
  begin
    inc(k1); i := k1;
    while (i > 1) and (k[i div 2] > x) do
    begin
      k[i] := k[i div 2]; i := i div 2; // i := i shr 1;
    end;
    k[i] := x;
  end;
  
procedure Out_K(var x : integer);
  var i, t : integer;
  begin
    x := k[1]; i := 1; 
    t := k[k1]; dec(k1);
    while (2 * i + 1 <= k1) and (k[2 * i + 1] < t) or
      (2 * i <= k1) and (k[2 * i] < t) do
       if (2 * i = k1) or 
       (2 * i < k1) and (k[2 * i] < k[2 * i + 1]) then begin
         k[i] := k[2 * i];  i := 2 * i;
       end
       else begin
         k[i] := k[2 * i + 1];  i := 2 * i + 1;
       end;
    k[i] := t;
  end;

begin
  read(n);
  for i := 1 to n do begin
    read(x); In_K(x);
  end;
  // for i := 1 to k1 do
  //   write(k[i], ' ');
  while k1 > 0 do begin
    Out_K(x); write(x, ' ');
  end;
end.