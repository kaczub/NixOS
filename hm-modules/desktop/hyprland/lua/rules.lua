-- 1. Smart Gaps (brak ramek i odstępów, gdy na pulpicie jest tylko 1 okno)
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0, rounding = 0 })

-- 2. Trwałe pulpity (1-5 zawsze widoczne na pasku)
for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end

-- 3. Okna pływające dla narzędzi i okien dialogowych
hl.window_rule({ match = { modal = true }, float = true, center = true })
hl.window_rule({ match = { class = "blueman-manager" }, float = true, center = true })
hl.window_rule({ match = { class = "pavucontrol" }, float = true, center = true })
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, float = true, center = true, size = { 900, 600 } })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true, center = true })

-- 4. Przypisywanie aplikacji do pulpitów
hl.window_rule({ match = { class = "^firefox$" }, workspace = "1" })
hl.window_rule({ match = { class = "^discord$" }, workspace = "4" })
hl.window_rule({ match = { class = "^Spotify$" }, workspace = "5" })

-- 5. Zapobieganie wygaszaniu ekranu w trybie pełnoekranowym (odtwarzanie wideo/prezentacje)
hl.window_rule({ match = { fullscreen = true }, idle_inhibit = "fullscreen" })