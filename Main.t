%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Jon Fu
%Date:    January 2014
%Course:  ICS3CU1
%Teacher:  D. Gillespie or M. Ianni
%Program Name:
%Descriptions:  Minesweeper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% files/code folder
include "files/code/includes.t"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% procedure to set all initial global variable with file scope
% even if already set (located in MyGlobalVars.t)
var winID : int
winID := Window.Open ("position:top;center,graphics:1000;800,title:Minesweeper")
%fork playmusic
Mouse.ButtonChoose ("multibutton")
loop
    setInitialGameValues
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %  ********  M A I N   P R O G R A M   S T E P S ********
    % *********************   Main Variable Declarations Here
    % var winID : int
    % winID := Window.Open ("position:top;center,graphics:1000;800,title:Minesweeper")

    cls
    %A. Display title screen
    titlescreen
    %B. Prompt user for instructions - if they want to read them, display them on the screen
    displayinstructions
    playgame
    %C. Allow user to select a difficulty (easy 10x10, medium 15x15, or hard 20x20)
    showdifficulty    
    loop
	Mouse.ButtonWait ("down", x, y, btnNumber, btnUpDown)
	if btnNumber = 1
		then
	    choosedifficulty (x, y)
	    instructionbutton (x, y)
	    gamestarttrue (x, y)
	    exit when isGameWindowOpen = true
	end if
    end loop
    %D. Create the hidden board to generate the mines and numbers randomly, then display a blank board
    %to the user (board2)
    gamestart
    %a. Allow the user to select a tile on the screen using their mouse (right click or left click)
    loop
	x := 0
	y := 0
	btnNumber := 0
	btnUpDown := 0
	%i. Left click reveals the hidden grid space that was selected and all spaces around it

	%if it was a "blank" (if it was a mine, the game is over). Nothing will happen if the

	%grid space is already revealed.
	Mouse.ButtonWait ("down", x, y, btnNumber, btnUpDown)
	if btnNumber = 1
		then
	    if easy = true and isGameOver = false
		    then
		revealspace (x, y, easyboardvisible, easyboard)
	    elsif medium = true and isGameOver = false
		    then
		revealspace (x, y, mediumboardvisible, mediumboard)
	    elsif hard = true and isGameOver = false
		    then
		revealspace (x, y, hardboardvisible, hardboard)
	    end if
	    if x >= 790 and x <= 950 and y >= 20 and y <= 60
		    then
		restart
	    end if
	    if x >= 50 and x <= 180 and y >= 0 and y <= 60
		    then
		mainmenu
	    end if
	end if
	%ii. Right click places a flag on the grid space selected if it is not already

	%revealed. If it is already revealed, nothing will happen.

	if btnNumber = 3 and isGameOver = false
		then
	    if easy = true
		    then
		plantflag (x, y, easyboardvisible)
	    elsif medium = true
		    then
		plantflag (x, y, mediumboardvisible)
	    elsif hard = true
		    then
		plantflag (x, y, hardboardvisible)
	    end if
	end if
	exit when isGameOver = true and returnToMain = true
	%b. Check to see if all the spaces that do not contain mines are revealed. If they are, the

	%player has won the game.
	if easy = true and isGameOver = false
		then
	    checkwin (easyboardvisible, easyboard)
	elsif medium = true and isGameOver = false
		then
	    checkwin (mediumboardvisible, mediumboard)
	elsif hard = true and isGameOver = false
		then
	    checkwin (hardboardvisible, hardboard)
	end if

	%c. Return to step a. until the game is over (either by winning or losing)

	%d. If the player loses, all mine spaces will be revealed to them after telling them the game is

	%over

	%e. Allow the player to either return to the beginning (step A.) or replay another round in the

	%same difficulty (step D.)
    end loop

end loop
