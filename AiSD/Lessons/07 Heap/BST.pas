Program ZZZ;

type 
  Node = record
    Key : integer;
    Left, Right : ^Node;
  end;

var
  root : ^Node;
  n, i, x : integer;
  

procedure InsertTree(var Cur : ^Node; x : integer);
  var T : ^Node;
  begin
    if Cur = Nil then begin
      new(T);
      T^.Key := x; T^.Left := Nil; T^.Right := Nil;
      Cur := T;
    end
    else if x < Cur^.Key then
      InsertTree(Cur^.Left, x)
    else if x > Cur^.Key then
      InsertTree(Cur^.Right, x);
  end;  

procedure LCR(Cur : ^Node);
  begin
    if Cur <> Nil then begin
      LCR(Cur^.Left);
      write(Cur^.Key, ' ');
      LCR(Cur^.Right);
    end;
  end;
  
procedure LRC(Cur : ^Node);
  begin
    if Cur <> Nil then begin
      LRC(Cur^.Left);
      LRC(Cur^.Right);
      write(Cur^.Key, ' '); 
    end;
  end;

 
procedure CLR(Cur : ^Node);
  begin
    if Cur <> Nil then begin
      write(Cur^.Key, ' ');
      CLR(Cur^.Left);
      CLR(Cur^.Right);
    end;
  end;

procedure BFS(Cur : ^Node);
  begin
    
  end;

function Find(Cur : ^Node; x :integer) : ^Node;
  begin
    if (Cur = Nil) or (x = Cur^.Key) then
      Find := Cur
    else if x < Cur^.Key then
      Find := Find(Cur^.Left, x)
    else
      Find := Find(Cur^.Right, x);
  end;

function Maximum(Cur : ^Node) : ^Node;
  begin
    if Cur^.Right = Nil then
      Maximum := Cur
    else
      Maximum := Cur^.Right;
  end;

function Minimum(Cur : ^Node) : ^Node;
  begin
    if Cur^.Left = Nil then
      Minimum := Cur
    else
      Minimum := Cur^.Left;
  end;

procedure DeleteTree(var Cur : ^Node; x :integer);
  begin
  end;

begin
  root := Nil;
  read(n);
  for i := 1 to n do begin
    read(x);
    InsertTree(root, x);
  end;
  LCR(root); writeln;
  CLR(root); writeln;
  (*
  if Find(root, 3) <> Nil then 
    write('+')
  else
    write('-');
  *)
  DeleteTree(root, 5);
  LCR(root); writeln;
  CLR(root); writeln;
 
end.
(*
5
5 1 3 4 2
*)