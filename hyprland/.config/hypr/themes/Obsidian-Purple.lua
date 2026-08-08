
hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(814DDEff)", "rgba(372952ff)" }, angle = 45 },
            inactive_border = { colors = { "rgba(05010Cff)", "rgba(16023Cff)" }, angle = 45 },
        },
        layout = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active = { colors = { "rgba(814DDEff)", "rgba(372952ff)" }, angle = 45 },
            border_inactive = { colors = { "rgba(05010Ccc)", "rgba(16023Ccc)" }, angle = 45 },
            border_locked_active = { colors = { "rgba(FFFFFFff)", "rgba(C7CAC2ff)" }, angle = 45 },
            border_locked_inactive = { colors = { "rgba(FFFFFFcc)", "rgba(FFFFFFcc)" }, angle = 45 },
        },
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 5,
            passes = 5,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
        },
        shadow = {
            enabled = true,
        },
    },
})

hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-dracula'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Obsidian-Purple'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 18")
end)

