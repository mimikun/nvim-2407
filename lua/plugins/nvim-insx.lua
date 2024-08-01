---@type LazySpec
local spec = {
    "hrsh7th/nvim-insx",
    --lazy = false,
    event = "InsertEnter",
    config = function()
        require("insx.preset.standard").setup({})
    end,
    --cond = false,
    -- TODO: autopair plugin
    enabled = false,
}

return spec
