Unit Unit3;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

Type
  TForm3 = Class(TForm)
    btnActg: TButton;
    btnAtg: TButton;
    btnAcos: TButton;
    btnAsin: TButton;
    btnSin: TButton;
    btnCos: TButton;
    btnTg: TButton;
    btnCtg: TButton;
    btnSh: TButton;
    btnCh: TButton;
    btnTh: TButton;
    btnCth: TButton;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn10: TButton;
    btn11: TButton;
    btn12: TButton;
    Procedure btnSinClick(Sender: TObject);
    Procedure btnCosClick(Sender: TObject);
    Procedure btnTgClick(Sender: TObject);
    Procedure btnCtgClick(Sender: TObject);
    Procedure btnScClick(Sender: TObject);
    Procedure btnCscClick(Sender: TObject);
    Procedure btnAsinClick(Sender: TObject);
    Procedure btnAcosClick(Sender: TObject);
    Procedure btnAtgClick(Sender: TObject);
    Procedure btnActgClick(Sender: TObject);
    Procedure btnAscClick(Sender: TObject);
    Procedure btnAcscClick(Sender: TObject);
    Procedure btnShClick(Sender: TObject);
    Procedure btnChClick(Sender: TObject);
    Procedure btnThClick(Sender: TObject);
    Procedure btnCthClick(Sender: TObject);
    Procedure btnSchClick(Sender: TObject);
    Procedure btnCschClick(Sender: TObject);
    Procedure btnVersinClick(Sender: TObject);
    Procedure btnVercosClick(Sender: TObject);
    Procedure btnHaversinClick(Sender: TObject);
    Procedure btnHavercosClick(Sender: TObject);
    Procedure btnExscClick(Sender: TObject);
    Procedure btnExcscClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form3: TForm3;

Implementation

Uses Unit1;

{$R *.dfm}

Procedure TForm3.btnSinClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ESIN;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnCosClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ECOS;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnTgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ETG;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnCtgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ECTG;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  If (GMem.Inp1 = 0) Then
    GError:= True;
  Form1.Display();
  Dispose(LInp);
End;        

Procedure TForm3.btnScClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ESC;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnCscClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ECSC;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  If (GMem.Inp1 = 0) Then
    GError:= True;
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnAsinClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EARCSIN;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  If (GMem.Inp1 > 1) Or (GMem.Inp1 < -1) Then
    GError:= True;
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnAcosClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EARCCOS;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  If (GMem.Inp1 > 1) Or (GMem.Inp1 < -1) Then
    GError:= True;
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnAtgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EARCTG;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnActgClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EARCCTG;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;     

Procedure TForm3.btnAscClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EARCSC;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  If (GMem.Inp1 > 1) Or (GMem.Inp1 < -1) Then
    GError:= True;
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnAcscClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EARCCSC;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  If (GMem.Inp1 > 1) Or (GMem.Inp1 < -1) Then
    GError:= True;
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnShClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ESH;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnChClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ECH;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnThClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ETH;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnCthClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ECTH;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  If GMem.Inp1 = 0 Then
    GError:= True;
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnSchClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ESCH;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnCschClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= ECSCH;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnVersinClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EVERSIN;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnVercosClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EVERCOS;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnHaversinClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EHAVERSIN;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnHavercosClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EHAVERCOS;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnExscClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EEXSC;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;

Procedure TForm3.btnExcscClick(Sender: TObject);
Var
  LInp: ^String;
Begin
  New(LInp);
  LInp^:= Form1.lblField.Caption;
  GOp:= EEXCSC;
  GMem.Inp1:= Form1.ConvertSF(LInp^);
  Form1.Display();
  Dispose(LInp);
End;
End.

