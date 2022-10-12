module Local.Prompt where

import XMonad.Prompt

mySP = def {
   height            = 40,
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
