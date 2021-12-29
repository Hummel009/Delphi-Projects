Program Razminka1;
{This program calculates quantity of monks for every Rank. Initial data are portions, numbers of all monks and cakes.}

//use app
{$APPTYPE CONSOLE}

//declare modules
Uses
  SysUtils;

//declare modules
Var
  Cakes1, Cakes2, Cakes3: Real;
  Input: String;
  Error, MaxRank1, Solutions, Rank1, Rank2, Rank3, Monks, Cakes: Integer;

  {Cakes1, Cakes2, Cakes3 - quantity of cakes per portion
  Rank1, Rank2, Rank3 - quantity of monks per rank
  Solutions - quantity of solutions
  Input - input string for checking input 
  Error - operator for checking input
  MaxRank1 - maximum quantity of higher monks}

Begin
  Error:= 0;

  //checking for the correct input
  Repeat
    Write('Enter the portion of higher monks: ');
    ReadLn(Input);
    Val(Input, Cakes1, Error);
    If (Cakes1 <= 0) or (Error <> 0) then
      WriteLn('Invalid Input. Enter another number.');
  Until (Cakes1 > 0) and (Error = 0);

  //checking for the correct input
  Repeat
    Write('Enter the portion of secondary monks: ');
    ReadLn(Input);
    Val(Input, Cakes2, Error);
    If (Cakes2 >= Cakes1) or (Cakes2 <= 0) or (Error <> 0) then
      WriteLn('Invalid Input. Enter another number.');
  Until (Cakes2 < Cakes1) and (Error = 0) and (Cakes2 > 0);

  //checking for the correct input
  Repeat
    Write('Enter the portion of student monks: ');
    ReadLn(Input);
    Val(Input, Cakes3, Error);
    If (Cakes3 >= Cakes2) or (Cakes3 < 0) or (Error <> 0) then
      WriteLn('Invalid Input. Enter another number.');
  Until (Cakes3 < Cakes2) and (Error = 0) and (Cakes3 > 0);

  //checking for the correct input
  Repeat
    Write('Enter the number of all cakes: ');
    ReadLn(Input);
    Val(Input, Cakes, Error);
    If (Cakes <= 0) or (Error <> 0) then
      WriteLn('Invalid Input. Enter another number.');
  Until (Cakes > 0) and (Error = 0);

  //checking for the correct input
  Repeat
    Write('Enter the number of all monks: ');
    ReadLn(Input);
    Val(Input, Monks, Error);
    If (Monks <= 0) or (Error <> 0) then
      WriteLn('Invalid Input. Enter another number.');
  Until (Monks > 0) and (Error = 0);

  MaxRank1:= Trunc(Cakes / Cakes1);
  Solutions:= 0;

  {This cycle starts with higher monks' number selection in range of [0, MaxRank1]. Number of monks calculates with formulas, which are described in the documentation.}
  For Rank1:= 0 to MaxRank1 do
  Begin
    //Rank2 calculations
    Rank2:= Round((Monks * Cakes3 - Rank1 * Cakes3 - Cakes + Cakes1 * Rank1) / (Cakes3 - Cakes2));
    If Rank2 >= 0 then
    Begin
      //Rank3 calculations
      Rank3:= Monks - Rank1 - Rank2;
      If Rank3 >= 0 then
      Begin
        If Cakes = Rank1 * Cakes1 + Rank2 * Cakes2 + Rank3 * Cakes3 then
        Begin
          Solutions:= Solutions + 1;
          If Solutions > 1 then
            WriteLn('The second solution:');
          WriteLn(Rank1, ' higher monks have eaten ', Cakes1:0:1, ' cakes.');
          WriteLn(Rank2, ' secondary monks have eaten ', Cakes2:0:1, ' cakes.');
          WriteLn(Rank3, ' student monks have eaten ', Cakes3:0:1, ' cakes.')
        End
      End
    End
  End;

  //next solution
  If Solutions >= 1 then
    WriteLn('The problem has ', Solutions, ' solutions')
  //no solutions
  Else
    WriteLn('There is no solutions.');
  ReadLn;
End.
