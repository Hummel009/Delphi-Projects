program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

//�������� �������� �� ������ ����� ������
function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X) and (X>0); //�������� �������� �� ����� �����
end;

//���������� ����� � ���� ����������
procedure solve(n:integer;history:string; var count:integer);
begin

  //�������, ���� ��� �������� ������ �������� �
  if (n>=2) then
  begin
    //���� ������ � � ������ - �����
    if (n=2) then
    begin
      Writeln(history+char(ord('�')-64));  //���������� ��� ����� ������� - ��� ����������� ������ �������� � �������
      count:=count+1;                      //����� ��������� ���������� +1
    end

    //����� ������������� ������� ����������
    else
      solve(n-2,history+char(ord('�')-64),count);
  end;

  //������ ��������� �������� �
  if (n>=3) then
  begin
    //������ � � ������ - �����
    if (n=3) then
    begin
      Writeln(history+char(ord('�')-16));
      count:=count+1;           //����� ��������� ���������� +1
    end

    //��� ��� ��� ��������� - ���������
    else
      solve(n-3,history+char(ord('�')-16),count);
  end;
end;

var
  count,n: integer;
  str:string;
begin
  write('Chislo simvolov: ');
  readln(str);
  while Not IsInteger(str) do
  begin
    Writeln('Nedopuctymu vvod.');
    write('Chislo simvolov: ');
    readln(str)
  end;
  writeln;
  Writeln('Kombinacii:');
  solve(StrToInt(str),'',count);
  writeln;
  writeln('Chislo kombinaciy: ',count);
  readln;
end.

