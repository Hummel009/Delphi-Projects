Program Lab3Part1Generator;
{Find elements of array without duplicates and their quantity}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Arr1, Arr2: Array[1..1000] of Integer;
  I, J, K, Quantity, Error, Limit: Integer;
  Unique: Boolean;
  Input: String;
  //Arr1 - array with duplicates
  //Arr2 - array without duplicates
  //I, J, K - loop operators
  //Error - operator for checking input
  //Limit - number of elements in array
  //Quantity - second array's size
  //Unique - if yes, then element has no duplicates
  //Input - input strings
Begin
  //Checking for the correct input
  Repeat
    Write('Enter the quantity of input array elements: ');
    ReadLn(Input);
    Val(Input, Limit, Error);
    If (Limit <= 0) or (Error <> 0) then
      WriteLn('Invalid input. Enter another number.');
  Until (Limit > 0) and (Error = 0);
  WriteLn;

  //Generate and display every element of array
  Randomize;
  For I:= 1 to Limit do
  Begin
    Arr1[I]:=Round(Random(1000)/100 - 5);
    Write(Arr1[I], ' ');
  End;
  WriteLn;
  
  K:= 1;

  //Prevent from random false number
  Quantity:= 0;

  //For every I
  For I:= 1 to Limit do
  Begin
    Unique:= True;

    //For every J
    For J:= 1 to Limit do

      //Condition of duplicate
      If (Arr1[I] = Arr1[J]) and (J <> I) then
        Unique:= False;

    //Creating and displaying the new array of unique elements
    If Unique then
    Begin
      Arr2[K]:= Arr1[I];
      Write(Arr2[K], ' ');

      //Increment Quantity
      Quantity:= Quantity + 1;

      //Increment K
      K:= K + 1;
    End;
  End;
  WriteLn;

  //Displaying the quantity of elements in the new array
  If Quantity > 0 then
    WriteLn('Quantity of unique elements: ', Quantity)
  Else
    WriteLn('There is no unique elements in array');
  ReadLn;
End.
