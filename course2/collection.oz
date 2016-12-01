declare
class Collection
   attr a1
   meth init a1:=nil end
   meth put(X) a1:=X|@a1 end
   meth get(X) local S=@a1 in a1:=S.2 X=S.1 end end
   meth isEmpty(B) B=(@a1==nil) end
   meth union(C)
      local B in
	 {C isEmpty(B)}
	 if {Bool.'not' B} then
	    local X in
	       {C get(X)}
	       {self union(C)}
	       a1:=X|@a1
	    end
	 end
      end     
   end
   meth list(X) X=@a1 end
end

declare
C1={New Collection init}
C2={New Collection init}
{C1 put(a)}
{C1 put(b)}
{C2 put(c)}
{C2 put(d)}
{C1 union(C2)}
local X in
   {C1 list(X)}{Browse X}
end
