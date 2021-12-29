Program Razminka2_1;
{This program calculates viruses' number for the last correct tick. Initial data are start number of 2 types of viruses, ticks number}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Green, Red, Tick, SavedGreen, SavedRed, SavedTick, Temp, Error, I: Integer;
  Input: String;
  Limit: Boolean;

  {Green, Red - the number of Red and Green viruses
  Tick - the number of Ticks
  SavedGreen, SavedRed, SavedTick - last correct numbers before integer Limit
  Input - input string
  Temp - auxiliary argument when calculating a new number of viruses
  Error - auxiliary operator for checking input
  I - parameter for cycle
  Limit - condition to finish the cycle}

Begin
  Error:= 0;
  
  //Checking for the correct input
  Repeat
  
    //Checking for the correct input
    Repeat
      Write('Enter the number of red viruses: ');
      ReadLn(Input);
      Val(Input, Red, Error);
      If (Red < 0) or (Error <> 0) then
       WriteLn('Invalid input. Enter another number.');
    Until (Red >= 0) and (Error = 0);

    //Checking for the correct input
    Repeat
      Write('Enter the number of green viruses: ');
      ReadLn(Input);
      Val(Input, Green, Error);
      If (Green < 0) or (Error <> 0) then
        WriteLn('Invalid input. Enter another number.');
    Until (Green >= 0) and (Error = 0);

    //Checking for the correct input
    Repeat
      Write('Enter the number of ticks: ');
      ReadLn(Input);
      Val(Input, Tick, Error);
      If (Tick <= 0) or (Error <> 0) then
       WriteLn('Invalid input. Enter another number.');
    Until (Tick > 0) and (Error = 0);

    If ((Green + Red) < 0) then
      WriteLn('Calculations impossible. Enter another numbers from the start.'); 
    If ((Green + Red) = 0) then
      WriteLn('Viruses won`t extend. Enter another numbers from the start.');
  Until ((Green + Red) > 0);

  //Integer Limit is not exceeded yet
  Limit:= False;
  
  SavedGreen:= 0;  
  SavedRed:= 0;
  SavedTick:= 0;
  
  For I:= 1 to Tick do
  Begin
  
	//If integer limit is not exceeded yet
    If (Limit = false) then
    Begin

      //Searching for the new number of viruses
      Temp:= Green + Red;
      Red:= Green;
      Green:= Temp;

      //Searching for correct numbers before integer Limit
      If (Green >= 0) and (Red >= 0) and ((Green + Red) >= 0) then
      Begin
        SavedGreen:= Green;
        SavedRed:= Red;
        SavedTick:= I;
      End
      Else
      Begin

        //Integer Limit was exceeded
        WriteLn('Out of limit during the tick ', I, '. Here is the last correct values.');
        Limit:= true;
      End;
    End;
  End;

  //Displaying the solution
  WriteLn('Tick: ', SavedTick, '; Red: ', SavedRed, '; Green: ', SavedGreen, '; Sum: ', SavedRed + SavedGreen);
  ReadLn;
End.
