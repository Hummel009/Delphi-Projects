Program HummelCalc;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitHist in 'UnitHist.pas' {FormHist},
  UnitTrig in 'UnitTrig.pas' {FormTrig};

{$R *.res}

Begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormHist, FormHist);
  Application.CreateForm(TFormTrig, FormTrig);
  Application.Run;
End.

