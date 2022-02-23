Program Lab7;
{This program returns words with conditions: first letter vowel, second conent and the word differs from the last en-tered word}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;
  
//Declare consts
Const
  Vow = ['e', 'y', 'u', 'i', 'o', 'a'];
  Con = ['q', 'w', 'r', 't', 'p', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm'];
 
//Declare vars
Var
  S, W: String;
  A: Array[1..50] of String;
  N, I, L: Integer;
  Flag: Boolean;
  //S - string
  //W - word
  //A - array with words
  //N - array length
  //I - cycle parameter
  //L - word length
  //Flag - boolean about existance
Begin
  Write('Enter the string: ');
  ReadLn(S);
  
  //To not remove last word
  S:= S + ' ';
    
  //Remove unneeded symbols
  While Pos(',', S) > 0 do
    Delete(S, Pos(',', S), 1);
  While Pos('  ', S) > 0 do
    Delete(S, Pos('  ', S), 1);
  Delete(S, Pos('.', S), 1);

  WriteLn;
  N:= 1;

  //Find words
  While Pos(' ', S) > 0 do
  Begin
    W:= Copy(S, 1, Pos(' ', S) - 1);    (* Find the word *)
    A[N]:= W;                           (* Save the word *)
    N:= N + 1;                            (* Increment N *)
    Delete(S, 1, Length(W) + 1);   (* Remove word, space *)
  End;
     
  //Zero words yet
  Flag:= True;
  
  //Find needed words
  For I:= 1 to N - 1 do
  Begin
    
    //Condition about last item
    If A[I] <> A[N - 1] then
    Begin
      W:= A[I];                       (* Load saved word *)
      L:= Length(W);

      //Condition about letters
      If (W[1] in Vow) and (W[L] in Con) then
      Begin
        Flag:= False;                     (* Has results *)
        Write(A[I], ' ');         (* Displaying the word *)
      End;
    End;
  End;

  //If has no results
  If Flag then
    Writeln('There is no needed words.');
  Readln; 
End.
