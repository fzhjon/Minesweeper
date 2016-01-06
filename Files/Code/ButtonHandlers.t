% Button File - code to handle button events
% Intro Window Procedures
procedure QuitIntroWindowButtonPressed
    isIntroWindowOpen := false
    GUI.Quit
    GUI.ResetQuit
end QuitIntroWindowButtonPressed


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
procedure QuitFontWindowPressed
    isFontWindowOpen := false
    GUI.Quit
    GUI.ResetQuit
end QuitFontWindowPressed

procedure QuitInstructionWindowPressed
    isInstructionWindowOpen := false
    GUI.Quit
    GUI.ResetQuit
end QuitInstructionWindowPressed
