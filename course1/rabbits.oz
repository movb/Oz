declare GetRefTime in GetRefTime = {Link ['x-oz://boot/Time']}.1.getReferenceTime

declare
fun {NaiveRabbit N}
  if N == 0 then 2
  elseif N == 1 then 4
  elseif N == 2 then 8
  else {NaiveRabbit N-1}+{NaiveRabbit N-2}+{NaiveRabbit N-3} end
end

declare
fun {Rabbit N}
   fun {RabbitAcc N Acc1 Acc2 Acc3}
      if N == 0 then 2
      elseif N == 1 then 4
      elseif N == 2 then 8
      elseif N == 3 then
	 Acc1+Acc2+Acc3
      else
	 {RabbitAcc (N-1) (Acc1+Acc2+Acc3) Acc1 Acc2}
      end
   end
in
   {RabbitAcc N 8 4 2}
end

declare
fun {Measure N}
   local StartNaive StartGood N1 N2 in
      StartNaive = {GetRefTime}
      N1 = {NaiveRabbit N}
      StartGood = {GetRefTime}
      N2 = {Rabbit N}
      ((StartGood-StartNaive) - (({GetRefTime})-StartGood))
   end
end

{Browse {Measure 15}}

