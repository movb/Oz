declare
fun {Reverse L}
    fun {ReverseAux L Acc}
        case L of nil then Acc
        [] H|T then {ReverseAux T H|Acc}
        end
    end
in
    {ReverseAux L nil}
end

for I in 1..10 do
    {Browse I}
end

declare
L=[1 2 5 10]

for E in L do
    {Browse E}
end

declare
fun {Reverse2 L}
   R = {NewCell nil}
   for X in L do
      R:= X | @R
   end
   @R
end

