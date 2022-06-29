Program Lab2;
{Comp sorts}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare types
Type
  TArr = Array[1..3000] Of Integer;
  //TArr - our array

//Declare Vars
Var
  I, J: Integer;
  Comp: Integer;
  Arr1, Arr2: TArr;
  N: Array[1..6] Of Integer = (100, 250, 500, 1000, 2000, 3000);
  S: Array[1..3] Of String = ('Random', 'Sorted', 'Revers');
  //I,J - loop params
  //N - array sizes
  //Comp - quantity of comparisons
  //Arr1, Arr2 - our arrays
  //N - num of elements
  //S - name of array

//Swaps 2 elements
//A, B - elements
Procedure Swap(Var A, B: Integer);
Var
  T: Integer;
  //T - temp
Begin
  T:= A;
  A:= B;
  B:= T;
End;

//Fills array with elements
//Arr - array, N - array size, Opt - filler type
Procedure Fill(Var Arr; Const N, Opt: Integer);
type
  ProcArr= TArr;
Var
  I: Integer;
  //I - select type of filling
Begin
  Randomize;
  Case Opt Of
    1:
      For I:= Low(ProcArr(Arr)) To N Do
        ProcArr(Arr)[I]:= Random(N);
    2:
      For I:= Low(ProcArr(Arr)) To N Do
        ProcArr(Arr)[I]:= I;
    3:
      For I:= Low(ProcArr(Arr)) To N Do
        ProcArr(Arr)[I]:= N - I;
  End;
End;

//Sorts an array and calculates the number of comparisons
//Arr - array, N - array size, Comp - comparisons
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

//Sorts an array and calculates the number of comparisons
//Arr - array, Node - current index, N - array size, Comp - comparisons
Procedure SiftDown(Var Arr: TArr; Node: Integer; Const N: Integer; Var Comp: Integer);
Var
  Root, Child: Integer;
  Sifted: Boolean;
  //Root, Child - indexes
  //Sifted - condition to exit
Begin
  Root:= Node;
  Sifted:= False;
  While (Not Sifted) And (Root * 2 - Node + 1 <= N) Do
  Begin
    Comp:= Comp + 2;
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

//Sorts an array and calculates the number of comparisons
//Arr - array, N - array size, Comp - comparisons
Procedure HeapSort(Var Arr: TArr; Const N: Integer; Var Comp: Integer);
Var
  NodeLast, NodeCurr: Integer;
  //NodeLast, NodeCurr - indexes
  //Comps - counter
Begin
  NodeCurr:= N Div 2 - 1;
  While NodeCurr >= Low(Arr) Do
  Begin
    SiftDown(Arr, NodeCurr, N, Comp);
    Dec(NodeCurr);
  End;
  NodeLast:= N;
  While NodeLast > Low(Arr) Do
  Begin
    Swap(Arr[Low(Arr)], Arr[NodeLast]);
    Dec(NodeLast);
    SiftDown(Arr, Low(Arr), NodeLast, Comp);
  End;
End;

Begin
  For I:= 1 To 6 Do
  Begin
    For J:= 1 To 3 Do
    Begin
      Fill(Arr1, N[I], J);

      //Show arr size
      Write(S[J], ' Arr[', N[I], ']; ');

      //Copy array
      Arr2:= Arr1;

      //Enzero to show true value
      Comp:= 0;
      BubbleSort(Arr1, N[I], Comp);
      Write('BubbleSort: ', Comp: 7, '; ');

      //Enzero to show true value
      Comp:= 0;
      HeapSort(Arr2, N[I], Comp);
      Write('HeapSort: ', Comp: 5);

      WriteLn;
    End;
    WriteLn;
  End;
  ReadLn;
End.
