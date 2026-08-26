-- Uruchamiane raz po starcie Hyprlanda (odpowiednik exec-once)
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
end)
