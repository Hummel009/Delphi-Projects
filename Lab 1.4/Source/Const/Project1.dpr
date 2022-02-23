Program Lab4_Const;
{Find and display a chain of elements on diagonals of the matrix}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare consts
Const
  N = 3; 
  Arr1: Array[1..3, 1..3] of Integer = ((1, 2, 3), (4, 5, 6), (7, 8, 9));
  {N - length and width of the matrix
  Arr1 - start matrix}
  
//Declare vars
Var
  Arr2: Array[1..9] of Integer;
  I, J, K, D: Integer;
  {Arr2 - final chain of elements
  I, J, K - parameters of loops
  D - quantity of diagonals}
Begin

  //Display every element of array
  For I:= 1 to N do
  Begin;
    For J:=1 to N do
    Begin
      Write(Arr1[I, J], ' ');
    End;
    WriteLn;
  End;
  
  K:= 0;

  //Every diagonal
  For D:= 2 * N - 1 downto 1 do
  Begin

    //Above or on the main diagonal
    If D >= N then
    Begin

      //From top to bottom (chain)
      If (D mod 2 = 1) then

        For I:= 1 To 2 * N - D do
        Begin
          K:= K + 1;
          Arr2[K]:= Arr1[I, I + D - N];
        End

      //From bottom  to top (chain)
      Else
        For I:= 2 * N - D downto 1 do
        Begin
          K:= K + 1;
          Arr2[K]:= Arr1[I, I + D - N];
        End
    End
    Else

    //Under the main diagonal
    Begin

      //From top to bottom (chain)
      If (D mod 2 = 1) then
        For I:= N - D + 1 to N do
        Begin
          K:= K + 1;
          Arr2[K]:= Arr1[I, I + D - N];
        End

      //From bottom  to top (chain)
      Else
        For I:= N downto N - D + 1 do
        Begin
          K:= K + 1;
          Arr2[K]:= Arr1[I, I + D - N];
        End;
    End;
  End;

  //Displaying the array
  WriteLn('Array:');
  For I:= 1 to K do
    Write(Arr2[I], ' ');
  ReadLn;
End.
