process timer
    locate (1, 55)
    put "Time Passed: " ..
    loop
	timepassed := Time.Elapsed
	locate (1, 60)
	put timepassed : 8
    end loop
end timer

process displaytimer
    loop
	fork timer
	delay (25)
	exit
    end loop
end displaytimer
