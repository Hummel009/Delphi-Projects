Program Lab3Part2Generator;
{Find the biggest duplicate of array}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Arr1, Arr2: Array[1..1000] of Integer;
  I, J, K, Quantity, Error, Limit, Max: Integer;
  Duplicate: Boolean;
  Input: String;
  //Arr1 - array with duplicates
  //Arr2 - array without duplicates
  //I, J, K - loop operators
  //Quantity - quantity of duplicates
  //Error - operator for checking input
  //Limit - number of elements in array
  //Max - the biggest duplicate
  //Duplicate - if yes, then element has duplicates
  //Input - input strings
Begin
  //Checking for the correct input
  Repeat
    Write('Enter the quantity of input array elements:');
    ReadLn(Input);
    Val(Input, Limit, Error);
    If (Limit <= 0) or (Error <> 0) then
      WriteLn('Invalid input. Enter another number.');
  Until (Limit > 0) and (Error = 0);
  WriteLn;

  //Generate and display every element of array
  Randomize;

  //For every I
  For I:= 1 to Limit do
  Begin
    Arr1[I]:=Round(Random(1000)/100 - 5);
    Write(Arr1[I], ' ');
  End;
  WriteLn;
  K:= 1;

  //To prevent from random false number
  Quantity:= 0;

  //For every I
  For I:= 1 to Limit do
  Begin
    Duplicate:= False;

    //For every J
    For J:= 1 to Limit do

      //Condition of duplicate
      If (Arr1[I] = Arr1[J]) and (J <> I) then
        Duplicate:= True;

    //Creating the new array of duplicates
    If Duplicate then
    Begin
      Arr2[K]:= Arr1[I];

      //Increment Quantity
      Quantity:= Quantity + 1;

      //Increment K
      K:= K + 1;
    End;
  End;

  //Finding the biggest element of the second array
  Max:= Arr2[1];
  For K:= 2 to Limit do
    If Arr2[K] > Max then
      Max:= Arr2[K];
  WriteLn;

  //Displaying the biggest duplicate
  If Quantity > 0 then
    WriteLn('The biggest duplicate: ', Max)
  Else
    WriteLn('There is no duplicates in array');
  ReadLn;
End.
