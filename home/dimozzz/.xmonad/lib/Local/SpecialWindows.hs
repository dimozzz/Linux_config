module Local.SpecialWindows where

import XMonad hiding ((|||))
import qualified XMonad.StackSet as W

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Util.Scratchpad 


myManageHook = composeAll [
    className =? "MPlayer"                --> doFloat,
    className =? "Firefox"                --> doF (W.shift "Web"),
    isFullscreen                          --> doFullFloat,
    manageDocks
    ] <+> scratchpadManageHook (W.RationalRect 0 0 1 0.3)
      <+> manageDocks
      <+> manageHook def
