Unit Unit1;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, Menus;

//If the name begins from:
//T - Type Name
//G - Global Variable Name
//L - Local Variable Name
//E - Enum Member Name
//F - Formal Parameter Name
Type
  TOp = (ENULL, EARCCOS, EARCCTG, EARCSIN, EARCTG, ECOS, ECTG, EDIVIDE, EFACTORIAL, EMINUS, EMULTIPLE, EPERCENT, EPLUS, EPOWER, ESIN, ESQRT, ETG, ESQUARE, ECUBE, ELG, ELN, ECH, ESH, ETH, ECTH, ETEN, EBACK, EDFACTORIAL);
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
    Procedure btn10Click(Sender: TObject);
    Function ConvertSF(Var FInput: String): Real;
    Procedure AddNum(Var FInput: String; Var FAdd: String);
    Procedure Display();
    Procedure Save();
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
  GOp: TOp;
  GOpS, GInput1S, GInput2S, GOutputS: String;
  GInput1, GInput2, GOutput: Real;
  GError, GClear: Boolean;
  GLine: Integer;
  GOpView: Array[TOp] Of String = ('?', 'arccos', 'arcctg', 'arcsin', 'arctg', 'cos', 'ctg', '/', '!', '-', '*', '%', '+', '^', 'sin', 'sqrt', 'tg', '^ 2', '^ 3', 'lg', 'ln', 'ch', 'sh', 'th', 'cth', '10 ^', '1 /', '!!');
  GFact1: Array[0..12] Of Integer = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);
  GFact2: Array[0..19] Of Integer = (1, 1, 2, 3, 8, 15, 48, 105, 384, 945, 3840, 10395, 46080, 135135, 645120, 2027025, 10321920, 34459425, 185794560, 654729075);
  GHist1: Set Of TOp = [EARCCOS, EARCCTG, EARCSIN, EARCTG, ECOS, ECTG, ESIN, ESQRT, ETG, ELG, ELN, ECH, ESH, ETH, ECTH];
  GHist2: Set Of TOp = [EFACTORIAL, EDFACTORIAL, ESQUARE, ECUBE];
  GHist3: Set Of TOp = [EBACK, ETEN];
Implementation

Uses Unit2;
{$R *.dfm}

Procedure Calculate();
Begin
  Case GOp Of
    EPLUS:
      GOutput:= GInput1 + GInput2;
    EMINUS:
      GOutput:= GInput1 - GInput2;
    EMULTIPLE:
      GOutput:= GInput1 * GInput2;
    EARCSIN:
      GOutput:= Arcsin(GInput1);
    EARCCOS:
      GOutput:= Arccos(GInput1);
    EARCTG:
      GOutput:= Arctan(GInput1);
    EARCCTG:
      GOutput:= Arccot(GInput1);
    ESIN:
      GOutput:= Sin(GInput1);
    ECOS:
      GOutput:= Cos(GInput1);
    ETG:
      GOutput:= Tan(GInput1);
    ECTG:
      GOutput:= Cotan(GInput1);
    ESQRT:
      GOutput:= Sqrt(GInput1);
    EPOWER:
      GOutput:= Power(GInput1, GInput2);
    EFACTORIAL:
      GOutput:= GFact1[Trunc(GInput1)];
    EDIVIDE:
      GOutput:= GInput1 / GInput2;
    EPERCENT:
      GOutput:= GInput2 * GInput1 / 100;
    ESQUARE:
      GOutput:= GInput1 * GInput1;
    ECUBE:
      GOutput:= GInput1 * GInput1 * GInput1;
    ELG:
      GOutput:= Log10(GInput1);
    ELN:
      GOutput:= Ln(GInput1);
    ECH:
      GOutput:= (Power(E, GInput1) + Power(E, (-1) * GInput1)) / 2;
    ESH:
      GOutput:= (Power(E, GInput1) - Power(E, (-1) * GInput1)) / 2;
    ETH:
      GOutput:= (Power(E, GInput1) - Power(E, (-1) * GInput1)) / (Power(E, GInput1) + Power(E, (-1) * GInput1));
    ECTH:
      GOutput:= (Power(E, GInput1) + Power(E, (-1) * GInput1)) / (Power(E, GInput1) - Power(E, (-1) * GInput1));
    ETEN:
      GOutput:= Power(10, GInput1);
    EBACK:
      GOutput:= 1 / GInput1;
    EDFACTORIAL:
      GOutput:= GFact2[Trunc(GInput1)];
  End;
End;

Function TForm1.ConvertSF(Var FInput: String): Real;
Var
  LInput: Real;
  LPos: Integer;
Begin
  GError:= False;
  Val(FInput, LInput, LPos);
  If LPos <> 0 Then
  Begin
    GError:= True;
    Result:= 0;
  End
  Else
    Result:= LInput;
End;

Procedure TForm1.AddNum(Var FInput: String; Var FAdd: String);
Begin
  If (FInput = 'Error. No correct input') Or (FInput = '0') And (FAdd <> '.') Then
    FInput:= '';
  If (Pos('.', FInput) > 1) And (FAdd = '.') Then
    FAdd:= '';
  If (Pos('-', FInput) > 0) And (FAdd = '-') Then
    FAdd:= '';
  If GClear Then
  Begin
    FInput:= '';
    GClear:= False;
  End;
  FInput:= FInput + FAdd;
End;

Procedure TForm1.Display();
Begin
  If GOp <> ENULL Then
    If (Not GError) Then
    Begin
      Calculate();
      lblField.Caption:= FloatToStr(GOutput);
      Save();
    End
    Else
      lblField.Caption:= 'Error. No correct input';
End;

Procedure TForm1.Save();
Begin
  If GOp <> ENULL Then
  Begin
    GOpS:= GOpView[GOp];
    GInput1S:= FloatToStr(GInput1);
    GInput2S:= FloatToStr(GInput2);
    GOutputS:= FloatToStr(GOutput);

    If GOp In GHist1 Then
      Form2.mmoHistory.Lines.Insert(GLine, GOpS + '(' + GInput1S + ') = ' + GOutputS)
    Else
      If GOp In GHist2 Then
        Form2.mmoHistory.Lines.Insert(GLine, GInput1S + ' ' + GOpS + ' = ' + GOutputS)
      Else
        If GOp In GHist3 Then
          Form2.mmoHistory.Lines.Insert(GLine, GOpS + ' ' + GInput1S + ' = ' + GOutputS)
        Else
          Form2.mmoHistory.Lines.Insert(GLine, GInput1S + ' ' + GOpS + ' ' + GInput2S + ' = ' + GOutputS);

    Inc(GLine);
  End;

  GClear:= True;
End;

Procedure TForm1.btnEqClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GInput2:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnBackClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EBACK;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnFactorialClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EFACTORIAL;
  GInput1:= ConvertSF(LInput);
  If (Trunc(GInput1) <> GInput1) Or (GInput1 < 0) Or (GInput1 > 12) Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnDFactorialClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EDFACTORIAL;
  GInput1:= ConvertSF(LInput);
  If (Trunc(GInput1) <> GInput1) Or (GInput1 < 0) Or (GInput1 > 19) Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnPosNegClick(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '-';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btnSquareClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ESQUARE;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnSqrtClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ESQRT;
  GInput1:= ConvertSF(LInput);
  If GInput1 < 0 Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnPowerClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EPOWER;
  GInput1:= ConvertSF(LInput);
  lblField.Caption:= '';
End;

Procedure TForm1.btnPercentClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EPERCENT;
  GInput1:= ConvertSF(LInput);
  lblField.Caption:= '';
End;

Procedure TForm1.btnMultipleClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EMULTIPLE;
  GInput1:= ConvertSF(LInput);
  lblField.Caption:= '';
End;

Procedure TForm1.btnDivideClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EDIVIDE;
  GInput1:= ConvertSF(LInput);
  lblField.Caption:= '';
End;

Procedure TForm1.btnPlusClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EPLUS;
  GInput1:= ConvertSF(LInput);
  lblField.Caption:= '';
End;

Procedure TForm1.btnMinusClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EMINUS;
  GInput1:= ConvertSF(LInput);
  lblField.Caption:= '';
End;

Procedure TForm1.btn0Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '0';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn1Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '1';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn2Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '2';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn3Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '3';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn4Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '4';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn5Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '5';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn6Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '6';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn7Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '7';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn8Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '8';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btn9Click(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '9';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
End;

Procedure TForm1.btnCommaClick(Sender: TObject);
Var
  LInput, LAdd: String;
Begin
  LInput:= lblField.Caption;
  LAdd:= '.';
  AddNum(LInput, LAdd);
  lblField.Caption:= LInput;
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
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ETEN;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnSinClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ESIN;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnCosClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ECOS;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnAtgClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EARCTG;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnTgClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ETG;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnCtgClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ECTG;
  GInput1:= ConvertSF(LInput);
  If GInput1 = 0 Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnShClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ESH;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnChClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ECH;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnThClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ETH;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnCthClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ECTH;
  GInput1:= ConvertSF(LInput);
  If GInput1 = 0 Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnLgClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ELG;
  GInput1:= ConvertSF(LInput);
  If GInput1 <= 0 Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnLnClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ELN;
  GInput1:= ConvertSF(LInput);
  If GInput1 <= 0 Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnCubeClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= ECUBE;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnActgClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EARCCTG;
  GInput1:= ConvertSF(LInput);
  Display();
End;

Procedure TForm1.btnAsinClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EARCSIN;
  GInput1:= ConvertSF(LInput);
  If (GInput1 > 1) Or (GInput1 < -1) Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnAcosClick(Sender: TObject);
Var
  LInput: String;
Begin
  LInput:= lblField.Caption;
  GOp:= EARCCOS;
  GInput1:= ConvertSF(LInput);
  If (GInput1 > 1) Or (GInput1 < -1) Then
    GError:= True;
  Display();
End;

Procedure TForm1.btn10Click(Sender: TObject);
Begin
  Form2.show;
  If AnsiPos('mmoHistory', Form2.mmoHistory.Lines[Form2.mmoHistory.Lines.Count - 1]) <> 0 Then
    Form2.mmoHistory.Lines.Delete(Form2.mmoHistory.Lines.Count - 1)
End;

Initialization
  Begin
    GOp:= ENULL;
  End;
End.

