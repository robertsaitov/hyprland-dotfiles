--█▀▀ █░█ █▀█ █▀ █▀█ █▀█
--█▄▄ █▄█ █▀▄ ▄█ █▄█ █▀▄

--env = XCURSOR_THEME,Bibata-Modern-Ice
--env = XCURSOR_SIZE,20


--█▀▀ █▀█ █▄░█ ▀█▀
--█▀░ █▄█ █░▀█ ░█░

--█▀ █▀█ █▀▀ █▀▀ █ ▄▀█ █░░
--▄█ █▀▀ ██▄ █▄▄ █ █▀█ █▄▄

hl.config({
    decoration = {
        dim_special = 0.3,
        blur = {
            special = true,
        },
    },
})

hl.on("config.reloaded", function()
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Cantarell 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting 'full'")
end)

