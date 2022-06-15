Unit Unit1;

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
  Num = Record
    N: integer;
    NLP: String[16];
    Winter: Array[1..3] Of Integer;
    Summer: Array[1..3] Of Integer;
    WinterS: Integer;
    SummerS: Integer;
  End;

  LElem = ^Elem;
  Elem = Record
    Data: Num;
    Next: LElem;
  End;

  TForm1 = Class(TForm)
    mmo1: TMemo;
    btnKill: TButton;
    btnEnter: TButton;
    edtEnter: TEdit;
    Procedure btnKillClick(Sender: TObject);      
    Procedure btnEnterClick(Sender: TObject);
    Procedure FindByLastName(X: LElem; LastName: String; Var GL: Integer);
    Procedure Make(X: LElem; Var GL: Integer);
    Procedure Show(X: LElem; Var GL: Integer);
    Procedure SortNumber(Y: LElem);
    Procedure HummelLn(Str: String; Var GL: Integer);

  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  Form1: TForm1;     
  LastName: String;

Implementation


Procedure TForm1.HummelLn(Str: String; Var GL: Integer);
Begin
  Inc(GL);
  mmo1.Lines.Insert(GL, Str);
End;

Procedure TForm1.FindByLastName(X: LElem; LastName: String; Var GL: Integer);
Var
  Count: Integer;
  OptiString: String;
Begin
  Count:= 0;
  While X <> Nil Do
  Begin
    If X^.Data.NLP = LastName Then
    Begin
      OptiString:= IntToStr(X^.Data.N) + '. ' + X^.Data.NLP + ': ' + IntToStr(X^.Data.Winter[1]) + ' ' + IntToStr(X^.Data.Winter[2]) + ' ' + IntToStr(X^.Data.Winter[3]) + ' ' + ', ' + IntToStr(X^.Data.Summer[1]) + ' ' + IntToStr(X^.Data.Summer[2]) + ' ' + IntToStr(X^.Data.Summer[3]) + ' ' + '; ' + IntToStr(X^.Data.WinterS) + ', ' + IntToStr(X^.Data.SummerS) + '; ' + ' ';
      HummelLn(OptiString, GL);
      Inc(Count);
    End;
    X:= X^.Next;
  End;
  If Count = 0 Then
    HummelLn('Maggot does not exist!', GL);
End;

Procedure TForm1.Make(X: LElem; Var GL: Integer);
Var
  Y: LElem;
  N, I, J: Integer;
  LFile: File Of Num;
  Jabroni, Slave: Byte;
Begin
  AssignFile(LFile, 'Slaves.jabroni');
  ReWrite(LFile);
  CloseFile(LFile);

  Jabroni:= 0;
  Slave:= 0;

  For N:= 1 To 4 Do
  Begin

    For I:= 1 To 30 Do
    Begin
      X^.Data.NLP:= 'Van' + IntToStr(10 + Random(90));
      X^.Data.N:= N;

      For J:= 1 To 3 Do
      Begin
        X^.Data.Winter[J]:= Random(10);
        X^.Data.Summer[J]:= Random(10);

        If (X^.Data.Winter[J]) < 4 Then
          Inc(Jabroni);

        If (X^.Data.Summer[J]) < 4 Then
          Inc(Slave);
      End;

      X^.Data.WinterS:= (X^.Data.Winter[1] + X^.Data.Winter[2] + X^.Data.Winter[3]) Div 3;
      X^.Data.SummerS:= (X^.Data.Summer[1] + X^.Data.Summer[2] + X^.Data.Summer[3]) Div 3;

      If (Jabroni >= 1) And (Slave >= 2) Then
      Begin
        AssignFile(LFile, 'Slaves.jabroni');
        Reset(LFile);
        Seek(LFile, FileSize(LFile));
        Write(LFile, X^.Data);
        CloseFile(LFile);
      End;

      Y:= X;
      New(X);
      Y^.Next:= X;
    End;
  End;
  Y^.Next:= Nil;

End;

Procedure TForm1.Show(X: LElem; Var GL: Integer);
Var
  OptiString: String;
Begin
  While (X <> Nil) Do
  Begin
    OptiString:= IntToStr(X^.Data.N) + '. ' + X^.Data.NLP + ': ' + IntToStr(X^.Data.Winter[1]) + ' ' + IntToStr(X^.Data.Winter[2]) + ' ' + IntToStr(X^.Data.Winter[3]) + ' ' + ', ' + IntToStr(X^.Data.Summer[1]) + ' ' + IntToStr(X^.Data.Summer[2]) + ' ' + IntToStr(X^.Data.Summer[3]) + ' ' + '; ' + IntToStr(X^.Data.WinterS) + ', ' + IntToStr(X^.Data.SummerS) + '; ' + ' ';
    HummelLn(OptiString, GL);
    X:= X^.Next;
  End;
End;

Procedure TForm1.SortNumber(Y: LElem);
Var
  Len, I, J: integer;
  X: LElem;
  Tmps: Num;
Begin
  X:= Y;
  Len:= 0;
  While X <> Nil Do
  Begin
    Inc(Len);
    X:= X^.Next;
  End;

  For I:= 1 To Len Do
  Begin
    X:= Y;
    For J:= 1 To Len - I Do
    Begin
      If (X^.Data.NLP > X^.Next^.Data.NLP) And (X^.Data.N = X^.Next^.Data.N) Then
      Begin
        Tmps:= X^.Data;
        X^.Data:= X^.Next^.Data;
        X^.Next^.Data:= Tmps;
      End;
      X:= X^.Next
    End;
  End;
End;

{$R *.dfm}

Procedure TForm1.btnKillClick(Sender: TObject);
Var
  First: LElem;
  LFile: File Of Num;
  LLine: Num;
  GL: Integer;
  OptiString: String;
Begin
  Randomize;
  mmo1.Clear;
  GL:= -1;

  New(First);
  Make(First, GL);

  HummelLn('Start:', GL);
  HummelLn('', GL);
  Show(First, GL);
       
  HummelLn('', GL);
  HummelLn('Sorted by NLP:', GL);
  HummelLn('', GL);

  SortNumber(First);
  Show(First, GL);

  AssignFile(LFile, 'Slaves.jabroni');
  Reset(LFile);

  HummelLn('', GL);
  HummelLn('Will be spanked', GL);
  HummelLn('', GL);

  While Not Eof(LFile) Do
  Begin
    Read(LFile, LLine);
    OptiString:= IntToStr(LLine.N) + '. ' + LLine.NLP + ': ' + IntToStr(LLine.Winter[1]) + ' ' + IntToStr(LLine.Winter[2]) + ' ' + IntToStr(LLine.Winter[3]) + ' ' + ', ' + IntToStr(LLine.Summer[1]) + ' ' + IntToStr(LLine.Summer[2]) + ' ' + IntToStr(LLine.Summer[3]) + ' ' + '; ' + IntToStr(LLine.WinterS) + ', ' + IntToStr(LLine.SummerS) + '; ' + ' ';
    HummelLn(OptiString, GL);
  End;
    
  HummelLn('', GL);
  HummelLn('Enter the NLP to find his hot loads', GL);    
  HummelLn('', GL);
  FindByLastName(First, LastName, GL);
  HummelLn('', GL);
  Dispose(First);
End;


Procedure TForm1.btnEnterClick(Sender: TObject);
Begin
  LastName:= edtEnter.Text;
End;

Initialization
End.

