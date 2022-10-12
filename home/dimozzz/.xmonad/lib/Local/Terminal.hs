module Local.Terminal where

import qualified XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad

myTerminal :: String
myTerminal = "urxvt -sh 15"

myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm ]
                where
                spawnTerm  = myTerminal ++ " -name scratchpad"
                findTerm   = title =? "scratchpad"
                manageTerm = customFloating $ W.RationalRect l t w h
                    where
                    h = 0.3
                    w = 1
                    t = 0
                    l = 0