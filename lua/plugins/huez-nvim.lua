---@type table
local opts = {
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

---@type table
local dependencies = {
    "folke/tokyonight.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    "marko-cerovac/material.nvim",
    "pauchiner/pastelnight.nvim",
    "loctvl842/monokai-pro.nvim",
    "projekt0n/github-nvim-theme",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    dependencies = dependencies,
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec
