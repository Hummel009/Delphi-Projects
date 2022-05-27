Unit UnitHist;

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
  TFormHist = Class(TForm)
    scrlbx: TScrollBox;
    mmoHistory: TMemo;
    btnClearFile: TButton;
    lblInfo: TLabel;
    Procedure btnClearFileClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  FormHist: TFormHist;

Implementation

Uses UnitMain;
{$R *.dfm}

//If pressed, load history from text file

Procedure TFormHist.btnClearFileClick(Sender: TObject);
Var
  LFile: File Of TDisp;
Begin
  AssignFile(LFile, 'Hummel.009');
  Rewrite(LFile);
  CloseFile(LFile);
  FormHist.mmoHistory.Lines.Clear;
  FormHist.close;
End;

Initialization
End.

