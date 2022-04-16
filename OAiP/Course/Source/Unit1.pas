Unit Unit1;

Interface

Uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Math,
  Menus;

//If the name begins from:
//T - Type Name
//G - Global Variable Name
//L - Local Variable Name
//E - Enum Member Name
//F - Formal Parameter Name
Type
  TLine = ^ELine;
  ELine = Record
    Data: Real;
    Next, Prev: TLine;
  End;
  TMem = Record
    Inp1, Inp2, Res: Real;
  End;
  TDisp = Record
    Inp1, Inp2, Res, Op: String;
  End;
  TOp = (ENULL, EARCCOS, EARCCTG, EARCSIN, EARCTG, ECOS, ECTG, EDIVIDE, EFACTORIAL, EMINUS, EMULTIPLE, EPERCENT, EPLUS, EPOWER, ESIN, ESQRT, ETG, ESQUARE, ECUBE, ELG, ELN, ECH, ESH, ETH, ECTH, ETEN, EBACK, EDFACTORIAL, EEXP, ETWO, ESC, ECSC, EARCSC, EARCCSC, ESCH, ECSCH, EVERSIN, EVERCOS, EHAVERSIN, EHAVERCOS, EEXSC, EEXCSC);
  TForm1 = Class(TForm)
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
    btnClrAll: TButton;
    btnE: TButton;
    btnP: TButton;
    btnEq: TButton;
    btn0: TButton;
    btnSqrt: TButton;
    btnPowerY: TButton;
    btnPower2: TButton;
    btnBack: TButton;
    btnDFact: TButton;
    btnPosNeg: TButton;
    btn10Power: TButton;
    btnFact: TButton;
    btnLn: TButton;
    btnLg: TButton;
    btnPower3: TButton;
    btnHist: TButton;
    btnBulk: TButton;
    btnTrig: TButton;
    btn2Power: TButton;
    btnExp: TButton;
    btnClr: TButton;
    btnFloat: TButton;
    dlgOpen1: TOpenDialog;
    lblField: TLabel;
    mmoTemp: TMemo;
    Procedure btnFloatClick(Sender: TObject);
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
    Procedure btnClearAllClick(Sender: TObject);
    Procedure btnClearClick(Sender: TObject);
    Procedure btnEilerClick(Sender: TObject);
    Procedure btnPeeClick(Sender: TObject);
    Procedure btnPlusClick(Sender: TObject);
    Procedure btnEqClick(Sender: TObject);
    Procedure btnMultipleClick(Sender: TObject);
    Procedure btnDivideClick(Sender: TObject);
    Procedure btnMinusClick(Sender: TObject);
    Procedure btnSqrtClick(Sender: TObject);
    Procedure btnPowerYClick(Sender: TObject);
    Procedure btnPower2Click(Sender: TObject);
    Procedure btnPosNegClick(Sender: TObject);
    Procedure btnBackClick(Sender: TObject);
    Procedure btnFactorialClick(Sender: TObject);
    Procedure btnDFactorialClick(Sender: TObject);
    Procedure btnPercentClick(Sender: TObject);
    Procedure btn10PowerClick(Sender: TObject);
    Procedure btnLgClick(Sender: TObject);
    Procedure btnLnClick(Sender: TObject);
    Procedure btnPower3Click(Sender: TObject);
    Procedure btn2PowerClick(Sender: TObject);
    Procedure btnExpClick(Sender: TObject);
    Procedure btnHistClick(Sender: TObject);
    Procedure btnTrigClick(Sender: TObject);
    Procedure btnBulkClick(Sender: TObject);
    Procedure LimException(Const FOp: TOp; Const FInt: Extended);
    Procedure FactException(Const FOp: TOp; Const FInt: Integer);
    Procedure NegException(Const FOp: TOp);
    Procedure PlaceSymbol(Const FSym: String);
    Procedure TwoNumbers(Const FOp: TOp);
    Procedure Display();
    Function ConvertSF(Var FInp: String): Real;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Const
  E = 2.718281828459045;
  P = 3.141592653589793;
  GOpView: Array[TOp] Of String = ('?', 'arccos', 'arcctg', 'arcsin', 'arctg', 'cos', 'ctg', '/', '!', '-', '*', '%', '+', '', 'sin', 'sqrt', 'tg', ' 2', ' 3', 'lg', 'ln', 'ch', 'sh', 'th', 'cth', '10 ', '1 /', '!!', 'exp', '2 ', 'sec', 'cosec', 'arcsec', 'arccosec', 'sch', 'csch', 'versin', 'vercos', 'haversin', 'havercos', 'exsec', 'excosec');
  GFact1: Array[0..12] Of Integer = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);
  GFact2: Array[0..19] Of Integer = (1, 1, 2, 3, 8, 15, 48, 105, 384, 945, 3840, 10395, 46080, 135135, 645120, 2027025, 10321920, 34459425, 185794560, 654729075);
  GHist1: Set Of TOp = [EARCCOS, EARCCTG, EARCSIN, EARCTG, ECOS, ECTG, ESIN, ESQRT, ETG, ELG, ELN, ECH, ESH, ETH, ECTH, EEXP, ESC, ECSC, EARCSC, EARCCSC, ESCH, ECSCH, EVERSIN, EVERCOS, EHAVERSIN, EHAVERCOS, EEXSC, EEXCSC];
  GHist2: Set Of TOp = [EFACTORIAL, EDFACTORIAL, ESQUARE, ECUBE];
  GHist3: Set Of TOp = [EBACK, ETEN, ETWO];

Var
  Form1: TForm1;
  GDisp: TDisp;
  GOp: TOp;
  GMem: TMem;
  GLine: Integer;
  GError, GClear: Boolean;

Implementation

Uses Unit2,
  Unit3;
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
      GMem.Res:= Power(GMem.Inp1, 2);
    ECUBE:
      GMem.Res:= Power(GMem.Inp1, 3);
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
    ETWO:
      GMem.Res:= Power(2, GMem.Inp1);
    EEXP:
      GMem.Res:= Power(E, GMem.Inp1);
    ESC:
      GMem.Res:= 1 / Cos(GMem.Inp1);
    ECSC:
      GMem.Res:= 1 / Sin(GMem.Inp1);
    EARCSC:
      GMem.Res:= 1 / Arccos(1 / GMem.Inp1);
    EARCCSC:
      GMem.Res:= 1 / Arcsin(1 / GMem.Inp1);
    ESCH:
      GMem.Res:= 1 / ((Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1)) / 2);
    ECSCH:
      GMem.Res:= 1 / ((Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1)) / 2);
    EVERSIN:
      GMem.Res:= 1 - Cos(GMem.Inp1);
    EVERCOS:
      GMem.Res:= 1 - Sin(GMem.Inp1);
    EHAVERSIN:
      GMem.Res:= (1 - Cos(GMem.Inp1)) / 2;
    EHAVERCOS:
      GMem.Res:= (1 - Sin(GMem.Inp1)) / 2;
    EEXSC:
      GMem.Res:= (1 / Cos(GMem.Inp1)) - 1;
    EEXCSC:
      GMem.Res:= (1 / Sin(GMem.Inp1)) - 1;
    ENULL:
  End;
End;

Procedure ResetData();
Begin
  GOp:= ENULL;
  GError:= False;
  With GMem Do
  Begin
    Inp1:= 0;
    Inp2:= 0;
    Res:= 0;
  End;
End;

Procedure SaveData();
Var
  LRes: String;
Begin
  If GOp <> ENULL Then
  Begin
    GDisp.Op:= GOpView[GOp];
    GDisp.Inp1:= FloatToStr(GMem.Inp1);
    GDisp.Inp2:= FloatToStr(GMem.Inp2);
    GDisp.Res:= FloatToStr(GMem.Res);

    If GOp In GHist1 Then
      LRes:= GDisp.Op + '(' + GDisp.Inp1 + ') = ' + GDisp.Res
    Else
      If GOp In GHist2 Then
        LRes:= GDisp.Inp1 + ' ' + GDisp.Op + ' = ' + GDisp.Res
      Else
        If GOp In GHist3 Then
          LRes:= GDisp.Op + ' ' + GDisp.Inp1 + ' = ' + GDisp.Res
        Else
          LRes:= GDisp.Inp1 + ' ' + GDisp.Op + ' ' + GDisp.Inp2 + ' = ' + GDisp.Res;

    Form2.mmoHistory.Lines.Insert(GLine, LRes);
    Inc(GLine);
  End;

  GClear:= True;
End;

Function TForm1.ConvertSF(Var FInp: String): Real;
Var
  LInp: Real;
  LPos, LLim: Integer;
  LPower: String;
Begin
  If (Pos('E', FInp) > 0) Then
  Begin
    LPower:= FInp;
    Delete(LPower, 1, pos('E', LPower));
    Val(LPower, LLim, LPos);
    If LLim >= 308 Then
      GError:= True;
  End;

  If Not GError Then
  Begin
    Val(FInp, LInp, LPos);
    If LPos <> 0 Then
      GError:= True
    Else
      Result:= LInp;
  End;
End;

Procedure TForm1.Display();
Begin
  If (GOp = EPOWER) And ((GMem.Inp1 > 143) Or (GMem.Inp2 > 143)) Then
    GError:= True;

  If GOp <> ENULL Then
    If (Not GError) Then
    Begin
      Calculate();
      lblField.Caption:= FloatToStr(GMem.Res);
      SaveData();
    End
    Else
      lblField.Caption:= 'Error. No correct input';
  ResetData();
End;

Procedure TForm1.btnEqClick(Sender: TObject);
Var
  LInp: String;
Begin
  LInp:= lblField.Caption;
  GMem.Inp2:= ConvertSF(LInp);
  Display();
End;

Procedure TForm1.btnBackClick(Sender: TObject);
Var
  LInp: String;
Begin
  LInp:= lblField.Caption;
  GOp:= EBACK;
  GMem.Inp1:= ConvertSF(LInp);
  Display();
End;

Procedure TForm1.FactException(Const FOp: TOp; Const FInt: Integer);
Var
  LInp: String;
Begin
  LInp:= lblField.Caption;
  GOp:= FOp;
  GMem.Inp1:= ConvertSF(LInp);
  If (Trunc(GMem.Inp1) <> GMem.Inp1) Or (GMem.Inp1 < 0) Or (GMem.Inp1 > FInt) Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnFactorialClick(Sender: TObject);
Begin
  FactException(EFACTORIAL, 12);
End;

Procedure TForm1.btnDFactorialClick(Sender: TObject);
Begin
  FactException(EDFACTORIAL, 19);
End;

Procedure TForm1.LimException(Const FOp: TOp; Const FInt: Extended);
Var
  LInp: String;
Begin
  LInp:= lblField.Caption;
  GOp:= FOp;
  GMem.Inp1:= ConvertSF(LInp);
  If GMem.Inp1 >= FInt Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnPower2Click(Sender: TObject);
Begin
  LimException(ESQUARE, 1E154);
End;

Procedure TForm1.btnExpClick(Sender: TObject);
Begin
  LimException(EEXP, 710);
End;

Procedure TForm1.btn2PowerClick(Sender: TObject);
Begin
  LimException(ETWO, 1024);
End;

Procedure TForm1.btn10PowerClick(Sender: TObject);
Begin
  LimException(ETEN, 308);
End;

Procedure TForm1.btnPower3Click(Sender: TObject);
Begin
  LimException(ECUBE, 1E100);
End;

Procedure TForm1.NegException(Const FOp: TOp);
Var
  LInp: String;
Begin
  LInp:= lblField.Caption;
  GOp:= FOp;
  GMem.Inp1:= ConvertSF(LInp);
  If GMem.Inp1 <= 0 Then
    GError:= True;
  Display();
End;

Procedure TForm1.btnSqrtClick(Sender: TObject);
Begin
  NegException(ESQRT);
End;

Procedure TForm1.btnLgClick(Sender: TObject);
Begin
  NegException(ELG);
End;

Procedure TForm1.btnLnClick(Sender: TObject);
Begin
  NegException(ELN);
End;

Procedure TForm1.TwoNumbers(Const FOp: TOp);
Var
  LInp: String;
Begin
  LInp:= lblField.Caption;
  GOp:= FOp;
  GMem.Inp1:= ConvertSF(LInp);
  lblField.Caption:= '';
End;

Procedure TForm1.btnPercentClick(Sender: TObject);
Begin
  TwoNumbers(EPERCENT);
End;

Procedure TForm1.btnPowerYClick(Sender: TObject);
Begin
  TwoNumbers(EPOWER);
End;

Procedure TForm1.btnMultipleClick(Sender: TObject);
Begin
  TwoNumbers(EMULTIPLE);
End;

Procedure TForm1.btnDivideClick(Sender: TObject);
Begin
  TwoNumbers(EDIVIDE);
End;

Procedure TForm1.btnPlusClick(Sender: TObject);
Begin
  TwoNumbers(EPLUS);
End;

Procedure TForm1.btnMinusClick(Sender: TObject);
Begin
  TwoNumbers(EMINUS);
End;

Procedure TForm1.PlaceSymbol(Const FSym: String);
Var
  LInp, LAdd: String;
Begin
  If GClear Then
  Begin
    lblField.Caption:= '0';
    GClear:= False;
  End;

  LInp:= lblField.Caption;
  LAdd:= FSym;

  If (LInp = 'Error. No correct input') Then
    LInp:= '0';

  If (Length(LInp) >= 32) Then
    LAdd:= '';

  If (LInp = '0') And (LAdd <> '0') And (LAdd <> '-') And (LAdd <> '.') And (LAdd <> 'E') Then
    LInp:= '';

  If (Pos('.', LInp) > 1) And (LAdd = '.') Then
    LAdd:= '';
  If (Pos('E', LInp) > 1) And (LAdd = 'E') Then
    LAdd:= '';
  If ((LInp = '0') Or (LInp = '-')) And (LAdd = 'E') Then
    LAdd:= '';
  If (LInp = '0') And (LAdd = '0') Then
    LAdd:= '';
  If (LInp <> '0') And (LInp <> '') And (LAdd = '-') Then
    LAdd:= '';
  If (LInp = '0') And (LAdd = '-') Then
  Begin
    LInp:= '-';
    LAdd:= '';
  End;

  lblField.Caption:= LInp + LAdd;
End;

Procedure TForm1.btnPosNegClick(Sender: TObject);
Begin
  PlaceSymbol('-');
End;

Procedure TForm1.btnFloatClick(Sender: TObject);
Begin
  PlaceSymbol('E');
End;

Procedure TForm1.btn0Click(Sender: TObject);
Begin
  PlaceSymbol('0');
End;

Procedure TForm1.btn1Click(Sender: TObject);
Begin
  PlaceSymbol('1');
End;

Procedure TForm1.btn2Click(Sender: TObject);
Begin
  PlaceSymbol('2');
End;

Procedure TForm1.btn3Click(Sender: TObject);
Begin
  PlaceSymbol('3');
End;

Procedure TForm1.btn4Click(Sender: TObject);
Begin
  PlaceSymbol('4');
End;

Procedure TForm1.btn5Click(Sender: TObject);
Begin
  PlaceSymbol('5');
End;

Procedure TForm1.btn6Click(Sender: TObject);
Begin
  PlaceSymbol('6');
End;

Procedure TForm1.btn7Click(Sender: TObject);
Begin
  PlaceSymbol('7');
End;

Procedure TForm1.btn8Click(Sender: TObject);
Begin
  PlaceSymbol('8');
End;

Procedure TForm1.btn9Click(Sender: TObject);
Begin
  PlaceSymbol('9');
End;

Procedure TForm1.btnCommaClick(Sender: TObject);
Begin
  PlaceSymbol('.');
End;

Procedure TForm1.btnClearAllClick(Sender: TObject);
Begin
  lblField.Caption:= '0';
  ResetData();
End;

Procedure TForm1.btnClearClick(Sender: TObject);
Var
  LInp: String;
  LLen: Integer;
Begin
  If (lblField.Caption = 'Error. No correct input') Then
    lblField.Caption:= '0'
  Else
  Begin
    LInp:= lblField.Caption;
    LLen:= Length(LInp);
    Delete(LInp, LLen, 1);
    lblField.Caption:= LInp;
    If (LLen = 1) Then
      lblField.Caption:= '0';
  End;
End;

Procedure TForm1.btnEilerClick(Sender: TObject);
Begin
  lblField.Caption:= '2.718281828459045';
End;

Procedure TForm1.btnPeeClick(Sender: TObject);
Begin
  lblField.Caption:= '3.141592653589793';
End;

Procedure TForm1.btnHistClick(Sender: TObject);
Var
  LLine: Integer;
Begin
  Form2.show;
  LLine:= Form2.mmoHistory.Lines.Count - 1;
  If AnsiPos('mmoHistory', Form2.mmoHistory.Lines[LLine]) <> 0 Then
    Form2.mmoHistory.Lines.Delete(LLine);
End;

Procedure TForm1.btnTrigClick(Sender: TObject);
Begin
  Form3.show;
End;

Procedure TForm1.btnBulkClick(Sender: TObject);
Var
  LFile: TextFile;
  LData: String;
  LLine1, LLine2: TLine;
  LRes: Real;
Begin
  GError:= False;
  With GMem Do
  Begin
    Inp1:= 0;
    Inp2:= 0;
    Res:= 0;
  End;

  If dlgOpen1.Execute Then
  Begin
    AssignFile(LFile, dlgOpen1.FileName);
    Reset(LFile);

    New(LLine1);
    LLine1^.Prev:= Nil;
    While Not EoF(LFile) Do
    Begin
      LLine2:= LLine1;
      ReadLn(LFile, LData);
      LLine1^.Data:= ConvertSF(LData);
      New(LLine1);
      LLine2^.Next:= LLine1;
      LLine1^.Prev:= LLine2;
    End;
    LLine2^.Next:= Nil;

    //One step back
    LLine1:= LLine1^.Prev;
    LLine1^.Next:= Nil;

    CloseFile(LFile);

    Case GOp Of
      EPLUS:
        Begin
          LRes:= 0;
          While LLine1 <> Nil Do
          Begin
            LRes:= LRes + LLine1^.Data;
            LLine1:= LLine1^.Prev;
          End;
        End;
      EMULTIPLE:
        Begin
          LRes:= 1;
          While LLine1 <> Nil Do
          Begin
            LRes:= LRes * LLine1^.Data;
            LLine1:= LLine1^.Prev;
          End;
        End;
    Else
      GError:= True;
      LRes:= 0;
    End;

    If Not GError Then
    Begin
      lblField.Caption:= FloatToStr(LRes);
      Form2.mmoHistory.Lines.Insert(GLine, 'Bulk ' + GOpView[GOp] + ' = ' + FloatToStr(LRes));
    End
    Else
      lblField.Caption:= 'Error. No correct input';
    Dispose(LLine1);
    ResetData();
  End;
End;

Initialization
  GOp:= ENULL;
  GError:= False;
  DecimalSeparator:= '.';
End.

