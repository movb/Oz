declare
fun {Fact1 N}
    if N==0 then 1
    else N*{Fact1 N-1} end
end

declare
fun {Pow3 X N}
      fun {PowLoop Y I A}
	 if I==0 then A
	 elseif (I mod 2) == 0 then
	    {PowLoop Y*Y (I div 2) A}
	 else {PowLoop Y (I-1) Y*A} end
      end
      in
      {PowLoop X N 1}
end


