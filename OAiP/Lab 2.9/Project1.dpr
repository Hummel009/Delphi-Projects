Program Lab9;

{$APPTYPE CONSOLE}

Uses
  SysUtils;

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

Var
  First: LElem;
  LastName: String;   
  LFile: File Of Num;
  LLine: Num;
  J: Integer;

Procedure FindByLastName(X: LElem; LastName: String);
Var
  Count, J: Integer;
Begin
  Count:= 0;
  While X <> Nil Do
  Begin
    If X^.Data.NLP = LastName Then
    Begin
      Write(X^.Data.N: 2, '. ');
      Write(X^.Data.NLP: 7, ' ');
      For J:= 1 To 3 Do
        Write(X^.Data.Winter[J]: 2);
      Write('  ');
      For J:= 1 To 3 Do
        Write(X^.Data.Summer[J]: 2);  
      Write(X^.Data.WinterS: 4);
      Write(X^.Data.SummerS: 4);
      WriteLn;
      Inc(Count);
    End;
    X:= X^.Next;
  End;
  If Count = 0 Then
    WriteLn('Maggot does not exist!');
End;

Procedure Make(X: LElem);
Var
  Y: LElem;
  N, I, J: Integer;
  LFile: File Of Num;
  Jabroni, Slave: Byte;
Begin
  AssignFile(LFile, 'Slaves.jabroni');
  Rewrite(LFile);
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

Procedure Show(X: LElem);
Var
  J: Integer;
Begin

  While (X <> Nil) Do
  Begin
    Write(X^.Data.N: 2, '. ');
    Write(X^.Data.NLP: 7, ' ');
    For J:= 1 To 3 Do
      Write(X^.Data.Winter[J]: 2);
    Write('  ');
    For J:= 1 To 3 Do
      Write(X^.Data.Summer[J]: 2); 
    Write(X^.Data.WinterS: 4);
    Write(X^.Data.SummerS: 4);
    WriteLn;
    X:= X^.Next;
  End;
End;

Procedure SortNumber(Y: LElem);
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

Begin
  New(First);
  
  Make(First);

  WriteLn('Start:');
  Show(First);

  WriteLn('');

  WriteLn('Sorted by NLP:');
  SortNumber(First);
  Show(First);  
  
  AssignFile(LFile, 'Slaves.jabroni');
  Reset(LFile);

  WriteLn;
  WriteLn('Will be spanked');
  
  While Not Eof(LFile) Do
  Begin
    Read(LFile, LLine);

    Write(LLine.N: 2, '. ');
    Write(LLine.NLP: 7, ' ');
    For J:= 1 To 3 Do
      Write(LLine.Winter[J]: 2);
    Write('  ');
    For J:= 1 To 3 Do
      Write(LLine.Summer[J]: 2);
    Write(LLine.WinterS: 4);
    Write(LLine.SummerS: 4);
    WriteLn;
  End;

  WriteLn;
  WriteLn('Enter the NLP to find his hot loads');
  ReadLn(LastName);
  WriteLn;
  FindByLastName(First, LastName);
  WriteLn;

  Dispose(First);
  ReadLn;
End.

