Program Lab10;
{This program calcs S of Integral}

{$APPTYPE CONSOLE}

Type
  TIntegral = Procedure(X: Real; Var Res: Real);
  //TIntegral - Integral

Var
  Res: Real;
  //Res - result

//This subprog saves integral
//X - needed, res - result
Procedure FirstI(X: Real; Var Res: Real);
Begin
  Res:= 1 / (Sqrt(2* X * X + 3));
End;
     
//This subprog saves integral
//X - needed, res - result
Procedure SecondI(X: Real; Var Res: Real);
Begin
  Res:= Sqrt(X ) * cos(X*X);
End;
           
//This subprog calcs integral
//Integral - data, Min, Max, Eps - borders and accuracy, res - result
Procedure RightRec(Integral: TIntegral; Min, Max, Eps: Real; Var Res: Real);
Var
  I, N: Integer;
  H, Last, Delta: Real;
  Temp: Real;
  //I, N - counters
  //H - step
  //Last, Delta - accuracy
  //Temp - saved data

Begin
  Res:= 0;
  N:= 1;
  Integral(Min, Delta);
  While Abs(Delta) > Eps Do
  Begin
    Last:= Res;
    Res:= 0;
    H:= (Max - Min) / N;
    For I:= 1 To N Do
    Begin
      Integral(Min + I * H, Temp);
      Res:= Res + Temp;
    End;
    Res:= Res * H;

    Delta:= Last - Res;
    N:= N + 10;
  End;
End;
      
//This subprog calcs integral
//Integral - data, Min, Max, Eps - borders and accuracy, res - result
Procedure Trapezoid(Integral: TIntegral; Min, Max, Eps: Real; Var Res: Real);
Var
  I, N: Integer;
  H, Last, Delta: Real;
  Temp: Real;
  //I, N - counters
  //H - step
  //Last, Delta - accuracy
  //Temp - saved data

Begin
  Res:= 0;
  N:= 1;
  Integral(Min, Delta);

  While Abs(Delta) > Eps Do
  Begin
    Last:= Res;
    Res:= 0;
    H:= (Max - Min) / N;
    For I:= 1 To N Do
    Begin
      Integral(Min + I * H, Temp);
      Res:= Res + Temp;
    End;
    Integral(Min, Temp);
    Res:= Res + Temp;
    Integral(Max, Temp);
    Res:= Res + Temp;
    Res:= Res * H;

    Delta:= Last - Res;
    N:= N + 10;
  End;
End;    

//This subprog shows logs
//Func - function, left, right, eps - borders and accuracy
Procedure PrintInfo(Func: TIntegral; Left, Right, Eps: Real);
Begin
  WriteLn('Eps: ', Eps: 8: 6);
  Write('1) ');
  RightRec(Func, Left, Right, Eps, Res);
  WriteLn('Square = ', Res: 10: 7);
  Write('2) ');
  Trapezoid(Func, Left, Right, Eps, Res);
  WriteLn('Square = ', Res: 10: 7);
End;

Begin
  WriteLn('1st func: ');
  PrintInfo(FirstI, 0.8, 1.4, 1E-5);
  PrintInfo(FirstI, 0.8, 1.4, 1E-6);

  WriteLn('2nd func: ');       
  PrintInfo(SecondI, 0.4, 1.2, 1E-5);
  PrintInfo(SecondI, 0.4, 1.2, 1E-6);

  Readln;
End.
