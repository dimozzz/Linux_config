module Local.SpecialWindows where

import XMonad hiding ((|||))
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers
import XMonad.Util.NamedScratchpad 

import Local.Terminal

myManageHook = composeAll [
    className =? "MPlayer"                --> doFloat,
    className =? "Firefox"                --> doF (W.shift "Web"),
    isFullscreen                          --> doFullFloat
    ] <+> namedScratchpadManageHook myScratchPads
      <+> manageHook def
