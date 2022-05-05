Program Lab8;
{Program loads key dict and does cycle shift}

{$APPTYPE CONSOLE}

Uses
  SysUtils,
  Windows;

Var
  F: TextFile;
  Res: String;
  I, J, K, L, M, N, Amogus: Integer;
  Data, Keys: Array[1..100] Of String;
  //F - file
  //I, J, K, L, M, N, O - counters
  //Amogus - amount of positions
  //Keys - array of dict
  //Data - array of data
  //Res - result array

//Calculates how many duplicates will be
//Key - word, Sus - line, Amogus - amount

Procedure Count(Key, Sus: String; Var Amogus: Integer);
Begin
  While AnsiPos(Key, Sus) > 0 Do
  Begin
    Inc(Amogus);
    Delete(Sus, 1, AnsiPos(Key, Sus));
  End;
End;

//Does cycle shift
//Key - word, Sus - line, K - length of step, Res - result

Procedure Shift(var Key, Sus: String; K: Integer; Var Res: String);
Var
  W: String;
  L: Integer;
Begin
  Res:= Sus;
  //Prevent breaking border
  K:= K Mod Length(Res);

  //Remove from start
  L:= AnsiPos(Key, Res) - K;

  if L >= 0 then
  begin
    W:= Copy(Res, 1, L);
    Delete(Res, 1, L);  
    Res:= Res + W;
  end
  else
  begin
    W:= Copy(Res, Length(Res) + L + 1, Length(Res));
    Delete(Res, Length(Res) + L + 1, Length(Res));  
    Res:= W + Res;
  end;

  //Append to end

  //Prepare for the next key
  L:= AnsiPos(Key, Sus) + Length(Key);
  W:= Copy(Sus, 1, L);
  Delete(Sus, 1, L);
  
  Sus:= Sus + W;
End;

Begin
  //Cyrillic support
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);

  Write('Enter K: ');
  ReadLn(K);

  //Load dictionary
  AssignFile(F, 'F.txt');
  Reset(F);
  L:= 1;
  While Not Eof(F) Do
  Begin
    ReadLn(F, Keys[L]);
    Inc(L);
  End;
  CloseFile(F);

  //Load data
  AssignFile(F, 'F1.txt');
  Reset(F);
  N:= 1;
  While Not Eof(F) Do
  Begin
    ReadLn(F, Data[N]);
    Inc(N);
  End;
  CloseFile(F);

  //Create file with shifted data
  AssignFile(F, 'Res.txt');
  Rewrite(F);

  For I:= 1 To N Do
    For J:= 1 To L Do
    Begin
      //How many additions
      Amogus:= 0;
      Count(Keys[J], Data[I], Amogus);

      //If should be added
      If (Amogus > 0) Then
      Begin

        For M:= 1 To Amogus Do
        Begin
          Shift(Keys[J], Data[I], K, Res);
          WriteLn(F, Res);
        End;
      End;
    End;

  CloseFile(F);

  Write('Saved to file Res.txt');
  ReadLn;
End.

