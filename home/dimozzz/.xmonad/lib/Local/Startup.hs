module Local.Startup where

import XMonad hiding ((|||))
import XMonad.Hooks.SetWMName


myStartupHook :: X ()
myStartupHook = do
    setWMName "LG3D"
    spawn "feh --bg-scale ~/work/wp.jpg &"
    spawn "emacs --daemon &"
    spawn "fcitx5 &"
    refresh
