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
          manageHook = manageDocks <+> manageHook defaultConfig
          , layoutHook = avoidStruts $ layoutHook defaultConfig
          , logHook = dynamicLogWithPP $ xmobarPP
                              { ppOutput = hPutStrLn xmproc,
                                ppTitle = xmobarColor "green" "" . shorten 50
                              }
          , modMask = mod4Mask 
        } `additionalKeys`
        [   ((mod4Mask, xF86XK_MonBrightnessUp), spawn "xbacklight +20")
          , ((mod4Mask, xF86XK_MonBrightnessDown), spawn "xbacklight -20")
        ]
