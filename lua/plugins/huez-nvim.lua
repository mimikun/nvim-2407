---@type table
local opts = {
    path = vim.fs.normalize(vim.fn.stdpath("data")) .. "/huez",
    suppress_messages = true,
    exclude = require("plugins.configs.huez-nvim.exclude").exclude,
    theme_config_module = "plugins.configs.huez-nvim.themes",
}

---@type table
local cmds = {
    "Huez",
    "HuezEnsured",
    "HuezLive",
    "HuezFavorites",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec
