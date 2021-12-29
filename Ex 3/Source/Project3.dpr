Program Razminka3;
{This program calculates the best way how to buy user`s number of floppy disks}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Disks, Cartons, Boxes, Error, Quantity1, Quantity2:Integer;
  Price1, Price2:Real;
  Input:String;
  //Disks, Cartons, Boxes – quantities of capacities
  //Price1 - price without economy
  //Price2 - price with economy
  //Input - input string
  //Error - operator for checking input
Begin

  //Checking for the correct input
  Repeat
    Write('Enter the number of floppy disks: ');
    ReadLn(Input);
    Val(Input, Quantity1, Error);
    If (Quantity1 < 0) Or (Error <> 0) Then
      WriteLn('Invalid Input. Enter another number.');
  Until (Quantity1 >= 0) And (Error = 0);
  WriteLn;

  Disks:= Quantity1;

  Price1:= Disks * 11.5;
  WriteLn('Usual price without economy: ', Price1:3:1);
  WriteLn;

  Boxes:= Disks Div 144;               (* Boxes quantity *)
  Disks:= Disks Mod 144;           (* Remaining quantity *)
  Cartons:= Disks Div 12;            (* Cartons quantity *)
  Disks:= Disks Mod 12;            (* Remaining quantity *)

  //If the carton is profitable
  If Disks * 11.5 >= 114.5 Then
  Begin
    Disks:= 0;
    Inc(Cartons);
  End;

  //If the box is profitable
  If Cartons * 114.5 >= 1255 Then
  Begin
    Cartons:= 0;
    Disks:= 0;
    Inc(Boxes);
  End;

  //Calculating the new price
  Price2:= Disks * 11.5 + Cartons * 114.5 + Boxes * 1255;
  Quantity2:= Disks + Cartons * 12 + Boxes * 144;

  //Checking for economy existence
  If Price2 < Price1 Then
  Begin
    WriteLn('Strategy for economy: ', Boxes, ' boxes; ', Cartons, ' cartons; ', Disks, ' disks.');
    WriteLn;
    WriteLn('New price with economy: ', Price2:3:1);
    WriteLn('Saved money: ', (Price1 - Price2):3:1);

    //If has bonus disks
    If Quantity2 > Quantity1 Then
      WriteLn('Bonus disks: ', Quantity2 - Quantity1);
  End
  Else
    WriteLn('This number of floppy disks is too low, so you can`t use economy strategy.');
  ReadLn;
End.

