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