proc drawgrid (originX, originY, rowNum, columnNum, horizontalSize, verticalSize, clr : int)
    % var x : int := originX
    % var y : int := originY
    % var counter : int := 0
    % var counter2 : int := 0
    % var counter3 : int := 0
    % var counter4 : int := 0
    % loop
    %     exit when counter2 >= rowNum + 1
    %     counter2 := counter2 + 1
    %     counter := 0
    %     loop
    %         exit when counter >= columnNum
    %         counter := counter + 1
    %         Draw.Line (x, y, x + horizontalSize, y, clr)
    %         x := x + horizontalSize
    %     end loop
    %     y := y - verticalSize
    %     x := originX
    % end loop
    % x := originX
    % y := originY
    % loop
    %     exit when counter4 >= columnNum + 1
    %     counter4 := counter4 + 1
    %     counter3 := 0
    %     loop
    %         exit when counter3 >= rowNum
    %         counter3 := counter3 + 1
    %         Draw.Line (x, y, x, y - verticalSize, clr)
    %         y := y - verticalSize
    %     end loop
    %     x := x + horizontalSize
    %     y := originY
    % end loop
    var tempx : int
    var tempy : int
    for i : 1 .. boardwidth
	for j : 1 .. boardlength
	    tempx := originX + (i - 1) * horizontalSize
	    tempy := originY - (j) * verticalSize
	    Pic.ScreenLoad ("images/unclicked space.jpg", tempx, tempy, picCopy)
	end for
    end for
end drawgrid
