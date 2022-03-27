Unit Unit1;

Interface

//Declare modules
Uses
  SysUtils;

//Declare types
Type
  TMatrix = Array[1..3, 1..3] Of Real;
  //TMatrix - matrix for using in subprograms

Function Disp(Const M: TMatrix): TMatrix;
Function MulN(Const M: TMatrix; Const N: Real): TMatrix;
Function MulM(Const M1: TMatrix; Const M2: TMatrix): TMatrix;
Function SumM(Const M1: TMatrix; M2: TMatrix; Const IsPlus: Boolean): TMatrix;

Implementation

//This func calculates Matrix * Number
Function MulN(Const M: TMatrix; Const N: Real): TMatrix;
Var
  I, J: Integer;
  //I, J - loop params
Begin
  //Multiple every cell of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M[I, J] * N;
End;

//This func calculates Matrix + Matrix
Function SumM(Const M1: TMatrix; M2: TMatrix; Const IsPlus: Boolean):TMatrix;
Var
  I, J: Integer;
  //I, J - loop params
Begin
  //Sum every cell with every cell of matrix
  If Not IsPlus Then
    MulN(M2, -1);
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M1[I, J] + M2[I, J]
End;

//This func calculates Matrix * Matrix
Function MulM(Const M1: TMatrix; Const M2: TMatrix): TMatrix;
Var
  I, J: Integer;
  //I, J - loop params
Begin
  //Sum every line with every column of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M1[I, 1] * M2[1, J] + M1[I, 2] * M2[2, J] + M1[I, 3] * M2[3, J];
End;

//This func shows formatted matrix
Function Disp(Const M: TMatrix): TMatrix;
Var
  I, J: Integer;
  //I, J - loop params
Begin
  //Display lines with spacing
  For I:= 1 To 3 Do
  Begin
    For J:= 1 To 3 Do
      Write(FloatToStr(M[I, J]): 5, ' ');
    Writeln;
  End;
End;
End.
