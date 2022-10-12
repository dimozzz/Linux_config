module Local.Keys where

import XMonad hiding ((|||))
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Hooks.ManageDocks

import XMonad.Actions.CycleWS
import XMonad.Actions.FlexibleResize as Flex

import XMonad.Layout.ToggleLayouts

import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.Shell
import XMonad.Prompt.Window

import XMonad.Util.NamedScratchpad 
import XMonad.Util.Run(spawnPipe)

import Local.Terminal
import Local.Prompt



myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $ [
    ((modMask, xK_Home), spawn $ XMonad.terminal conf),
    ((modMask, xK_Down), namedScratchpadAction myScratchPads "terminal"),
 
    -- shell/window prompts
    ((modMask, xK_space), shellPrompt mySP),
    ((modMask .|. controlMask, xK_space), windowPrompt mySP Goto allWindows),
 
    ((modMask, xK_b), spawn "uzbl-tabbed"),
    ((0, xK_Print), spawn "scrot -e 'mv $f ~'"),
 
    -- cycle through workspaces
    ((modMask .|. controlMask, xK_Right ), moveTo Next (WSIs (return $ not . (=="SP") . W.tag))),
    ((modMask .|. controlMask, xK_Left),   moveTo Prev (WSIs (return $ not . (=="SP") . W.tag))),
    ((modMask .|. controlMask, xK_Up),     moveTo Next emptyWS),
    ((modMask .|. controlMask, xK_Down),   moveTo Prev emptyWS),
     
    -- move windows through workspaces
    ((modMask .|. shiftMask, xK_Right ), shiftTo Next (WSIs (return $ not . (=="SP") . W.tag))),
    ((modMask .|. shiftMask, xK_Left  ), shiftTo Prev (WSIs (return $ not . (=="SP") . W.tag))),
 
 
    -- Move focus to the next/previous window
    ((mod1Mask, xK_Tab), windows W.focusDown),
    ((mod1Mask .|. shiftMask, xK_Tab), windows W.focusUp),
 
 
    -- Shrink/Expand the master area
    ((modMask, xK_x), sendMessage Shrink),
    ((modMask, xK_z), sendMessage Expand),
    -- Swap the focused window and the master window
    ((modMask, xK_a), windows W.swapMaster),
 
 
    -- Resize viewed windows to the correct size
    ((modMask, xK_n), refresh),
    -- Reset layout of current workspace
    ((modMask .|. shiftMask, xK_n), setLayout $ XMonad.layoutHook conf),
    
    -- Push window back into tiling
    ((modMask, xK_s), withFocused $ windows . W.sink),
 
 
    -- toggle focused window fullscreen
    ((modMask, xK_m), sendMessage (Toggle "Full")),
    ((modMask, xK_c), sendMessage (Toggle "Circle")),
 
    -- toggle the status bar gap
    ((modMask, xK_f), sendMessage ToggleStruts),
 
    -- close focused window
    ((mod1Mask, xK_F4), kill),
    
    -- Volume control
    ((controlMask .|. shiftMask, xK_Left), spawn "amixer -D pulse sset Master 2%-"),
    ((controlMask .|. shiftMask, xK_Right), spawn "amixer -D pulse sset Master 2%+"),
    ((controlMask .|. shiftMask, xK_Up), spawn "mpc seek +5"),
    ((controlMask .|. shiftMask, xK_Down), spawn "mpc seek -5"),
    ((controlMask .|. shiftMask, xK_space), spawn "mpc toggle")
    ] ++ [
    
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    ((m .|. modMask, k), windows $ f i) |
    (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9],
    (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]


myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $ [
    ((modMask, button1), (\w -> focus w >> mouseMoveWindow w)),
    ((modMask, button2), (\w -> focus w >> windows W.swapMaster)),
    ((modMask, button3), (\w -> focus w >> Flex.mouseResizeWindow w))
    ]
