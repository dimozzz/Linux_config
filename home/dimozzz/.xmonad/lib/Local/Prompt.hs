module Local.Prompt where

import XMonad.Prompt


mySP = def {
    bgColor           = "black",
    fgColor           = "white",
    bgHLight          = "gray",
    fgHLight          = "black",
    borderColor       = "orange",
    promptBorderWidth = 1,
    position          = Bottom,
    height            = 20,
    historySize       = 1000
}
