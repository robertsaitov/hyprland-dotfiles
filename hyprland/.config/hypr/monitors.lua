-- █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█ █▀
-- █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄ ▄█

-- Set your monitor configuration here
-- See https://wiki.hyprland.org/Configuring/Monitors/

-- Main 2k monitor, positioned to the left of the Dell.
-- Match by EDID description because dock/MST connector names change after resume.


hl.monitor({
    output = "desc:Shenzhen KTC Technology Group H24T7 0x00000001",
    mode = "2560x1440@120",
    position = "-2560x0",
    scale = "1",
    bitdepth = 10,
    -- cm = "hdr",
    -- sdrbrightness = 3,
    vrr = 1,
})

hl.monitor({
    output = "desc:Dell Inc. DELL U2419HC 42FFX13",
    mode = "1920x1080@60",
    position = "0x0",
    scale = "1",
})

hl.workspace_rule({
    workspace = "1",
    monitor = "desc:Shenzhen KTC Technology Group H24T7 0x00000001",
    default = true,
})

hl.workspace_rule({
    workspace = "2",
    monitor = "desc:Dell Inc. DELL U2419HC 42FFX13",
    default = true,
})

hl.workspace_rule({
    workspace = "10",
    monitor = "HDMI-A-2",
    default = true,
})

-- Fallback for any other monitor (e.g., when main monitor is not connected)
-- This will apply to any monitor that is not explicitly configured above.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})
