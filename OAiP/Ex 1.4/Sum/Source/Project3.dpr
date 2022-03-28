Program Ex4Sum;
{This program calculates the sum of two numbers consisting of 1 to 50 digits and displays it.}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare consts
Const
  Num = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  //Symbols, that should be in the number

//Declare vars
Var
  Str1, Str2:String;
  Num1, Num2:Array Of Integer;
  I, J:Integer;
  Max:Integer;
  Sum:Array[1..51] Of Integer;
  Error:Boolean;
  //Str1, Str2 - numbers as string
  //Num1, Num2 - numbers as array view
  //I, J - cycle parameters
  //Max - size of the number
  //Sum - result
  //Error - has bad symbols
Begin

  //Checking for the correct input
  Repeat
    Error:= False;

    Write('Enter the first number: ');
    ReadLn(Str1);

    //If too big
    If (Length(Str1) > 50) Then
      Error:= True;
    
    //If contains banned items
    For I:= 1 To Length(Str1) Do
      If Not (Str1[I] In Num) Then
        Error:= True;

    //Alarmimg the user
    If Error Then
      WriteLn('Invalid input. Enter another number.');

  Until Not Error;

  //Checking for the correct input
  Repeat
    Error:= False;

    Write('Enter the second number: ');
    ReadLn(Str2);

    //If too big
    If (Length(Str2) > 50) Then
      Error:= True;

    //If contains banned items
    For I:= 1 To Length(Str2) Do
      If Not (Str2[I] In Num) Then
        Error:= True;

    //Alarmimg the user
    If Error Then
      WriteLn('Invalid input. Enter another number.');

  Until Not Error;

  WriteLn;

  If Length(Str1) > Length(Str2) Then
    Max:= Length(Str1)
  Else
    Max:= Length(Str2);

  SetLength(Num1, Max);
  SetLength(Num2, Max);

  //Rewrite the first number in array
  J:= Max;
  For I:= Length(Str1) Downto 1 Do
  Begin
    Num1[J - 1]:= StrToInt(Str1[I]);
    J:= J - 1;
  End;

  //Rewrite the second number in array
  J:= Max;
  For I:= Length(Str2) Downto 1 Do
  Begin
    Num2[J - 1]:= StrToInt(Str2[I]);
    J:= J - 1;
  End;

  //Calculating the sum
  For I:= High(Num1) Downto 0 Do
  Begin

    //Base rule
    Sum[I + 2]:= Sum[I + 2] + Num1[I] + Num2[I];

    //Transfer next charges
    If Sum[I + 2] > 9 Then
    Begin
      Sum[I + 1]:= Sum[I + 2] Div 10;
      Sum[I + 2]:= Sum[I + 2] Mod 10;
    End;
  End;

  J:= 1;
  While Sum[J] = 0 Do
    J:= J + 1;

  //Displaying results
  For I:= J To (Max + 1) Do
    Write(Sum[I]);

  ReadLn;
End.

