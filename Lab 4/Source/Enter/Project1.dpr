Program Lab4_Read;
{Find and display a chain of elements on diagonals of the matrix}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Arr1: Array[1..1000, 1..1000] of Integer;
  Arr2: Array[1..1000000] of Integer;
  N, I, J, K, D, Error: Integer;
  Input: String;
  {Arr1 - start matrix
  Arr2 - final chain of elements
  N - length and width of the matrix
  I, J, K - parameters of loops
  D - quantity of diagonals
  Error - operator for checking input
  Input - input string}

Begin

  //Checking for the correct input
  Repeat
    Write('Enter the size of the matrix: ');
    ReadLn(Input);
    Val(Input, N, Error);
    If (N <= 0) or (Error <> 0) then
      WriteLn('Invalid input. Enter another number.');
  Until (N > 0) and (Error = 0);
  WriteLn;

  //Enter every element of array
  For I:= 1 to N do
  Begin
    For J:= 1 to N do
    Begin

      //Checking for the correct input
      Repeat
        Write('a[', I, '][', J, ']=');
        ReadLn(Input);
        Val(Input, Arr1[I, J], Error);
        If Error <> 0 then
          WriteLn('Invalid input. Enter another number.');
      Until Error = 0;
    End;
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
