Program Lab8;{Program loads key dict and does cycle shift}

{$APPTYPE CONSOLE}

Uses
  SysUtils,
  Windows;

Type
  TArr = Array[1..100] Of String;
Var
  F: TextFile;
  Res: String;
  I, J, K, L, M, N, Amogus: Integer;
  Data, Keys: TArr;
  //F - file
  //I, J, K, L, M, N - counters
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
Procedure Shift(Var Key, Sus: String; K: Integer; Var Res: String);
Var
  W: String;
  L: Integer;
Begin
  Res:= Sus;
  L:= AnsiPos(Key, Res) - K;

  //Cut from start or end
  If L >= 0 Then
  Begin
    W:= Copy(Res, 1, L);
    Delete(Res, 1, L);
    Res:= Res + W;
  End
  Else
  Begin
    W:= Copy(Res, Length(Res) + L + 1, Length(Res));
    Delete(Res, Length(Res) + L + 1, Length(Res));
    Res:= W + Res;
  End;

  //Prepare for the next key
  L:= AnsiPos(Key, Sus) + Length(Key);
  W:= Copy(Sus, 1, L);
  Delete(Sus, 1, L);

  Sus:= Sus + W;
End;
 
//Loads file data into array
//F - file, I - size, Keys - array, S - filename
Procedure LoadFile(var F: TextFile; var I: Integer; var Arr: TArr; const S: String);
Begin
  AssignFile(F, S);
  Reset(F);
  I:= 1;
  While Not Eof(F) Do
  Begin
    ReadLn(F, Arr[I]);
    Inc(I);
  End;
  CloseFile(F);
End;

Begin
  //Cyrillic support
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);

  //Load dictionary and data
  LoadFile(F, L, Keys, 'F.txt');
  LoadFile(F, N, Data, 'F1.txt');
  
  Write('Enter K: ');
  ReadLn(K);

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

          //Prevent from border
          If Length(Data[I]) >= K Then
          Begin
            Shift(Keys[J], Data[I], K, Res);
            WriteLn(F, Res);
          End
          Else
            WriteLn(F, 'K is too big');
        End;
      End;
    End;

  CloseFile(F);

  Write('Saved to file Res.txt');
  ReadLn;
End.