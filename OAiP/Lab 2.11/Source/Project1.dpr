Program Lab11;
{Program calcs boolean exprs}

{$APPTYPE CONSOLE}

Uses
  SysUtils;

Var
  Sus: String;

//This procedure calcs unar ops
//Sus - our string
Procedure UnoOp(Var Sus: String);
Var
  OpPos: Integer;
Begin

  //Find op pos
  OpPos:= Pos('Not', Sus);
  If (OpPos > 0) Then
  Begin
    If (Sus[OpPos + 4] = 'T') Then
    Begin
	
      //Replace first type
      Delete(Sus, OpPos, Length('Not(True)'));
      Insert('False', Sus, OpPos);
    End
    Else
    Begin
	
      //Replace second type
      Delete(Sus, OpPos, Length('Not(False)'));
      Insert('True', Sus, OpPos);
    End;
    UnoOp(Sus);
  End;
End;

//This procedure calcs binar ops
//Sus - our string
Procedure DuoOp(Var Sus: String; Const Op, Value: String);
Var
  OpPos, LB, RB: Integer;
  Part1, Part2: String;
Begin
  OpPos:= Pos(Op, Sus);

  If (OpPos > 0) Then
  Begin
    //Define content between brackets
    LB:= OpPos + Length(Op);
    Part1:= Copy(Sus, LB, Length(Sus) - LB + 1);
    RB:= Pos(')', Part1);
    Part2:= Copy(Part1, 1, RB);

    //Replace with equal operand
    If Pos(Value, Part2) > 0 Then
    Begin
      Delete(Sus, OpPos, Length(Part2) + Length(Op));
      Insert(Value, Sus, OpPos)
    End;
    DuoOp(Sus, Op, Value);
  End;
End;

Begin
  Write('Enter formula: ');
  Readln(Sus);

  UnoOp(Sus);
  
  //Define priority
  If Pos('And', Sus) > Pos('Or', Sus) Then
  Begin
    DuoOp(Sus, 'And', 'False');
    DuoOp(Sus, 'Or', 'True');
  End
  Else
  Begin
    DuoOp(Sus, 'Or', 'True');
    DuoOp(Sus, 'And', 'False');
  End;

  WriteLn('The result is: ', Sus);

  ReadLn;
End.