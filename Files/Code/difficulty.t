proc showdifficulty
    locatexy (430, 320)
    put "Select a difficulty:" ..
    Draw.FillBox (300, 220, 700, 280, red)
    Draw.FillBox (300, 120, 700, 180, black)
    Draw.FillBox (300, 20, 700, 80, black)
    locatexy (440, 250)
    colorback (red)
    put "Easy (10 x 10)" ..
    locatexy (440, 150)
    colorback (black)
    put "Medium (15 x 15)" ..
    locatexy (440, 50)
    put "Hard (20 x 20)" ..
end showdifficulty

proc choosedifficulty (x, y : int)
    if x >= 300 and x <= 700 and y >= 20 and y <= 80
	    then
	easy := false
	medium := false
	hard := true
	Draw.FillBox (300, 220, 700, 280, black)
	Draw.FillBox (300, 120, 700, 180, black)
	Draw.FillBox (300, 20, 700, 80, red)
	locatexy (440, 250)
	put "Easy (10 x 10)" ..
	locatexy (440, 150)
	put "Medium (15 x 15)" ..
	locatexy (440, 50)
	colorback (red)
	put "Hard (20 x 20)" ..
	colorback (black)
    end if
    if x >= 300 and x <= 700 and y >= 120 and y <= 180
	    then
	easy := false
	medium := true
	hard := false
	Draw.FillBox (300, 220, 700, 280, black)
	Draw.FillBox (300, 120, 700, 180, red)
	Draw.FillBox (300, 20, 700, 80, black)
	locatexy (440, 250)
	put "Easy (10 x 10)" ..
	locatexy (440, 150)
	colorback (red)
	put "Medium (15 x 15)" ..
	locatexy (440, 50)
	colorback (black)
	put "Hard (20 x 20)" ..
    end if
    if x >= 300 and x <= 700 and y >= 220 and y <= 280
	    then
	easy := true
	medium := false
	hard := false
	Draw.FillBox (300, 220, 700, 280, red)
	Draw.FillBox (300, 120, 700, 180, black)
	Draw.FillBox (300, 20, 700, 80, black)
	locatexy (440, 250)
	colorback (red)
	put "Easy (10 x 10)" ..
	locatexy (440, 150)
	colorback (black)
	put "Medium (15 x 15)" ..
	locatexy (440, 50)
	put "Hard (20 x 20)" ..
    end if
end choosedifficulty
