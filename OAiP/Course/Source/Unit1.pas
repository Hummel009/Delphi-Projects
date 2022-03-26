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
  Real = double;
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
    dlgOpen1: TOpenDialog;
    lblField: TLabel;
    mmoTemp: TMemo;
    btnRight: TButton;
    btnLeft: TButton;
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
    Procedure btnLeftClick(Sender: TObject);
    Procedure btnRightClick(Sender: TObject);
    Function ConvertSF(Var FInp: String): Real;
    Procedure AddNum(Var FInp: String; Var FAdd: String);
    Procedure Display();
    Procedure Save();
    Procedure btnBulkClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Const
  E = 2.718281828459045;
  P = 3.141592653589793;
  GOpView: Array[TOp] Of String = ('?', 'arccos', 'arcctg', 'arcsin', 'arctg', 'cos', 'ctg', '/', '!', '-', '*', '%', '+', '^', 'sin', 'sqrt', 'tg', '^ 2', '^ 3', 'lg', 'ln', 'ch', 'sh', 'th', 'cth', '10 ^', '1 /', '!!', 'exp', '2 ^', 'sec', 'cosec', 'arcsec', 'arccosec', 'sch', 'csch', 'versin', 'vercos', 'haversin', 'havercos', 'exsec', 'excosec');
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
  PolishMode: Boolean;
  Expression: String;
  Razbor: TStringList;

Implementation

Uses Unit2, Unit3;
{$R *.dfm}

(* ѕолучение приоритета *)
Function GetPriority(c: char): byte;
Begin
  Result:= 0;
  Case c Of
    '(': Result:= 1;
    '+', '-': Result:= 2;
    '*', '/', '%': Result:= 3;
    '^': Result:= 4;
  End;
End;

(* ѕереводим строку с формулой в обратную польскую запись *)
Procedure ParseString(s: AnsiString; Var _Stack: TStringList);
Var
  Ms: TMemoryStream;
  Temp: TStringList; // ¬ременный стек дл€ знаков и геометрических функций
  flag: boolean;
Begin
  Temp:= TStringList.Create;
  Ms:= TMemoryStream.Create;
  Ms.WriteBuffer(s[1], Length(s));
  Ms.Position:= 0;
  With TParser.Create(Ms) Do
  Begin
    While Token <> toEof Do
    Begin
         // ≈сли это число, помещаем его в выходной стек
      If (TokenString[1] In ['0'..'9']) Then
        If flag Then
        Begin
          _Stack[_Stack.Count - 1]:= _Stack[_Stack.Count - 1] + TokenString;
          flag:= false;
        End
        Else
          _Stack.Add(TokenString);
         // ≈сли это разделитель дробной части
      If (TokenString[1] In [DecimalSeparator]) Then
      Begin
        _Stack[_Stack.Count - 1]:= _Stack[_Stack.Count - 1] + TokenString;
        flag:= true;
      End;
         // ≈сли это знак (или геометрическа€ функци€), то...
      If (TokenString[1] In ['+', '-', '/', '*', '%', '^']) Then
      Begin
            // ...если стек пустой, помещаем знак в стек ...
        If Temp.Count = 0 Then
          Temp.Add(TokenString)
        Else
        Begin
               // ... если приоритер текущей операции выше, чем приоритет
               // последней операции в стеке, помещаем знак в стек ...
          If GetPriority(TokenString[1]) > GetPriority(Temp.Strings[Temp.Count - 1][1]) Then
            Temp.Add(TokenString)
          Else
          Begin
                  // ... иначе извлекаем из стека все операции, пока
                  // не встретим операцию с более высшим приоритетом
            While true Do
            Begin
              _Stack.Add(Temp.Strings[Temp.Count - 1]);
              Temp.Delete(Temp.Count - 1);
              If Temp.Count = 0 Then Break;
              If GetPriority(TokenString[1]) > GetPriority(Temp.Strings[Temp.Count - 1][1]) Then
                Break;
            End;
                  // Ќе забываем добавить в стек текущую операцию
            Temp.Add(TokenString);
          End;
        End;
      End;
         // ≈сли это открывающа€ скобка, помещаем ее в стек операций
      If (TokenString[1] In ['(']) Then
        Temp.Add(TokenString);
         // ≈сли это закрывающа€ скобка, извлекаем из стека операций в
         // выходной стек все операции, пока не встретим открывающую скобку.
         // —ами скобки при зтом уничтожаютс€.
      If (TokenString[1] In [')']) Then
        While true Do
        Begin
          If Temp.Count = 0 Then Break;
          If Temp.Strings[Temp.Count - 1] = '(' Then
          Begin
            Temp.Delete(Temp.Count - 1);
            Break;
          End;
          _Stack.Add(Temp.Strings[Temp.Count - 1]);
          Temp.Delete(Temp.Count - 1);
        End;
      NextToken;
    End;
  End;
  Ms.Free;
   // ≈сли по окончании разбора строки с формулой, в стеке операций
   // еще чтото осталось, извлекаем все в выходной стек
  If Temp.Count <> 0 Then
    While Temp.Count <> 0 Do
    Begin
      _Stack.Add(Temp.Strings[Temp.Count - 1]);
      Temp.Delete(Temp.Count - 1);
    End;
  Temp.Free;
End;

(* –ассчитываем выражение в постфиксной форме *)
Function PolishCount(Var _Stack: TStringList): real;
Var
  i: integer;
  a1, a2: real;
  Temp: TStringList; // ¬ременный стек дл€ рассчетов
Begin
  Result:= 0;
  Temp:= TStringList.Create;
  For i:= 0 To _Stack.Count - 1 Do
      // ≈сли зто число, помещаем его в стек дл€ рассчета, иначе ...
    If _Stack.Strings[i][1] In ['0'..'9'] Then
      Temp.Add(_Stack.Strings[i])
    Else
    Begin
         // ... ¬ынимаем из стека рассчета последнее число
      a2:= StrToFloat(Temp.Strings[Temp.Count - 1]);
      Temp.Delete(Temp.Count - 1);
         // если дл€ выполнени€ операции требуетс€ 2 аргумента,
         // вынимаем из стека рассчета еще одно число
      If _Stack.Strings[i][1] In ['+', '-', '/', '*', '%', '^'] Then
      Begin
        a1:= StrToFloat(Temp.Strings[Temp.Count - 1]);
        Temp.Delete(Temp.Count - 1);
      End;
         // ѕроизводим рассчет
      Case _Stack.Strings[i][1] Of
        '+': Temp.Add(FloatToStr(a1 + a2));
        '-': Temp.Add(FloatToStr(a1 - a2));
        '/': Temp.Add(FloatToStr(a1 / a2));
        '*': Temp.Add(FloatToStr(a1 * a2));  
        '%': Temp.Add(FloatToStr(a1 * a2/100));
        '^': Temp.Add(FloatToStr(Power(a1, a2)));
      End;
    End;
  Result:= StrToFloat(Temp.Strings[0]);
  Temp.Free;
End;

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
  PolishMode:= False;
  With GMem Do
  Begin
    Inp1:= 0;
    Inp2:= 0;
    Res:= 0;
  End;
End;

Function TForm1.ConvertSF(Var FInp: String): Real;
Var
  LInp: ^Real;
  LPos, LLim: ^Integer;
  LPower: ^String;
Begin
  New(LPos);
  If (Pos('E', FInp) > 0) Then
  Begin
    New(LPower);
    New(LLim);
    LPower^:= FInp;
    Delete(LPower^, 1, pos('E', LPower^));
    Val(LPower^, LLim^, LPos^);
    If LLim^ >= 308 Then
    Begin
      GError:= True;
      Result:= 0;
    End;
    Dispose(LPower);
    Dispose(LLim);
  End;
  If Not GError Then
  Begin
    New(LInp);
    Val(FInp, LInp^, LPos^);
    If LPos^ <> 0 Then
    Begin
      GError:= True;
      Result:= 0;
    End
    Else
      Result:= LInp^;
    Dispose(LInp);
  End;
  Dispose(LPos);
End;

Procedure TForm1.AddNum(Var FInp: String; Var FAdd: String);
Begin
  If (Length(FInp) >= 32) And (FAdd <> '.') Then
    FAdd:= '';
  If (FInp = 'Error. No correct input') Or (FInp = '0') And (FAdd <> '.') And (FAdd <> 'E') Then
    FInp:= '';
  If (Pos('.', FInp) > 1) And (FAdd = '.') Then
    FAdd:= '';
  If (Pos('E', FInp) > 1) And (FAdd = 'E') Then
    FAdd:= '';   
  If (Pos('-', FInp) > 1) And (FAdd = '-') Then
  Begin
    FAdd:= '-';
    PolishMode:=True;
  End;
  If (FInp = '') And (FAdd = 'E') Then
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
  If (GOp = EPOWER) And ((GMem.Inp1 > 143) Or (GMem.Inp2 > 143)) Then
    GError:= True;

  If GOp <> ENULL Then
    If (Not GError) Then
    Begin
      Calculate();
      lblField.Caption:= FloatToStr(GMem.Res);
      Save();
    End
    Else
      lblField.Caption:= 'Error. No correct input';
  ResetData();
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
  If PolishMode Then
  Begin
    Razbor.Clear;
    Expression:= AnsiLowerCase(lblField.Caption);
    Expression:= StringReplace(Expression, '+', ' + ', [rfReplaceAll, rfIgnoreCase]);
    Expression:= StringReplace(Expression, '-', ' - ', [rfReplaceAll, rfIgnoreCase]);
    ParseString(Expression, Razbor);
    lblField.Caption:= FloatToStr(PolishCount(Razbor));
    PolishMode:= False;
  End
  Else
  Begin
    New(LInp);
    LInp^:= lblField.Caption;
    GMem.Inp2:= ConvertSF(LInp^);
    Display();
    Dispose(LInp);
  End;
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

Procedure TForm1.btnPower2Click(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ESQUARE;
  GMem.Inp1:= ConvertSF(LInp^);
  If GMem.Inp1 >= 1E154 Then
    GError:= True;
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

Procedure TForm1.btnPowerYClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '^';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnPercentClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '%';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  GOp:= EPERCENT;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnMultipleClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '*';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  GOp:= EMULTIPLE;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnDivideClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '/';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  GOp:= EDIVIDE;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnPlusClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '+';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  GOp:= EPLUS;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnMinusClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '-';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  GOp:= EMINUS;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnLeftClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= '(';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnRightClick(Sender: TObject);
Var
  LInp, LAdd: ^String;
Begin
  New(LInp);
  New(LAdd);
  LInp^:= lblField.Caption;
  LAdd^:= ')';
  AddNum(LInp^, LAdd^);
  lblField.Caption:= LInp^;
  PolishMode:= True;
  Dispose(LInp);
  Dispose(LAdd);
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
  Dispose(LInp);
  Dispose(LAdd);
End;

Procedure TForm1.btnClearAllClick(Sender: TObject);
Begin
  lblField.Caption:= '0';
  ResetData();
End;

Procedure TForm1.btnClearClick(Sender: TObject);
Var
  LInp: ^String;
  LLen: ^Integer;
Begin
  If (lblField.Caption = 'Error. No correct input') Then
    lblField.Caption:= '0'
  Else
  Begin
    New(LInp);
    New(LLen);
    LInp^:= lblField.Caption;
    LLen^:= Length(LInp^);
    Delete(LInp^, LLen^, 1);
    lblField.Caption:= LInp^;
    If (LLen^ = 1) Then
      lblField.Caption:= '0';
    Dispose(LInp);
    Dispose(LLen);
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

Procedure TForm1.btnExpClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= EEXP;
  GMem.Inp1:= ConvertSF(LInp^);
  If (GMem.Inp1 >= 710) Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btn2PowerClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ETWO;
  GMem.Inp1:= ConvertSF(LInp^);
  If (GMem.Inp1 >= 1024) Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btn10PowerClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ETEN;
  GMem.Inp1:= ConvertSF(LInp^);
  If (GMem.Inp1 >= 308) Then
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

Procedure TForm1.btnPower3Click(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= lblField.Caption;
  GOp:= ECUBE;
  GMem.Inp1:= ConvertSF(LInp^);
  If GMem.Inp1 >= 1E154 Then
    GError:= True;
  Display();
  Dispose(LInp);
End;

Procedure TForm1.btnHistClick(Sender: TObject);
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

Procedure TForm1.btnTrigClick(Sender: TObject);
Begin
  Form3.show;
End;

Procedure TForm1.btnBulkClick(Sender: TObject);
Var
  LArr: Array[1..1000000] Of Real;
  I, LLen: Integer;
  LFile: TextFile;
  LData: String;
Begin
  GError:= False;
  With GMem Do
  Begin
    Inp1:= 0;
    Inp2:= 0;
    Res:= 0;
  End;

  lblField.Caption:= '';

  If dlgOpen1.Execute Then
  Begin
    AssignFile(LFile, dlgOpen1.FileName);
    Reset(LFile);
    I:= 1;

    While Not EoF(LFile) Do
    Begin
      ReadLn(LFile, LData);
      LArr[I]:= ConvertSF(LData);
      Inc(I);
    End;

    CloseFile(LFile);
  End;

  LLen:= I - 1;
  For I:= 2 To LLen Do
  Begin
    Case GOp Of
      EPLUS:
        LArr[I]:= LArr[I - 1] + LArr[I];
      EMINUS:
        LArr[I]:= LArr[I - 1] - LArr[I];
      EMULTIPLE:
        LArr[I]:= LArr[I - 1] * LArr[I];
      EDIVIDE:
        LArr[I]:= LArr[I - 1] / LArr[I];
      EPERCENT:
        LArr[I]:= LArr[I] * LArr[I - 1] / 100
    Else
      GError:= True;
    End;
  End;
  If Not GError Then
  Begin
    lblField.Caption:= FloatToStr(LArr[LLen]);
    Form2.mmoHistory.Lines.Insert(GLine, 'Bulk ' + GOpView[GOp] + ' = ' + FloatToStr(LArr[LLen]));
  End
  Else
    lblField.Caption:= 'Error. No correct input';

  For I:= 1 To LLen Do
    LArr[I]:= 0;
  ResetData();
End;

Initialization
  Begin
    PolishMode:= False;
    GOp:= ENULL;
    GError:= False;
    Razbor:= TStringList.Create;
  End;

Finalization
  Razbor.Free;

End.

