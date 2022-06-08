Program Lab7;
{Show all the ssgz letters in our words}

//Use app
{$APPTYPE CONSOLE}

Uses
  SysUtils,
  Windows;

Type
  TSet = Set Of Char;
  TArrWords = Array[1..250] Of String;
  TArrSets = Array[1..250] Of TSet;
  TArrLets = Array[1..10] Of String;

Var
  Str: String;
  MainSet: TSet = ['а', 'е', 'и', 'о', 'у', 'ы', 'э', 'ю', 'я'];

  ArrWords: TArrWords;
  ArrSets: TArrSets;   
  Quantity: Byte;

  FinalSet: TSet = [];
  FinalArr: TArrLets;
  FinalArrLen: Byte;

  I: Byte;

Procedure GetArrayOfWords(Str: String; Var AWords: TArrWords; Var Quantity: Byte);
Var
  W: String;
Begin
  Delete(Str, Pos('.', Str), 1);
  Str:= Str + ',';

  Quantity:= 0;
  While Pos(',', Str) > 0 Do
  Begin        
    Inc(Quantity);
    W:= Copy(Str, 1, Pos(',', Str) - 1);
    AWords[Quantity]:= W;
    Delete(Str, 1, Length(W) + 1);
  End;
End;

Procedure GetArrayOfSets(const AWords: TArrWords; Var ASets: TArrSets; const Quantity: Byte);
Var
  I, J: Byte;
Begin
  For I:= 1 To Quantity Do
  Begin
    For J:= 1 To Length(AWords[I]) Do
      If AWords[I][J] In MainSet Then
        Include(ASets[I], AWords[I][J]);
  End;
End;

Procedure GetFinalSet(const ASets: TArrSets; Var FSet: TSet; const Quantity: Byte);
Var
  I: Byte;
Begin
  FSet:= ASets[1];
  For I:= 2 To Quantity Do
    FSet:= FSet * ASets[I];
End;

Procedure GetFinalArr(const FSet: TSet; Var FArr: TArrLets; Var FArrLen: Byte);
Var
  C: Char;
Begin
  FArrLen:= 1;
  For C:= 'а' To 'я' Do
  Begin
    If C In FSet Then
    Begin
      FArr[FArrLen]:= C;
      Inc(FArrLen);
    End;
  End;
End;

Begin
  //Помощь при выводе кирилических символов
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);

  Write('Введите строку (до 250 слов): ');
  ReadLn(Str);

  WriteLn;

  GetArrayOfWords(Str, ArrWords, Quantity);
  GetArrayOfSets(ArrWords, ArrSets, Quantity);
  GetFinalSet(ArrSets, FinalSet, Quantity);
  GetFinalArr(FinalSet, FinalArr, FinalArrLen);

  If FinalSet = [] Then
    Write('Таких элементов не найдено.')
  Else
  Begin
    Write('Гласные буквы, входящие в каждое слово:');
    WriteLn;
    For I:= 1 To FinalArrLen Do
      Write(FinalArr[I], ' ');
  End;

  WriteLn;
  Readln;
End.
