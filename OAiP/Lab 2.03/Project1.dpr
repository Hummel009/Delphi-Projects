Program Lab3;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Type
  TArr = Array[1..15] Of Integer;

Var
  I: Integer;
  Arr: TArr = (5, 4, 3, 2, 1, 15, 14, 13, 12, 11, 6, 7, 8, 9, 10);

Procedure QuickSort(Var a: TArr);
Const
  M = Length(a);
Var
  i, j, L, R: Integer;
  x, w: Integer;
  s: 1..M;
  stack: Array[1..M, 1..2] Of Integer;
Begin
  s:= 1;
  stack[1, 1]:= 1;
  stack[1, 2]:= M;
  Repeat
    L:= stack[s, 1];
    R:= stack[s, 2];
    s:= s - 1;
    Repeat
      i:= L;
      j:= R;
      x:= a[(L + R) Div 2];
      Repeat
        While a[i] < x Do
          i:= i + 1;
        While x < a[j] Do
          j:= j - 1;

        If i <= j Then
        Begin
          w:= a[i];
          a[i]:= a[j];
          a[j]:= w;
          i:= i + 1;
          j:= j - 1;
        End;
      Until i > j;

      If i < R Then
      Begin
        s:= s + 1;
        stack[s, 1]:= i;
        stack[s, 2]:= R;
      End;

      R:= j;
    Until L >= R;
  Until s = 0;
End;

Begin
  For i:= 1 To 15 Do
    Write(Arr[i], ' ');
  Writeln;

  Writeln;

  QuickSort(Arr);

  Writeln;

  For i:= 1 To 15 Do
    Write(Arr[i], ' ');

  ReadLn;
End.