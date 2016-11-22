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

for E in L do
    {Browse E}
end