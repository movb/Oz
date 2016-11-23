declare
fun {MF}   % module definition
    C = {NewCell 0}
    fun {F X}
        C:=@C+1
        X+2
    end
    fun {G X}
       {F X}
    end
    fun {Count} @C end
in 'export'(f:F g:G c:Count)
end

declare
M = {MF}   % module instantiation
	 