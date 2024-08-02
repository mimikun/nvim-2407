---@type table
local opts = {
    transparent = vim.g.transparent_enabled,
    glow = false,
}

---@type LazySpec
local spec = {
    "aliqyan-21/darkvoid.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
    enabled = false,
}

return spec
