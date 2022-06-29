Function MulN(Const M: TMatrix; Const N: Real): TMatrix;
Var
  I, J: Integer;
Begin
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M[I, J] * N;
End;

Function SumM(Const M1: TMatrix; M2: TMatrix; Const IsPlus: Boolean):TMatrix;
Var
  I, J: Integer;
Begin
  If Not IsPlus Then
    MulN(M2, -1);
  For I:= 1 To 3 Do
    For J:= 1 To 3 Do
      Result[I, J]:= M1[I, J] + M2[I, J]
End;
