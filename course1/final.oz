local A B C in
   A=1 B=2 C=3
   local C D E in
     C=B D=5 E=A
     local A C E in
       A=B C=D E=9
       {Browse A+B+C}
     end
     {Browse A+B+C}
   end
   {Browse A+B+C}
end

declare
L = (a | b) | nil

{Browse L}

declare
 fun {Snake F N X}
   if N==0 then {F X}
   else {Snake fun {$ X} {Snake F N-1 X} end N-1 X} end
 end
 
 {Browse {Snake fun {$ X} X+1 end 2 2}}
 
 {Browse {Snake fun {$ X} X+1 end 10 5}}

declare
proc {Split L L1 L2}
    case L
    of X1|X2|Tail then
       local L1b L2b in
	  L1 = X1 | L1b
	  L2 = X2 | L2b
	  {Split Tail L1b L2b}
       end
    [] X1|nil then
       L1 = X1 | nil
       L2 = nil
    [] nil then
       L1 = nil
       L2 = nil
    end
end

local L1 L2 in
   {Split [a0 a1 a2 a3 a4] L1 L2}
   {Browse L1}
   {Browse L2}
end

declare
fun {Reduction L A B C D}
   local L1 L2 Sum in
      fun {Sum L Acc}
	 case L
	 of nil then Acc
	 [] H|T then {Sum T (Acc+H)}
	 end
      end
      
      {Split L L1 L2}
      local Lb1 Lb2 Lb3 Lb4 in
	 {Split L1 Lb1 Lb2}
	 {Split L2 Lb3 Lb4}
	 (({Sum Lb1 0} * A) + ({Sum Lb2 0} * B) +
	  ({Sum Lb3 0} * C) + ({Sum Lb4 0} * D))
      end
   end
end

	 
end


 