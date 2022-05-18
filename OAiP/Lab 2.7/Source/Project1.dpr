Program Lab7;
{Show all the ssgz letters in our words}

//Use app
{$APPTYPE CONSOLE}

//Declare libs
Uses
  SysUtils,
  Windows;

//Declare types
Type
  TArr = Array[1..11] Of String;
  TSet = Set Of Char;

//Declare vars
Var
  Ssgz: TSet = ['б', 'в', 'г', 'д', 'ж', 'з', 'л', 'м', 'н', 'р'];
  Letr: TSet;
  Str: String;
  Arr: TArr;
  I, N: Byte;
  //Ssgz - vow letters
  //Letr - been found letters
  //Str - our string
  //Arr - array of letters
  //I, N - loop parameter

//Swaps 2 elements
//A, B - elements
Procedure Swap(Var A, B: String);
Var
  T: String;
Begin
  T:= A;
  A:= B;
  B:= T;
End;

//Sorts a set
//Enum - set, N - size of the array
Procedure Sort(Const Enum: TSet; var Arr: TArr; Var N: Byte);
Var
  I, J: Integer;
  S: Char;
  //I, J - loop params
  //S - potential enum letter

Begin
  //Form an array for sort and showing
  N:= 1;
  For S:= 'а' To 'я' Do
  Begin
    If S In Enum Then
    Begin
      Arr[N]:= S;
      Inc(N);
    End;
  End;

  //Sort an array
  For I:= 1 To N - 1 Do
  Begin
    For J:= 1 To N - I Do
    Begin
      If Arr[J] > Arr[J + 1] Then
        Swap(Arr[J], Arr[J + 1]);
    End;
  End;
End;

Begin
  //Cyrillic support
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);

  Write('Введите строку любой длины: ');
  ReadLn(Str);

  WriteLn;

  //Put every vow letter into array
  For I:= 1 To Length(Str) Do
    If Str[I] In Ssgz Then
      Include(Letr, Str[I]);

  //Sort a set and form an array
  Sort(Letr, Arr, N);
        
  Write('Звонкие согласные: ');

  //Show the array
  For I:= 1 To N Do
    Write(Arr[I]);

  WriteLn;

  Readln;
End.

