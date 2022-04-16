Unit Unit2;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

Type
  TForm2 = Class(TForm)
    btnSave: TButton;
    btnLoad: TButton;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    scrlbx1: TScrollBox;
    mmoHistory: TMemo;
    Procedure btnLoadClick(Sender: TObject);
    Procedure btnSaveClick(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form2: TForm2;

Implementation

{$R *.dfm}

Procedure TForm2.btnLoadClick(Sender: TObject);
Begin
  If dlgOpen1.Execute Then
    Form2.mmoHistory.Lines.LoadFromFile(dlgOpen1.FileName);
End;

Procedure TForm2.btnSaveClick(Sender: TObject);
Begin
  If dlgSave1.Execute Then
    Form2.mmoHistory.Lines.SaveToFile(dlgSave1.FileName);
End;

Initialization
End.

