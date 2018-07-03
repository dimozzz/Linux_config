module Local.Colors where

import XMonad hiding ((|||))

import XMonad.Layout.Tabbed

 
myDeco = def {
    activeColor         = "orange",
    inactiveColor       = "#222222",
    urgentColor         = "yellow",
    activeBorderColor   = "orange",
    inactiveBorderColor = "#222222",
    urgentBorderColor   = "yellow",
    activeTextColor     = "orange",
    inactiveTextColor   = "#222222",
    urgentTextColor     = "yellow",
    decoHeight          = 10
}
 
-- tab theme
myTab = def {
    activeColor         = "black",
    inactiveColor       = "black",
    urgentColor         = "yellow",
    activeBorderColor   = "orange",
    inactiveBorderColor = "#222222",
    urgentBorderColor   = "black",
    activeTextColor     = "orange",
    inactiveTextColor   = "#222222",
    urgentTextColor     = "yellow"
}