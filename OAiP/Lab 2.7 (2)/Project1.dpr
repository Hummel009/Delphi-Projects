Program Lab7;

{$APPTYPE CONSOLE}

Uses
  SysUtils,
  Windows;

Type
  GOROD = (A, B, C, D, E, F, G, H);
  GORODA = Set of GOROD;
  REJSY = array[GOROD] of GORODA;

var
  SushchestvujushchijeRejsy: REJSY = ([H, A,B], [A, B,C], [B, C, D], [C, D, E], [D, E, F], [E, F, G], [F, G, H], [G, H, A]);
  VybrannyjGorod: GOROD;
  Mnozhestvo:GORODA;
  Nm: GOROD;      
  Nazvanija: array[GOROD] of String = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H');

procedure MozhnoPopast(var P: REJSY; var H: GOROD; var K: GORODA);
begin
   K:=P[H];
end;

Begin
  VybrannyjGorod:=C;
  MozhnoPopast(SushchestvujushchijeRejsy, VybrannyjGorod, Mnozhestvo);
             
  for Nm := Low(GOROD) to High(GOROD) do
    if Nm in Mnozhestvo then WriteLn(Nazvanija[Nm]);

  Readln;
End.
