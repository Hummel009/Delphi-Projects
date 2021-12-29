Program Lab1;
{For a given function f, calculate it's value for n = 10; 11 ... 15 and x = 0.6; 0.7 ... 1.1 with a step h = 0.1.}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare vars
Var
  Numerator, Denominator, TermL1, TermL2, TermR1, TermR2, TermR3, TermR4, X, F, Sum: Real;
  N, K: Integer;
  //N - number of repetitions of the cycle;
  //X, K - arguments of function;
  //Sum - the sum of a series of numbers for every K;
  //F - function value.
  //Numerator, Denominator - parts of the function
  //TermL1, TermL2 – parts of the function
  //TermR1, TermR2, TermR3, TermR4 - parts of the function
Begin

  //Every X value
  X:= 0.6;
  While X <= 1.1 do
  Begin

    //Every N value
    For N:= 10 to 15 do
    Begin
      Sum:= 0;

      //Every K value
      For K:= 1 to N do
      Begin
        TermR1:= Exp(1.2 * K);   
        TermR2:= (K - 10) / (K + 30);
        Numerator:= Exp(Ln(TermR1 + TermR2) / K); 
        TermR3:= Sqrt((K * Exp(Ln(N + 5) / 3)));
        TermR4:= Ln(Sqrt(N * X));
        Denominator:= TermR3 + TermR4;
        Sum:= Sum + Numerator / Denominator;
      End;

      TermL1:= Exp(N * X) / 2;
      TermL2:= Exp(Ln(N * X) / 3);
      F:= Sum + Exp(Ln(TermL1 + TermL2) / 3);

      //Displaying values F, N, X
      WriteLn('X = ', X:2:1, ', N = ', N, ', F = ', F:17:13);
    End;

    //Increment X
    X:= X + 0.1;
    WriteLn;
  End;
  ReadLn;
End.
