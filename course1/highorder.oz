declare
fun {Compose F G}
   fun {$ X} {F {G X}} end
end

Fnew = {Compose fun {$ X} X*X end fun {$ X} X+1 end}