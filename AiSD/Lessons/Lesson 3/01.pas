type
  ss = ^integer;

var
  x, y: ss;
  a: ^real;

begin
  new(x);
  x^ := 100;
  write(x^);
  dispose(x);
end.