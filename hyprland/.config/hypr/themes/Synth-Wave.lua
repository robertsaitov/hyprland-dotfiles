
hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
})

hl.config({
    general = {
        gaps_in = 12,
        gaps_out = 18,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(03edf9ff)", "rgba(72f1b8ff)" }, angle = 45 },
            inactive_border = { colors = { "rgba(495495cc)", "rgba(614D85cc)" }, angle = 45 },
        },
        layout = "dwindle",
        resize_on_border = true,
    },
    group = {
        col = {
            border_active = { colors = { "rgba(03edf9ff)", "rgba(72f1b8ff)" }, angle = 45 },
            border_inactive = { colors = { "rgba(495495cc)", "rgba(614D85cc)" }, angle = 45 },
            border_locked_active = { colors = { "rgba(03edf9ff)", "rgba(72f1b8ff)" }, angle = 45 },
            border_locked_inactive = { colors = { "rgba(495495cc)", "rgba(614D85cc)" }, angle = 45 },
        },
    },
    decoration = {
        rounding = 2,
        shadow = {
            enabled = true,
            scale = 1,
            offset = "0 0",
            range = 12,
            render_power = 1,
            color = 0xffff7edb,
        },
        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
        },
    },
})

hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'BeautyLine'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Synth-Wave'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end)

