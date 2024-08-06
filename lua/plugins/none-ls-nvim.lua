---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    --lazy = false,
    --event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    --cond = false,
    -- TODO: null-ls replace plugin `pattern 2`
    --enabled = false,
}

return spec
