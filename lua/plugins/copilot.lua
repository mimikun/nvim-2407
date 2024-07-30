-- TODO: fix it
---@type boolean
local cond = false

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    enabled = cond,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {},
    cond = cond,
}

return spec
