---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    file_types = { "markdown", "vimwiki" },
    -- Set to avoid seeing warnings for conflicts in health check
    acknowledge_conflicts = false,
    anti_conceal = {
        -- This enables hiding any added text on the line the cursor is on
        -- This does have a performance penalty as we must listen to the 'CursorMoved' event
        enabled = true,
    },
    heading = {
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        signs = { "󰫎 " },
    },
    code = {
        above = "▄",
        below = "▀",
    },
    dash = {
        icon = "─",
    },
    bullet = {
        icons = { "●", "○", "◆", "◇" },
    },
    checkbox = {
        unchecked = {
            icon = "󰄱 ",
        },
        checked = {
            icon = "󰱒 ",
        },
        custom = {
            todo = {
                rendered = "󰥔 ",
            },
        },
    },
    quote = {
        icon = "▋",
        repeat_linebreak = false,
    },
    pipe_table = {
        alignment_indicator = "━",
        border = {
            "┌",
            "┬",
            "┐",
            "├",
            "┼",
            "┤",
            "└",
            "┴",
            "┘",
            "│",
            "─",
        },
    },
    callout = {
        note = { rendered = "󰋽 Note" },
        tip = { rendered = "󰌶 Tip" },
        important = { rendered = "󰅾 Important" },
        warning = { rendered = "󰀪 Warning" },
        caution = { rendered = "󰳦 Caution" },
        -- Obsidian: https://help.a.md/Editing+and+formatting/Callouts
        abstract = { rendered = "󰨸 Abstract" },
        todo = { rendered = "󰗡 Todo" },
        success = { rendered = "󰄬 Success" },
        question = { rendered = "󰘥 Question" },
        failure = { rendered = "󰅖 Failure" },
        danger = { rendered = "󱐌 Danger" },
        bug = { rendered = "󰨰 Bug" },
        example = { rendered = "󰉹 Example" },
        quote = { rendered = "󱆨 Quote" },
    },
    link = {
        image = "󰥶 ",
        hyperlink = "󰌹 ",
        custom = {
            web = {
                icon = "󰖟 ",
            },
        },
    },
}

---@type LazySpec
local spec = {
    "MeanderingProgrammer/render-markdown.nvim",
    --lazy = false,
    ft = { "markdown", "vimwiki" },
    cmd = "RenderMarkdown",
    event = "BufEnter",
    dependencies = dependencies,
    init = function()
        vim.treesitter.language.register("markdown", "vimwiki")
    end,
    opts = opts,
    --cond = false,
    -- TODO: markdown-render plugin
    enabled = false,
}

return spec
