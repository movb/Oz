% Pattern matching

declare
fun {Sum L}
   case L
   of H|T then H+{Sum T}
   [] nil then 0
   end
end

declare
fun {Sum2 L A}
   case L
   of H|T then {Sum2 T H+A}
   [] nil then A
   end
end

declare
fun {Append L1 L2}
   case L1
   of nil then L2
   [] H|T then H|{Append T L2}
   end
end

{Browse {Append [1 2 3] [4 5 6]}}

% translate Append to kernel language
declare
proc {Append L1 L2 L3}
   case L1 of nil then L3=L2
   else case L1 of H|T then
	   local T3 in
	      L3=H|T3
	      {Append T L2 T3}
	   end
	end
   end
end

local R in
   {Append [1 2 3] [3 2 4] R}
   {Browse R}
end

declare
fun {Prefix L1 L2}
   if L1==nil then true
   elseif L2==nil then false
   elseif L1.1 \= L2.1 then false
   else {Prefix L1.2 L2.2} end
end

declare
fun {FindString L1 L2}
   if L1==nil then true
   elseif L2==nil then false
   elseif {Prefix L1 L2} then true
   else {FindString L1 L2.2} end
end

declare
fun {FlattenList L}
   case L
   of nil then nil
   [] H|T then
      case H
      of H1|T1 then {Append {FlattenList H} {FlattenList T}}
      else H | {FlattenList T}
      end
   else
      L
   end
end

{Browse {FlattenList [[1] [2 [3 4]] [[[5]]]]}}