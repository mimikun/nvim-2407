-- README
local readme = {}

--- Get plugins markdown-link
---@return table
local get_plugins = function()
    local plugins = {}
    local it = vim.iter(require("lazy").plugins())

    it:map(function(plugin)
        local name = plugin.name
        local url = string.gsub(plugin.url, ".git$", "")
        local md_link = string.format("- [%s](%s)", name, url)
        --print(md_link)
        table.insert(plugins, md_link)
    end)
    return plugins
end

-- OUTPUT
local metadata = table.concat(tmp, "\n")

local file_path = string.format("%s/README-generated.md", vim.fn.stdpath("config"))
local fd = assert(vim.uv.fs_open(file_path, "w", 438))
assert(vim.uv.fs_write(fd, metadata))
assert(vim.uv.fs_close(fd))

--[[
---Get lsp servers
---@return table
local lsp_servers = function()
    local lspconfig = require("lspconfig")
    local servers = lspconfig.util.available_servers()

    table.sort(servers)

    return servers
end

---Get the installed treesitter parsers by nvim-treesitter
---@return table
local treesitter_parsers = function()
    local ts = require("nvim-treesitter.configs")
    local parsers = ts.get_ensure_installed_parsers()

    table.sort(parsers)

    return parsers
end

---Get the installed lsp servers and tools by mason.nvim
---@return table
local mason_tools = function()
    local mason = require("mason")

    local install_dir = string.format("%s/bin", vim.env.MASON)

    if vim.fn.isdirectory(install_dir) == 0 then
        return {}
    end

    local files
    files = vim.split(vim.fn.globpath(install_dir, "*"), "\n", {})
    files = vim.tbl_map(function(file)
        return vim.fn.fnamemodify(file, ":t")
    end, files)

    table.sort(files)

    return files
end

table.insert(readme, "# My neovim configuration")
table.insert(readme, "")
table.insert(readme, "## Plugins")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, table.concat(plugin_full_list(), "\n"))
table.insert(readme, "")
table.insert(readme, "### Denops Plugins")
table.insert(readme, "")
table.insert(readme, "Disable when [human rights] are violated.")
table.insert(readme, "[denops.vim] needs [human rights].")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "### Vim Script Plugins")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "#### Colorscheme")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "### Lua Plugins")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "#### Colorscheme")
table.insert(readme, "")
table.insert(readme, "手動で配置してください")
table.insert(readme, "")
table.insert(readme, "## nvim-treesitter parsers")
table.insert(readme, "")
table.insert(readme, "## Mason managed tools")
table.insert(readme, "")
table.insert(readme, "## LSP servers")
table.insert(readme, "")
-- reference links
table.insert(readme, "[human rights]:https://github.com/mimikun/dotfiles/blob/master/docs/GLOSSARY.md#human-rights")
]]
