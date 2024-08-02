---@type table
local cmds = {
    "BufferPrevious",
    "BufferNext",
    "BufferMovePrevious",
    "BufferMoveNext",
    "BufferGoto",
    "BufferLast",
    "BufferPin",
    "BufferClose",
    "BufferRestore",
    "BufferWipeout",
    "BufferCloseAllButCurrent",
    "BufferCloseAllButVisible",
    "BufferCloseAllButPinned",
    "BufferCloseAllButCurrentOrPinned",
    "BufferCloseBuffersLeft",
    "BufferCloseBuffersRight",
    "BufferPick",
    "BufferPickDelete",
    "BufferOrderByBufferNumber",
    "BufferOrderByName",
    "BufferOrderByDirectory",
    "BufferOrderByLanguage",
    "BufferOrderByWindowNumber",
    "BarbarEnable",
    "BarbarDisable",
}

---@type LazySpec[]
local keys = {
    --[[
--NOTE: commands and keymaps
The name of each command should be descriptive enough for you to use it. >vim
    " Move to previous/next
    nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
    nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

    " Re-order to previous/next
    nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
    nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

    " Goto buffer in position...
    nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
    nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
    nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
    nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
    nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
    nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
    nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
    nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
    nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
    nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

    " Pin/unpin buffer
    nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

    " Close buffer
    nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
    " Restore buffer
    nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

    " Wipeout buffer
    "                          :BufferWipeout
    " Close commands
    "                          :BufferCloseAllButCurrent
    "                          :BufferCloseAllButVisible
    "                          :BufferCloseAllButPinned
    "                          :BufferCloseAllButCurrentOrPinned
    "                          :BufferCloseBuffersLeft
    "                          :BufferCloseBuffersRight

    " Magic buffer-picking mode
    nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
    nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

    " Sort automatically by...
    nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
    nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
    nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
    nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
    nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

    " Other:
    " :BarbarEnable - enables barbar (enabled by default)
    " :BarbarDisable - very bad command, should never be used
]]
}

---@type LazySpec[]
local dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "romgrk/barbar.nvim",
    --lazy = false,
    cmd = cmds,
    --keys = "",
    event = "BufEnter",
    dependencies = dependencies,
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {},
    --cond = false,
    -- TODO: tabline plugin
    --enabled = false,
}

return spec
--[[
--NOTE: configs
`barbar`.setup({options})                                           *barbar.setup()*
  To configure barbar, you must call this `setup` function. The valid
  {options} are listed below.

  Lua example: >lua
    require'barbar'.setup {
      auto_hide = 1,
      clickable = false,
      icons = {current = {filetype = {enabled = false}}},
      maximum_padding = math.huge,
    }
<

  Vimscript example (see |:lua-heredoc| for more details): >vim
    lua << EOF
    require'barbar'.setup {
      auto_hide = 1,
      clickable = false,
      icons = {current = {filetype = {enabled = false}}},
      maximum_padding = math.huge,
    }
    EOF
<
                                                        *barbar-setup.animation*
animation ~
  `boolean`  (default: `true`)
  Enables animations if `true`.

                                                        *barbar-setup.auto_hide*
auto_hide ~
  `false|integer`  (default: `-1`)
  Automatically hide the 'tabline' when there are this many buffers left. Set
  to any value less than `0` to disable.

  For example: `auto_hide = 0` hides the 'tabline' when there would be zero
  buffers shown, `auto_hide  = 1` hides the 'tabline' when there would only be
  one, etc.

                                                        *barbar-setup.clickable*
clickable ~
  `boolean`  (default: `true`)
  If set, you can left-click on a tab to switch to that buffer, and
  middle-click to delete it.

                                                       *barbar-setup.exclude_ft*
exclude_ft ~
  `string[]`  (default: `{}`)
  Excludes filetypes from appearing in the tabs.

                                                     *barbar-setup.exclude_name*
exclude_name ~
  `string[]`  (default: `{}`)
  Excludes buffers matching name from appearing in the tabs.

                                                   *barbar-setup.focus_on_close*
focus_on_close ~
  `'left'|'previous'|'right'`  (default: `'left'`)
  The algorithm to use for getting the next buffer after closing the current
  one:

  - `'left'`: focus the buffer to the left of the current buffer.
  - `'previous'`: focus the previous buffer.
  - `'right'`: focus the buffer to the right of the current buffer.

                                                             *barbar-setup.hide*
hide ~
  Sets which elements are hidden in the bufferline. Possible options are:

                                                   *barbar-setup.hide.alternate*
  hide.alternate ~
    `boolean`  (default: `false`)
    Controls the visibility of the |alternate-file|.
    |barbar-setup.highlight_alternate| must be `true`.

                                                     *barbar-setup.hide.current*
  hide.current ~
    `boolean`  (default: `false`)
    Controls the visibility of the current buffer.

                                                  *barbar-setup.hide.extensions*
  hide.extensions ~
    `boolean`  (default: `false`)
    Controls the visibility of file extensions.

                                                    *barbar-setup.hide.inactive*
  hide.inactive ~
    `boolean`  (default: `false`)
    Controls visibility of |hidden-buffer|s and |inactive-buffer|s.

                                                     *barbar-setup.hide.visible*
  hide.visible ~
    `boolean`  (default: `false`)
    Controls visibility of |active-buffer|s.
    |barbar-setup.highlight_visible| must be `true`.

                                              *barbar-setup.highlight_alternate*
highlight_alternate ~
  `boolean`  (default: `false`)
  Enables highlighting of alternate buffers.

                                    *barbar-setup.highlight_inactive_file_icons*
highlight_inactive_file_icons ~
  `boolean`  (default: `false`)
  Enables highlighting the file icons of inactive buffers.

                                                *barbar-setup.highlight_visible*
highlight_visible ~
  `boolean`  (default: `true`)
  Enables highlighting of visible buffers.

                                                            *barbar-setup.icons*
icons ~
  `table`
  Controls the icons rendered on each tab. The base options are:

                                               *barbar-setup.icons.buffer_index*
  icons.buffer_index ~
    `boolean|'superscript'|'subscript'`  (default: `false`)
    if `true`, show the index of the buffer with respect to the ordering of
    the buffers in the tabline.

                                              *barbar-setup.icons.buffer_number*
  icons.buffer_number ~
    `boolean|'superscript'|'subscript'`  (default: `false`)
    If `true`, show the `bufnr` for the associated buffer.

                                                     *barbar-setup.icons.button*
  icons.button ~
    `false | string`  (default: `''`)
    The button which is clicked to close / save a buffer, or indicate that
    it is pinned. Use `false` to disable it.

                                                *barbar-setup.icons.diagnostics*
  icons.diagnostics ~
    `{[vim.diagnostic.severity]: table}`

                                        *barbar-setup.icons.diagnostics.enabled*
     icons.diagnostics.enabled ~
       `boolean`  (default: `false`)
       Enable showing diagnostics of this |diagnostic-severity| in the
       'tabline'.

                                           *barbar-setup.icons.diagnostics.icon*
     icons.diagnostics.icon ~
       `boolean`  (defaults: `' '`, `'󰌶 '`, `' '`, and `' '`)
       The icon which accompanies the number of diagnostics.

    Example that disables the error icon, but still shows the count: >lua
      require'barbar'.setup {icons = {diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ''},
      }}}
<
                                                   *barbar-setup.icons.gitsigns*
  icons.gitsigns ~
    `table`  (default: >lua
                    {
                      added = {enabled = false, icon = '+'},
                      changed = {enabled = false, icon = '~'},
                      deleted = {enabled = false, icon = '-'},
                    }
<           )

                                           *barbar-setup.icons.gitsigns.enabled*
    icons.gitsigns.enabled ~
      `boolean`  (default: `true`)
      Enables showing git changes of this type.
      Requires |gitsigns.nvim|.

                                              *barbar-setup.icons.gitsigns.icon*
    icons.gitsigns.icon ~
      `boolean`  (default: `'+'`, `'-'`, `'~'`)
       The icon which accompanies the number of git status.

    Example that disables the "added" icon, but still shows the count: >lua
      require'barbar'.setup {icons = {git = {
        added = {enabled = true, icon = ''},
      }}}
<
                                                   *barbar-setup.icons.filename*
  icons.filename ~
    `boolean`  (default: `true`)
    If `true`, show the name of the file.

                                     *barbar-setup.icons.filetype.custom_colors*
  icons.filetype.custom_colors ~
    `boolean`  (default: `false`)
    If `true`, the `Buffer<status>Icon` color will be used for icon colors.

                                           *barbar-setup.icons.filetype.enabled*
  icons.filetype.enabled ~
    `boolean`  (default: `true`)
    Filetype `true`, show the `devicons` for the associated buffer's
    `filetype`.

                                             *barbar-setup.icons.separator.left*
  icons.separator.left ~
    `string`  (default: `'▎'`)
    The left separator between buffers in the tabline.

                                            *barbar-setup.icons.separator.right*
  icons.separator.right ~
    `string`  (default: `''`)
    The right separator between buffers in the tabline.

  Example: >lua
    -- Show the file icon, a left separator, and ERROR/WARN diagnostics
    require'barbar'.setup {icons = {
      buffer_index = false,
      buffer_number = false,
      button = '',
      diagnostics = {{enabled = true}, {enabled = true}},
      filetype = {enabled = true},
      separator = {left = '▎'},
    }}
<

  You can also customize icons of 'modified' and pinned buffers:

                                           *barbar-setup.icons.separator_at_end*
  icons.separator_at_end ~
    `boolean`  (default: `true`)
    If true, add an additional separator at the end of the buffer list.
    Can be used to create a visual separation when the inactive buffer
    background color is the same as the fill region background color.

                                                   *barbar-setup.icons.modified*
  icons.modified ~
    `table`  (default: `{button = '●'}`)
    The icons which should be used for a 'modified' buffer.
    Supports all the base options (e.g. `buffer_index`, `filetype.enabled`,
    etc)

                                                     *barbar-setup.icons.pinned*
  icons.pinned ~
    `table`  (default: >lua
                    {
                      button = false,
                      filename = false,
                      separator = {right = ' '},
                    }
<           )
    The icons which should be used for a pinned buffer.
    Supports all the base options (e.g. `buffer_index`, `filetype.enabled`,
    etc)

  Example: >lua
    require'barbar'.setup {icons = {
      modified = {separator = '⋄'},
      pinned = {button = '', filename = true},
    }}
<

  You can also customize icons based on the visibility of a buffer:

                                                  *barbar-setup.icons.alternate*
  icons.alternate ~
    `table`
    The icons which should be used for the |alternate-file|.
    Supports all the base options (e.g. `buffer_index`, `filetype.enabled`,
    etc) as well as `modified` and `pinned`.

                                                    *barbar-setup.icons.current*
  icons.current ~
    `table`
    The icons which should be used for current buffer.
    Supports all the base options (e.g. `buffer_index`, `filetype.enabled`,
    etc) as well as `modified` and `pinned`.

                                                   *barbar-setup.icons.inactive*
  icons.inactive ~
    `table`  (default: `{separator = {left = '▎', right = ''}}`)
    The icons which should be used for |hidden-buffer|s and |inactive-buffer|s.
    Supports all the base options (e.g. `buffer_index`, `filetype.enabled`,
    etc) as well as `modified` and `pinned`.

                                                    *barbar-setup.icons.visible*
  icons.visible ~
    `table`
    The icons which should be used for |active-buffer|s.
    Supports all the base options (e.g. `buffer_index`, `filetype.enabled`,
    etc) as well as `modified` and `pinned`.

  Example: >lua
    -- Enable file icons for alternate buffers.
    -- Enable buffer indices for current buffers.
    -- Override the button for inactive buffers.
    -- Disable buffer numbers for visible, modified buffers.
    require'barbar'.setup {icons = {
      alternate = {filetype = {enabled = false}},
      current = {buffer_index = true},
      inactive = {button = '×'},
      visible = {modified = {buffer_number = false}},
    }}
<

                                                    *barbar-seutup.icons.preset*
  icons.preset ~
    `'default'|'powerline'|'slanted'`  (default: `'default'`)
    Base all |barbar-setup.icons| configuration off of this set of defaults.

    - `'default'`: the classic |barbar.nvim| look.
    - `'powerline'`: like <https://github.com/powerline/powerline>
    - `'slanted'`: like old Google Chrome tabs

                                                  *barbar-setup.insert_at_start*
insert_at_start ~
  `boolean`  (default: `false`)
  If `true`, new buffers appear at the start of the list. Default is to open
  after the current buffer.

  Has priority over |barbar-setup.insert_at_end|

                                                    *barbar-setup.insert_at_end*
insert_at_end ~
  `boolean`   (default: `false`)
  If `true`, new buffers appear at the end of the list. Default is to open
  after the current buffer.

                                                          *barbar-setup.letters*
letters ~
  `string`  (default: `'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'`)
  New buffer letters are assigned in this order.

  This order is optimal for the QWERTY keyboard layout but might need
  adjustment for other layouts.

                                                  *barbar-setup.maximum_padding*
maximum_padding ~
  `int`  (default: `4`)
  Sets the maximum padding width with which to surround each tab.

                                                   *barbar-setup.maximum_length*
maximum_length ~
  `int`  (default: 30)
  Sets the maximum buffer name length.

                                                   *barbar-setup.minimum_length*
minimum_length ~
  `int`  (default: 0)
  Sets the minimum buffer name length.

                                                  *barbar-setup.minimum_padding*
minimum_padding ~
  `int`  (default: `1`)
  Sets the minimum padding width with which to surround each tab.

                                                    *barbar-setup.no_name_title*
no_name_title ~
  `string`  (default: `nil`)
  Sets the name of unnamed buffers.

  By default format is `'[Buffer X]'` where `X` is the buffer number. However,
  only a static string is accepted here.

                                                 *barbar-setup.semantic_letters*
semantic_letters ~
  `boolean`  (default: `true`)
  If `true`, the letters for each buffer in buffer-pick mode will be
  assigned based on their name.

  Otherwise (or in case all letters are already assigned), the behavior is to
  assign letters in the order of provided to |barbar-setup.letters|.

                                                *barbar-setup.sidebar_filetypes*
sidebar_filetypes ~
  `{[string]: true|table}`  (default `{}`)
  Control which 'filetype's will cause barbar to add an offset.

                                          *barbar-setup.sidebar_filetypes.align*
  sidebar_filetypes.align ~
    `'left'|'center'|'right'`  (default: `'left'`)
    Aligns the |barbar-setup.sidebar_filetypes.text|.

                                          *barbar-setup.sidebar_filetypes.event*
  sidebar_filetypes.event ~
    `string`  (default: `'BufWinLeave'`)
    The |{event}| which is |autocmd-execute|d when the sidebar closes.

                                           *barbar-setup.sidebar_filetypes.text*
  sidebar_filetypes.text ~
    `string`  (default: `nil`)
    The text which will fill the offset.

  Example: >lua
    require'bufferline'.setup {sidebar_filetypes = {
      -- Use the default values: {event = 'BufWinLeave', text = nil}
      NvimTree = true,
      -- Or, specify the text used for the offset:
      undotree = {text = 'undotree'},
      -- Or, specify the event which the sidebar executes when leaving:
      ['neo-tree'] = {event = 'BufWipeout'},
      -- Or, specify both
      Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
    }}
<

                                                             *barbar-setup.sort*
sort ~
  Configures the `:BufferOrderBy*` commands.

                                                 *barbar-setup.sort.ignore_case*
  sort.ignore_case ~
    `boolean` (default `false`)
    If `true`, comparisons of names in buffer orderings will not take into
    account differences in case (e.g. 'a' will equal 'A').

                                                         *barbar-setup.tabpages*
tabpages ~
  `boolean`  (default: `true`)
  Enable/disable current/total tabpages indicator (top right corner).
]]
