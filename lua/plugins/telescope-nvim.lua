---@type boolean
local is_windows = require("config.global").is_windows

---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "danielfalk/smart-open.nvim",
    "ghassan0/telescope-glyph.nvim",
    "xiyaowong/telescope-emoji.nvim",
    "tsakirist/telescope-lazy.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "vuki656/package-info.nvim",
    "tiagovla/scope.nvim",
    "nvim-lua/popup.nvim",
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "epwalsh/pomo.nvim",
    "GianniBYoung/chezmoi-telescope.nvim",
    "roycrippen4/telescope-treesitter-info.nvim",
    "illia-shkroba/telescope-completion.nvim",
    "cljoly/telescope-repo.nvim",
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not is_windows then
    table.insert(dependencies, {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    })
    table.insert(dependencies, {
        "dharmx/telescope-media.nvim",
    })
end

---@type LazySpec
local spec = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    --lazy = false,
    --keys = keys,
    dependencies = dependencies,
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            extensions = require("plugins.configs.telescope-nvim.extensions"),
        })

        -- Load some extensions

        -- NOTE: Add fzf_sorter if not a Windows
        -- Very difficult to build fzf on Windows
        if not is_windows then
            telescope.load_extension("fzf")
            telescope.load_extension("media")
        end
        telescope.load_extension("frecency")
        telescope.load_extension("smart_open")
        telescope.load_extension("glyph")
        telescope.load_extension("emoji")
        telescope.load_extension("lazy")
        telescope.load_extension("file_browser")
        telescope.load_extension("egrepify")
        telescope.load_extension("package_info")
        telescope.load_extension("scope")
        telescope.load_extension("zoxide")
        telescope.load_extension("undo")
        telescope.load_extension("pomodori")
        telescope.load_extension("chezmoi")
        telescope.load_extension("treesitter_info")
        telescope.load_extension("completion")
        telescope.load_extension("repo")
    end,
    --cond = false,
}

return spec
