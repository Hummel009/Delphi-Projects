Program Lab5;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Type
  pt = ^elem;
  Elem = Record
    Prior: Integer;
    SubExp: String;
    Next: Pt;
    Prev: Pt;
  End;

Function MakePrioretyOtn(S: Char): Integer;
Var
  Numbers: Set Of Char;
Begin
  Numbers:= ['0'..'9'];
  If S = '(' Then
    Result:= 9;

  If S = ')' Then
    Result:= 0;

  If (S = '+') Or (S = '-') Then
    Result:= 1;

  If (S = '*') Or (S = '/') Then
    Result:= 3;

  If S = '^' Then
    Result:= 6;

  If S In Numbers Then
    Result:= 7;
End;

Function MakePrioretyStack(S: Char): Integer;
Var
  Numbers: Set Of Char;
Begin
  Numbers:= ['0'..'9'];
  If S = '(' Then
    Result:= 0;

  If (S = '+') Or (S = '-') Then
    Result:= 2;

  If (S = '*') Or (S = '/') Then
    Result:= 4;

  If S = '^' Then
    Result:= 5;

  If S In Numbers Then
    Result:= 8;
End;

Function InfToPost(S: String): String;
Var
  X, Y: pt;
  I, K: Integer;
  Prior: Integer;
  Num, Temp: String;
  Numbers: Set Of Char;
Begin
  Numbers:= ['0'..'9'];

  New(X);
  Y:= X;
  X.Prev:= Nil;
  X.Prior:= -2;

  New(X);
  Y.Next:= X;
  X.Prev:= Y;

  Result:= '';
  S:= StringReplace(S, ' ', '', [rfReplaceAll]);
  I:= 1;

  While I <= Length(S) Do
  Begin
    If S[I] In Numbers Then
    Begin
      K:= 1;
      Num:= '';
      While S[I] In Numbers Do
      Begin
        Num:= Num + ' ';
        Num[K]:= S[I];
        K:= K + 1;
        I:= I + 1;
      End;
      Temp:= Num;
    End
    Else
    Begin
      Temp:= S[I];
      I:= I + 1;
    End;
    Prior:= MakePrioretyOtn(S[I - 1]);
    If (Prior > Y.Prior) Or (Y.Prior = -2) Then
    Begin
      X.SubExp:= Temp;
      X.Prior:= MakePrioretyStack(S[I - 1]);
      Y:= X;
      New(X);
      Y.Next:= X;
      X.Prev:= Y;
    End
    Else
      If (Prior <= Y.Prior) And (Prior <> -1) Then
      Begin
        Result:= Result + Y.SubExp + ' ';
        Y:= Y.Prev;
        Y.Next:= X;
        X.Prev:= Y;

        While (Prior < Y.Prior) And (Y.Prior <> 0) Do
        Begin
          Result:= Result + Y.SubExp + ' ';
          Y:= Y.Prev;
          Y.Next:= X;
          X.Prev:= Y;
        End;

        If Prior <> 0 Then
        Begin
          X.SubExp:= Temp;
          X.Prior:= MakePrioretyStack(S[I - 1]);
          Y:= X;
          New(X);
          Y.Next:= X;
          X.Prev:= Y;
        End
        Else
        Begin
          Y:= Y.Prev;
          Y.Next:= X;
          X.Prev:= Y;
        End;
      End;

  End;

  While Y.Prior <> -2 Do
  Begin
    Result:= Result + Y.SubExp + ' ';
    Y:= Y.Prev;
    Y.Next:= X;
    X.Prev:= Y;
  End;
End;

Var
  S: String;
  Syms: Set Of Char = ['-', '+', '*', '/', '^', '(', ')'];
  Nums: Set Of Char = ['0'..'9'];
  N, I: Integer;
Begin
  Readln(S);
  S:= InfToPost(S);   
  Writeln(S);
  
  N:= 1;
  For I:= 1 To Length(S) Do
    If (S[I] in Nums) and (S[I-1] = ' ') Then
      Inc(N);

  For I:= 1 To Length(S) Do
    If (S[I] in Syms) Then
      Dec(N);

  Writeln(N);
  Readln;
End.

