Unit Unit1;

Interface

Uses
  SysUtils;

Type
  TMatrix = Array[1..3, 1..3] Of Real;

Procedure Disp(Const M: TMatrix);
Function MulM(Const M1: TMatrix; Const M2: TMatrix): TMatrix;

Implementation

Procedure Disp(Const M: TMatrix);
Var
  I, J: Integer;
Begin
  For I:= 1 To 3 Do
  Begin
    For J:= 1 To 3 Do
      Write(FloatToStr(M[I, J]): 5, ' ');
    Writeln;
  End;
End;    

Function MulM(Const M1: TMatrix; Const M2: TMatrix): TMatrix;
Var
  I, J: Integer;
Begin
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M1[I, 1] * M2[1, J] + M1[I, 2] * M2[2, J] + M1[I, 3] * M2[3, J];
End;

End.
