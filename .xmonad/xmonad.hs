import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.EwmhDesktops

import XMonad.Util.WorkspaceCompare
import XMonad.Util.Run

import XMonad.Layout.Spacing

import System.IO

main :: IO ()
main = do
    xmproc0 <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc"
    xmproc1 <- spawnPipe "xmobar -x 1 ~/.config/xmobar/xmobarrc"
    xmproc2 <- spawnPipe "xmobar -x 2 ~/.config/xmobar/xmobarrc"
    spawn "picom --config ~/.config/picom/picom.conf"
    xmonad $ ewmhFullscreen $ ewmh $ docks def
        { manageHook = manageDocks <+> manageHook def
        , terminal   = "kitty"
        , layoutHook = avoidStruts $ spacingWithEdge 5 $ layoutHook def
        , logHook = dynamicLogWithPP $ myXmobarPP xmproc0 xmproc1 xmproc2
        , modMask = mod4Mask
        , workspaces = myWorkspaces
        }
      `removeKeysP`
        [ ("M-p")
        ]
      `additionalKeysP`
        [ ("M-d", spawn "dmenu_run -i")
        , ("M-f", spawn "firefox")
        , ("M-o", spawn "obsidian")
        , ("M-S-l", spawn "dm-tool lock")
        , ("<XF86MonBrightnessUp>"   , spawn "brightnessctl s +5 au_bl0mdgp")    
        , ("<XF86MonBrightnessDown>" , spawn "brightnessctl s 5- au_bl0mdgp")    
        , ("<XF86AudioLowerVolume>"  , spawn "zsh -c '/home/brandon/scripts/volume_control.sh -d 10'")
        , ("<XF86AudioRaiseVolume>"  , spawn "zsh -c '/home/brandon/scripts/volume_control.sh -i 10'")
        , ("<XF86AudioMute>"         , spawn "pamixer --toggle-mute")
        ]

myWorkspaces :: [String]
myWorkspaces = ["\xea85", "\xf0239", "3", "4", "5", "6", "7", "8", "9"]

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , isDialog            --> doFloat
    ]

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myXmobarPP :: Handle -> Handle -> Handle -> PP
myXmobarPP xmproc0 xmproc1 xmproc2 = def
    { ppSep             = white " "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, _, _, wins] -> [ws, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    , ppOutput = \x -> hPutStrLn xmproc0 x >> hPutStrLn xmproc1 x >> hPutStrLn xmproc2 x
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "{") (lowWhite "}") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
