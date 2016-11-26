declare
class Counter2
   attr a1
   meth init a1:=0 end
   meth inc a1:=@a1+1 end
   meth get(X) X=@a1 end
end

declare
C1={New Counter2 init}
{C1 inc}
local X in
   {C1 get(X)}{Browse X}
end
