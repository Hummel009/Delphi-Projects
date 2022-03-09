Program Lab2;
{Compare sorts}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare types
Type
  TArr = Array[0..3000] Of Integer;
  //TArr - our array
  
//Declare Vars
Var
  I, J: Integer;
  Nums: Array[1..6] Of Integer = (100, 250, 500, 1000, 2000, 3000);
  //I,J - loop params
  //Nums - array sizes
  
Procedure Swap(Var A, B: Integer);
Var
  T: Integer;
  //T - temp
Begin
  T:= A;
  A:= B;
  B:= T;
End;

Procedure Fill(Var Arr: TArr; Const N, Opt: Integer);
Var
  I: Integer;
  //I - select type of filling
Begin
  Randomize;
  For I:= 1 To N Do
  Begin
    Case Opt Of
      1:
        Arr[I]:= Random(N);
      2:
        Arr[I]:= I;
      3:
        Arr[I]:= N - I;
    End;
  End;
End;

Procedure BubbleSort(Var Arr: TArr; Const N: Integer; Var Comp: Integer);
Var
  I, J: Integer;
  Sorted: Boolean;
  //I, J - loop params
  //Sorted - condition to exit
Begin
  Sorted:= False;
  I:= 1;
  While (I <= N - 1) And Not Sorted Do
  Begin
    Sorted:= True;
    For J:= 1 To N - I Do
    Begin
      If Arr[J] > Arr[J + 1] Then
      Begin
        Sorted:= False;
        Swap(Arr[J], Arr[J + 1]);
      End;
      Inc(Comp);
    End;
    Inc(I);
  End;
End;

Procedure SiftDown(Var Arr: TArr; Node, NodeLast: Integer; Var Comp: Integer);
Var
  Root, Child: Integer;
  Sifted: Boolean;
  //Root, Child - indexes
  //Sifted - condition to exit
Begin
  Root:= Node;
  Sifted:= False;
  While (Not Sifted) And (Root * 2 - Node + 1 <= NodeLast) Do
  Begin
    Comp:= Comp + 2;
    Child:= Root * 2 - Node + 1;
    If (Child + 1 <= NodeLast) And (Arr[Child] < Arr[Child + 1]) Then
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

Procedure HeapSort(Var Arr: TArr; Const Count: Integer; Var Comp: Integer);
Var
  NodeLast, NodeCurr, Comps: Integer;
  //NodeLast, NodeCurr - indexes
  //Comps - counter
Begin
  NodeCurr:= Count Div 2 - 1;
  While NodeCurr >= 0 Do
  Begin
    Comps:= 0;
    SiftDown(Arr, NodeCurr, Count, Comps);
    Comp:= Comp + Comps;
    Dec(NodeCurr);
  End;
  NodeLast:= Count;
  While NodeLast > 0 Do
  Begin
    Swap(Arr[0], Arr[NodeLast]);
    Comps:= 0;
    Dec(NodeLast);
    SiftDown(Arr, 0, NodeLast, Comps);
    Comp:= Comp + Comps;
  End;
End;

Procedure Generate(Const N, Sort: Integer);
Var
  Compare: Integer;
  Arr1, Arr2: TArr;
  Str: String;
  //Compare - counter
  //Arr1, Arr2 - similar arrays for the test
  //Str - displaying
Begin

  //options for all cases
  Case Sort Of
    1:
      Begin
        Str:= 'Random';
        Fill(Arr1, N, Sort);
      End;
    2:
      Begin
        Str:= 'Sorted';
        Fill(Arr1, N, Sort);
      End;
    3:
      Begin
        Str:= 'Revers';
        Fill(Arr1, N, Sort);
      End;
  End;

  //show arr size
  Write(Str, ' Arr1[', N, ']; ');

  //copy array
  Arr2:= Arr1;

  //enzero to show true value
  Compare:= 0;
  BubbleSort(Arr1, N, Compare);
  Write('BubbleSort: ', Compare: 7, '; ');
       
  //enzero to show true value
  Compare:= 0;
  HeapSort(Arr2, N, Compare);
  Write('HeapSort: ', Compare: 5);

  WriteLn;
End;

Begin
  For I:= 1 To 6 Do
  Begin
    For J:= 1 To 3 Do
      Generate(Nums[I], J);
    WriteLn;
  End;
  Readln;
End.

