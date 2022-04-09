Program Lab9;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Type
  TArr = Array[1..15] Of Integer;

Var
  I: Integer;  
  Arr: TArr = (5, 4, 3, 2, 1, 15, 14, 13, 12, 11, 6, 7, 8, 9, 10);

Procedure Swap(Var A, B: Integer);
Var
  T: Integer;
Begin
  T:= A;
  A:= B;
  B:= T;
End;

Procedure SiftDown(Var Arr: TArr; Node: Integer; Const N: Integer);
Var
  Root, Child: Integer;
  Sifted: Boolean;
Begin
  Root:= Node;
  Sifted:= False;
  While (Not Sifted) And (Root * 2 - Node + 1 <= N) Do
  Begin
    Child:= Root * 2 - Node + 1;
    If (Child + 1 <= N) And (Arr[Child] < Arr[Child + 1]) Then
      Inc(Child);
    If Arr[Root] < Arr[Child] Then
    Begin
      Swap(Arr[Root], Arr[Child]);
      Root:= Child;
    End
    Else
      Sifted:= True;
  End;
End;

Procedure HeapSort(Var Arr: TArr; Const N: Integer);
Var
  NodeLast, NodeCurr: Integer;
Begin
  NodeCurr:= N Div 2 - 1;
  While NodeCurr >= Low(Arr) Do
  Begin
    SiftDown(Arr, NodeCurr, N);
    Dec(NodeCurr);
  End;
  NodeLast:= N;
  While NodeLast > Low(Arr) Do
  Begin
    Swap(Arr[Low(Arr)], Arr[NodeLast]);
    Dec(NodeLast);
    SiftDown(Arr, Low(Arr), NodeLast);
  End;
End;

Begin
  For i:= 1 To 15 Do
    Write(Arr[i], ' ');
  Writeln;
  Writeln;

  HeapSort(Arr, 15);

  Writeln;

  For i:= 1 To 15 Do
    Write(Arr[i], ' ');

  ReadLn;
End.