proc checkwin (visible, hidden : array 1 .. *, 1 .. * of string (1))
    var font1 : int
    font1 := Font.New ("Palatino:32")
    assert font1 > 0
    var x := 0
    var y := maxy div 2
    isGameWon := true
    for i : 1 .. boardlength
	for j : 1 .. boardwidth
	    if hidden (i, j) not= "m"
		    then
		if hidden (i, j) not= visible (i, j)
			then
		    isGameWon := false
		end if
	    end if
	end for
    end for
    if isGameWon = true
	    then
	isGameOver := true

	Font.Draw ("Congratulations! You Win!", 250, 50, font1, red)
	Font.Free (font1)
    end if
end checkwin
