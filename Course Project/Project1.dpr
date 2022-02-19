Program DelphiCalculator;
{Console calculator}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils, Math;

//Declare types
Type
  TOp = (FARCCOS, FARCCTG, FARCSIN, FARCTG, FCOS, FCTG, FDIVIDE, FFACTORIAL, FLOGARITHM, FMINUS, FMULTIPLE, FPERCENT, FPLUS, FPOWER, FSIN, FSQRT, FTG, FSQARE, FCUBE, FLG, FLN, FCH, FSH, FTH, FCTH, FTEN, FBACK, FDOUBLEFACT);

//Declare vars
Var
  Op:TOp;
  OpName, HasSecond: String;
  OpNames:Array[TOp] Of String = ('ARCCOS', 'ARCCTG', 'ARCSIN', 'ARCTG', 'COS', 'CTG', 'DIVIDE', 'FACTORIAL', 'LOGARITHM', 'MINUS', 'MULTIPLE', 'PERCENT', 'PLUS', 'POWER', 'SIN', 'SQRT', 'TG', 'SQARE', 'CUBE', 'LG', 'LN', 'CH', 'SH', 'TH', 'CTH', 'TEN', 'BACK', 'DOUBLEFACT');
  Output, Input1, Input2: Real;
  I: Integer;

//Double factorial function
Function getDoubleFactorial(Var Input: Real): Integer;
Var
  Fctr, Rounded: Integer;
Begin
  Fctr:= 1;
  rounded:= Trunc(Input1);
  While Rounded >= 1 Do
  Begin
    Fctr:= Fctr * Rounded;
    Rounded:= Rounded - 2;
  End;
  Result:= Fctr;
End;

//Factorial function
Function getFactorial(Var Input: Real): Integer;
Var
  Fctr, Rounded, I: Integer;
Begin
  Fctr:= 1;
  Rounded:= Trunc(Input1);
  I:= 1;
  While Rounded >= I Do
  Begin
    Fctr:= Fctr * I;
    I:= I + 1
  End;
  Result:= Fctr;
End;

//Operating part. Depending on current operation will do calculations
Procedure Calculate();
Begin
  Case Op Of
    FPLUS:
      Output:= Input1 + Input2;
    FMINUS:
      Output:= Input1 - Input2;
    FMULTIPLE:
      Output:= Input1 * Input2;
    FARCSIN:
      Output:= Arcsin(Input1);
    FARCCOS:
      Output:= Arccos(Input1);
    FARCTG:
      Output:= Arctan(Input1);
    FARCCTG:
      Output:= Arccot(Input1);
    FSIN:
      Output:= Sin(Input1);
    FCOS:
      Output:= Cos(Input1);
    FTG:
      Output:= Tan(Input1);
    FCTG:
      Output:= Cotan(Input1);
    FSQRT:
      Output:= Sqrt(Input1);
    FLOGARITHM:
      Output:= Log10(Input1) / Log10(Input2);
    //FPOWER:
     // Output:= Math.pow(Input1, Input2);
    FFACTORIAL:
      Output:= getFactorial(Input1);
    FDIVIDE:
      Output:= Input1 / Input2;
    FPERCENT:
      Output:= Input2 * Input1 / 100;
    FSQARE:
      Output:= Input1 * Input1;
    FCUBE:
      Output:= Input1 * Input1 * Input1;
    FLG:
      Output:= Log10(Input1);
    FLN:
      Output:= Ln(Input1);
    {FCH:
      Output:= (Math.pow(2.7183, Input1) + Math.pow(2.7183, (-1) * Input1)) / 2;
    FSH:
      Output:= (Math.pow(2.7183, Input1) - Math.pow(2.7183, (-1) * Input1)) / 2;
    FTH:
      Output:= (Math.pow(2.7183, Input1) - Math.pow(2.7183, (-1) * Input1)) / (Math.pow(2.7183, Input1) + Math.pow(2.7183, (-1) * Input1));
    FCTH:
      Output:= (Math.pow(2.7183, Input1) + Math.pow(2.7183, (-1) * Input1)) / (Math.pow(2.7183, Input1) - Math.pow(2.7183, (-1) * Input1));
    FTEN:
      Output:= Math.pow(10, Input1); }
    FBACK:
      Output:= 1 / Input1;
    FDOUBLEFACT:
      Output:= getDoubleFactorial(Input1);
  End;
End;

//Calculator
Begin
  Write('Enter the number: ');
  ReadLn(Input1);
  Write('Is there the second number? Write "No" or "Yes" ');
  ReadLn(HasSecond);
  If HasSecond = 'Yes' Then
  Begin
    Write('Enter the number: ');
    ReadLn(Input2);
  End;
  Write('Type the operation name, example: "PLUS": ');
  ReadLn(OpName);
  Op:= FARCCOS;
  Repeat
    Inc(Op);
  Until OpName = OpNames[Op];

  Calculate();
  Writeln(FloatToStr(Output));
  Readln;
End.  
