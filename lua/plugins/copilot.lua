-- TODO: fix it
---@type boolean
local cond = false

---@type table
local opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
}

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    enabled = cond,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = opts,
    cond = cond,
}

return spec
