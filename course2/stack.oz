declare
fun {NewStack}
   C={NewCell nil}
   proc {Push X} C:=X|@C end
   proc {Pop X} S=@C in C:=S.2 X=S.1 end
   proc {IsEmpty B} B=(@C==nil) end
in
   proc {$ M}
      case M of push(X) then {Push X}
      [] pop(X) then {Pop X}
      [] isEmpty(B) then {IsEmpty B} end
   end
end
