module Local.SpecialWindows where

import XMonad hiding ((|||))
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Scratchpad 


myManageHook = composeAll [
    className =? "MPlayer"                --> doFloat,
    className =? "Firefox"                --> doF (W.shift "Web"),
    isFullscreen                          --> doFullFloat
    ] <+> scratchpadManageHook (W.RationalRect 0 0 1 0.3)
      <+> manageHook def
