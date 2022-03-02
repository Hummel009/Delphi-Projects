Program Razminka2_3;
{This program calculates viruses' number for the last correct tick.}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Green, Red, Tick, SavedGreen, SavedRed, SavedTick, Temp, Temp1, Temp2, Error, I:Integer;
  Input:String;
  Limit:Boolean;
  //Green, Red - the number of red and green viruses
  //Tick - the number of ticks
  //SavedGreen, SavedRed, SavedTick - last correct numbers
  //Input - input string
  //Temp - auxiliary argument
  //Temp1 - saved pre-pre-data for the even tick
  //Temp2 - saved pre-pre-data for the odd tick
  //Error - auxiliary operator for checking input
  //I - parameter for cycle
  //Limit - condition to finish the cycle
Begin

  //Checking for the correct input
  Repeat
    Write('Enter the number of red viruses: ');
    ReadLn(Input);

    //Error is bad symbol pos
    Val(Input, Red, Error);
    If (Red < 0) Or (Error <> 0) Then
      WriteLn('Invalid input. Enter another number.');
  Until (Red >= 0) And (Error = 0);

  //Checking for the correct input
  Repeat
    Write('Enter the number of green viruses: ');
    ReadLn(Input);

    //Error is bad symbol pos
    Val(Input, Green, Error);
    If (Green < 0) Or (Error <> 0) Then
      WriteLn('Invalid input. Enter another number.');
  Until (Green >= 0) And (Error = 0);

  //Checking for the correct input
  Repeat
    Write('Enter the number of ticks: ');
    ReadLn(Input);

    //Error is bad symbol pos
    Val(Input, Tick, Error);
    If (Tick <= 0) Or (Error <> 0) Then
      WriteLn('Invalid input. Enter another number.');
  Until (Tick > 0) And (Error = 0);

  //Integer limit is not exceeded yet
  Limit:= False;

  //To prevent from random false value
  SavedGreen:= 0;
  SavedRed:= 0;
  SavedTick:= 0;
  Temp1:= 0;
  Temp2:= 0;

  For I:= 1 To Tick Do
  Begin

    //If integer limit is not exceeded yet
    If (Limit = False) Then
    Begin

      //First tick has no pre-pre step
      If I = 1 Then
      Begin
        Temp1:= Red;
        Temp:= Green + Red;
        Red:= Green;
        Temp2:= Red;
        Green:= Temp;
      End
      Else
      Begin

        //Even tick
        If I Mod 2 = 0 Then
        Begin
          Red:= Green;
          Green:= Temp1 + 2 * Temp2;
          Temp1:= Red;
        End;

        //Odd tick
        If I Mod 2 = 1 Then
        Begin
          Red:= Green;
          Green:= 2 * Temp1 + Temp2;
          Temp2:= Red;
        End;
      End;

      //Searching for correct numbers before integer Limit
      If (Green >= 0) And (Red >= 0) And ((Green + Red) >= 0) Then
      Begin
        SavedGreen:= Green;
        SavedRed:= Red;
        SavedTick:= I;
      End
      Else
      Begin

        //Integer Limit was exceeded
        WriteLn('Out of limit during the tick ', I, '. Here is the last correct values.');
        Limit:= True;
      End;
    End;
  End;

  //Displaying the solution
  WriteLn('Tick: ', SavedTick, '; Red: ', SavedRed, '; Green: ', SavedGreen, '; Sum: ', SavedRed + SavedGreen);
  ReadLn;
End.

