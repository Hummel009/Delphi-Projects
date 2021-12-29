Program Razminka2_2;
{This program calculates viruses' number for the last correct tick. Initial data are start number of 2 types of viruses, ticks number}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Green, Red, Tick, SavedGreen, SavedRed, SavedTick, Temp, Temp1, Temp2, Error, I: Integer;
  Input: String;
  Limit: Boolean;

  {Green, Red - the number of red and green viruses
  Tick - the number of ticks
  SavedGreen, SavedRed, SavedTick - last correct numbers before integer Limit
  Input - input string
  Temp - auxiliary argument for the first tick
  Temp1 - saved pre-pre-data for using during the even tick
  Temp2 - saved pre-pre-data for using during the odd tick
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
  Limit:= false;
  
  SavedGreen:= 0;
  SavedRed:= 0;
  SavedTick:= 0;  
  Temp1:= 0;
  Temp2:= 0;
  
  For I:= 1 To Tick Do
  Begin
  
	//If integer limit is not exceeded yet
    If (Limit = false) then
    Begin

      //First tick has no pre-pre step
      If I = 1 then
      Begin
        Temp1:= Green;
        Temp:= Green + Red;
        Red:= Green;
        Green:= Temp;
        Temp2:= Green;
      End
      Else
      Begin

        //Even tick
        If I mod 2 = 0 then
        Begin
          Red:= Green;
          Green:= Temp1 + Temp2;
          Temp1:= Green;
        End;

        //Odd tick
        If I mod 2 = 1 then
        Begin
          Red:= Green;
          Green:= Temp1 + Temp2;
          Temp2:= Green;
        End;
      End;
      
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
