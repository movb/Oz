declare
fun {Shuffle L}
   local A T Length in
      Length = {List.length L}
      T = {NewCell L}
      A = {NewArray 1 Length 0}

      for I in 1..Length do
	 A.I := T.1
	 T := T.2
      end

      for I in 1..Length do
	 local N Temp in
	    N = {Number.abs ({OS.rand} mod (Length-I+1)) }
	    Temp = A.I
	    A.I := A.(N+I)
	    A.(N+I) := Temp
	 end
      end
      
      local ArrayToList in
	 fun {ArrayToList A}
	    local Temp in
	       Temp = {NewCell nil}
	       for I in (A.low)..(A.high) do
		  Temp := A.I | @Temp
	       end
	       @Temp
	    end
	 end

	 {ArrayToList A}
      end
   end
end

{Browse {Shuffle [1 2 3 4]}}

{Browse {List.length [0 1 3]}}

declare
A = {NewArray 1 3 0}
for I in 1..3 do
   A.I := I
end
{Browse A.3}
   