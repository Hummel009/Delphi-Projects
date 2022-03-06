Unit Unit1;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, Menus;

Type
  TOp = (FNULL, FARCCOS, FARCCTG, FARCSIN, FARCTG, FCOS, FCTG, FDIVIDE, FFACTORIAL, FLOGARITHM, FMINUS, FMULTIPLE, FPERCENT, FPLUS, FPOWER, FSIN, FSQRT, FTG, FSQARE, FCUBE, FLG, FLN, FCH, FSH, FTH, FCTH, FTEN, FBACK, FDOUBLEFACT);
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
    btnPosNeg: TButton;
    btnTen: TButton;
    btnFact: TButton;
    btnSin: TButton;
    btnTg: TButton;
    btnCtg: TButton;
    btnCos: TButton;
    btnAsin: TButton;
    btnAtg: TButton;
    btnActg: TButton;
    btnAcos: TButton;
    btnSh: TButton;
    btnTh: TButton;
    btnCth: TButton;
    btnCh: TButton;
    btnLn: TButton;
    btnLg: TButton;
    btnCube: TButton;
    btn10: TButton;
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
    Procedure btnPosNegClick(Sender: TObject);
    Procedure btnBackClick(Sender: TObject);
    Procedure btnFactorialClick(Sender: TObject);
    Procedure btnDFactorialClick(Sender: TObject);
    Procedure btnPercentClick(Sender: TObject);
    Procedure AddNum(Var inp: String; Var num: String);
    Procedure Display();
    Procedure btnTenClick(Sender: TObject);
    Procedure btnSinClick(Sender: TObject);
    Procedure btnCosClick(Sender: TObject);
    Procedure btnAtgClick(Sender: TObject);
    Procedure btnTgClick(Sender: TObject);
    Procedure btnCtgClick(Sender: TObject);
    Procedure btnShClick(Sender: TObject);
    Procedure btnChClick(Sender: TObject);
    Procedure btnThClick(Sender: TObject);
    Procedure btnCthClick(Sender: TObject);
    Procedure btnLgClick(Sender: TObject);
    Procedure btnLnClick(Sender: TObject);
    Procedure btnCubeClick(Sender: TObject);
    Procedure btnActgClick(Sender: TObject);
    Procedure btnAsinClick(Sender: TObject);
    Procedure btnAcosClick(Sender: TObject);
    Function ConvertSF(Var inp: String): Real;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Const
  E = 2.718281828459045;
  P = 3.141592653589793;
Var
  Form1: TForm1;
  Op: TOp;
  OpName, Str: String;
  Output, Input1, Input2: Real;
  Error: Boolean;
  Fact1: Array[0..12] Of Integer = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);
  Fact2: Array[0..19] Of Integer = (1, 1, 2, 3, 8, 15, 48, 105, 384, 945, 3840, 10395, 46080, 135135, 645120, 2027025, 10321920, 34459425, 185794560, 654729075);

Implementation
{$R *.dfm}

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
    FPOWER:
      Output:= Power(Input1, Input2);
    FFACTORIAL:
      Output:= Fact1[Trunc(Input1)];
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
      Output:= (Power(E, input1) + Power(E, (-1) * input1)) / 2;
    FSH:
      Output:= (Power(E, input1) - Power(E, (-1) * input1)) / 2;
    FTH:
      Output:= (Power(E, input1) - Power(E, (-1) * input1)) / (Power(E, input1) + Power(E, (-1) * input1));
    FCTH:
      Output:= (Power(E, input1) + Power(E, (-1) * input1)) / (Power(E, input1) - Power(E, (-1) * input1));
    FTEN:
      Output:= Power(10, Input1);
    FBACK:
      Output:= 1 / Input1;
    FDOUBLEFACT:
      Output:= Fact2[Trunc(Input1)];
  End;
End;

Function TForm1.ConvertSF(Var inp: String): Real;
Var
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

Procedure TForm1.AddNum(Var inp: String; Var num: String);
Begin
  If (inp = 'Error. No correct input') Or (inp = '0') And (num <> '.') Then
    Inp:= '';
  If (Pos('.', Inp) > 1) And (num = '.') Then
    num:= '';
  If (Pos('-', Inp) > 0) And (num = '-') Then
    num:= '';

  Inp:= inp + num;
End;

Procedure TForm1.Display();
Begin
  If Op <> FNULL Then
    If (Not Error) Then
    Begin
      Calculate();
      lblField.Caption:= FloatToStr(Output);
    End
    Else
      lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.btnEqClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Input2:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnBackClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FBACK;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnFactorialClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FFACTORIAL;
  Input1:= ConvertSF(str);
  If (Trunc(Input1) <> Input1) Or (Input1 < 0) Or (Input1 > 12) Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnDFactorialClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FDOUBLEFACT;
  Input1:= ConvertSF(str);
  If (Trunc(Input1) <> Input1) Or (Input1 < 0) Or (Input1 > 19) Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnPosNegClick(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '-';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btnSquareClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FSQARE;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnSqrtClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FSQRT;
  Input1:= ConvertSF(str);
  If Input1 < 0 Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnPowerClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FPOWER;
  Input1:= ConvertSF(str);
  lblField.Caption:= '';
End;

Procedure TForm1.btnPercentClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FPERCENT;
  Input1:= ConvertSF(str);
  lblField.Caption:= '';
End;

Procedure TForm1.btnMultipleClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FMULTIPLE;
  Input1:= ConvertSF(str);
  lblField.Caption:= '';
End;

Procedure TForm1.btnDivideClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FDIVIDE;
  Input1:= ConvertSF(str);
  lblField.Caption:= '';
End;

Procedure TForm1.btnPlusClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FPLUS;
  Input1:= ConvertSF(str);
  lblField.Caption:= '';
End;

Procedure TForm1.btnMinusClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FMINUS;
  Input1:= ConvertSF(str);
  lblField.Caption:= '';
End;

Procedure TForm1.btn0Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '0';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn1Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '1';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn2Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '2';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn3Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '3';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn4Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '4';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn5Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '5';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn6Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '6';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn7Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '7';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn8Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '8';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btn9Click(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '9';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btnCommaClick(Sender: TObject);
Var
  inp, add: String;
Begin
  inp:= lblField.Caption;
  add:= '.';
  AddNum(inp, add);
  lblField.Caption:= inp;
End;

Procedure TForm1.btnClearClick(Sender: TObject);
Begin
  lblField.Caption:= '0';
End;

Procedure TForm1.btnEilerClick(Sender: TObject);
Begin
  lblField.Caption:= '2.718281828459045';
End;

Procedure TForm1.btnPeeClick(Sender: TObject);
Begin
  lblField.Caption:= '3.141592653589793';
End;

Procedure TForm1.btnTenClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FTEN;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnSinClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FSIN;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnCosClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FCOS;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnAtgClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FARCTG;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnTgClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FTG;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnCtgClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FCTG;
  Input1:= ConvertSF(str);
  If Input1 = 0 Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnShClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FSH;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnChClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FCH;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnThClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FTH;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnCthClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FCTH;
  Input1:= ConvertSF(str);
  If Input1 = 0 Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnLgClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FLG;
  Input1:= ConvertSF(str);
  If Input1 <= 0 Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnLnClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FLN;
  Input1:= ConvertSF(str);
  If Input1 <= 0 Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnCubeClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FCUBE;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnActgClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FARCCTG;
  Input1:= ConvertSF(str);
  Display();
End;

Procedure TForm1.btnAsinClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FARCSIN;
  Input1:= ConvertSF(str);
  If (Input1 > 1) Or (Input1 < -1) Then
    Error:= True;
  Display();
End;

Procedure TForm1.btnAcosClick(Sender: TObject);
Var
  str: String;
Begin
  str:= lblField.Caption;
  Op:= FARCCOS;
  Input1:= ConvertSF(str);
  If (Input1 > 1) Or (Input1 < -1) Then
    Error:= True;
  Display();
End;

Initialization
  Begin
    Op:= FNULL;
  End;
End.

