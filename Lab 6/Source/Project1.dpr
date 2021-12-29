Program Lab6;
{This program calculates the day of the week from the date}

//Use app
{$APPTYPE CONSOLE}

//Declare modules
Uses
  SysUtils;

//Declare types
Type
  TMon = (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
  TWds = (Sun, Mon, Tue, Wed, Thi, Fri, Sat);
  //TMon - type for months
  //TWds - type for weekdays

//Declare vars
Var
  NMon:TMon;
  NWds:TWds;
  //NMon - name of month
  //NWds - name of weekday
  AQuas:Array[TMon] Of Integer = (0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334);
  ADays:Array[TWds] Of String = ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thirsday', 'Friday', 'Saturday');
  //AQuas - quantities of days since 1 jan
  //ADays - names of weekdays
  Year, Month, N, I, Error, Max:Integer;
  //Year - current year
  //N - quantity of days
  //I - cycle parameter
  //Error - parameter for checking input
  //Max - limit of month days
  Input:String;
  //Input - input string
  Flag:Boolean;
  //Flag - has 29 feb
Begin
  //Checking for the correct input
  Repeat
    Write('Enter the year (example: 2002): ');
    ReadLn(Input);

    //First incorrect symbol is Error
    Val(Input, Year, Error);
    If (Year <= 0) Or (Error <> 0) Then
      WriteLn('Invalid input. Enter another number.');
  Until (Error = 0) And (Year >= 0);

  //Checking for the correct input
  Repeat
    Write('Enter the month (example: 07): ');
    ReadLn(Input);

    //First incorrect symbol is Error
    Val(Input, Month, Error);

    If (Month <= 0) Or (Month > 12) Or (Error <> 0) Then
      WriteLn('Invalid input. Enter another number.');
  Until (Error = 0) And (Month > 0) And (Month <= 12);    

  //If has 29 feb
  Flag:= (((Year Mod 4 = 0) And (Year Mod 100 <> 0)) Or (Year Mod 400 = 0));

  //Convert month
  NMon:= Jan;
  For I:= 1 To 11 Do
    If Month > I Then
      Inc(NMon);

  //Limit of days
  Case (NMon) Of
    Apr, Jun, Sep, Nov:
      Max:= 30;
    Feb:
      Begin
        Max:= 28;
        If Flag Then
          Inc(Max);
      End;
  Else
    Max:= 31;
  End;

  //Checking for the correct input
  Repeat
    Write('Enter the day (example: 10): ');
    ReadLn(Input);

    //First incorrect symbol is Error
    Val(Input, N, Error);
    If (N <= 0) Or (N > Max) Or (Error <> 0) Then
      WriteLn('Invalid input. Enter another number.');
  Until (Error = 0) And (N > 0) And (N <= Max);

  //Add all days of previous years, months + 29 febs
  N:= N + (Year - 1) * 365 + ((Year-1) Div 4) - ((Year-1) Div 100) + ((Year-1) Div 400) + AQuas[NMon];

  //If there was 29 feb
  If Flag And (NMon > Feb) Then
    Inc(N);

  //Convert weekday
  NWds:= Sun;
  For I:= 0 To 5 Do
    If N Mod 7 > I Then
      Inc(NWds);

  WriteLn;
  WriteLn(ADays[NWds]);

  ReadLn;
End.

