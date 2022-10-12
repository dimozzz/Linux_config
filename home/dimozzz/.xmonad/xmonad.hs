import XMonad hiding ((|||))
import Data.Ratio ((%))

 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicHooks
import XMonad.Hooks.UrgencyHook
 
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Grid
import XMonad.Layout.Circle
import XMonad.Layout.PerWorkspace
import XMonad.Layout.LayoutCombinators
 
import System.IO


import XMonad.Util.Run(spawnPipe)

import Local.Startup
import Local.Terminal
import Local.Keys
import Local.Colors
import Local.SpecialWindows


main = do
    top <- spawnPipe "xmobar ~/.xmobar/xmobarUp"
    down <- spawnPipe "xmobar ~/.xmobar/xmobarDown"

    xmonad $ docks $ ewmh $ ewmhFullscreen $ def {
        terminal           = myTerminal    ,
        borderWidth        = 2,
        normalBorderColor  = "black",
        focusedBorderColor = "orange",
        focusFollowsMouse  = True,
        modMask            = mod4Mask,
        keys               = myKeys,
--        handleEventHook    = fullscreenEventHook, 
        mouseBindings      = myMouseBindings,
        layoutHook         = myLayout,
        workspaces         = myWorkspaces,
        manageHook         = myManageHook,
        startupHook        = myStartupHook,
        logHook            = myLogHook down
    }

myLayout = avoidStruts $ smartBorders $ toggleLayouts Full tiled
    where
        tiled   = ResizableTall nmaster delta ratio []
        nmaster = 1
        delta   = 2/100
        ratio   = 1/2



myLogHook bar = dynamicLogWithPP xmobarPP {
    ppOutput = hPutStrLn bar
}


myNamedWorkSpaces = ["Web","Message","Music","8","9"]
myWorkspaces = map show [1..4] ++ myNamedWorkSpaces