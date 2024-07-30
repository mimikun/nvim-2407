---@type table
local cmds = {
    "LspInstall",
    "LspUninstall",
}

---@type LazySpec[]
local dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "b0o/schemastore.nvim",
    "hrsh7th/cmp-nvim-lsp",
}

---@type LazySpec
local spec = {
    "williamboman/mason-lspconfig.nvim",
    --lazy = false,
    cmd = cmds,
    --event = "VeryLazy",
    config = function()
        local lspconfig = require("lspconfig")

        local lsp_handlers = {
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end,

            ["lua_ls"] = function()
                lspconfig.lua_ls.setup(require("plugins.configs.lspconfigs.lua-ls"))
            end,
            ["jsonls"] = function()
                --lspconfig.jsonls.setup(require("plugins.lsp.jsonls"))
            end,
            ["yamlls"] = function()
                --lspconfig.yamlls.setup(require("plugins.lsp.yamlls"))
            end,
        }
        require("mason-lspconfig").setup({
            ensure_installed = require("plugins.configs.lspconfigs.need_servers"),
            handlers = lsp_handlers,
        })
    end,
    --cond = false,
}

return spec
