Program Lab4;
{Operations with matrix exps}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils,
  Unit1 In 'Unit1.pas';

//Declare vars
Var
  A: TMatrix = ((1, -1, 0), (2, 0, -1), (1, 1, 1));
  B: TMatrix = ((5, 3, 1), (-1, 2, 0), (-3, 0, 0));
  C1, C2, C3, C4, C5: TMatrix;
  //I, J - loop params
  //A, B - start matrixs
  //C - result matrixs

Begin
  Disp(A);
  Writeln;
  Disp(B);
  Writeln;
  C1:= MulN(A, 2);
  C2:= MulN(B, 3);
  C3:= MulM(A, B);
  C4:= MulN(A, 2);
  C5:= SumM(C3, C4, False);
  C3:= MulM(C2, C5);
  C2:= SumM(C1, C3, True);
  Disp(C2);
  Readln;
End.
