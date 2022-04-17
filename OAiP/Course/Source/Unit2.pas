Unit Unit2;

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
  TForm2 = Class(TForm)
    scrlbx1: TScrollBox;
    mmoHistory: TMemo;
    Button1: TButton;
    lbl1: TLabel;
    Procedure btnClearFileClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form2: TForm2;

Implementation

Uses Unit1;
{$R *.dfm}

//If pressed, load history from text file

Procedure TForm2.btnClearFileClick(Sender: TObject);
Var
  LFile: File Of TDisp;
Begin
  AssignFile(LFile, 'Hummel009.hzzn');
  Rewrite(LFile);
  CloseFile(LFile);
  Form2.mmoHistory.Lines.Clear;
  Form2.close;
End;

Initialization
End.

