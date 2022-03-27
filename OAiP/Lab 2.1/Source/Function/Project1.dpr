Program Lab1F;
{Operations with matrix exps}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare types
Type
  TMatrix = Array[1..3, 1..3] Of Real;
  //TMatrix - matrix for using in subprograms
  
//Declare vars
Var
  A:TMatrix = ((1, -1, 0), (2, 0, -1), (1, 1, 1));
  B:TMatrix = ((5, 3, 1), (-1, 2, 0), (-3, 0, 0)); 
  C1, C2, C3, C4, C5, C6, C7:TMatrix;
  //I, J - loop params
  //A, B - start matrixs
  //C - result matrixs

//This func calculates Matrix * Number
Function MulN(const M:TMatrix; const N:Real):TMatrix;
Var
  I, J:Integer;
  //I, J - loop params
  
Begin

  //Multiple every cell of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M[I, J] * N;
End;

//This func calculates Matrix + Matrix
Function SumM(const M1:TMatrix; const M2:TMatrix; const IsPlus: Boolean):TMatrix;
Var
  I, J:Integer;
  //I, J - loop params

Begin

  //Sum every cell with every cell of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
    Begin
      if IsPlus then
        Result[I, J]:= M1[I, J] + M2[I, J]
      else
        Result[I, J]:= M1[I, J] - M2[I, J];
    End;
End;

//This func calculates Matrix * Matrix
Function MulM(const M1:TMatrix; const M2:TMatrix):TMatrix;
Var
  I, J:Integer;
  //I, J - loop params

Begin
  
  //Sum every line with every column of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M1[I, 1] * M2[1, J] + M1[I, 2] * M2[2, J] + M1[I, 3] * M2[3, J];
End;

//This func shows formatted matrix
Function Disp(const M:TMatrix):TMatrix;
Var
  I, J:Integer;
  //I, J - loop params

Begin

  //Display lines with spacing
  For I:= 1 To 3 Do
  Begin
    For J:= 1 To 3 Do
      Write(FloatToStr(M[I, J]):5, ' ');
    Writeln;
  End;
End;


Begin
  Disp(A);
  Writeln;
  Disp(B);
  Writeln;
  C1:=MulN(A, 2);
  C2:=MulN(B, 3);
  C3:=MulM(A, B);
  C4:=MulN(A, 2);
  C5:=SumM(C3, C4, False);
  C6:=MulM(C2, C5);
  C7:=SumM(C1, C6, True);
  Disp(C7);
  Readln;
End.
