Program Razminka3;
{This program calculates the best way how to buy user`s number of floppy disks}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Disks, Cartons, Boxes, Error, Quantity1, Quantity2: Integer;
  Price1, Price2: Real;
  Input: String;
  {Disks, Cartons, Boxes - the number of disks, cartons and boxes
  Price1 - price without economy
  Price2 - price with economy
  Input - input string
  Error - operator for checking input}
Begin
  Error:= 0;

  //Checking for the correct input
  Repeat
    Write('Enter the number of floppy disks: ');
    ReadLn(Input);
    Val(Input, Quantity1, Error);
    If (Quantity1 <= 0) or (Error <> 0) then
      WriteLn('Invalid Input. Enter another number.');
  Until (Quantity1 > 0) and (Error = 0);
  WriteLn;

  Disks:=Quantity1;
  
  Price1:= Disks * 11.5;
  WriteLn('Usual price without economy: ', Price1:1:1);
  WriteLn;

  //Checking for the number of boxes
  Boxes:= Disks div 144;

  //Remaining floppy disks
  Disks:= Disks mod 144;

  //Checking for the number of cartons
  Cartons:= Disks div 12;

  //Remaining floppy disks
  Disks:= Disks mod 12;

  //If the box is profitable
  If Disks * 11.5 >= 114.5 then
  Begin
    Disks:= 0;
    Cartons:= Cartons + 1;
  End;

  //If the carton is profitable
  If Cartons * 114.5 >= 1255 then
  Begin
    Cartons:= 0;
    Disks:= 0;
    Boxes:= Boxes + 1;
  End;

  //Calculating the new price
  Price2:= Disks * 11.5 + Cartons * 114.5 + Boxes * 1255;
  Quantity2:= Disks + Cartons * 12 + Boxes * 144;

  //Checking for economy existence
  If Price2 < Price1 then
  Begin
    WriteLn('Strategy for economy: ', Boxes, ' boxes; ', Cartons, ' cartons; ', Disks, ' disks.');
    WriteLn;
    WriteLn('New price with economy: ', Price2:1:1);
    WriteLn('Saved money: ', (Price1-Price2):1:1);
    If Quantity2 > Quantity1 then
      WriteLn('Bonus disks: ', Quantity2-Quantity1);
  End
  Else
    WriteLn('This number of floppy disks is too low, so you can`t use economy strategy.');
  ReadLn;
End.
