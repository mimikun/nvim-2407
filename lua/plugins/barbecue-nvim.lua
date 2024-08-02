---@type LazySpec[]
local dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    lazy = false,
    --ft = "",
    --cmd = "CMDNAME",
    --keys = "",
    --event = "VeryLazy",
    dependencies = dependencies,
    --init = function()
    --    INIT
    --end,
    opts = {},
    --cond = false,
    enabled = false,
}

return spec
