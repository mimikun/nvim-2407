---@type LazyKeysSpec[]
local keys = {
    {
        -- TODO:
        --vim.cmd([[cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>" ] ])
    },
}

---@type LazySpec
local spec = {
    "rhysd/migemo-search.vim",
    --lazy = false,
    keys = keys,
    config = function()
        return true
    end,
    cond = false,
    --- enabled check
    --- 1. if there are no human rights
    --- 2. and if executable cmigemo command
    ---@return boolean
    enabled = function()
        local is_not_human_rights = not require("config.global").is_human_rights
        local has_cmigemo = (1 == vim.fn.executable("cmigemo")) and true or false
        --return is_not_human_rights and has_cmigemo
        return false
    end,
}

return spec
