Program Project1;

Uses
  Forms,
  Unit1 In 'Unit1.pas' {Form1},
  Unit2 In 'Unit2.pas' {Form2};

{$R *.res}

Begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
End.

