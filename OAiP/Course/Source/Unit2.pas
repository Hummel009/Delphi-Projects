Unit Unit2;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

Type
  TForm2 = Class(TForm)
    mmoHistory: TMemo;
    btn11: TButton;
    btn1: TButton;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    Procedure btn1Click(Sender: TObject);
    Procedure btn11Click(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form2: TForm2;

Implementation

{$R *.dfm}

Procedure TForm2.btn1Click(Sender: TObject);
Begin
  If dlgOpen1.Execute Then
    Form2.mmoHistory.Lines.LoadFromFile(dlgOpen1.FileName);
End;

Procedure TForm2.btn11Click(Sender: TObject);
Begin
  If dlgSave1.Execute Then
    Form2.mmoHistory.Lines.SaveToFile(dlgSave1.FileName);
End;

Initialization
End.

