Unit Unit1;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;

Type
  TOp = (FARCCOS, FARCCTG, FARCSIN, FARCTG, FCOS, FCTG, FDIVIDE, FFACTORIAL, FLOGARITHM, FMINUS, FMULTIPLE, FPERCENT, FPLUS, FPOWER, FSIN, FSQRT, FTG, FSQARE, FCUBE, FLG, FLN, FCH, FSH, FTH, FCTH, FTEN, FBACK, FDOUBLEFACT);
  TForm1 = Class(TForm)
    lblField: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btnPercent: TButton;
    btnComma: TButton;
    btnDivide: TButton;
    btnMultiple: TButton;
    btnMunus: TButton;
    btnPlus: TButton;
    btnClr: TButton;
    btnE: TButton;
    btnP: TButton;
    btnEq: TButton;
    btn0: TButton;
    btnSqrt: TButton;
    btnPower: TButton;
    btnSquare: TButton;
    btnBack: TButton;
    btnDFact: TButton;
    btnCube: TButton;
    btnMore: TButton;
    btnFact: TButton;
    Procedure btn0Click(Sender: TObject);
    Procedure btn1Click(Sender: TObject);
    Procedure btn2Click(Sender: TObject);
    Procedure btn3Click(Sender: TObject);
    Procedure btn4Click(Sender: TObject);
    Procedure btn5Click(Sender: TObject);
    Procedure btn6Click(Sender: TObject);
    Procedure btn7Click(Sender: TObject);
    Procedure btn8Click(Sender: TObject);
    Procedure btn9Click(Sender: TObject);
    Procedure btnCommaClick(Sender: TObject);
    Procedure btnClearClick(Sender: TObject);
    Procedure btnEilerClick(Sender: TObject);
    Procedure btnPeeClick(Sender: TObject);
    Procedure btnPlusClick(Sender: TObject);
    Procedure btnEqClick(Sender: TObject);
    Procedure btnMultipleClick(Sender: TObject);
    Procedure btnDivideClick(Sender: TObject);
    Procedure btnMinusClick(Sender: TObject);
    Procedure btnSqrtClick(Sender: TObject);
    Procedure btnPowerClick(Sender: TObject);
    Procedure btnSquareClick(Sender: TObject);
    Procedure btnCubeClick(Sender: TObject);
    Procedure btnBackClick(Sender: TObject);
    Procedure btnFactorialClick(Sender: TObject);
    Procedure btnDFactorialClick(Sender: TObject);
    Procedure btnPercentClick(Sender: TObject);
    Function ConvertSF(inp: String): Real;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;
  Op: TOp;
  OpName, Str: String;
  Output, Input1, Input2: Real;
  Error: Boolean;
  Fact1: Array[0..12] Of Integer = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);

Implementation
{$R *.dfm}
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

Function TForm1.ConvertSF(inp: String): Real;
var
  test: Real; 
  pos: Integer;
Begin
  Error:= False;
  Val(inp, test, pos);
  If pos <> 0 Then
  Begin
    Error:= True;
    Result:= 0;
  End
  Else
    Result:= test;
End;

Procedure TForm1.btnEqClick(Sender: TObject);
Begin
  Input2:= ConvertSF(lblField.Caption);
  If Not Error Then
  Begin
    Calculate();
    lblField.Caption:= FloatToStr(Output);
  End
  Else
    lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnBackClick(Sender: TObject);
Begin
  Op:= FBACK;
  Input1:= ConvertSF(lblField.Caption);
  If Not Error Then
  Begin
    Calculate();
    lblField.Caption:= FloatToStr(Output);
  End
  Else
    lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnFactorialClick(Sender: TObject);
Begin
  Op:= FFACTORIAL;
  Input1:= ConvertSF(lblField.Caption);
  If Not Error Then
  Begin
    Calculate();
    lblField.Caption:= FloatToStr(Output);
  End
  Else
    lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnDFactorialClick(Sender: TObject);
Begin
  Op:= FDOUBLEFACT;
  Input1:= ConvertSF(lblField.Caption);
  If Not Error Then
  Begin
    Calculate();
    lblField.Caption:= FloatToStr(Output);
  End
  Else
    lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnCubeClick(Sender: TObject);
Begin
  Op:= FCUBE;
  Input1:= ConvertSF(lblField.Caption);
  If Not Error Then
  Begin
    Calculate();
    lblField.Caption:= FloatToStr(Output);
  End
  Else
    lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnSquareClick(Sender: TObject);
Begin
  Op:= FSQARE;
  Input1:= ConvertSF(lblField.Caption);
  If Not Error Then
  Begin
    Calculate();
    lblField.Caption:= FloatToStr(Output);
  End
  Else
    lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnSqrtClick(Sender: TObject);
Begin
  Op:= FSQRT;
  Input1:= ConvertSF(lblField.Caption);
  If Not Error Then
  Begin
    Calculate();
    lblField.Caption:= FloatToStr(Output);
  End
  Else
    lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnPowerClick(Sender: TObject);
Begin
  Op:= FPOWER;
  Input1:= ConvertSF(lblField.Caption);
  lblField.Caption:= '';
End;

Procedure TForm1.btnPercentClick(Sender: TObject);
Begin
  Op:= FPERCENT;
  Input1:= ConvertSF(lblField.Caption);
  lblField.Caption:= '';
End;

Procedure TForm1.btnMultipleClick(Sender: TObject);
Begin
  Op:= FMULTIPLE;
  Input1:= ConvertSF(lblField.Caption);
  lblField.Caption:= '';
End;

Procedure TForm1.btnDivideClick(Sender: TObject);
Begin
  Op:= FDIVIDE;
  Input1:= ConvertSF(lblField.Caption);
  lblField.Caption:= '';
End;

Procedure TForm1.btnPlusClick(Sender: TObject);
Begin
  Op:= FPLUS;
  Input1:= ConvertSF(lblField.Caption);
  lblField.Caption:= '';
End;

Procedure TForm1.btnMinusClick(Sender: TObject);
Begin
  Op:= FMINUS;
  Input1:= ConvertSF(lblField.Caption);
  lblField.Caption:= '';
End;

Procedure TForm1.btn0Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '0';
  lblField.Caption:= s;
End;

Procedure TForm1.btn1Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '1';
  lblField.Caption:= s;
End;

Procedure TForm1.btn2Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '2';
  lblField.Caption:= s;
End;

Procedure TForm1.btn3Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '3';
  lblField.Caption:= s;
End;

Procedure TForm1.btn4Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '4';
  lblField.Caption:= s;
End;

Procedure TForm1.btn5Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '5';
  lblField.Caption:= s;
End;

Procedure TForm1.btn6Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '6';
  lblField.Caption:= s;
End;

Procedure TForm1.btn7Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '7';
  lblField.Caption:= s;
End;

Procedure TForm1.btn8Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '8';
  lblField.Caption:= s;
End;

Procedure TForm1.btn9Click(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '9';
  lblField.Caption:= s;
End;

Procedure TForm1.btnCommaClick(Sender: TObject);
Var
  s: String;
Begin
  s:= lblField.Caption;
  s:= s + '.';
  lblField.Caption:= s;
End;

Procedure TForm1.btnClearClick(Sender: TObject);
Begin
  lblField.Caption:= '';
  Input1:= 0;
  Input2:= 0;
End;

Procedure TForm1.btnEilerClick(Sender: TObject);
Begin
  lblField.Caption:= '2.718281828459045';
End;

Procedure TForm1.btnPeeClick(Sender: TObject);
Begin
  lblField.Caption:= '3.141592653589793';
End;
End.
