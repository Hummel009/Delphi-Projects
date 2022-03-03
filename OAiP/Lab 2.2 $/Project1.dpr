Program Lab2;
{Compare Sorts}

//Use App
{$APPTYPE CONSOLE}

//Declare Modules
Uses
  SysUtils;

//Declare Types
Type
  TArr=Array[0..3001] Of Integer;

//Declare Vars
Var
  I, J: Integer;
  Nums: Array[1..6] Of Integer=(100, 250, 500, 1000, 2000, 3000);

Procedure Swap(Var Arr, B: Integer);
Var
  Temp: Integer;
Begin
  Temp:=Arr;
  Arr:=B;
  B:=Temp;
End;

Procedure ArrS(Var Arr: TArr; Const N: Integer);
Var
  I: Integer;
Begin
  For I:=1 To N Do
    Arr[I]:=I;
End;

Procedure ArrVV(Var Arr: TArr; Const N: Integer);
Var
  I: Integer;
Begin
  For I:=1 To N Do
    Arr[I]:=N-I;
End;

Procedure ArrR(Var Arr: TArr; Const N: Integer);
Var
  I: Integer;
Begin
  Randomize;
  For I:=1 To N Do
    Arr[I]:=Random(N);
End;

Procedure BubbleSort(Var Arr: TArr; Const N: Integer; Var Comp: Integer);
Var
  I, J: Integer;
  Sorted: Boolean;
Begin
  Sorted:=False;
  I:=1;
  While (I<=N-1)And Not Sorted Do
  Begin
    Sorted:=True;
    For J:=1 To N-I Do
    Begin
      If Arr[J]>Arr[J+1] Then
      Begin
        Sorted:=False;
        Swap(Arr[J], Arr[J+1]);
      End;
      Inc(Comp);
    End;
    Inc(I);
  End;
End;

Procedure SiftDown(Var Arr: TArr; Var Node: Integer; Var NodeLast: Integer; Var Comp: Integer);
Var
  Child: Integer;
  Sifted: Boolean;
Begin
  Sifted:=False;
  Child:=2*Node;
  While (Not Sifted)And(Child<=NodeLast) Do
  Begin
    If (Child+1<NodeLast)And(Arr[Child]<Arr[Child+1]) Then
      Inc(Child);
    Comp:=Comp+2;
    If (Arr[Child]>Arr[Node]) Then
    Begin
      Swap(Arr[Node], Arr[Child]);
      Node:=Child;
    End
    Else
      Sifted:=True;
    Inc(Comp);
  End;
  Inc(Comp);
End;

Procedure HeapSort(Var Arr: TArr; Const Count: Integer; Var Comp: Integer);
Var
  NodeCurr, NodeLast: Integer;
  Comps: Integer;
Begin
  NodeCurr:=Count Div 2;
  While NodeCurr>1 Do
  Begin
    Comps:=0;
    SiftDown(Arr, NodeCurr, NodeLast, Comps);
    Comp:=Comp+Comps;
    Dec(NodeCurr);
  End;
  NodeLast:=Count;
  While NodeLast>1 Do
  Begin
    Swap(Arr[1], Arr[NodeLast]);
    Comps:=0;
    SiftDown(Arr, NodeCurr, NodeLast, Comps);
    Comp:=Comp+Comps;
    Dec(NodeLast);
  End;
End;

Procedure GenInfo(Const N, Sort: Integer);
Var
  Compare: Integer;
  Arr, B: TArr;
  Str: String;
Begin

  Case Sort Of
    1:
      Begin
        Str:='Random';
        ArrR(Arr, N);
      End;
    2:
      Begin
        Str:='Sorted';
        ArrS(Arr, N);
      End;
    3:
      Begin
        Str:='Vivers';
        ArrVV(Arr, N);
      End;
  End;

  Write(Str, ' Arr[', N, ']; ');

  B:=Arr;

  Compare:=0;
  BubbleSort(Arr, N, Compare);
  Write('Bubble: ', Compare: 7, '; ');

  Compare:=0;
  HeapSort(B, N, Compare);
  Write('Heap: ', Compare: 5);

  WriteLn;
End;

Begin
  For I:=1 To 6 Do
  Begin
    For J:=1 To 3 Do
      GenInfo(Nums[I], J);
    WriteLn;
  End;
  Readln;
End.