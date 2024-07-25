---@type Huez.ThemeConfig
local M = {
    styles = { "moon", "day", "night", "storm" },
    set_theme = function(theme)
        ---@type tokyonight.Config
        local base_conf = {
            transparent = vim.g.transparent_enabled,
            terminal_colors = true,
        }

        require("tokyonight").setup(base_conf)
        vim.cmd("colorscheme " .. theme)
        return true
    end,
}
