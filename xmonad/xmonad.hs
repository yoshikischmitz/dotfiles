import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Graphics.X11.ExtraTypes.XF86  
 
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc"

  xmonad $ defaultConfig 
        {
          manageHook = manageDocks <+> manageHook defaultConfig-- <+> (className =? "trayer" --> doIgnore)
          , layoutHook = avoidStruts $ layoutHook defaultConfig
          , logHook = dynamicLogWithPP $ xmobarPP
                              { ppOutput = hPutStrLn xmproc,
                                ppTitle = xmobarColor "green" "" . shorten 50
                              }
          , modMask = mod4Mask 
        } `additionalKeys`
        [   ((0, xF86XK_MonBrightnessUp), spawn "xbacklight +20")
          , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -20")
          , ((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 10%-")
          , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 10%+")
        ]
