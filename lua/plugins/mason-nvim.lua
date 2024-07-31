local global = require("config.global")

---@type table
local cmds = {
    -- mason.nvim
    "Mason",
    "MasonUpdate",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    -- mason-lspconfig
    "LspInstall",
    "LspUninstall",
    -- mason-nvim-dap
    "DapInstall",
    "DapUninstall",
}

---@type LazySpec[]
local dependencies = {
    -- LSP plugins
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    -- DAP plugins
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    -- Linter plugins
    "mfussenegger/nvim-lint",
    "rshkarin/mason-nvim-lint",
    -- Formatter plugins
    "stevearc/conform.nvim",
    "zapling/mason-conform.nvim",
    -- Other deps
    "folke/lazydev.nvim",
    "Bilal2453/luvit-meta",
    "justinsgithub/wezterm-types",
    "b0o/schemastore.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "zapling/mason-lock.nvim",
    "folke/neoconf.nvim",
    "b0o/schemastore.nvim",
}

---@type table
local opts = {
    max_concurrent_installers = global.is_human_rights and 4 or 1,
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
        width = 0.88,
        height = 0.8,
        icons = {
            package_installed = "󰗠",
            package_pending = "󰊠",
            package_uninstalled = "󰅙",
        },
    },
    log_level = vim.log.levels.DEBUG,
}

---@type LazySpec
local spec = {
    "williamboman/mason.nvim",
    --lazy = false,
    cmd = cmds,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_nvim_dap = require("mason-nvim-dap")

        require("neoconf").setup({})
        require("mason").setup(opts)

        -- LSP
        mason_lspconfig.setup({
            --ensure_installed = require("plugins.configs.lspconfigs.need_servers"),
            -- TODO: test only, remove it
            ensure_installed = { "lua_ls", "rust_analyzer" },
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                })
            end,
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup(require("plugins.configs.lspconfigs.lua-ls"))
            end,
            ["jsonls"] = function()
                lspconfig.jsonls.setup(require("plugins.configs.lspconfigs.jsonls"))
            end,
            ["yamlls"] = function()
                lspconfig.yamlls.setup(require("plugins.configs.lspconfigs.yamlls"))
            end,
        })

        lspconfig.lua_ls.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.yamlls.setup({})

        -- DAP
        mason_nvim_dap.setup({
            --ensure_installed = require("plugins.configs.nvim-dap.need_adapters"),
            -- TODO: test only, remove it
            ensure_installed = { "python" },
            handlers = {
                function(config)
                    mason_nvim_dap.default_setup(config)
                end,
            },
        })

        -- Linter
        require("mason-nvim-lint").setup({
            --ensure_installed = require("plugins.configs.nvim-lint.need_linters"),
            -- TODO: test only, remove it
            ensure_installed = { "selene" },
            automatic_installation = false,
        })

        -- Formatter
        require("mason-conform").setup({
            --ignore_install = require("plugins.configs.conform-nvim.ignore_formatters"),
            -- TODO: test only, remove it
            ignore_install = { "prettier" },
        })

        -- Utils
        require("mason-lock").setup({
            lockfile_path = global.mason_lockfile,
        })
    end,
    --cond = false,
}

return spec
