Program Lab3Part1Var;
{Find elements of array without duplicates and their quantity}

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
  I, J, K, Quantity: Integer;
  Unique: Boolean;
  //Arr1 - array with duplicates
  //Arr2 - array without duplicates
  //I, J, K - loop operators
  //Quantity - second array's size
  //Unique - if yes, then element has no duplicates
Begin

  //Display every element of array
  For I:= 1 to Limit do
    Write(Arr1[I], ' ');
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
