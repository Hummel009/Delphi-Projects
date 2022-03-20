Program Project1;

Uses
  Forms,
  Unit1 In 'Unit1.pas' {Form1},
  Unit2 In 'Unit2.pas' {Form2},
  Unit3 In 'Unit3.pas' {Form3};

{$R *.res}

Begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
End.

