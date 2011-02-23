import XMonad hiding ( (|||) )
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import Data.Ratio ((%))
 
import XMonad.Actions.CycleWS
import XMonad.Actions.FlexibleResize as Flex
 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicHooks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.SetWMName
 
import XMonad.Layout.LayoutHints
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.PerWorkspace
import XMonad.Layout.LayoutCombinators
 
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.Shell
import XMonad.Prompt.Window
import System.IO.UTF8

import XMonad.Util.Scratchpad 

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
 
    -- terminals
    [ ((modMask, xK_Home), spawn $ XMonad.terminal conf)
    , ((modMask, xK_Down), scratchpadSpawnAction conf)
 
    -- shell/window prompts
    , ((modMask, xK_space), shellPrompt mySP)
    , ((modMask .|. controlMask, xK_space), windowPromptGoto mySP)
 
    , ((modMask, xK_b), spawn "firefox")
    , ((0, xK_Print), spawn "scrot -e 'mv $f ~'")
 
    -- cycle through workspaces
    , ((modMask .|. controlMask, xK_Right ), moveTo Next (WSIs (return $ not . (=="SP") . W.tag)))
    , ((modMask .|. controlMask, xK_Left),   moveTo Prev (WSIs (return $ not . (=="SP") . W.tag)))
    , ((modMask .|. controlMask, xK_Up),     moveTo Next EmptyWS)
    , ((modMask .|. controlMask, xK_Down),   moveTo Prev EmptyWS)
     
    -- move windows through workspaces
    , ((modMask .|. shiftMask, xK_Right ), shiftTo Next (WSIs (return $ not . (=="SP") . W.tag)))
    , ((modMask .|. shiftMask, xK_Left  ), shiftTo Prev (WSIs (return $ not . (=="SP") . W.tag)))
 
 
    -- Move focus to the next/previous window
    , ((mod1Mask, xK_Tab), windows W.focusDown)
    , ((mod1Mask .|. shiftMask, xK_Tab), windows W.focusUp)
 
 
    -- Shrink/Expand the master area
    , ((modMask, xK_x), sendMessage Shrink)
    , ((modMask, xK_z), sendMessage Expand)
    -- Swap the focused window and the master window
    , ((modMask, xK_a), windows W.swapMaster)
 
 
    -- Resize viewed windows to the correct size
    , ((modMask, xK_n), refresh)
    -- Reset layout of current workspace
    , ((modMask .|. shiftMask, xK_n), setLayout $ XMonad.layoutHook conf)
    
    -- Push window back into tiling
    , ((modMask, xK_s), withFocused $ windows . W.sink)
 
 
    -- toggle focused window fullscreen
    , ((modMask, xK_m), sendMessage (Toggle "Full"))
 
    -- toggle the status bar gap
    , ((modMask, xK_f), sendMessage ToggleStruts)
 
    -- close focused window
    , ((mod1Mask, xK_F4), kill)
	
    -- Volume control
    , ((controlMask .|. shiftMask, xK_Left), spawn "amixer sset Master 2-")
    , ((controlMask .|. shiftMask, xK_Right), spawn "amixer sset Master 2+")
    , ((controlMask .|. shiftMask, xK_Up), spawn "mpc seek +5")
    , ((controlMask .|. shiftMask, xK_Down), spawn "mpc seek -5")
    , ((controlMask .|. shiftMask, xK_space), spawn "mpc toggle")

    ]
 


    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [ ((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)] ]
 

myNamedWorkSpaces = ["Web","Pidgin! (Achtung)","Mail","Idea","Arena"]
myWorkspaces = map show [1..4] ++ myNamedWorkSpaces
 
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, button1), (\w -> focus w >> mouseMoveWindow w))
    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2), (\w -> focus w >> windows W.swapMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3), (\w -> focus w >> Flex.mouseResizeWindow w)) ]
 
-- decoration theme
myDeco = defaultTheme
    { activeColor         = "orange"
    , inactiveColor       = "#222222"
    , urgentColor         = "yellow"
    , activeBorderColor   = "orange"
    , inactiveBorderColor = "#222222"
    , urgentBorderColor   = "yellow"
    , activeTextColor     = "orange"
    , inactiveTextColor   = "#222222"
    , urgentTextColor     = "yellow"
    , decoHeight          = 10 }
 
-- tab theme
myTab = defaultTheme
    { activeColor         = "black"
    , inactiveColor       = "black"
    , urgentColor         = "yellow"
    , activeBorderColor   = "orange"
    , inactiveBorderColor = "#222222"
    , urgentBorderColor   = "black"
    , activeTextColor     = "orange"
    , inactiveTextColor   = "#222222"
    , urgentTextColor     = "yellow" }
 
-- shell prompt theme
mySP = defaultXPConfig
    { bgColor           = "black"
    , fgColor           = "white"
    , bgHLight          = "gray"
    , fgHLight          = "black"
    , borderColor       = "orange"
    , promptBorderWidth = 1
    , position          = Bottom
    , height            = 20
    --, autoComplete      = Just 1000
    , historySize       = 1000 }
 
-- dynamicLog theme (suppress everything but layout)
myPP = defaultPP
    { ppLayout  = (\ x -> case x of
      "Hinted ResizableTall"        -> "[|]"
      "Mirror Hinted ResizableTall" -> "[-]"
      "Hinted Tabbed Simplest"      -> "[T]"
      "Full"                 -> "[ ]"
      _                      -> x )
    , ppCurrent         = const ""
    , ppVisible         = const ""
    , ppHidden          = const ""
    , ppHiddenNoWindows = const ""
    , ppUrgent          = const ""
    , ppTitle           = const ""
    , ppWsSep           = ""
    , ppSep             = "" }
 
 
-- layouts
myLayoutDefault = avoidStruts $ smartBorders $ toggleLayouts (noBorders Full)
    (smartBorders (tiled ||| Mirror tiled ||| layoutHints (tabbed shrinkText myTab)))
    where
        tiled   = layoutHints $ ResizableTall nmaster delta ratio []
        nmaster = 1
        delta   = 2/100
        ratio   = 1/2

myLIm = avoidStruts (withIM (1%4) (ClassName "Pidgin" `And` Role "buddy_list") (Grid ||| Full))
--avoidStruts (withIM (1%4) (ClassName "Pidgin" `And` Role "buddy_list") Grid)

myLayout = onWorkspace "Pidgin! (Achtung)" myLIm $
           myLayoutDefault



-- special windows
myManageHook = composeAll
    [ className =? "MPlayer"                --> doFloat
    , className =? "Namoroka"              --> doF (W.shift "Web")
    , className =? "Pidgin"                 --> doF (W.shift "Pidgin! (Achtung)")
    , className =? "Claws-mail"             --> doF (W.shift "Mail")
    , className =? "java-lang-Thread"       --> doF (W.shift "Idea")
    , className =? "com-sun-javaws-Main" --> doF (W.shift "Arena")
    , isFullscreen                          --> doFullFloat
    , manageDocks
    --, scratchpadManageHook scratchpad
    ] <+> scratchpadManageHook (W.RationalRect 0 0 1 0.3)
      <+> manageHook defaultConfig 

myLogHook = dynamicLogWithPP xmobarPP

myStartupHook :: X ()
myStartupHook = do
    setWMName "LG3D"
    spawn "xxkb"
    spawn "feh --bg-scale ~/pictures1/oboi.jpg &"
    spawn "claws-mail &"
    spawn "pidgin &"
    spawn "firefox &"
    refresh

main = do

    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig {
	terminal           = "urxvt -tr -tint black -sh 20"
        , borderWidth        = 2
        , normalBorderColor  = "black"
        , focusedBorderColor = "orange"
        , focusFollowsMouse  = True
        , modMask            = mod4Mask
        , keys               = myKeys
        , mouseBindings      = myMouseBindings
        , layoutHook         = myLayout
        , handleEventHook    = ewmhDesktopsEventHook
		, workspaces         = myWorkspaces
        , manageHook         = myManageHook
		, startupHook        = myStartupHook
		, logHook            = myLogHook

    }
