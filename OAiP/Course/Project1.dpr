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
  Op: TOp;
  OpName, Str: String;
  OpNames: Array[TOp] Of String = ('ARCCOS', 'ARCCTG', 'ARCSIN', 'ARCTG', 'COS', 'CTG', 'DIVIDE', 'FACTORIAL', 'LOGARITHM', 'MINUS', 'MULTIPLE', 'PERCENT', 'PLUS', 'POWER', 'SIN', 'SQRT', 'TG', 'SQARE', 'CUBE', 'LG', 'LN', 'CH', 'SH', 'TH', 'CTH', 'TEN', 'BACK', 'DOUBLEFACT');
  Output, Input1, Input2: Real;
  Error: Boolean;
  Fact1: Array[0..12] Of Integer = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);

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

//Normal power function like in java
Function getPower(Const Number, Power: Real): Real;
Var
  PowerPositive, PowerNegative, PowerInt, PowerPositiveInt, PowerNegativeInt, NumberPositive, NumberNegative: Boolean;
Begin
  PowerPositive:= False;
  PowerNegative:= False;
  PowerInt:= False;
  PowerPositiveInt:= False;
  PowerNegativeInt:= False;
  NumberPositive:= False;
  NumberNegative:= False;

  If Trunc(Power) = Power Then
    PowerInt:= True;

  If Power > 0 Then
    PowerPositive:= True
  Else
    PowerNegative:= True;

  If Number > 0 Then
    NumberPositive:= True
  Else
    NumberNegative:= True;

  If PowerInt And PowerPositive Then
    PowerPositiveInt:= True;

  If PowerInt And PowerNegative Then
    PowerNegativeInt:= True;

  If (Number <> 0.0) And (Power = 0.0) Then
    Result:= 1.0
  Else
    If (Number = 0.0) And (Power <> 0.0) Then
      Result:= 0.0
    Else
      If NumberPositive And PowerNegative Then
        Result:= 1 / Exp(Power * Ln(Number))
      Else
        If NumberPositive And PowerPositive Then
          Result:= Exp(Power * Ln(Number))
        Else
          If NumberNegative And PowerNegativeInt Then
          Begin
            If Trunc(Power) Mod 2 = 0 Then
              Result:= 1 / Exp(Power * Ln(Abs(Number)))
            Else
              Result:= -1 / Exp(Power * Ln(Abs(Number)));
          End
          Else
            If NumberNegative And PowerPositiveInt Then
            Begin
              If Trunc(Power) Mod 2 = 0 Then
                Result:= Exp(Power * Ln(Abs(Number)))
              Else
                Result:= -Exp(Power * Ln(Abs(Number)));
            End
            Else
            Begin
              Result:= 0;
              Error:= True;
            End;
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
      Begin
        If (Trunc(Input1) <> Input1) Or (Input1 < 0) Or (Input1 > 12) Then
        Begin
          Output:= 0;
          Error:= True;
        End
        Else
          Output:= Fact1[Trunc(Input1)];
      End;
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
      WriteLn(FloatToStr(Output))
    Else
      WriteLn('Error');

    Write('Continue? Write "No" or "Yes" ');
    ReadLn(Str);
  Until Str <> 'Yes'
End.


