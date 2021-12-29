Program Ex4Mul;
{This program calculates the mul of two numbers consisting of 1 to 50 digits and displays it.}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare consts
Const
  Num = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  //Symbols, that should be in the number

//Variable description section
Var
  Str1, Str2:String;
  Num1, Num2, Res:Array Of Integer;
  Error, Invert:Boolean;
  I, J, L, K, Max:Integer;
  Sum:Array[1..51] Of Integer;
  //Str1, Str2 - numbers as string
  //Num1, Num2 - numbers as array view
  //Res - result of calculations
  //Error - has bad symbols
  //I,J,L,M – cycle parameters
  //Sum – sum of multiplies

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
    For I:= 2 To Length(Str1) Do
      If Not (Str1[I] In Num) Then
        Error:= True;

    If Not ((Str1[1] In Num) Or (Str1[1] = '-')) Then
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
    For I:= 2 To Length(Str2) Do
      If Not (Str2[I] In Num) Then
        Error:= True;

    If Not ((Str2[1] In Num) Or (Str2[1] = '-')) Then
      Error:= True;

    //Alarmimg the user
    If Error Then
      WriteLn('Invalid input. Enter another number.');

  Until Not Error;

  Invert:= False;
  
  //If the first < 0
  If (Pos('-', Str1) > 0) And Not (Pos('-', Str2) > 0) Then
  Begin
    Delete(Str1, Pos('-', Str1), 1);
    Invert:= True;
  End;
       
  //If the second < 0
  If (Pos('-', Str2) > 0) And Not (Pos('-', Str1) > 0) Then
  Begin
    Delete(Str2, Pos('-', Str1), 1);
    Invert:= True;
  End;
    
  //If both < 0
  If (Pos('-', Str2) > 0) And (Pos('-', Str1) > 0) Then
  Begin
    Delete(Str1, Pos('-', Str1), 1);
    Delete(Str2, Pos('-', Str2), 1);
  End;

  WriteLn;

  If Length(Str2) > Length(Str1) Then
    Max:= Length(Str2)
  Else
    Max:= Length(Str1);

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

  L:= Length(Str1) + Length(Str2);
  SetLength(Res, L);

  J:= L;
  
  K:= High(Num2);

  //Start cycle A1 by parameter M
  While K >= 0 Do
  Begin

    //Start cycle A2 for zeroing Res
    For I:= High(Res) Downto 0 Do
      Res[I]:= 0;
    //End of Cycle A2

    //Start cycle A3 for multiplying
    For I:= High(Num1) Downto 0 Do
    Begin
      Res[J - 1]:= Res[J - 1] + Num1[I] * Num2[K];

      //Check if element is bigger or equal 10
      If Res[J - 1] >= 10 Then
      Begin
        Res[J - 2]:= Res[J - 1] Div 10;
        Res[J - 1]:= Res[J - 1] Mod 10;
      End;
      J:= J - 1;
    End;

    //Start cycle A4 for suming
    For I:= High(Res) Downto 0 Do
    Begin
      Sum[L]:= Res[L - 1] + Sum[L];

      //Check if element is bigger or equal 10
      If Sum[L] >= 10 Then
      Begin
        Sum[L - 1]:= Sum[L - 1] + (Sum[L] Div 10);
        Sum[L]:= Sum[l] Mod 10;
      End;
      L:= L - 1;
    End;
    //End of cycle A4

    J:= J - 1;
    K:= K - 1;
  End;
  //End of cycle A1

  L:= Length(Str1) + Length(Str2);

  //Cut unneeded zeros
  J:= 1;
  While Sum[J] = 0 Do
    J:= J + 1;

  //For the <0
  If Invert Then
    Write('-');
    
  //Displaying results
  For I:= J To L Do
    Write(Sum[I]);

End.

