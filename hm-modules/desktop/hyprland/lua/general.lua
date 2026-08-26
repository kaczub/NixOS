local colors = require("lua.colors")

hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("easeOutQuint", {
  type = "bezier",
  points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("easeInOutCubic", {
  type = "bezier",
  points = { { 0.65, 0.05 }, { 0.36, 1 } },
})

hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 4,
  bezier = "easeOutQuint",
})

hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 4,
  bezier = "easeOutQuint",
  style = "popin 80%",
})

hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 3,
  bezier = "easeInOutCubic",
  style = "popin 80%",
})

hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuint",
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 4,
  bezier = "easeInOutCubic",
  style = "fade",
})

hl.config({
  general = {
    gaps_in = 6,
    gaps_out = 12,
    border_size = 1,
    layout = "dwindle",
    ["col.active_border"] = "rgb(" .. colors.base0D .. ")",
    ["col.inactive_border"] = "rgb(" .. colors.base03 .. ")",
  },

  decoration = {
    rounding = 8,
    active_opacity = 0.95,
    inactive_opacity = 0.85,

    blur = {
      enabled = true,
      size = 5,
      passes = 2,
    },

    shadow = {
      enabled = true,
      color = "rgba(" .. colors.base00 .. "99)",
      range = 15,
      render_power = 3,
    },
  },

  dwindle = {
    pseudotile = true,
    preserve_split = true,
  },
})