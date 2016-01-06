function checkadjacent (var a : array 1 .. *, 1 .. * of string (1), x, y, boardlength, boardwidth : int) : string
    var counter : int := 0
    var tempx : int := 0
    var tempy : int := 0
    for i : 1 .. 3
	tempy := x - 2 + i
	for k : 1 .. 3
	    tempx := y - 2 + k
	    if tempx >= 1 and tempx <= boardlength and tempy >= 1 and tempy <= boardwidth
		    then
		if a (tempy, tempx) = "m"
			then
		    counter += 1
		end if
	    end if

	end for
    end for
    if counter > 0
	    then
	result intstr (counter)
    else
	result "b"
    end if
end checkadjacent
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This changes depending on difficulty
%var boardlength : int := 10
%var boardwidth : int := 10
%var hiddenboard : array 1 .. boardlength, 1 .. boardwidth of string (1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
proc generatehiddenboard (var hiddenboard : array 1 .. *, 1 .. * of string (1), boardlength, boardwidth : int)
    var temp : int := 0
    var counter : int := 0
    for i : 1 .. boardlength
	for k : 1 .. boardwidth
	    hiddenboard (i, k) := "b"
	end for
    end for

    loop
	temp := 0
	loop
	    temp += Rand.Int (1, 3)
	    exit when temp > boardwidth
	    hiddenboard (Rand.Int (1, boardlength), temp) := "m"
	end loop
	counter += 1
	exit when counter >= boardlength div 3
    end loop

    for i : 1 .. boardlength
	for k : 1 .. boardwidth
	    if
		    hiddenboard (i, k) = "b"
		    then
		hiddenboard (i, k) := checkadjacent (hiddenboard, i, k, boardlength, boardwidth)
	    end if
	end for
    end for
end generatehiddenboard

%generatehiddenboard (hiddenboard, boardlength, boardwidth)

%%%%%%%%%%%%%%%%%%%%%%%%%%
%unnecessary
% for i : 1 .. boardlength
%     for k : 1 .. boardwidth
%         put hiddenboard (i, k), " " ..
%     end for
%     put ""
% end for
%%%%%%%%%%%%%%%%%%%%%%%%%%%
