unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type      
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
  
  TForm1 = class(TForm)
    mmo1: TMemo;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);  
    Procedure FindByLastName(X: LElem; LastName: String; var GL: Integer);
    Procedure Make(X: LElem; var GL: Integer);
    Procedure Show(X: LElem; var GL: Integer);
    Procedure SortNumber(Y: LElem);  
    Procedure Hummel(Str: String; var GL: Integer);
    Procedure HummelLn(Str: String; var GL: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
    
Procedure TForm1.Hummel(Str: String; var GL: Integer);
var
  Local: string;
Begin
  Local:=mmo1.Lines[GL];
  Local:=Local+Str;
  mmo1.Lines.Delete(GL);
  mmo1.Lines.Insert(GL, Local);
end;

Procedure TForm1.HummelLn(Str: String; var GL: Integer);
Begin                    
  Inc(GL);
  mmo1.Lines.Insert(GL, Str);
end;

Procedure TForm1.FindByLastName(X: LElem; LastName: String; var GL: Integer);
Var
  Count, J: Integer;
Begin
  Count:= 0;
  While X <> Nil Do
  Begin
    If X^.Data.NLP = LastName Then
    Begin
      Hummel( IntToStr(X^.Data.N) + '. ', GL);
      Hummel(X^.Data.NLP + ': ', GL);
      For J:= 1 To 3 Do
        Hummel(IntToStr(X^.Data.Winter[J]) + ' ', GL);
        Hummel(' ', GL);
      For J:= 1 To 3 Do
        Hummel(IntToStr(X^.Data.Summer[J]) + ' ', GL);
      Hummel('; ', GL);
      Hummel(IntToStr(X^.Data.WinterS) + ', ', GL);
      Hummel(IntToStr(X^.Data.SummerS) + '; ', GL);
      Hummel(' ', GL);
      HummelLn('', GL);
      Inc(Count);
    End;
    X:= X^.Next;
  End;
  If Count = 0 Then
    HummelLn('Maggot does not exist!', GL);
End;

Procedure TForm1.Make(X: LElem; var GL: Integer);
Var
  Y: LElem;
  N, I, J: Integer;
  LFile: File Of Num;
  Jabroni, Slave: Byte;
Begin
  AssignFile(LFile, 'Slaves.jabroni');
  ReWrite(LFile);
  CloseFile(LFile);
  
  Jabroni:=0;
  Slave:=0;

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
        
        If (X^.Data.Winter[J]) < 4 then
          Inc(Jabroni);

        If (X^.Data.Summer[J]) < 4 then
          Inc(Slave);
      End;
      
      X^.Data.WinterS:=(X^.Data.Winter[1]+X^.Data.Winter[2]+X^.Data.Winter[3]) div 3;  
      X^.Data.SummerS:=(X^.Data.Summer[1]+X^.Data.Summer[2]+X^.Data.Summer[3]) div 3;

      if (Jabroni >= 1) and (Slave >=2) then
      begin
        AssignFile(LFile, 'Slaves.jabroni');
        Reset(LFile);
        Seek(LFile, FileSize(LFile));
        Write(LFile, X^.Data);
        CloseFile(LFile);
      end;

      Y:= X;
      New(X);
      Y^.Next:= X;
    End;
  End;
  Y^.Next:= Nil;

End;

Procedure TForm1.Show(X: LElem; var GL: Integer);
Var
  J: Integer;
Begin

  While (X <> Nil) Do
  Begin
    Hummel( IntToStr(X^.Data.N) + '. ', GL);
    Hummel(X^.Data.NLP + ': ', GL);
    For J:= 1 To 3 Do
      Hummel(IntToStr(X^.Data.Winter[J]) + ' ', GL);
    Hummel(' ', GL);
    For J:= 1 To 3 Do
      Hummel(IntToStr(X^.Data.Summer[J]) + ' ', GL);
    Hummel('; ', GL);
    Hummel(IntToStr(X^.Data.WinterS) + ', ', GL);
    Hummel(IntToStr(X^.Data.SummerS) + '; ', GL);
    Hummel(' ', GL);
    HummelLn('', GL);
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
      If (X^.Data.NLP > X^.Next^.Data.NLP) and (X^.Data.N = X^.Next^.Data.N) Then
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

procedure TForm1.btn1Click(Sender: TObject);
Var
  First: LElem;
  LastName: String;   
  LFile: File Of Num;
  LLine: Num;
  J: Integer;
  GL: Integer;
begin
  Randomize;
  mmo1.Clear;  
  GL:=-1;
         
  New(First);
  Make(First, GL);
                                  
  HummelLn('Start:', GL);
  HummelLn('', GL);
  Show(First, GL);

  HummelLn('Sorted by NLP:', GL);
  HummelLn('', GL);
  
  SortNumber(First);
  Show(First, GL);

  AssignFile(LFile, 'Slaves.jabroni');
  Reset(LFile);

  HummelLn('Will be spanked', GL);
  HummelLn('', GL);

  While Not Eof(LFile) Do
  Begin
    Read(LFile, LLine);

    Hummel( IntToStr(LLine.N) + '. ', GL);
    Hummel(LLine.NLP + ': ', GL);
    For J:= 1 To 3 Do
      Hummel(IntToStr(LLine.Winter[J]) + ' ', GL);
    Hummel(', ', GL);
    For J:= 1 To 3 Do
      Hummel(IntToStr(LLine.Summer[J]) + ' ', GL);
    Hummel('; ', GL);
    Hummel(IntToStr(LLine.WinterS) + ', ', GL);
    Hummel(IntToStr(LLine.SummerS) + '; ', GL);
    Hummel(' ', GL);
    HummelLn('', GL);
  End;

  HummelLn('Enter the NLP to find his hot loads', GL);
  LastName:='Van' + IntToStr(10 + Random(90));
  HummelLn('', GL);
  FindByLastName(First, LastName, GL);
  HummelLn('', GL);
  Dispose(First);
end;

initialization
end.
