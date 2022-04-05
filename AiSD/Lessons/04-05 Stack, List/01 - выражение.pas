const MAX_S : integer = 10000;
var
  std : array[0..MAX_S] of integer;
  sto : array[0..MAX_S] of char;
  sto1, std1 : integer;
  i, x, y : integer;
  s : string;
  op : char;
  Number : boolean;

procedure In_SD(x : integer);
  begin
    std[std1] := x; inc(std1);
  end;

procedure In_SO(x : char);
  begin
    sto[sto1] := x; inc(sto1);
  end;


procedure Out_SD(var x : integer);
  begin
    dec(std1); x := std[std1];
  end;

procedure Out_SO(var x : char);
  begin
    dec(sto1); x := sto[sto1];
  end;

begin
  read(s);
  Number := false;
  for i := 1 to length(s) do
    if s[i] in ['0'..'9'] then 
      if Number then
          x := x * 10 + ord(s[i]) - ord('0')
      else begin
        Number := true;
        x := ord(s[i]) - ord('0');
      end
    else begin
      if Number then begin
        Number := false;
        In_SD(x);
      end;
      case s[i] of
        '(': In_SO(s[i]);
        '+', '-': begin
              while (sto1 > 0) and 
                ((sto[sto1 - 1] = '*') or (sto[sto1 - 1] = '/') or
                 (sto[sto1 - 1] = '+') or (sto[sto1 - 1] = '-')) do
              begin
                Out_SD(y); Out_SD(x); Out_SO(op);
                case op of
                  '+': In_SD(x + y);
                  '-': In_SD(x - y);
                  '*': In_SD(x * y);
                  '/': In_SD(x div y);
                end;
              end;
              In_SO(s[i]);
              end;
        '*', '/': begin
              while (sto1 > 0) and 
                ((sto[sto1 - 1] = '*') or (sto[sto1 - 1] = '/')) do
              begin
                Out_SD(y); Out_SD(x); Out_SO(op);
                case op of
                  '*': In_SD(x * y);
                  '/': In_SD(x div y);
                end;
              end;
              In_SO(s[i]);
              end;
        ')': begin
              while sto[sto1 - 1] <> '(' do
              begin
                Out_SD(y); Out_SD(x); Out_SO(op);
                case op of
                  '+': In_SD(x + y);
                  '-': In_SD(x - y);
                  '*': In_SD(x * y);
                  '/': In_SD(x div y);
                end;
              end;
              Out_SO(op);
        end;
      end;
    end;
  if Number then begin
    Number := false;
    In_SD(x);
  end;
  while sto1 > 0 do
  begin
    Out_SD(y); Out_SD(x); Out_SO(op);
    case op of
      '+': In_SD(x + y);
      '-': In_SD(x - y);
      '*': In_SD(x * y);
      '/': In_SD(x div y);
    end;
  end;
  Out_SD(x);
  write(x);
end.