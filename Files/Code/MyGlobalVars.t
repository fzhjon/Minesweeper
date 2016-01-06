%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer:
%Date:
%Course:  ICS3CU1
%Teacher:
%Program Name:
%Descriptions:  Final Program Name Here and a brief description of the game
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   MyGlobalVars.t
%   All global variables are coded in this file.
%   These will have FILE scope.
%   These must be document thoroughly - Descriptive name,
%   where used and for what purpose
var x, y, btnNumber, btnUpDown, buttons : int
var isIntroWindowOpen : boolean % Flag for Introduction Window state open or closed
var isFontWindowOpen : boolean
var isInstructionWindowOpen : boolean
var isGameWindowOpen : boolean
var isGameOver : boolean
var returnToMain : boolean
var isGameWon : boolean
var easy : boolean
var medium : boolean
var hard : boolean
var originX : int := 350
var originY : int := 550
var horizontalSize : int := 30
var verticalSize : int := 30
var clr : int := black
var row : int := 0
var column : int := 0
var timepassed : int

proc setInitialGameValues

    isGameWindowOpen := false
    isInstructionWindowOpen := false
    isIntroWindowOpen := false
    isFontWindowOpen := false
    isGameOver := false
    returnToMain := false
    isGameWon := false
    easy := true
    medium := false
    hard := false

end setInitialGameValues

var boardlength : int := 10 %parameters for hidden board (default diff. is easy)
var boardwidth : int := 10
%%%%%%%%%%%%%%%%%%%%%%%%
var easyboard : array 1 .. 10, 1 .. 10 of string (1) %array for hidden board
var mediumboard : array 1 .. 15, 1 .. 15 of string (1)
var hardboard : array 1 .. 20, 1 .. 20 of string (1)
%"b" = blank
%"m" = mine
%"#" = number
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var easyboardvisible : array 1 .. 10, 1 .. 10 of string (1) %array for visible board
var mediumboardvisible : array 1 .. 15, 1 .. 15 of string (1)
var hardboardvisible : array 1 .. 20, 1 .. 20 of string (1)
%"u" = unrevealed
%"f" = flag
%"b" = blank
%"m" = mine
%"#" = number
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
