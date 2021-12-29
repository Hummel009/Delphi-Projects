Program Lab5;
{For a given function f, calculate it's value with precision 0,00001; 0,000001 and x = 0.1; 0.2 ... 1.0 with a step h = 0.1.}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  I: Integer;
  Flag: Boolean;
  Y, Eps, Diff, Numerator, Denominator, K, X: Real;
  //I – parameter of cycle
  //X, K - arguments of function;
  //Y - the sum of a series of numbers for every K;
  //Eps – precision;
  //Diff - changes
  //Numerator, Denominator - parts of the function
Begin

  //Every X value
  Flag:= true;
  For I:= 1 to 2 do
  Begin       
    X:= 0.1;

    //If first iteration
    If Flag then
      Eps:= 0.00001
    Else
      Eps:= 0.000001;

    //Display Eps for the next block
    WriteLn('Eps =', Eps:3);

    //For every X
    While X <= 1.0 do


    Begin

      //Calculating sum from the beginning every time
      Y:= 0;
      K:= 1;
      Diff:=Eps+1;
      //Repeat until difference become too small
      While Diff >= Eps do
      Begin
        Numerator:= Exp(Ln(X) * (3 * K + 1));
        Denominator:= (4 * K - 1) * (4 * K - 2);
        Diff:= Numerator / Denominator;

        Y:= Y + Diff;

        //Increment K
        K:= K + 1;
      End;

      //Displaying values F, N, X
      WriteLn('X =', X:4:1, '; K =', K:4:0, '; F =', Y:16:13);

      //Increment X
      X:= X + 0.1;
    End;
    WriteLn;
    Flag:= False;
  End;
  ReadLn;
End.
