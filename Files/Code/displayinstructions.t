proc instructionbutton (x, y : int)
    if x >= 50 and x <= 200 and y >= 20 and y <= 60
	    then
	var instructionwindow : int := Window.Open ("position:top;center,graphics:850;200,title:Minesweeper Instructions")
	var stream : int
	var sWord : string
	var filename : string := "Files/Text/Instructions.txt"
	open : stream, filename, get
	loop
	    get : stream, skip
	    exit when eof (stream)
	    get : stream, sWord : *
	    put sWord
	end loop
	close : stream
	isInstructionWindowOpen := true
	var closebutton := GUI.CreateButton (600, 25, 200, "Close", QuitInstructionWindowPressed)
	loop
	    exit when GUI.ProcessEvent or isInstructionWindowOpen = false
	end loop
	Window.Close (instructionwindow)
    end if
end instructionbutton
proc displayinstructions
    Draw.FillBox (50, 20, 200, 60, black)
    locatexy (80, 35)
    color(yellow)
    colorback(black)
    put "Instructions" ..
end displayinstructions
