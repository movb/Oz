declare
local
   A1={NewCell 0}
in
   proc {Inc} A1:=@A1+1 end
   proc {Get X} X=@A1 end
end

{Inc}
{Inc}
local X in {Get X}{Browse X} end

declare
local
   A1={NewCell 0}
   proc {Inc} A1:=@A1+1 end
   proc {Get X} X=@A1 end
in
   proc {Counter M}
      case M of inc then {Inc}
      [] get(X) then {Get X}
      end
   end
end

declare
fun {NewCounter}
   A1={NewCell 0}
   proc {Inc} A1:=@A1+1 end
   proc {Get X} X=@A1 end
in
   proc {$ M}
      case M of inc then {Inc}
      [] get(X) then {Get X}
      end
   end
end

declare
C1={NewCounter}
C2={NewCounter}
{C1 inc}
{C1 inc}

local X in {C1 get(X)} {Browse X} end
local X in {C2 get(X)} {Browse X} end
