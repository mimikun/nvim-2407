-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {
    styles = { "moon", "day", "night", "storm" },
}

function M.set_theme(theme)
    print("tokyonight.nvim setting")

    ---@type tokyonight.Config
    local opts = {
        transparent = vim.g.transparent_enabled,
    }

    require("tokyonight").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
