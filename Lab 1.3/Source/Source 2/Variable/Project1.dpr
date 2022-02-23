Program Lab3Part2Var;
{Find the biggest duplicate of array}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;
    
//Declare consts
Const
  Limit = 10;
  //Limit - number of elements in array
  
//Declare vars
Var
  Arr1: Array[1..Limit] of Integer = (1, 1, 3, 4, 5, 6, 7, 8, 9, 9);
  Arr2: Array[1..Limit] of Integer;
  I, J, K, Quantity, Max: Integer;
  Duplicate: Boolean;
  //Arr1 - array with duplicates
  //Arr2 - array without duplicates
  //I, J, K - loop operators
  //Quantity - quantity of duplicates
  //Max - the biggest duplicate
  //Duplicate - if yes, then element has duplicates
Begin
  //Display every element of array
  For I:= 1 to Limit do
    Write(Arr1[I], ' ');
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
