declare
T = btree(
     1:4
     left:btree(
             1:2
             left:btree(1:1 left:leaf right:leaf)
             right:btree(1:3 left:leaf right: leaf))
       right:btree(1:5 left:leaf right: leaf))

{Browse T}

declare
fun {Infix Tree}
   case Tree
   of leaf then nil
   [] btree(1:X left:Left right:Right) then
      {Append {Append {Infix Left} [X]} {Infix Right}}
   end
end

{Browse {Infix T}}

declare
fun {FromListToTree L}
   local Insert FromListToTreeInt in
      fun {Insert Tree Elem}
	 %{Browse "Insert: "#Tree#", Elem: "#Elem}
	 case Tree
	 of btree(1:Key left:Left right:Right) then
	    if Elem<Key then
	       btree(1:Key left:{Insert Left Elem} right:Right)
	    elseif Elem>Key then
	       btree(1:Key left:Left right:{Insert Right Elem})
	    else
	       btree(1:Key left:Left right:Right)
	    end
	 [] leaf then
	    %{Browse Some}
	    btree(1:Elem left:leaf right:leaf)
	 end
      end
      fun {FromListToTreeInt L Acc}
	 case L
	 of H|T then {FromListToTreeInt T {Insert Acc H}}
	 else Acc
	 end
      end
      {FromListToTreeInt L leaf}
   end
end

declare
fun {FromTreeToList T}
   case T
   of leaf then nil
   [] btree(1:X left:Left right:Right) then
      {Append {Append {FromTreeToList Left} [X]} {FromTreeToList Right}}
   end
end


{Browse {FromListToTree [42 24 12]}}

{Browse {FromTreeToList {FromListToTree [42 42]}}}
      

declare
T=tree(key:horse value:cheval
       left:tree(key:dog value:chien
		 left:tree(key:cat value:chat left:leaf right:leaf)
		 right:tree(key:elephant value:elephant left:leaf right:leaf))
       right:tree(key:mouse value:souris
		  left:tree(key:monkey value:singe left:leaf right:leaf)
		  right:tree(key:tiger value:tigre left:leaf right:leaf))
      )

{Browse T}

declare
fun {Lookup K T}
   case T
   of leaf then notfound
   [] tree(key:X value:V left:T1 right:T2) andthen X==K then
      found(V)
   [] tree(key:X value:V left:T1 right:T2) andthen X<K then
      {Lookup K T2}
   [] tree(key:X value:V left:T1 right:T2) andthen X>K then
      {Lookup K T1}
   [] Some then
      Some
   end
end

{Browse {Lookup cat T}}

declare
fun {Insert K W T}
   case T of leaf then tree(key:K value:W left:leaf right:leaf)
   [] tree(key:X value:V left:T1 right:T2) andthen X==K then
      tree(key:X value:W left:T1 right:T2)
   [] tree(key:X value:V left:T1 right:T2) andthen X<K then
      tree(key:X value:V left:T1 right:{Insert K W T2})
   [] tree(key:X value:V left:T1 right:T2) andthen X>K then
      tree(key:X value:V left:{Insert K W T1} right:T2)
   end
end

{Browse {Insert fly mouche T}}
      
declare
fun {NumLeaves Tree}
   case Tree
   of leaf then 1
   [] btree(T left:T1 right:T2) then
    {NumLeaves T1} + {NumLeaves T2}
   end
end

declare
fun {IsBalanced Tree}
   case Tree
of leaf then true
[] btree(T left:T1 right:T2) then
    if {IsBalanced T1} then
        if {IsBalanced T2} then
            if {NumLeaves T1} == {NumLeaves T2} then
                true
            elseif {NumLeaves T1} == ({NumLeaves T2} + 1) then
                true
            elseif ({NumLeaves T1}+1) == {NumLeaves T2} then
                true
            else
                false
            end
        else
            false
        end
    else
        false
    end
   end
end

declare
fun {Delete K T}
   case T of leaf then leaf
   [] tree(key:X value:V left:T1 right:T2) andthen X==K then
      case {RemoveSmallest T2}
      of none then T1
      [] triple(Tp Yp Vp) then
	 tree(key:Yp value:Vp left:T1 right:Tp)
      end
   [] tree(key:X value:V left:T1 right:T2) andthen X<K then
      tree(key:X value:V left:T1 right:{Delete K T2})
   [] tree(key:X value:V left:T1 right:T2) andthen X>K then
      tree(key:X value:V left:{Delete K T1} right:T2)
   end
end

declare
fun {RemoveSmallest T}
   case T
   of leaf then none
   [] tree(key:X value:V left:T1 right:T2) then
      case {RemoveSmallest T1}
      of none then triple(T2 X V)
      [] triple(Tp Xp Vp) then
	 triple(tree(key:X value:V left:Tp right:T2) Xp Vp)
      end
   end
end

 

      
