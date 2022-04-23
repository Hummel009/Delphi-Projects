Unit UnitTrig;

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
  TFormTrig = Class(TForm)
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
  FormTrig: TFormTrig;

Implementation

Uses UnitMain;

{$R *.dfm}

Procedure TFormTrig.btnCtgClick(Sender: TObject);
Begin
  FormMain.ZeroException(ECTG);
End;

Procedure TFormTrig.btnCscClick(Sender: TObject);
Begin
  FormMain.ZeroException(ECSC);
End;

Procedure TFormTrig.btnCthClick(Sender: TObject);
Begin
  FormMain.ZeroException(ECTH);
End;

Procedure TFormTrig.btnAsinClick(Sender: TObject);
Begin
  FormMain.OneException(EARCSIN);
End;

Procedure TFormTrig.btnAcosClick(Sender: TObject);
Begin
  FormMain.OneException(EARCCOS);
End;

Procedure TFormTrig.btnAscClick(Sender: TObject);
Begin
  FormMain.OneException(EARCSC);
End;

Procedure TFormTrig.btnAcscClick(Sender: TObject);
Begin
  FormMain.OneException(EARCCSC);
End;

Procedure TFormTrig.btnSinClick(Sender: TObject);
Begin
  FormMain.NoException(ESIN);
End;

Procedure TFormTrig.btnCosClick(Sender: TObject);
Begin
  FormMain.NoException(ECOS);
End;

Procedure TFormTrig.btnTgClick(Sender: TObject);
Begin
  FormMain.NoException(ETG);
End;

Procedure TFormTrig.btnScClick(Sender: TObject);
Begin
  FormMain.NoException(ESC);
End;

Procedure TFormTrig.btnAtgClick(Sender: TObject);
Begin
  FormMain.NoException(EARCTG);
End;

Procedure TFormTrig.btnActgClick(Sender: TObject);
Begin
  FormMain.NoException(EARCCTG);
End;

Procedure TFormTrig.btnShClick(Sender: TObject);
Begin
  FormMain.NoException(ESH);
End;

Procedure TFormTrig.btnChClick(Sender: TObject);
Begin
  FormMain.NoException(ECH);
End;

Procedure TFormTrig.btnThClick(Sender: TObject);
Begin
  FormMain.NoException(ETH);
End;

Procedure TFormTrig.btnSchClick(Sender: TObject);
Begin
  FormMain.NoException(ESCH);
End;

Procedure TFormTrig.btnCschClick(Sender: TObject);
Begin
  FormMain.NoException(ECSCH);
End;

Procedure TFormTrig.btnVersinClick(Sender: TObject);
Begin
  FormMain.NoException(EVERSIN);
End;

Procedure TFormTrig.btnVercosClick(Sender: TObject);
Begin
  FormMain.NoException(EVERCOS);
End;

Procedure TFormTrig.btnHaversinClick(Sender: TObject);
Begin
  FormMain.NoException(EHAVERSIN);
End;

Procedure TFormTrig.btnHavercosClick(Sender: TObject);
Begin
  FormMain.NoException(EHAVERCOS);
End;

Procedure TFormTrig.btnExscClick(Sender: TObject);
Begin
  FormMain.NoException(EEXSC);
End;

Procedure TFormTrig.btnExcscClick(Sender: TObject);
Begin
  FormMain.NoException(EEXCSC);
End;
End.

