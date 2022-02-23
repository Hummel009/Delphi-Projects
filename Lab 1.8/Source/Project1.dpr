Program Lab8;
{This program sorts the matrix with some conditions}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  A: Array[1..10, 1..10] of Integer;
  J, I, K, Temp: Integer;
  //A - start matrix
  //I - number of line
  //J - number of column
  //K - auxilary member during sort
  //Temp - saving member during sort
Begin
  Randomize;

  //Generate the matrix and display it
  Write('Matrix:');
  For I:= 1 to 9 do
  Begin
    WriteLn;
    For J:= 1 to 10 do
    Begin
      A[I, J]:= Random(6) + 1;
      Write(A[I, J]:5, '[', I, ',', J, ']');
    End;
  End;

  WriteLn;
  WriteLn;

  //Calculate multiples and display it
  WriteLn('Multiples:');
  For J:= 1 to 10 do
  Begin
    A[10, J]:= 1;
    I:= 2;                                  (* First odd *) 
    Repeat
      A[10, J]:= A[10, J] * A[I, J];
      I:= I + 2;                           (* Other odds *)
    Until I = 10;
    Write(A[10, J]:7, '[', J, ']');
  End;

  WriteLn;
  WriteLn;

  //Sort elements in columnts excluding line of extended items
  For J:= 1 to 10 Do
    For I:= 1 to 9 Do
      For K:= 1 to 9 - I Do
        If (A[K, J] > A[K + 1, J]) then
        Begin
          Temp:= A[K, J];
          A[K, J]:= A[K + 1, J];
          A[K + 1, J]:= Temp;
        End;

  //Sort line of extended items
  For J:= 1 to 10 do
    For K:= 1 to 10 - J do
      If (A[10, K] > A[10, K + 1]) then
      
        //If extended item is moved, move the all column
        For I:= 1 to 10 do
        Begin
          Temp:= A[I, K];
          A[I, K]:= A[I, K + 1];
          A[I, K + 1]:= Temp;
        End;

  //Display final sorted matrix
  Write('Final:');
  For I:= 1 to 9 do
  Begin
    WriteLn;
    For J:= 1 to 10 do
      Write(A[I, J]:5, '[', I, ',', J, ']');
  End;

  WriteLn;
  WriteLn;

  //Display new multiple places
  For J:= 1 to 10 do
    Write(A[10, J]:7, '[', J, ']');

  ReadLn;
End.


