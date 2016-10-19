declare
fun {SumDigits N}
   (N mod 10) + (N div 10) mod 10 + (N div 100) mod 10
end

declare
fun {SumDigits6 N}
   {SumDigits (N div 1000)} +
   {SumDigits (N mod 1000)}
end

{Browse {SumDigits 999}}

declare
fun {SumDigitsR N}
   if N==0 then 0
   else
      (N mod 10) +
      {SumDigitsR (N div 10)}
   end
end

{Browse {SumDigitsR 123456789}}