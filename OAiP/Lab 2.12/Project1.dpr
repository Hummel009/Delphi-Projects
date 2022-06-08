Program LAB12;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Type
  Pt1 = ^Elem1;
  Elem1 = Record
    Data: Integer;
    Next: Pt1;
  End;

  Pt2 = ^Elem2;
  Elem2 = Record
    Data: Integer;
    Next: Pt2;
  End;

Var
  I, N, Res: Integer;

  First1, Last1: Pt1;
  First2, Last2: Pt2;

  Num1, Num2: Integer;

Procedure Push1(Var X, Y: Pt1; Const V: Integer);
Var
  PTmp: Pt1;
Begin
  new(PTmp);
  PTmp^.data:= V;
  PTmp^.next:= Nil;

  If X = Nil Then
    X:= PTmp
  Else
    Y^.next:= PTmp;

  Y:= PTmp;
End;

Procedure Push2(Var X, Y: Pt2; Const V: Integer);
Var
  PTmp: Pt2;
Begin
  new(PTmp);
  PTmp^.data:= V;
  PTmp^.next:= Nil;

  If X = Nil Then
    X:= PTmp
  Else
    Y^.next:= PTmp;

  Y:= PTmp;
End;

Begin
  Readln(N);
  Res:= 1;

  For I:= 1 To N Do
  Begin
    Push1(First1, Last1, I);
    Push2(First2, Last2, N - I + 1);
  End;

  While (First1 <> Nil) Or (First2 <> Nil) Do
  Begin
    Num1:= First1^.Data;
    Num2:= First2^.Data;
    Res:= Res * (Num1 + Num2);

    First1:= First1^.Next;
    First2:= First2^.Next;
  End;

  WriteLn(Res);

  ReadLn;
End.

