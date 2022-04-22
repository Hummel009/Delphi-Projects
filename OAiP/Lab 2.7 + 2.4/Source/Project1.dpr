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
  TArr = Array[0..255] Of String;

//Declare vars
Var      
  Ssgz: Set of Char = ['á', 'â', 'ã', 'ä', 'æ', 'ç', 'ë', 'ì', 'í', 'ð'];
  Str: String[255];
  Arr: TArr;
  I, N: Byte;   
  //Ssgz - vow letters
  //Str - our string
  //Arr - array of letters
  //I, N - loop parameter

//Swaps 2 elements
//A1, B1 - elements
Procedure Swap(Var A1, B1);
Type
  B = Integer;
  //B - type that will be upon the untyped parameter
Var
  T: Integer;
  A: Integer Absolute A1;
  //T - temp
  //A - var that will be upon the untyped parameter
Begin
  T:= A;
  A:= B(B1);
  B(B1):= T;
End;
    
//Sorts an array
//Arr - array, N - size of the array
Procedure BubbleSort(Var Arr: TArr; Const N: Integer);
Var
  I, J: Integer;
  //I, J - loop params
Begin
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

  Write('Enter the string: ');
  ReadLn(Str);

  WriteLn;

  N:=1;
  
  //Put every vow letter into array
  For I:= 1 To Length(Str) Do
  Begin
    If Str[I] In Ssgz Then
    Begin
      Arr[N]:= Str[I];
      Inc(N);
    end;
  End;

  //Sort an array
  BubbleSort(Arr, N);

  //Show without duplicates
  For I:= 1 To N Do
    If (Arr[I] <> Arr[I + 1]) Then
      Write(Arr[I]);

  WriteLn;

  Readln;
End.
