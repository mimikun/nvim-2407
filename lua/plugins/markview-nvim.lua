---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "OXY2DEV/markview.nvim",
    lazy = false,
    --ft = "markdown",
    cmd = "Markview",
    event = "BufEnter",
    dependencies = dependencies,
    config = function()
        require("markview").setup({
            headings = require("markview.presets").headings.glow_labels,
        })
    end,
    --cond = false,
    -- TODO: markdown-render plugin
    enabled = false,
}

return spec
