module Local.Startup where

import XMonad hiding ((|||))
import XMonad.Hooks.SetWMName


myStartupHook :: X ()
myStartupHook = do
    setWMName "LG3D"
    spawn "feh --bg-scale ~/trash/pics/wallpaper/lofotenskie-ostrova-norvegiya.jpg &"
    spawn "emacs --daemon &"
    refresh
