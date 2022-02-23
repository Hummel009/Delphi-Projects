Program Lab1;
{Console calculator}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare types
Type
  TMatrix = array[1..3, 1..3] of Real;
  
//Declare vars
Var
  i, j: Integer;
  a, b, c: TMatrix;

//This func calculates Matrix * Number
Function MatrixMultipleNumber(Matrix:TMatrix; Num:Real):TMatrix;
Var
  i, j: integer;
  matr: TMatrix;
Begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      matr[i,j]:=Matrix[i,j] * Num;
  Result:=matr;
End;

//This func calculates Matrix + Matrix
Function MatrixPlusMatrix(Matrix1:TMatrix; Matrix2:TMatrix):TMatrix;
Var
  i, j: integer;
  matr: TMatrix;
Begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      matr[i,j]:=Matrix1[i,j] + Matrix2[i,j];
  Result:=matr;
End;  
      
//This func calculates Matrix * Matrix
Function MatrixMultipleMatrix(Matrix1:TMatrix; Matrix2:TMatrix):TMatrix;
Var
  i, j: integer;
  matr: TMatrix;
Begin

  for i:=1 to 3 do    
    for j:=1 to 3 do
      matr[i,j]:=Matrix1[i,1] * Matrix2[1,j] + Matrix1[i,2] * Matrix2[2,j] + Matrix1[i,3] * Matrix2[3,j];

  Result:=matr;
End;
             
//This func shows formatted matrix
Procedure DisplayMatrix(Matrix:TMatrix);
Var
  i, j: integer;
Begin
  for i:=1 to 3 do
  begin
    for j:=1 to 3 do
      Write(FloatToStr(Matrix[i,j]):5, ' ');
    Writeln;
  end;
End; 
    
//This func makes good header with spacing
Procedure DisplayText(Str:String);
Begin
  Writeln;
  Writeln(Str);
  Writeln;
End;
  
Begin
  Randomize;
  for i:=1 to 3 do
    for j:=1 to 3 do
      A[i,j]:=10+Random(10);

  for i:=1 to 3 do
    for j:=1 to 3 do
      B[i,j]:=10+Random(10);

  DisplayText('Matrix A');
  DisplayMatrix(A);
  DisplayText('Matrix B');
  DisplayMatrix(B);
  DisplayText('Matrix A*3');
  c:=MatrixMultipleNumber(A, 3);
  DisplayMatrix(C);
  DisplayText('Matrix A+B');
  c:=MatrixPlusMatrix(A, B);
  DisplayMatrix(C);
  DisplayText('Matrix A*B');
  c:=MatrixMultipleMatrix(A, B);
  DisplayMatrix(C);
  Readln;
End.
