%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Demos how to implement a button and a process
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% displays a intro banner
process displayBanner

    var x := maxrow div 2
    var y := maxcol div 2


    loop
	locate (x, y)
	color (black)
	put "Welcome to Minesweeper!" ..
	delay (100)
	% locate (x, y)
	% color (white)
	% put "Welcome to Minesweeper!" ..
	% delay (100)
	exit when isIntroWindowOpen = false
    end loop


end displayBanner

% main procedure to handle the intro window
procedure displayIntroWindow

    % flag that intro screen is open - global var isIntroWindowOpen
    isIntroWindowOpen := true
    % Open the window
    var winID : int
    winID := Window.Open ("position:top;center,graphics:600;400,title:Introduction Window")


    fork displayBanner


    % create a button
    var quitIntroWindowButton := GUI.CreateButton (maxx - 100, 25, 0, "Close", QuitIntroWindowButtonPressed)

    % Window will continue until quit button is pressed
    loop
	exit when GUI.ProcessEvent or isIntroWindowOpen = false
    end loop
    % release the button
    GUI.Dispose (quitIntroWindowButton)
    %close/release the window
    Window.Close (winID)




end displayIntroWindow

procedure titlescreen    
Draw.FillBox(0,0,maxx,maxy,black)
    var font1 : int
    font1 := Font.New ("QuickType:60")
    assert font1 > 0
    var x := 20
    var y := maxy div 2
    Font.Draw ("Welcome to Minesweeper!", x, y, font1, red)
    Font.Free (font1)
end titlescreen
