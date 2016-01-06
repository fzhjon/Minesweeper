proc generatevisibleboard (var a : array 1 .. *, 1 .. * of string (1), boardlength, boardwidth : int)
    for i : 1 .. boardwidth
	for j : 1 .. boardlength
	    a (i, j) := "u"
	end for
    end for
end generatevisibleboard
