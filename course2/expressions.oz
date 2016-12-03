declare
class Constant
   attr val
   meth init(V) val:=V end
   meth evaluate(R) R=@val end
end
class Variable
   attr val
   meth init(V) val:=V end
   meth evaluate(R) R=@val end
   meth set(V) val:=V end
end
class Addition
   attr exp1 exp2
   meth init(Exp1 Exp2) exp1:=Exp1 exp2:=Exp2 end
   meth evaluate(R)
      local R1 R2 in
	 {@exp1 evaluate(R1)}
	 {@exp2 evaluate(R2)}
	 R=R1+R2
      end
   end
end
class Subtraction
   attr exp1 exp2
   meth init(Exp1 Exp2) exp1:=Exp1 exp2:=Exp2 end
   meth evaluate(R)
      local R1 R2 in
	 {@exp1 evaluate(R1)}
	 {@exp2 evaluate(R2)}
	 R=R1-R2
      end
   end
end
class Multiplication
   attr exp1 exp2
   meth init(Exp1 Exp2) exp1:=Exp1 exp2:=Exp2 end
   meth evaluate(R)
      local R1 R2 in
	 {@exp1 evaluate(R1)}
	 {@exp2 evaluate(R2)}
	 R=R1*R2
      end
   end
end
class Division
   attr exp1 exp2
   meth init(Exp1 Exp2) exp1:=Exp1 exp2:=Exp2 end
   meth evaluate(R)
      local R1 R2 in
	 {@exp1 evaluate(R1)}
	 {@exp2 evaluate(R2)}
	 R=(R1 div R2)
      end
   end
end



declare
    VarX = {New Variable init(0)}
    VarY = {New Variable init(0)}
    local
        Result
        C = {New Constant init(6)}
        Expr1 = {New Addition init(VarX VarY)}
        Expr2 = {New Division init(Expr1 C)}
    in
        {VarX set(3)}
        {VarY set(4)}
        {Expr2 evaluate(Result)}
        {Browse Result}
    end