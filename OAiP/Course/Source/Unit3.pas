Unit Unit3;

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
  StdCtrls;

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

Procedure TForm3.btnCtgClick(Sender: TObject);
Begin
  Form1.ZeroException(ECTG);
End;

Procedure TForm3.btnCscClick(Sender: TObject);
Begin
  Form1.ZeroException(ECSC);
End;

Procedure TForm3.btnCthClick(Sender: TObject);
Begin
  Form1.ZeroException(ECTH);
End;

Procedure TForm3.btnAsinClick(Sender: TObject);
Begin
  Form1.OneException(EARCSIN);
End;

Procedure TForm3.btnAcosClick(Sender: TObject);
Begin
  Form1.OneException(EARCCOS);
End;

Procedure TForm3.btnAscClick(Sender: TObject);
Begin
  Form1.OneException(EARCSC);
End;

Procedure TForm3.btnAcscClick(Sender: TObject);
Begin
  Form1.OneException(EARCCSC);
End;

Procedure TForm3.btnSinClick(Sender: TObject);
Begin
  Form1.NoException(ESIN);
End;

Procedure TForm3.btnCosClick(Sender: TObject);
Begin
  Form1.NoException(ECOS);
End;

Procedure TForm3.btnTgClick(Sender: TObject);
Begin
  Form1.NoException(ETG);
End;

Procedure TForm3.btnScClick(Sender: TObject);
Begin
  Form1.NoException(ESC);
End;

Procedure TForm3.btnAtgClick(Sender: TObject);
Begin
  Form1.NoException(EARCTG);
End;

Procedure TForm3.btnActgClick(Sender: TObject);
Begin
  Form1.NoException(EARCCTG);
End;

Procedure TForm3.btnShClick(Sender: TObject);
Begin
  Form1.NoException(ESH);
End;

Procedure TForm3.btnChClick(Sender: TObject);
Begin
  Form1.NoException(ECH);
End;

Procedure TForm3.btnThClick(Sender: TObject);
Begin
  Form1.NoException(ETH);
End;

Procedure TForm3.btnSchClick(Sender: TObject);
Begin
  Form1.NoException(ESCH);
End;

Procedure TForm3.btnCschClick(Sender: TObject);
Begin
  Form1.NoException(ECSCH);
End;

Procedure TForm3.btnVersinClick(Sender: TObject);
Begin
  Form1.NoException(EVERSIN);
End;

Procedure TForm3.btnVercosClick(Sender: TObject);
Begin
  Form1.NoException(EVERCOS);
End;

Procedure TForm3.btnHaversinClick(Sender: TObject);
Begin
  Form1.NoException(EHAVERSIN);
End;

Procedure TForm3.btnHavercosClick(Sender: TObject);
Begin
  Form1.NoException(EHAVERCOS);
End;

Procedure TForm3.btnExscClick(Sender: TObject);
Begin
  Form1.NoException(EEXSC);
End;

Procedure TForm3.btnExcscClick(Sender: TObject);
Begin
  Form1.NoException(EEXCSC);
End;
End.

