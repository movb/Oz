declare
L=[1 2 3]

{Browse L}

declare
M={Append L L}
{Browse M}

[a b c] == a|b|c|nil == '|'(1:a 2:'|'(1:b 2:'|'(1:c 2:nil)))

declare X1 X2 in
X1=1 | X2

{Browse X1}

declare X3 in
X2 = 2 | X3

X3 = nil

{Browse X1}

{Browse X1.1}
{Browse X1.2}

declare
fun {Sum L}
   if L==nil then 0
   else L.1+{Sum L.2} end
end

{Browse {Sum X1}}

declare
fun {Sum2 L A}
   if L==nil then A
   else {Sum2 L.2 L.1+A} end
end

{Browse {Sum2 X1 0}}

% N-th element
declare
fun {Nth L N}
   if N==1 then L.1
   else {Nth L.2 N-1} end
end

{Browse {Nth X1 5}}

declare
fun {Fact N}
   local FactInt in
    fun {FactInt M F Acc}
        if M==N then {Append Acc [F*M]}
        else {FactInt (M+1) (F*M) {Append Acc [F*M]}} end
    end
    {FactInt 1 1 nil}
   end
end

{Browse {Fact 1}}
