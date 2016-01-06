proc losegame
    var tempx : int := 0
    var tempy : int := 0
    isGameOver := true
    if easy = true
	    then
	for i : 1 .. boardwidth
	    for k : 1 .. boardlength
		if easyboard (i, k) = "m"
			then
		    tempx := originX + (k - 1) * horizontalSize
		    tempy := originY - (i) * verticalSize
		    Pic.ScreenLoad ("images/mine.jpg", tempx, tempy, picCopy)
		end if
	    end for
	end for
    elsif medium = true
	    then
	for i : 1 .. boardwidth
	    for k : 1 .. boardlength
		if mediumboard (i, k) = "m"
			then
		    tempx := originX + (k - 1) * horizontalSize
		    tempy := originY - (i) * verticalSize
		    Pic.ScreenLoad ("images/mine.jpg", tempx, tempy, picCopy)
		end if
	    end for
	end for
    elsif hard = true
	    then
	for i : 1 .. boardwidth
	    for k : 1 .. boardlength
		if hardboard (i, k) = "m"
			then
		    tempx := originX + (k - 1) * horizontalSize
		    tempy := originY - (i) * verticalSize
		    Pic.ScreenLoad ("images/mine.jpg", tempx, tempy, picCopy)
		end if
	    end for
	end for
    end if

    var font1 : int
    font1 := Font.New ("Palatino:32")
    assert font1 > 0
    var x := 0
    var y := maxy div 2
    Font.Draw ("Game Over! You Lose!", 280, 50, font1, red)
    Font.Free (font1)
end losegame
