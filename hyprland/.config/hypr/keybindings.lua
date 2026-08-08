-- █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
-- █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more
-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

-- Main modifier

local mainMod = "SUPER" -- windows key
local scrPath = "~/.config/hypr/scripts"

-- assign apps
local term = "kitty"
local editor = "nvim"
local file = "nautilus"
local browser = "firefox"

local function closeActiveWindow()
    local window = hl.get_active_window()
    if window ~= nil and window.class == "Steam" then
        hl.exec_cmd("xdotool windowunmap $(xdotool getactivewindow)")
    else
        hl.dispatch(hl.dsp.window.close())
    end
end

local function togglePin()
    local window = hl.get_active_window()
    if window == nil then
        return
    end

    local wasFloating = window.floating
    local wasPinned = window.pinned

    if not wasFloating and not wasPinned then
        hl.dispatch(hl.dsp.window.float({ action = "set" }))
    end

    hl.dispatch(hl.dsp.window.pin({ action = "toggle" }))

    if wasFloating and wasPinned then
        hl.dispatch(hl.dsp.window.float({ action = "unset" }))
    end
end

-- Window/Session actions
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/refresh.sh"))
hl.bind(mainMod .. " + Q", closeActiveWindow)
hl.bind("ALT + F4", closeActiveWindow)
hl.bind(mainMod .. " + delete", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + F", togglePin)
hl.bind(mainMod .. " + backspace", hl.dsp.exec_cmd("~/.config/hypr/scripts/logoutlaunch.sh 1"))
hl.bind("CTRL + ESCAPE", hl.dsp.exec_cmd("killall waybar || waybar"))

-- Application shortcuts
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(term))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("handy --toggle-transcription"))
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("~/.config/hypr/scripts/sysmonlaunch.sh"))

-- Rofi is toggled on/off if you repeat the key presses
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/rofilaunch.sh d"))
hl.bind(mainMod .. " + tab", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/rofilaunch.sh w"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/rofilaunch.sh f"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/lofimusic.sh"))

-- Audio control
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
-- bindl  = , F10, exec, ~/.config/hypr/scripts/volumecontrol.sh -o m # toggle audio mute
-- bindel = , F11, exec, ~/.config/hypr/scripts/volumecontrol.sh -o d # decrease volume
-- bindel = , F12, exec, ~/.config/hypr/scripts/volumecontrol.sh -o i # increase volume
-- bindl  = , XF86AudioMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -o m # toggle audio mute
-- bindl  = , XF86AudioMicMute, exec, ~/.config/hypr/scripts/volumecontrol.sh -i m # toggle microphone mute
-- bindel = , XF86AudioLowerVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o d # decrease volume
-- bindel = , XF86AudioRaiseVolume, exec, ~/.config/hypr/scripts/volumecontrol.sh -o i # increase volume
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Brightness control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightnesscontrol.sh i"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightnesscontrol.sh d"), { locked = true, repeating = true })

-- Screenshot/Screencapture
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh"))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh sf"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh m"))

-- Exec custom scripts
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/gamemode.sh"))
hl.bind(mainMod .. " + ALT + right", hl.dsp.exec_cmd("~/.config/hypr/scripts/swwwallpaper.sh -n"))
hl.bind(mainMod .. " + ALT + left", hl.dsp.exec_cmd("~/.config/hypr/scripts/swwwallpaper.sh -p"))
hl.bind(mainMod .. " + ALT + up", hl.dsp.exec_cmd("~/.config/hypr/scripts/wbarconfgen.sh n"))
hl.bind(mainMod .. " + ALT + down", hl.dsp.exec_cmd("~/.config/hypr/scripts/wbarconfgen.sh p"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallbashtoggle.sh"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/themeselect.sh"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/rofiselect.sh"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/swwwallselect.sh"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/cliphist.sh c"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("~/.config/hypr/scripts/keyboardswitch.sh"), { locked = true, repeating = true })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind("ALT + Tab", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Switch workspaces relative to the active workspace with mainMod + CTRL + [←→]
hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "r-1" }))

-- move to the first empty workspace instantly with mainMod + CTRL + [↓]
hl.bind(mainMod .. " + CTRL + down", hl.dsp.focus({ workspace = "empty" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + CTRL + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + CTRL + left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + CTRL + up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + CTRL + down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Move active window to a relative workspace with mainMod + CTRL + ALT + [←→]
hl.bind(mainMod .. " + CTRL + ALT + right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + ALT + left", hl.dsp.window.move({ workspace = "r-1" }))

-- Move active window around current workspace with mainMod + SHIFT + CTRL [←→↑↓]
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/Resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Special workspaces (scratchpad)
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(""))

-- Toggle Layout
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move window silently to workspace Super + Alt + [0-9]
hl.bind(mainMod .. " + ALT + 1", hl.dsp.window.move({ workspace = 1, follow = false }))
hl.bind(mainMod .. " + ALT + 2", hl.dsp.window.move({ workspace = 2, follow = false }))
hl.bind(mainMod .. " + ALT + 3", hl.dsp.window.move({ workspace = 3, follow = false }))
hl.bind(mainMod .. " + ALT + 4", hl.dsp.window.move({ workspace = 4, follow = false }))
hl.bind(mainMod .. " + ALT + 5", hl.dsp.window.move({ workspace = 5, follow = false }))
hl.bind(mainMod .. " + ALT + 6", hl.dsp.window.move({ workspace = 6, follow = false }))
hl.bind(mainMod .. " + ALT + 7", hl.dsp.window.move({ workspace = 7, follow = false }))
hl.bind(mainMod .. " + ALT + 8", hl.dsp.window.move({ workspace = 8, follow = false }))
hl.bind(mainMod .. " + ALT + 9", hl.dsp.window.move({ workspace = 9, follow = false }))
hl.bind(mainMod .. " + ALT + 0", hl.dsp.window.move({ workspace = 10, follow = false }))

-- Trigger when the switch is turning off, Might cause bugs. Recommend to use logind instead.
--bindl= , switch:on:Lid Switch, exec, hyprlock && systemctl suspend
