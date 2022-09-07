module Local.Prompt where

import XMonad.Prompt


--mySP = def {
--    bgColor           = "black",
--    fgColor           = "white",
--    bgHLight          = "gray",
--    fgHLight          = "black",
--   borderColor       = "orange",
--    promptBorderWidth = 1,
--    position          = Bottom,
--    height            = 20,
--    historySize       = 1000
--}


mySP = def {
   height            = 30,
   font              = "xft:dejavu sans mono:size=12",
   bgColor           = "#002b36",
   fgColor           = "#93a1a1",
   fgHLight          = "#d33682",
   bgHLight          = "#073642",
   borderColor       = "#053542",
   promptBorderWidth = 5,
   maxComplRows      = Just 12,
   alwaysHighlight   = True,
   promptKeymap      = emacsLikeXPKeymap
}
