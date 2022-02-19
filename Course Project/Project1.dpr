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
  OpName, Str:String;
  OpNames:Array[TOp] Of String = ('ARCCOS', 'ARCCTG', 'ARCSIN', 'ARCTG', 'COS', 'CTG', 'DIVIDE', 'FACTORIAL', 'LOGARITHM', 'MINUS', 'MULTIPLE', 'PERCENT', 'PLUS', 'POWER', 'SIN', 'SQRT', 'TG', 'SQARE', 'CUBE', 'LG', 'LN', 'CH', 'SH', 'TH', 'CTH', 'TEN', 'BACK', 'DOUBLEFACT');
  Output, Input1, Input2:Real;
  Error:Boolean;

//Double factorial function
Function getDoubleFactorial(Var Input:Real):Integer;
Var
  Fctr, Rounded:Integer;
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

//Normal power function like in java
Function getPower(Const Number, Power:Real):Real;
Var
  PowerPositive, PowerNegative, PowerReal, PowerInt, PowerPositiveInt, PowerNegativeInt, NumberPositive, NumberNegative:Boolean;
Begin
  PowerPositive:= false;
  PowerNegative:= false;
  PowerReal:= false;
  PowerInt:= false;
  PowerPositiveInt:= false;
  PowerNegativeInt:= false;
  NumberPositive:= false;    
  NumberNegative:= false;

  If Trunc(Power) = Power Then
    PowerInt:= true
  Else
    PowerReal:= true;

  If Power > 0 Then
    PowerPositive:= True
  Else
    PowerNegative:= true; 

  If Number > 0 Then
    NumberPositive:= True
  Else
    NumberNegative:= true;

  If PowerInt And PowerPositive Then
    PowerPositiveInt:= true;

  If PowerInt And PowerNegative Then
    PowerNegativeInt:= true;

  If (Number <> 0.0) And (Power = 0.0) Then
    Result:= 1.0
  Else If (Number = 0.0) And (Power = 0.0) Then
  Begin
    Result:= 0;
    Error:= True;
  End
  Else If (Number = 0.0) And (Power <> 0.0) Then
    Result:= 0.0
  Else If NumberPositive And PowerNegative Then
    Result:= 1 / Exp(Power * Ln(Number))
  Else If NumberPositive And PowerPositive Then
    Result:= Exp(Power * Ln(Number))
  Else If NumberNegative And PowerNegativeInt Then
  Begin
    If Trunc(Power) Mod 2 = 0 Then
      Result:= 1 / Exp(Power * Ln(Abs(Number)))
    Else
      Result:= -1 / Exp(Power * Ln(Abs(Number)));
  End
  Else If NumberNegative And PowerPositiveInt Then
  Begin
    If Trunc(Power) Mod 2 = 0 Then
      Result:= Exp(Power * Ln(Abs(Number)))
    Else
      Result:= -Exp(Power * Ln(Abs(Number)));
  End
  Else If NumberNegative And PowerReal Then
  Begin
    Result:= 0;
    Error:= True;
  End;
End;

//Factorial function
Function getFactorial(Var Input:Real):Integer;
Var
  Fctr, Rounded, I:Integer;
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
    FPOWER:
      Output:= getPower(Input1, Input2);
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
    FCH:
      Output:= (getPower(2.7183, Input1) + getPower(2.7183, (-1) * Input1)) / 2;
    FSH:
      Output:= (getPower(2.7183, Input1) - getPower(2.7183, (-1) * Input1)) / 2;
    FTH:
      Output:= (getPower(2.7183, Input1) - getPower(2.7183, (-1) * Input1)) / (getPower(2.7183, Input1) + getPower(2.7183, (-1) * Input1));
    FCTH:
      Output:= (getPower(2.7183, Input1) + getPower(2.7183, (-1) * Input1)) / (getPower(2.7183, Input1) - getPower(2.7183, (-1) * Input1));
    FTEN:
      Output:= getPower(10, Input1);
    FBACK:
      Output:= 1 / Input1;
    FDOUBLEFACT:
      Output:= getDoubleFactorial(Input1);
  End;
End;

//Calculator
Begin
  Repeat
    Error:= False;
    Write('Enter the number: ');
    ReadLn(Input1);
    Write('Is there the second number? Write "No" or "Yes": ');
    ReadLn(Str);
    If Str = 'Yes' Then
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
    If Not Error Then
      Writeln(FloatToStr(Output))
    Else
      Writeln('Error');

    Write('Continue? Write "No" or "Yes" ');
    ReadLn(Str);
  Until Str = 'No'
End.
