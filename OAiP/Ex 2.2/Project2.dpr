program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;
const
  n=15;

type
  mas=array[1..n,1..n] of string;
  TDirArray= array[1..4] of Integer;
  TDirection = (Up,Down,Left,Right);

//�������� �������� �� ������ ����� ������
function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X) and (X>=0); //�������� �������� �� ����� �����
end;

//����� ������� ��������
function rus (mes: string) : string;
var
  i: integer;
begin
  for i := 1 to length (mes) do
    case mes[i] of
      '�'..'�', '�'..'�', '�'..'�': mes[i] := chr (ord (mes[i]) -64) ;
      '�'..'�': mes[i] := chr (ord (mes[i])-16);
    end;
  rus := mes;
end;

//���������� ������� �������� �� �����
function ReadRus(mes: string) : string;
var
  i: integer;
begin
  for i := 1 to length (mes) do
    case mes[i] of
      '�'..'�': mes[i] := chr (ord (mes[i])+16);
    end;
  ReadRus := mes;
end;

//������� ���������� ������ ��������� ����. ����������� ����������� ��������
//� �������� �� ������ ����������� ������
function GetDirArray(dir:TDirection; first:boolean): TDirArray;
begin
  //���� ����������� ������ - �� ������� ����� ��� ����� ����� ����� ��� �� ������ ���
  if first then
  begin
    result[1]:=1;
    result[2]:=0;
    result[3]:=1;
    result[4]:=0;
  end
  //����� ��������
  else
  begin
    result[1]:=0;
    result[2]:=1;
    result[3]:=0;
    result[4]:=1;
  end;

  //���� ��������� �� ��������� ���������� - ������ ��� - �������������
  if (dir = Up) Or (dir=Left) then
  begin
    result[1]:=result[1]*(-1);
    result[2]:=result[2]*(-1);
  end
  //����� ������, � �� ����� �� 3 ��� 4 ����� �� � ������� ���� 0*(-1)=0
  else
  begin
    result[3]:=result[3]*(-1);
    result[4]:=result[4]*(-1);
  end
end;


//������� ���������� ����������� � ������ ����� ������� � ������� �� ������� i,j � ����� �� i - di
// �� j - dj. ����� ���������� ������� - count
function GetLine(var A:mas;var i,j:integer;di,dj,count:integer):string;
var
  k:integer;
begin
  result:='';
  for k:=1 to count do             //��� ������� ���������������� �������
  begin
    i:=i+di;                       //��������
    j:=j+dj;                       //i � j
    result:=result+A[i,j];         //���������� � ����������
  end;
end;


//������� �������� ������ � ���������� ��� �� �������
function Code(A:mas;DirI,DirJ:TDirArray):string;
var
  i,j:integer;
  k:integer;
begin
  i:=(n+1) div 2;                 // ���������
  j:=(n+1) div 2;                 // ����������
  result:=A[i,j];

  //���������� ������� ��� ������ ��������� �� 5-� (��� ������� 11�11) �������� ����� ������������� ������ � �����
  for k:=0 to (n-3) div 2 do
  begin
    result:=result+GetLine(A,i,j,DirI[1],DirJ[1],2*k+1);   // ������ ��� ������� �������
    result:=result+GetLine(A,i,j,DirI[2],DirJ[2],2*k+1);   // ����� ������ ������
    result:=result+GetLine(A,i,j,DirI[3],DirJ[3],2*k+2);   // ��� ���
    result:=result+GetLine(A,i,j,DirI[4],DirJ[4],2*k+2);   // �������
  end;
    result:=result+GetLine(A,i,j,DirI[1],DirJ[1],n-1)       //��������� ����� �� ����� � �������  - ������� �

end;

//���������� ������ � ������� �� �������
function LineToMarix(str:string):mas;
var
  i,j:integer;
begin
  for i:=1 to n do
    for j:=1 to n do
      result[i,j]:=str[n*(i-1)+j];  // ����� ������ - ����� ����� �� ������� �� n, c������� - �������
end;

//���������� ��������� ���� �����������
procedure RandomDirectionPair(out FirstD,SecondD:TDirection);
var
  TempD:TDirection;
begin
//���� �� ����������� ����� ��� ����
  if Round(Random(2))-1=0 then
    FirstD:=Up
  else
    FirstD:=Down;

//������ ����� ��� ������
  if Round(Random(2))-1=0 then
    SecondD:=Left
  else
    SecondD:=Right;

//�����-�� �� ��� ������
  if Round(Random(2))-1=0 then
  begin
    TempD:=SecondD;
    SecondD:=FirstD;
    FirstD:=TempD;
  end;

end;

//������ ����������� ������ s �� DirCount ��������
function AllCode(s:string;DirCount:integer):string;
var
  i:integer;
  Directions:array of array[0..1] of TDirection;
  Di,Dj:TDirArray;
  TempD1,TempD2:TDirection;
  tstr:string;
begin
  SetLength(Directions,DirCount);    //����. ������������ ������ �����������

  for i:=0 to DirCount-1 do
  begin
    //�������� ��������� ���� ����������� � �������. � ������
    RandomDirectionPair(TempD1,TempD2);
    Directions[i][0]:=TempD1;
    Directions[i][1]:=TempD2;

    //���������� ����� �� ����������� �� Ox, ����� �� Oy � �������� ������� ��������
    if (TempD1 = Up) Or (TempD1 = Down) then
    begin
      Di:=GetDirArray(TempD1,true);
      Dj:=GetDirArray(TempD2,false)
    end
    else
    begin
      Dj:=GetDirArray(TempD1,true);
      Di:=GetDirArray(TempD2,false)
    end;

    //�������� �� ������ ���� ����������
    s:=Code(LineToMarix(s),Di,Dj);
  end;

  //��������� ����� �������� � �������� ������
  tstr:=IntToStr(DirCount);
  s:=s+IntToStr(Length(tstr));
  s:=s+tstr;

  //���������� ����������� � �������� ������
  for i:=0 to DirCount-1 do
    s:=s+IntToStr(Ord(Directions[i][0]))+IntToStr(Ord(Directions[i][1]));

  result:=s;
end;


//������� ��������� � ������� � ������� �� ������ s, ������� � ������� ss. ������� � ������� ������� �� ������� i,j
//� ����� �� i - di �� j - dj. ����� ����������� ������� - count
procedure SetLine(var A:mas;var i,j:integer;di,dj,count:integer;s:string;ss:integer);
var
  k:integer;
begin
  for k:=1 to count do             //��� ������� ���������������� �������
  begin
    i:=i+di;                       //��������
    j:=j+dj;                       //i � j
    A[i,j]:=s[ss+k];               //���������� � ����������
  end;
end;

function DeCode(s:string;DirI,DirJ:TDirArray):mas;
var
  i,j,ss:integer;
  k:integer;
  A:mas;
begin
  i:=(n+1) div 2;                 // ���������
  j:=(n+1) div 2;                 // ����������
  A[i,j]:=s[1];
  ss:=1;

  //���������� ������� ��� ������ ��������� �� 4-� (��� ������� 11�11) �������� ����� ������������� ������ � �����
  for k:=0 to (n-3) div 2 do
  begin
    SetLine(A,i,j,DirI[1],DirJ[1],2*k+1,s,ss);   // ������ ��� ������� �������
    ss:=ss+2*k+1;
    SetLine(A,i,j,DirI[2],DirJ[2],2*k+1,s,ss);   // ����� ������ ������
    ss:=ss+2*k+1;
    SetLine(A,i,j,DirI[3],DirJ[3],2*k+2,s,ss);   // ��� ���
    ss:=ss+2*k+2;
    SetLine(A,i,j,DirI[4],DirJ[4],2*k+2,s,ss);   // �������
    ss:=ss+2*k+2;
  end;
  SetLine(A,i,j,DirI[1],DirJ[1],n-1,s,ss);        //��������� ����� �� ����� � �������  - ������� �

  result:=A;
end;

//������������� ������� � ������
function MatrixToLine(A:mas):string;
var
  i,j:integer;
begin
  result:='';
  for i:=1 to n do
    for j:=1 to n  do
      result:=result+A[i,j];
end;

//�������� �������� �� ������ ���������� �������������� �������
function ChekForDecode(s:string):boolean;
var
  i,DirCount:integer;
begin
  result:=true;
  DirCount:=0;

  if (length(s) < n*n+1) or                 //���� � ������ ��� ����� ��������
     ( Not ( s[n*n+1] in ['1'..'9'])) or    //��� �������� �� �����
     (length(s) < n*n+1+StrToInt(s[n*n+1])) //��� ���� ������ �������� �����
   then result:=false;

  if result then
  //��������� ��� �� ����� �������� ������
  for i:=n*n+2 to StrToInt(s[n*n+1]) do
    if Not(s[i] in ['0'..'9']) then  result:=false;

  if result then
  begin
    DirCount:=StrToInt(copy(s,n*n+2,StrToInt(s[n*n+1])));
    if length(s)<n*n+1+StrToInt(s[n*n+1]) + DirCount*2 then
      //��������� �������� �� ��� �����������
      result:=false;
  end;

  //��������� ��������� �� ���������� �����������
  if result then
    for i:=n*n+1+StrToInt(s[n*n+1])+1 to n*n+1+StrToInt(s[n*n+1])+DirCount*2 do
      if Not(s[i] in ['0'..'3']) then result:=false;

end;


//������ �������������� ������ s �� DirCount ��������
function AllDeCode(s:string):string;
var
  i,DirStart,DirCount:integer;
  Di,Dj:TDirArray;
  TempD1,TempD2:TDirection;
  Dirstr:string;
begin
  DirStart:=n*n+2+StrToInt(s[n*n+1]);               //������ � �������� �������� �����������

  //���������� DirCount
  Dirstr:='';
  for i:=n*n+2 to DirStart-1 do
    Dirstr:=Dirstr+s[i];
  DirCount:= StrToInt(Dirstr);
  Dirstr:=Copy(s,DirStart,DirCount*2);

  for i:=DirCount downto 1 do
  begin
    //�������� ���� ����������� � �������. � ������
    TempD1:=TDirection(StrToInt(Dirstr[i*2-1]));
    TempD2:=TDirection(StrToInt(Dirstr[i*2]));

    //���������� ����� �� ����������� �� Ox, ����� �� Oy � �������� ������� ��������
    if (TempD1 = Up) Or (TempD1 = Down) then
    begin
      Di:=GetDirArray(TempD1,true);
      Dj:=GetDirArray(TempD2,false)
    end
    else
    begin
      Dj:=GetDirArray(TempD1,true);
      Di:=GetDirArray(TempD2,false)
    end;

    //�������� �� ������ ���� ����������
    s:=MatrixToLine(DeCode(s,Di,Dj));
  end;

  result:=s;
end;

//�������� ������ ����� � n*n ��������
function CutStr(s:string):string;
var
  i,len:integer;
begin
  //������� ������ ������ 121
  len:=Length(s);
  Setlength(s,n*n);
  //��������� ���������� ������� ������ ��������, ������ ��������� ������ ��� ���������
  for i:=len+1 to n*n do
    s[i]:=char(0);
  CutStr:=s;
end;

//�������� ������ (��� ������������� �� ����� filename);
function LoadString(filename:string):string;
var
  tofile,s:string;
  f:TextFile;
  ok:boolean;
begin
  ok:=false; //������� �������� �����
  while not ok do
  begin
    Write(rus('������� �� �����? (Y/N): '));
    Readln(tofile);

    //�� �����
    if tofile='Y' then
    begin
      AssignFile(f,filename);
      {$I-}   //��� ���� ����� �� ����� ������ IOResult ����� �� 0,� �� ������� ����������
      Reset(f);
      {$I+}
      //������ ��� �������� �����
      if IOResult <> 0 then
        Writeln(rus('������� ����. ���������� ��� ���'))
      else
      //���� ������ ��� �������
      begin
        Readln(f,s);
        CloseFile(f);
        ok:=true;
      end;
    end

    //���� �� �������
    else if tofile='N' then
    begin
      Writeln(rus('������ ����: '));
      Readln(s);
      s:=ReadRus(s);
      ok:=true;
    end

    //������� �� Y �� N
    else
      Writeln(rus('������� ����. ���������� ��� ���'));

    //�������� �� ����������� �������������
    if ok and (filename='decode.txt') and (Not ChekForDecode(s)) then
    begin
      Writeln(rus('�������� ������ ������ ��� �����������'));
      ok:=ChekForDecode(s);
    end
  end;

  if filename='code.txt' then
    s:=CutStr(s);
  if tofile='Y' then
  begin
    Writeln(rus('������� ������:'));
    Writeln(rus(s));
  end;
  LoadString:=s;
end;

var
  s,com,dc:string;
  DirCount:integer;
  f:TextFile;
begin
  Randomize;

  while true do
  begin
    Write(rus('�������� �����������(code)/��������������(decode): '));
    Readln(com);
    if com='code' then
    begin
      s:=LoadString('code.txt');
      if Length(s)< 200 then
      begin
        Writeln(rus('������� �������� ������'));
        Readln;
        Exit;
      end;
      Writeln;

      //������� ����� ��������
      Write(rus('����� ��������: '));
      Readln(dc);
      //�������� �� ���� ����������� ��������
      while Not IsInteger(dc) do
      begin
        Writeln(rus('�������� ����.'));
        Write(rus('����� ��������: '));
        Readln(dc);
      end;

      DirCount:=StrToInt(dc);
      //�����������
      s:= AllCode(s,DirCount);

      Writeln(rus('��������� �����������:'));
      Writeln(rus(s));
      Writeln;

      //����������
      Write(rus('��������� � ����? (Y/N): '));
      Readln(com);
      if com = 'Y' then
      begin
        AssignFile(f,'decode.txt');
        Rewrite(f);
        Writeln(f,s);
        CloseFile(f);
        Writeln(rus('������������ ������ ���������.'));
      end;
    end
    else if com= 'decode' then
    begin
      s:=LoadString('decode.txt');
      Writeln;

      //�������������
      s:=AllDecode(s);
      Writeln(rus('��������������� �����:'));
      Writeln(rus(s));
    end;

    Writeln('----------------------------------------------------------');
    Writeln;
  end;
end.
