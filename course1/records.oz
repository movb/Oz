declare
R = rectangle(bottom: 10 left:20 top:100 right:200)

{Browse (R.top-R.bottom)*(R.right-R.left)}

{Browse {Label R}}

{Browse {Width R}}

{Browse {Arity R}}

{Browse R == rectangle(bottom: 10 left:20 top:100 right:200)}

case R of rectangle(bottom:A top:B left:C right:D) then
   {Browse (A+B+C+D)}
end

{Browse '|'(1:1 2:'|'(1:2 2:nil))}
{Browse '|'(1:1 2:('|'(1:2 2:nil)))}

declare
T = [z [3 a] [b 5]]

declare
fun {Transform L}
   case L
   of H|T then
      fun {RecAdd Acc Names Values}
	 case Names
	 of nil then Acc
	 else {RecAdd {AdjoinAt Acc Names.1 {Transform Values.1}} Names.2 Values.2}
	 end
      end
      in	    
      {RecAdd H() T.1 T.2.1}
   else L
   end
end

{Browse {Transform T}}

local Res in
  local Arg1 Arg2 in
    Arg1 = 7
    Arg2 = 6
    Res = Arg1 * Arg2
  end
  {Browse Res}
end

local Res in
  local Arg1 Arg2 in
    Arg1 = 7
    Res = Arg1 * Arg2
    Arg2 = 6
  end
  {Browse Res}
end