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
  TMem = Record
    Inp1, Inp2, Res: Real;
  End;
  TDisp = Record
    Inp1, Inp2, Res, Op: String;
  End;
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
    Procedure btnHClick(Sender: TObject);
    Function ConvertSF(Var FInp: String): Real;
    Procedure AddNum(Var FInp: String; Var FAdd: String);
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
  GOpView: Array[TOp] Of String = ('?', 'arccos', 'arcctg', 'arcsin', 'arctg', 'cos', 'ctg', '/', '!', '-', '*', '%', '+', '^', 'sin', 'sqrt', 'tg', '^ 2', '^ 3', 'lg', 'ln', 'ch', 'sh', 'th', 'cth', '10 ^', '1 /', '!!');
  GFact1: Array[0..12] Of Integer = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);
  GFact2: Array[0..19] Of Integer = (1, 1, 2, 3, 8, 15, 48, 105, 384, 945, 3840, 10395, 46080, 135135, 645120, 2027025, 10321920, 34459425, 185794560, 654729075);
  GHist1: Set Of TOp = [EARCCOS, EARCCTG, EARCSIN, EARCTG, ECOS, ECTG, ESIN, ESQRT, ETG, ELG, ELN, ECH, ESH, ETH, ECTH];
  GHist2: Set Of TOp = [EFACTORIAL, EDFACTORIAL, ESQUARE, ECUBE];
  GHist3: Set Of TOp = [EBACK, ETEN];

Var
  Form1: TForm1;
  GDisp: TDisp;
  GOp: TOp;
  GMem: TMem;
  GLine: Integer;
  GError, GClear: Boolean;

Implementation

Uses Unit2;
{$R *.dfm}

Procedure Calculate();
Begin
  Case GOp Of
    EPLUS:
      GMem.Res:= GMem.Inp1 + GMem.Inp2;
    EMINUS:
      GMem.Res:= GMem.Inp1 - GMem.Inp2;
    EMULTIPLE:
      GMem.Res:= GMem.Inp1 * GMem.Inp2;
    EARCSIN:
      GMem.Res:= Arcsin(GMem.Inp1);
    EARCCOS:
      GMem.Res:= Arccos(GMem.Inp1);
    EARCTG:
      GMem.Res:= Arctan(GMem.Inp1);
    EARCCTG:
      GMem.Res:= Arccot(GMem.Inp1);
    ESIN:
      GMem.Res:= Sin(GMem.Inp1);
    ECOS:
      GMem.Res:= Cos(GMem.Inp1);
    ETG:
      GMem.Res:= Tan(GMem.Inp1);
    ECTG:
      GMem.Res:= Cotan(GMem.Inp1);
    ESQRT:
      GMem.Res:= Sqrt(GMem.Inp1);
    EPOWER:
      GMem.Res:= Power(GMem.Inp1, GMem.Inp2);
    EFACTORIAL:
      GMem.Res:= GFact1[Trunc(GMem.Inp1)];
    EDIVIDE:
      GMem.Res:= GMem.Inp1 / GMem.Inp2;
    EPERCENT:
      GMem.Res:= GMem.Inp2 * GMem.Inp1 / 100;
    ESQUARE:
      GMem.Res:= GMem.Inp1 * GMem.Inp1;
    ECUBE:
      GMem.Res:= GMem.Inp1 * GMem.Inp1 * GMem.Inp1;
    ELG:
      GMem.Res:= Log10(GMem.Inp1);
    ELN:
      GMem.Res:= Ln(GMem.Inp1);
    ECH:
      GMem.Res:= (Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1)) / 2;
    ESH:
      GMem.Res:= (Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1)) / 2;
    ETH:
      GMem.Res:= (Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1)) / (Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1));
    ECTH:
      GMem.Res:= (Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1)) / (Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1));
    ETEN:
      GMem.Res:= Power(10, GMem.Inp1);
    EBACK:
      GMem.Res:= 1 / GMem.Inp1;
    EDFACTORIAL:
      GMem.Res:= GFact2[Trunc(GMem.Inp1)];
  End;
End;

Function TForm1.ConvertSF(Var FInp: String): Real;
Var
  LInp: ^Real;
  LPos: ^Integer;
Begin
  New(LInp);
  New(LPos);
  GError:= False;
  Val(FInp, LInp^, LPos^);
  If LPos^ <> 0 Then
  Begin
    GError:= True;
    Result:= 0;
  End
  Else
    Result:= LInp^;
  Dispose(LInp);
  Dispose(LPos);
End;

Procedure TForm1.AddNum(Var FInp: String; Var FAdd: String);
Begin
  If (FInp = 'Error. No correct input') Or (FInp = '0') And (FAdd <> '.') Then
    FInp:= '';
  If (Pos('.', FInp) > 1) And (FAdd = '.') Then
    FAdd:= '';
  If (Pos('-', FInp) > 0) And (FAdd = '-') Then
    FAdd:= '';
  If GClear Then
  Begin
    FInp:= '';
    GClear:= False;
  End;
  FInp:= FInp + FAdd;
End;

Procedure TForm1.Display();
Begin
  If GOp <> ENULL Then
    If (Not GError) Then
    Begin
      Calculate();
      lblField.Caption:= FloatToStr(GMem.Res);
      Save();
    End
    Else
      lblField.Caption:= 'Error. No correct input';
  GOp:= ENULL;
  With GMem Do
  Begin
    Inp1:= 0;
    Inp2:= 0;
    Res:= 0;
  End;
End;

Procedure TForm1.Save();
Var
  LRes: ^String;
Begin
  New(LRes);
  If GOp <> ENULL Then
  Begin
    GDisp.Op:= GOpView[GOp];
    GDisp.Inp1:= FloatToStr(GMem.Inp1);
    GDisp.Inp2:= FloatToStr(GMem.Inp2);
    GDisp.Res:= FloatToStr(GMem.Res);

    If GOp In GHist1 Then
      LRes^:= GDisp.Op + '(' + GDisp.Inp1 + ') = ' + GDisp.Res
    Else
      If GOp In GHist2 Then
        LRes^:= GDisp.Inp1 + ' ' + GDisp.Op + ' = ' + GDisp.Res
      Else
        If GOp In GHist3 Then
          LRes^:= GDisp.Op + ' ' + GDisp.Inp1 + ' = ' + GDisp.Res
        Else
          LRes^:= GDisp.Inp1 + ' ' + GDisp.Op + ' ' + GDisp.Inp2 + ' = ' + GDisp.Res;

    Form2.mmoHistory.Lines.Insert(GLine, LRes^);
    Inc(GLine);
  End;

  GClear:= True;
  Dispose(LRes);
End;

Procedure TForm1.btnEqClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GMem.Inp2:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnBackClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EBACK;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnFactorialClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EFACTORIAL;
  GMem.Inp1:= ConvertSF(LInp^);
  If (Trunc(GMem.Inp1) <> GMem.Inp1) Or (GMem.Inp1 < 0) Or (GMem.Inp1 > 12) Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnDFactorialClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EDFACTORIAL;
  GMem.Inp1:= ConvertSF(LInp^);
  If (Trunc(GMem.Inp1) <> GMem.Inp1) Or (GMem.Inp1 < 0) Or (GMem.Inp1 > 19) Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnPosNegClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LAdd);
  New(LInp);
  LInp^:= lblField.Caption;
  LAdd^:= '-';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnSquareClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ESQUARE;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnSqrtClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ESQRT;
  GMem.Inp1:= ConvertSF(LInp^);
  If GMem.Inp1 < 0 Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnPowerClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EPOWER;
  GMem.Inp1:= ConvertSF(LInp^);
  lblField.Caption:= '';
  Dispose(LInp);
End;

Procedure TForm1.btnPercentClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EPERCENT;
  GMem.Inp1:= ConvertSF(LInp^);
  lblField.Caption:= '';
  Dispose(LInp);
End;

Procedure TForm1.btnMultipleClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EMULTIPLE;
  GMem.Inp1:= ConvertSF(LInp^);
  lblField.Caption:= '';
  Dispose(LInp);
End;

Procedure TForm1.btnDivideClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EDIVIDE;
  GMem.Inp1:= ConvertSF(LInp^);
  lblField.Caption:= '';
  Dispose(LInp);
End;

Procedure TForm1.btnPlusClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EPLUS;
  GMem.Inp1:= ConvertSF(LInp^);
  lblField.Caption:= '';
  Dispose(LInp);
End;

Procedure TForm1.btnMinusClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EMINUS;
  GMem.Inp1:= ConvertSF(LInp^);
  lblField.Caption:= '';
  Dispose(LInp);
End;

Procedure TForm1.btn0Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '0';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn1Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '1';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn2Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '2';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn3Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '3';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn4Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '4';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn5Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '5';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn6Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '6';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn7Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '7';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn8Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '8';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btn9Click(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '9';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnCommaClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '.';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  Dispose(LAdd);
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
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ETEN;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnSinClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ESIN;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnCosClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ECOS;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnAtgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EARCTG;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnTgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ETG;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnCtgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ECTG;
  GMem.Inp1:= ConvertSF(LInp^);
  If GMem.Inp1 = 0 Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnShClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ESH;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnChClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ECH;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnThClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ETH;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnCthClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ECTH;
  GMem.Inp1:= ConvertSF(LInp^);
  If GMem.Inp1 = 0 Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnLgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ELG;
  GMem.Inp1:= ConvertSF(LInp^);
  If GMem.Inp1 <= 0 Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnLnClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ELN;
  GMem.Inp1:= ConvertSF(LInp^);
  If GMem.Inp1 <= 0 Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnCubeClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ECUBE;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnActgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EARCCTG;
  GMem.Inp1:= ConvertSF(LInp^);
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnAsinClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EARCSIN;
  GMem.Inp1:= ConvertSF(LInp^);
  If (GMem.Inp1 > 1) Or (GMem.Inp1 < -1) Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnAcosClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EARCCOS;
  GMem.Inp1:= ConvertSF(LInp^);
  If (GMem.Inp1 > 1) Or (GMem.Inp1 < -1) Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnHClick(Sender: TObject);
Var
  LLine: ^Integer;
Begin
  New(LLine);
  Form2.show;
  LLine^:= Form2.mmoHistory.Lines.Count - 1;
  If AnsiPos('mmoHistory', Form2.mmoHistory.Lines[LLine^]) <> 0 Then
    Form2.mmoHistory.Lines.Delete(LLine^);
  Dispose(LLine);
End;

Initialization
  Begin
    GOp:= ENULL;
  End;
End.

