---@type table
local key_opts = {
    noremap = true,
    silent = true,
    --expr = true,
}

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>,",
        function()
            vim.cmd("BufferPrevious")
        end,
        mode = "n",
        key_opts,
        desc = "Move to previous",
    },
    {
        "<leader>.",
        function()
            vim.cmd("BufferNext")
        end,
        mode = "n",
        key_opts,
        desc = "Move to next",
    },
    {
        "<leader><",
        function()
            vim.cmd("BufferMovePrevious")
        end,
        mode = "n",
        key_opts,
        desc = "Re-order to previous",
    },
    {
        "<leader>>",
        function()
            vim.cmd("BufferMoveNext")
        end,
        mode = "n",
        key_opts,
        desc = "Re-order to next",
    },
    -- TODO: it

    -- Goto buffer in position...
    --nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
    --nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
    --nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
    --nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
    --nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
    --nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
    --nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
    --nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
    --nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
    --nnoremap <silent>    <A-$> <Cmd>BufferLast<CR>

    -- Pin/unpin buffer
    --nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

    -- Close buffer
    --nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
    -- Restore buffer
    --nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

    -- Magic buffer-picking mode
    --nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
    -- Magic buffer-picking mode
    --nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

    -- Sort automatically by BufferNumber
    --nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
    -- Sort automatically by Name
    --nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
    -- Sort automatically by Directory
    --nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
    -- Sort automatically by Language
    --nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
    -- Sort automatically by WindowNumber
    --nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
    {
        "<leader>",
        function()
            vim.cmd("")
        end,
        mode = "n",
        key_opts,
        desc = "",
    },
}

return keys
