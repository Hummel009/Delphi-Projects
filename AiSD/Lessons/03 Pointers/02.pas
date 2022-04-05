procedure Insert_Middle(var p1 : list; n : integer; x : integer);
  var 
    temp, p : list;
    i : integer;
  begin
    new(temp); temp^.data := x; 
    p := p1; for i := 1 to n - 2 do p := p^.next;
    temp^.next := p^.next; p^.next := temp;
  end;
  
procedure Del_Front(var p1 : list; var p2 : list);
  var temp : list;
  begin
    temp := p1; p1 := p1^.next; Dispose(temp);
    if p1 = Nil then p2 := Nil;
  end;

procedure Del_Back(var p1 : list; var p2 : list);
  var temp : list;
  begin
    temp := p1; while temp^.next^.next <> Nil do temp := temp^.next;
    p2 := temp; Dispose(temp^.next); temp^.next := Nil;
  end;

procedure Del_Middle(var p1 : list; n : integer);
  var 
    temp, temp2 : list;
    i :integer;
  begin
    temp := p1; for i := 1 to n - 2 do temp := temp^.next;
    temp2 := temp^.next; temp^.next := temp^.next^.next; Dispose(temp2);
  end;

begin
  first := Nil; last := Nil;
  for i := 0 to 4 do
    Insert_Front(first, last, i);
  Print(first); writeln;
  for i := 5 to 9 do
    Insert_Back(first, last, i);
  Print(first); writeln;
  Insert_Middle(first, 3, 99);
  Print(first); writeln;
  Del_Front(first, last);
  Print(first); writeln;
  Del_Back(first, last);
  Print(first); writeln;
  Del_Middle(first, 3);
  Print(first); writeln;
end.