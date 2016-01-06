proc gridlocate (x, y : int, var row, column : int)
    if x > originX
	    and x < originX + boardwidth * horizontalSize
	    and y < originY
	    and y > originY - boardlength * verticalSize
	    then
	column := (x - originX) div horizontalSize + 1
	row := (originY - y) div verticalSize + 1
    else
	column := 0
	row := 0
    end if
end gridlocate


proc plantflag (x, y : int, var a : array 1 .. *, 1 .. * of string (1))
    var tempx : int
    var tempy : int
    gridlocate (x, y, row, column)
    if row not= 0 and column not= 0 and a (row, column) = "u"
	    then
	tempx := originX + (column - 1) * horizontalSize
	tempy := originY - (row) * verticalSize
	Pic.ScreenLoad ("images/flag.jpg", tempx, tempy, picCopy)
	a (row, column) := "f"
    elsif row not= 0 and column not= 0 and a (row, column) = "f"
	    then
	tempx := originX + (column - 1) * horizontalSize
	tempy := originY - (row) * verticalSize
	Pic.ScreenLoad ("images/unclicked space.jpg", tempx, tempy, picCopy)
	a (row, column) := "u"
    end if

end plantflag

proc revealadjacent (x, y : int, var visible : array 1 .. *, 1 .. * of string (1), var hidden : array 1 .. *, 1 .. * of string (1))
    var tempx : int := 0
    var tempy : int := 0
    var tempx2 : int
    var tempy2 : int
    var ischeckover : boolean := false
    var exitloop : boolean := true
    for i : 1 .. 3
	tempy := x - 2 + i
	for k : 1 .. 3
	    tempx := y - 2 + k
	    tempx2 := originX + (tempx - 1) * horizontalSize
	    tempy2 := originY - (tempy) * verticalSize
	    if tempx >= 1 and tempx <= boardlength and tempy >= 1 and tempy <= boardwidth and visible (tempy, tempx) = "u"
		    or tempx >= 1 and tempx <= boardlength and tempy >= 1 and tempy <= boardwidth and visible (tempy, tempx) = "f"
		    then
		visible (tempy, tempx) := hidden (tempy, tempx)
		if hidden (tempy, tempx) = "b"
			then
		    Pic.ScreenLoad ("images/revealed space.jpg", tempx2, tempy2, picCopy)
		    visible (tempy, tempx) := "b"
		    revealadjacent (tempy, tempx, visible, hidden)
		else
		    Pic.ScreenLoad ("images/" + hidden (tempy, tempx) + ".jpg", tempx2, tempy2, picCopy)
		    visible (tempy, tempx) := hidden (tempy, tempx)
		end if
	    end if
	end for
    end for
end revealadjacent


proc revealspace (x, y : int, var visible : array 1 .. *, 1 .. * of string (1), var hidden : array 1 .. *, 1 .. * of string (1))
    var tempx : int
    var tempy : int
    gridlocate (x, y, row, column)
    if row not= 0 and column not= 0
	    then
	if visible (row, column) = "u"
		then
	    tempx := originX + (column - 1) * horizontalSize
	    tempy := originY - (row) * verticalSize
	    if hidden (row, column) = "m"
		    then
		visible (row, column) := "m"
		losegame
		Pic.ScreenLoad ("images/clickedmine.jpg", tempx, tempy, picCopy)
	    elsif hidden (row, column) = "b"
		    then
		Pic.ScreenLoad ("images/revealed space.jpg", tempx, tempy, picCopy)
		visible (row, column) := "b"
		revealadjacent (row, column, visible, hidden)
	    else
		Pic.ScreenLoad ("images/" + hidden (row, column) + ".jpg", tempx, tempy, picCopy)
		visible (row, column) := hidden (row, column)
	    end if
	end if
    end if
end revealspace


