Unit UnitMain;
{This program calculates ops on numbers}

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

Type
  //List of ops
  TOp = (ENULL, EARCCOS, EARCCTG, EARCSIN, EARCTG, ECOS, ECTG, EDIVIDE, EFACTORIAL, EMINUS, EMULTIPLE, EPERCENT, EPLUS, EPOWER, ESIN, ESQRT, ETG, ESQUARE, ECUBE, ELG, ELN, ECH, ESH, ETH, ECTH, ETEN, EBACK, EDFACTORIAL, EEXP, ETWO, ESC, ECSC, EARCSC, EARCCSC, ESCH, ECSCH, EVERSIN, EVERCOS, EHAVERSIN, EHAVERCOS, EEXSC, EEXCSC);

  //Linked list
  TLine = ^ELine;
  ELine = Record
    Data: Real;
    Next, Prev: TLine;
  End;

  //Record of data in orig types
  TMem = Record
    Inp1, Inp2, Res: Real;
    Op: TOp;
  End;

  //Record of data in string view
  TDisp = Record
    Inp1, Inp2, Res, Op, Disp: String[50];
  End;

  //GUI elements, procedures
  TFormMain = Class(TForm)
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
    btnDot: TButton;
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
    dlgOpen: TOpenDialog;
    lblRes: TLabel;

    //This proc cals res depending on op
    //FRes - result
    Procedure Calculate(Var FRes: Real);

    //This proc converts str to float and resets some flags
    //FInp - input, FRes - result
    Procedure ConvertSF(Var FInp: String; Var FRes: Real);

    //This proc displays res
    Procedure Display();

    //This proc calcs factorials
    //FOp - factorial, FInt - error border
    Procedure FactException(Const FOp: TOp; Const FInt: Integer);

    //This proc calcs one-operand ops
    //FOp - operation, FInt - error border
    Procedure LimException(Const FOp: TOp; Const FInt: Extended);

    //This proc calcs one-operand ops
    //FOp - operation
    Procedure NegException(Const FOp: TOp);

    //This proc calcs one-operand ops
    //FOp - operation
    Procedure NoException(Const FOp: TOp);

    //This proc calcs one-operand ops
    //FOp - operation
    Procedure OneException(Const FOp: TOp);

    //This proc puts sym on the screen
    //FSym - symbol
    Procedure PlaceSymbol(Const FSym: String);

    //This proc clears data
    //FMem - data
    Procedure ResetData(Var FMem: TMem);

    //This proc saves data into file
    Procedure SaveData();

    //This proc calcs two-operand ops
    //FOp - operation
    Procedure TwoNumbers(Const FOp: TOp);

    //This proc calcs one-operand ops
    //FOp - operation
    Procedure ZeroException(Const FOp: TOp);

    //GUI procedures
    Procedure btn0Click(Sender: TObject);
    Procedure btn10PowerClick(Sender: TObject);
    Procedure btn1Click(Sender: TObject);
    Procedure btn2Click(Sender: TObject);
    Procedure btn2PowerClick(Sender: TObject);
    Procedure btn3Click(Sender: TObject);
    Procedure btn4Click(Sender: TObject);
    Procedure btn5Click(Sender: TObject);
    Procedure btn6Click(Sender: TObject);
    Procedure btn7Click(Sender: TObject);
    Procedure btn8Click(Sender: TObject);
    Procedure btn9Click(Sender: TObject);
    Procedure btnBackClick(Sender: TObject);
    Procedure btnBulkClick(Sender: TObject);
    Procedure btnClearAllClick(Sender: TObject);
    Procedure btnClearClick(Sender: TObject);
    Procedure btnDFactorialClick(Sender: TObject);
    Procedure btnDivideClick(Sender: TObject);
    Procedure btnDotClick(Sender: TObject);
    Procedure btnEilerClick(Sender: TObject);
    Procedure btnEqClick(Sender: TObject);
    Procedure btnExpClick(Sender: TObject);
    Procedure btnFactorialClick(Sender: TObject);
    Procedure btnFloatClick(Sender: TObject);
    Procedure btnHistClick(Sender: TObject);
    Procedure btnLgClick(Sender: TObject);
    Procedure btnLnClick(Sender: TObject);
    Procedure btnMinusClick(Sender: TObject);
    Procedure btnMultipleClick(Sender: TObject);
    Procedure btnPeeClick(Sender: TObject);
    Procedure btnPercentClick(Sender: TObject);
    Procedure btnPlusClick(Sender: TObject);
    Procedure btnPosNegClick(Sender: TObject);
    Procedure btnPower2Click(Sender: TObject);
    Procedure btnPower3Click(Sender: TObject);
    Procedure btnPowerYClick(Sender: TObject);
    Procedure btnSqrtClick(Sender: TObject);
    Procedure btnTrigClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  //Eiler num
  E: Real = 2.718281828459045;

  //Pe num
  P: Real = 3.141592653589793;

  //String view of ops for the history
  GOpView: Array[TOp] Of String = ('?', 'arccos', 'arcctg', 'arcsin', 'arctg', 'cos', 'ctg', '/', '!', '-', '*', '%', '+', '^', 'sin', 'sqrt', 'tg', ' 2', ' 3', 'lg', 'ln', 'ch', 'sh', 'th', 'cth', '10 ', '1 /', '!!', 'exp', '2 ', 'sec', 'cosec', 'arcsec', 'arccosec', 'sch', 'csch', 'versin', 'vercos', 'haversin', 'havercos', 'exsec', 'excosec');

  //Best factorial implementation - (c) Onoshko
  GFact1: Array[0..12] Of Integer = (1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600);
  GFact2: Array[0..19] Of Integer = (1, 1, 2, 3, 8, 15, 48, 105, 384, 945, 3840, 10395, 46080, 135135, 645120, 2027025, 10321920, 34459425, 185794560, 654729075);

  //Categories of ops to be shown in right way in the hist
  GHist1: Set Of TOp = [EARCCOS, EARCCTG, EARCSIN, EARCTG, ECOS, ECTG, ESIN, ESQRT, ETG, ELG, ELN, ECH, ESH, ETH, ECTH, EEXP, ESC, ECSC, EARCSC, EARCCSC, ESCH, ECSCH, EVERSIN, EVERCOS, EHAVERSIN, EHAVERCOS, EEXSC, EEXCSC];
  GHist2: Set Of TOp = [EFACTORIAL, EDFACTORIAL, ESQUARE, ECUBE];
  GHist3: Set Of TOp = [EBACK, ETEN, ETWO];

  //Memory in string view - operands and op
  GDisp: TDisp;

  //Memory in orig view - operands and op
  GMem: TMem;

  //Mistake & clean flags
  GError, GClear: Boolean;

  //GUI
  FormMain: TFormMain;

Implementation

Uses UnitHist,
  UnitTrig;
{$R *.dfm}

Procedure TFormMain.Calculate(Var FRes: Real);
Begin
  Case GMem.Op Of
    EPLUS:
      FRes:= GMem.Inp1 + GMem.Inp2;
    EMINUS:
      FRes:= GMem.Inp1 - GMem.Inp2;
    EMULTIPLE:
      FRes:= GMem.Inp1 * GMem.Inp2;
    EARCSIN:
      FRes:= Arcsin(GMem.Inp1);
    EARCCOS:
      FRes:= Arccos(GMem.Inp1);
    EARCTG:
      FRes:= Arctan(GMem.Inp1);
    EARCCTG:
      FRes:= Arccot(GMem.Inp1);
    ESIN:
      FRes:= Sin(GMem.Inp1);
    ECOS:
      FRes:= Cos(GMem.Inp1);
    ETG:
      FRes:= Tan(GMem.Inp1);
    ECTG:
      FRes:= Cotan(GMem.Inp1);
    ESQRT:
      FRes:= Sqrt(GMem.Inp1);
    EPOWER:
      FRes:= Power(GMem.Inp1, GMem.Inp2);
    EFACTORIAL:
      FRes:= GFact1[Trunc(GMem.Inp1)];
    EDIVIDE:
      FRes:= GMem.Inp1 / GMem.Inp2;
    EPERCENT:
      FRes:= GMem.Inp2 * GMem.Inp1 / 100;
    ESQUARE:
      FRes:= Power(GMem.Inp1, 2);
    ECUBE:
      FRes:= Power(GMem.Inp1, 3);
    ELG:
      FRes:= Log10(GMem.Inp1);
    ELN:
      FRes:= Ln(GMem.Inp1);
    ECH:
      FRes:= (Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1)) / 2;
    ESH:
      FRes:= (Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1)) / 2;
    ETH:
      FRes:= (Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1)) / (Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1));
    ECTH:
      FRes:= (Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1)) / (Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1));
    ETEN:
      FRes:= Power(10, GMem.Inp1);
    EBACK:
      FRes:= 1 / GMem.Inp1;
    EDFACTORIAL:
      FRes:= GFact2[Trunc(GMem.Inp1)];
    ETWO:
      FRes:= Power(2, GMem.Inp1);
    EEXP:
      FRes:= Power(E, GMem.Inp1);
    ESC:
      FRes:= 1 / Cos(GMem.Inp1);
    ECSC:
      FRes:= 1 / Sin(GMem.Inp1);
    EARCSC:
      FRes:= 1 / Arccos(1 / GMem.Inp1);
    EARCCSC:
      FRes:= 1 / Arcsin(1 / GMem.Inp1);
    ESCH:
      FRes:= 1 / ((Power(E, GMem.Inp1) + Power(E, (-1) * GMem.Inp1)) / 2);
    ECSCH:
      FRes:= 1 / ((Power(E, GMem.Inp1) - Power(E, (-1) * GMem.Inp1)) / 2);
    EVERSIN:
      FRes:= 1 - Cos(GMem.Inp1);
    EVERCOS:
      FRes:= 1 - Sin(GMem.Inp1);
    EHAVERSIN:
      FRes:= (1 - Cos(GMem.Inp1)) / 2;
    EHAVERCOS:
      FRes:= (1 - Sin(GMem.Inp1)) / 2;
    EEXSC:
      FRes:= (1 / Cos(GMem.Inp1)) - 1;
    EEXCSC:
      FRes:= (1 / Sin(GMem.Inp1)) - 1;
    ENULL:
  End;
End;

Procedure TFormMain.ConvertSF(Var FInp: String; Var FRes: Real);
Var
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
    Val(FInp, FRes, LPos);
    If LPos <> 0 Then
      GError:= True
  End;
End;

Procedure TFormMain.Display();
Var
  TRes: Real;
Begin
  If ((GMem.Op = EPOWER) And ((GMem.Inp1 > 143) Or (GMem.Inp2 > 143))) And ((GMem.Op = EDIVIDE) And (GMem.Inp2 = 0)) Then
    GError:= True;

  If GMem.Op <> ENULL Then
    If (Not GError) Then
    Begin
      Calculate(TRes);
      GMem.Res:= TRes;
      lblRes.Caption:= FloatToStr(GMem.Res);
      SaveData();
    End
    Else
      lblRes.Caption:= 'Error. No correct input';
  ResetData(GMem);
End;

Procedure TFormMain.FactException(Const FOp: TOp; Const FInt: Integer);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  GMem.Op:= FOp;
  ConvertSF(LInp, GMem.Inp1);
  If (Trunc(GMem.Inp1) <> GMem.Inp1) Or (GMem.Inp1 < 0) Or (GMem.Inp1 > FInt) Then
    GError:= True;
  Display();
End;

Procedure TFormMain.LimException(Const FOp: TOp; Const FInt: Extended);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  GMem.Op:= FOp;
  ConvertSF(LInp, GMem.Inp1);
  If GMem.Inp1 >= FInt Then
    GError:= True;
  Display();
End;

Procedure TFormMain.NegException(Const FOp: TOp);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  GMem.Op:= FOp;
  ConvertSF(LInp, GMem.Inp1);
  If GMem.Inp1 <= 0 Then
    GError:= True;
  Display();
End;

Procedure TFormMain.NoException(Const FOp: TOp);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  GMem.Op:= FOp;
  ConvertSF(LInp, GMem.Inp1);
  Display();
End;

Procedure TFormMain.OneException(Const FOp: TOp);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  GMem.Op:= FOp;
  ConvertSF(LInp, GMem.Inp1);
  If (GMem.Inp1 > 1) Or (GMem.Inp1 < -1) Then
    GError:= True;
  Display();
End;

Procedure TFormMain.PlaceSymbol(Const FSym: String);
Var
  LInp, LAdd: String;
Begin
  If GClear Then
  Begin
    lblRes.Caption:= '0';
    GClear:= False;
  End;

  LInp:= lblRes.Caption;
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

  lblRes.Caption:= LInp + LAdd;
End;

Procedure TFormMain.ResetData(Var FMem: TMem);
Begin
  GMem.Op:= ENULL;
  GError:= False;
  With FMem Do
  Begin
    Inp1:= 0;
    Inp2:= 0;
    Res:= 0;
  End;
End;

Procedure TFormMain.SaveData();
Var
  LFile: File Of TDisp;
Begin
  If GMem.Op <> ENULL Then
  Begin
    GDisp.Op:= GOpView[GMem.Op];
    GDisp.Inp1:= FloatToStr(GMem.Inp1);
    GDisp.Inp2:= FloatToStr(GMem.Inp2);
    GDisp.Res:= FloatToStr(GMem.Res);

    If GMem.Op In GHist1 Then
      GDisp.Disp:= GDisp.Op + '(' + GDisp.Inp1 + ') = ' + GDisp.Res
    Else
      If GMem.Op In GHist2 Then
        GDisp.Disp:= GDisp.Inp1 + ' ' + GDisp.Op + ' = ' + GDisp.Res
      Else
        If GMem.Op In GHist3 Then
          GDisp.Disp:= GDisp.Op + ' ' + GDisp.Inp1 + ' = ' + GDisp.Res
        Else
          GDisp.Disp:= GDisp.Inp1 + ' ' + GDisp.Op + ' ' + GDisp.Inp2 + ' = ' + GDisp.Res;

    AssignFile(LFile, 'Hummel.009');

    If Not FileExists('Hummel.009') Then
      Rewrite(LFile);

    Reset(LFile);
    Seek(LFile, FileSize(LFile));
    Write(LFile, GDisp);
    CloseFile(LFile);
  End;

  GClear:= True;
End;

Procedure TFormMain.TwoNumbers(Const FOp: TOp);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  GMem.Op:= FOp;
  ConvertSF(LInp, GMem.Inp1);
  lblRes.Caption:= '';
End;

Procedure TFormMain.ZeroException(Const FOp: TOp);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  GMem.Op:= FOp;
  ConvertSF(LInp, GMem.Inp1);
  If (GMem.Inp1 = 0) Then
    GError:= True;
  Display();
End;

Procedure TFormMain.btnBackClick(Sender: TObject);
Begin
  NoException(EBACK);
End;

Procedure TFormMain.btnFactorialClick(Sender: TObject);
Begin
  FactException(EFACTORIAL, 12);
End;

Procedure TFormMain.btnDFactorialClick(Sender: TObject);
Begin
  FactException(EDFACTORIAL, 19);
End;

Procedure TFormMain.btnPower2Click(Sender: TObject);
Begin
  LimException(ESQUARE, 1E154);
End;

Procedure TFormMain.btnExpClick(Sender: TObject);
Begin
  LimException(EEXP, 710);
End;

Procedure TFormMain.btn2PowerClick(Sender: TObject);
Begin
  LimException(ETWO, 1024);
End;

Procedure TFormMain.btnEqClick(Sender: TObject);
Var
  LInp: String;
Begin
  LInp:= lblRes.Caption;
  ConvertSF(LInp, GMem.Inp2);
  Display();
End;

Procedure TFormMain.btn10PowerClick(Sender: TObject);
Begin
  LimException(ETEN, 308);
End;

Procedure TFormMain.btnPower3Click(Sender: TObject);
Begin
  LimException(ECUBE, 1E100);
End;

Procedure TFormMain.btnSqrtClick(Sender: TObject);
Begin
  NegException(ESQRT);
End;

Procedure TFormMain.btnLgClick(Sender: TObject);
Begin
  NegException(ELG);
End;

Procedure TFormMain.btnLnClick(Sender: TObject);
Begin
  NegException(ELN);
End;

Procedure TFormMain.btnPercentClick(Sender: TObject);
Begin
  TwoNumbers(EPERCENT);
End;

Procedure TFormMain.btnPowerYClick(Sender: TObject);
Begin
  TwoNumbers(EPOWER);
End;

Procedure TFormMain.btnMultipleClick(Sender: TObject);
Begin
  TwoNumbers(EMULTIPLE);
End;

Procedure TFormMain.btnDivideClick(Sender: TObject);
Begin
  TwoNumbers(EDIVIDE);
End;

Procedure TFormMain.btnPlusClick(Sender: TObject);
Begin
  TwoNumbers(EPLUS);
End;

Procedure TFormMain.btnMinusClick(Sender: TObject);
Begin
  TwoNumbers(EMINUS);
End;

Procedure TFormMain.btnPosNegClick(Sender: TObject);
Begin
  PlaceSymbol('-');
End;

Procedure TFormMain.btnFloatClick(Sender: TObject);
Begin
  PlaceSymbol('E');
End;

Procedure TFormMain.btn0Click(Sender: TObject);
Begin
  PlaceSymbol('0');
End;

Procedure TFormMain.btn1Click(Sender: TObject);
Begin
  PlaceSymbol('1');
End;

Procedure TFormMain.btn2Click(Sender: TObject);
Begin
  PlaceSymbol('2');
End;

Procedure TFormMain.btn3Click(Sender: TObject);
Begin
  PlaceSymbol('3');
End;

Procedure TFormMain.btn4Click(Sender: TObject);
Begin
  PlaceSymbol('4');
End;

Procedure TFormMain.btn5Click(Sender: TObject);
Begin
  PlaceSymbol('5');
End;

Procedure TFormMain.btn6Click(Sender: TObject);
Begin
  PlaceSymbol('6');
End;

Procedure TFormMain.btn7Click(Sender: TObject);
Begin
  PlaceSymbol('7');
End;

Procedure TFormMain.btn8Click(Sender: TObject);
Begin
  PlaceSymbol('8');
End;

Procedure TFormMain.btn9Click(Sender: TObject);
Begin
  PlaceSymbol('9');
End;

Procedure TFormMain.btnDotClick(Sender: TObject);
Begin
  PlaceSymbol('.');
End;

Procedure TFormMain.btnClearAllClick(Sender: TObject);
Begin
  lblRes.Caption:= '0';
  ResetData(GMem);
End;

Procedure TFormMain.btnEilerClick(Sender: TObject);
Begin
  lblRes.Caption:= '2.718281828459045';
End;

Procedure TFormMain.btnPeeClick(Sender: TObject);
Begin
  lblRes.Caption:= '3.141592653589793';
End;

Procedure TFormMain.btnTrigClick(Sender: TObject);
Begin
  FormTrig.show;
End;

Procedure TFormMain.btnClearClick(Sender: TObject);
Var
  LInp: String;
  LLen: Integer;
Begin
  If (lblRes.Caption = 'Error. No correct input') Then
    lblRes.Caption:= '0'
  Else
  Begin
    LInp:= lblRes.Caption;
    LLen:= Length(LInp);
    Delete(LInp, LLen, 1);
    lblRes.Caption:= LInp;
    If (LLen = 1) Then
      lblRes.Caption:= '0';
  End;
End;

Procedure TFormMain.btnHistClick(Sender: TObject);
Var
  LFile: File Of TDisp;
  LLine: TDisp;
  LInsert: Integer;
Begin
  FormHist.mmoHistory.Lines.Clear;

  AssignFile(LFile, 'Hummel.009');
  If Not FileExists('Hummel.009') Then
    Rewrite(LFile);

  Reset(LFile);

  LInsert:= 0;
  While Not Eof(LFile) Do
  Begin
    Read(LFile, LLine);
    FormHist.mmoHistory.Lines.Insert(LInsert, LLine.Disp);
    Inc(LInsert);
  End;

  FormHist.show;
End;

Procedure TFormMain.btnBulkClick(Sender: TObject);
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

  If dlgOpen.Execute Then
  Begin
    AssignFile(LFile, dlgOpen.FileName);
    Reset(LFile);

    New(LLine1);
    LLine1^.Prev:= Nil;
    While Not EoF(LFile) Do
    Begin
      LLine2:= LLine1;
      ReadLn(LFile, LData);
      ConvertSF(LData, LLine1^.Data);
      New(LLine1);
      LLine2^.Next:= LLine1;
      LLine1^.Prev:= LLine2;
    End;
    LLine2^.Next:= Nil;

    //One step back
    LLine1:= LLine1^.Prev;
    LLine1^.Next:= Nil;

    CloseFile(LFile);

    Case GMem.Op Of
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
      lblRes.Caption:= FloatToStr(LRes)
    Else
      lblRes.Caption:= 'Error. No correct input';
    Dispose(LLine1);
    ResetData(GMem);
  End;
End;

Initialization
  GMem.Op:= ENULL;
  GError:= False;
  DecimalSeparator:= '.';
End.

