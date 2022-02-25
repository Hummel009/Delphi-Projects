Program Lab1F;
{Operations with matrixes}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare types
Type
  TMatrix = Array[1..3, 1..3] Of Real;
  //TMatrix - matrix for using in procs
  
//Declare vars
Var
  A:TMatrix = ((1, -1, 0), (2, 0, -1), (1, 1, 1));
  B:TMatrix = ((5, 3, 1), (-1, 2, 0), (-3, 0, 0)); 
  C1, C2, C3, C4, C5, C6, C7:TMatrix;
  //I, J - loop params
  //A, B - start matrixs
  //C - result matrixs

//This func calculates Matrix * Number
Function MatrixMultipleNumber(Matrix:TMatrix; Num:Real):TMatrix;
Var
  I, J:Integer;
  Matr:TMatrix;
  //I, J - loop params
  //Matr - result
  
Begin

  //Multiple every cell of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Matr[I, J]:= Matrix[I, J] * Num;
  Result:= Matr;
End;

//This func calculates Matrix + Matrix
Function MatrixPlusMatrix(Matrix1:TMatrix; Matrix2:TMatrix; IsPlus: Boolean):TMatrix;
Var
  I, J:Integer;
  Matr:TMatrix;
  //I, J - loop params
  //Matr - result

Begin

  //Sum every cell with every cell of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
    Begin
      if IsPlus then
        Matr[I, J]:= Matrix1[I, J] + Matrix2[I, J]
      else
        Matr[I, J]:= Matrix1[I, J] - Matrix2[I, J];
    End;
  Result:= Matr;
End;

//This func calculates Matrix * Matrix
Function MatrixMultipleMatrix(Matrix1:TMatrix; Matrix2:TMatrix):TMatrix;
Var
  I, J:Integer;
  Matr:TMatrix;
  //I, J - loop params
  //Matr - result

Begin
  
  //Sum every line with every column of matrix
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Matr[I, J]:= Matrix1[I, 1] * Matrix2[1, J] + Matrix1[I, 2] * Matrix2[2, J] + Matrix1[I, 3] * Matrix2[3, J];
  Result:= Matr;
End;

//This func shows formatted matrix
Function DisplayMatrix(Matrix:TMatrix):TMatrix;
Var
  I, J:Integer;
  //I, J - loop params

Begin

  //Display lines with spacing
  For I:= 1 To 3 Do
  Begin
    For J:= 1 To 3 Do
      Write(FloatToStr(Matrix[I, J]):5, ' ');
    Writeln;
  End;
End;


Begin
  DisplayMatrix(A);
  Writeln;
  DisplayMatrix(B);
  Writeln;
  C1:= MatrixMultipleNumber(A, 2);
  C2:= MatrixMultipleNumber(B, 3);
  C3:= MatrixMultipleMatrix(A, B);
  C4:= MatrixMultipleNumber(A, 2);
  C5:= MatrixPlusMatrix(C3, C4, False);
  C6:= MatrixMultipleMatrix(C2, C5);
  C7:= MatrixPlusMatrix(C1, C6, True);
  DisplayMatrix(C7);
  Readln;
End.
