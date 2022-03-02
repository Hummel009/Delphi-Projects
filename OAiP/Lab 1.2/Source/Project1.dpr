Program Lab2;
{For a given numbers, calculate it's gcd}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  A: Array[1..1000] of Integer;
  Error, Temp, N, I: Integer;
  Input: String;
  //A - array of numbers to find gcd
  //N - array size
  //I - cycle parameter
  //Temp - needed to swap
  //Input - input string
  //Error - operator for checking input
Begin
  //Checking for the correct input
  Repeat
    Write('Enter the quantity of input array elements: ');
    ReadLn(Input);
    Val(Input, N, Error);
    If (N <= 0) Or (Error <> 0) Then
      WriteLn('Invalid input. Enter another number.');
  Until (N > 0) And (Error = 0);
  WriteLn;

  //Enter every element of array
  For I:= 1 To N Do
  Begin

    //Checking for the correct input
    Repeat
      Write('A[', I, ']=');
      ReadLn(Input);
      Val(Input, A[I], Error);
      If Error <> 0 Then
        WriteLn('Invalid input. Enter another number.');
    Until Error = 0;
  End;

  //GCD(-A,-B) = GCD(A,B)
  For I:= 1 to N do
    If A[I] < 0 then
      A[I]:= -A[I];
      
  WriteLn;
  
  For I:= 1 to N - 1 do
  Begin

    //Searching for the GCD of two numbers
    Repeat

      //Mustn't divide zero
      If A[I] <> 0 then
      Begin
      
        //Euclid algorithm
        If A[I] <= A[I + 1] then
          A[I + 1]:= A[I + 1] mod A[I]
        Else
        Begin
      
          //Swap A[I] and A[I+1]
          Temp:= A[I];
          A[I]:= A[I + 1];
         A[I + 1]:= Temp;
        End;
      End
      Else
      Begin
        A[I]:=0; 
        A[I+1]:=0;
      End;
    Until (A[I] = 0);
  End;

  //Displaying the GCD
  Write('GCD = ', A[N]);
  ReadLn;
End.
