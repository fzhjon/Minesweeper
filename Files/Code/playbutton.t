proc gamestarttrue (x, y : int)
    if x >= 800 and x <= 950 and y >= 20 and y <= 60
	    then
	isGameWindowOpen := true
	cls
    end if
end gamestarttrue

proc playgame
    Draw.FillBox (800, 20, 950, 60, black)
    locatexy (840, 40)
    put "Play Game!" ..
end playgame

proc gamestart
    if easy = true
	    then
	boardlength := 10
	boardwidth := 10
	originX := 350
	originY := 550
	generatehiddenboard (easyboard, boardlength, boardwidth)
	generatevisibleboard (easyboardvisible, boardlength, boardwidth)
	drawgrid (originX, originY, boardwidth, boardlength, horizontalSize, verticalSize, clr)
    elsif medium = true
	    then
	boardlength := 15
	boardwidth := 15
	originX := 270
	originY := 630
	generatehiddenboard (mediumboard, boardlength, boardwidth)
	generatevisibleboard (mediumboardvisible, boardlength, boardwidth)
	drawgrid (originX, originY, boardwidth, boardlength, horizontalSize, verticalSize, clr)
    elsif hard = true
	    then
	boardlength := 20
	boardwidth := 20
	originX := 190
	originY := 710
	generatehiddenboard (hardboard, boardlength, boardwidth)
	generatevisibleboard (hardboardvisible, boardlength, boardwidth)
	drawgrid (originX, originY, boardwidth, boardlength, horizontalSize, verticalSize, clr)
    end if
    locatexy (840, 40)
    put "Restart" ..
    locatexy (80, 35)
    put "Main Menu" ..
end gamestart
