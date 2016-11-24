local Wrap Unwrap in
   {NewWrapper Wrap Unwrap}
   fun {NewStack} {Wrap nil} end
   fun {Push W X} {Wrap X|{Unwrap W}} end
   fun {Pop W X} S={Unwrap W} in X=S.1 {Wrap S.2} end
   fun {IsEmpty W} {Unwrap W}==nil end
end
