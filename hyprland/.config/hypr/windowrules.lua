-- █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
-- ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█

-- Example windowrule v1
-- windowrule = float, ^(kitty)$
-- Example named windowrule
-- windowrule {
--   name = my-rule
--   match:class = ^(kitty)$
--   match:title = ^(kitty)$
--   float = on
-- }
-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more

-- Steam rules

hl.window_rule({
    match = {
        class = "^steam_app\\d+$",
    },
    fullscreen = true,
})

hl.window_rule({
    match = {
        class = "^steam_app_\\d+$",
    },
    monitor = "2",
    workspace = "9",
})

hl.workspace_rule({
    workspace = "9",
    no_border = true,
    no_rounding = true,
})

-- Opacity rules
hl.window_rule({
    match = {
        class = "^(firefox)$",
    },
    opacity = "0.90 0.90",
})

hl.window_rule({
    match = {
        class = "^(Steam)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(steam)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(steamwebhelper)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(Spotify)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(Code)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(code-url-handler)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(org.kde.dolphin)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(org.kde.ark)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(nwg-look)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(qt5ct)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(qt6ct)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(kvantummanager)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(com.github.rafostar.Clapper)$",
    },
    opacity = "0.90 0.90",
})

hl.window_rule({
    match = {
        class = "^(com.github.tchx84.Flatseal)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(hu.kramo.Cartridges)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(com.obsproject.Studio)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(gnome-boxes)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(discord)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(WebCord)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(ArmCord)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(app.drey.Warp)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(net.davidotek.pupgui2)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(yad)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(Signal)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(io.github.alainm23.planify)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(io.gitlab.theevilskeleton.Upscaler)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(com.github.unrud.VideoDownloader)$",
    },
    opacity = "0.80 0.80",
})

hl.window_rule({
    match = {
        class = "^(pavucontrol)$",
    },
    opacity = "0.80 0.70",
})

hl.window_rule({
    match = {
        class = "^(blueman-manager)$",
    },
    opacity = "0.80 0.70",
})

hl.window_rule({
    match = {
        class = "^(nm-applet)$",
    },
    opacity = "0.80 0.70",
})

hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$",
    },
    opacity = "0.80 0.70",
})

hl.window_rule({
    match = {
        class = "^(org.kde.polkit-kde-authentication-agent-1)$",
    },
    opacity = "0.80 0.70",
})

-- Float rules
hl.window_rule({
    match = {
        class = "^(kitty)$",
    },
    opacity = "1 1",
})

hl.window_rule({
    match = {
        title = "^(Picture-in-Picture)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(firefox)$",
        title = "^(Library)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(vlc)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(kvantummanager)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(qt5ct)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(qt6ct)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(nwg-look)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(org.kde.ark)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(Signal)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(com.github.rafostar.Clapper)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(app.drey.Warp)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(net.davidotek.pupgui2)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(yad)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(eog)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(io.github.alainm23.planify)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(io.gitlab.theevilskeleton.Upscaler)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(com.github.unrud.VideoDownloader)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(pavucontrol)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(blueman-manager)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(nm-applet)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(nm-connection-editor)$",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "^(org.kde.polkit-kde-authentication-agent-1)$",
    },
    float = true,
})
