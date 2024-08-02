---@type LazySpec
local spec = {
    "lukas-reineke/virt-column.nvim",
    --lazy = false,
    event = "BufEnter",
    opts = {},
    --cond = false,
    -- TODO: colorcolumn plugin
    enabled = false,
}

return spec

--[[
==============================================================================
 2. FUNCTIONS                                          *virt-column.functions*
 
setup({config})                                          *virt-column.setup()*

 Initializes and configures virt-column

 Optionally, the first parameter can be a configuration table.
 All values that are not passed in the table are set to the default value.
 List values get merged with the default list value.

 `setup` is idempotent, meaning you can call it multiple times, and each call
 will reset virt-column. If you want to only update the current
 configuration, use |virt-column.update()|.

 Parameters: ~
   • {config}  (|virt-column.config|?) Configuration table

 Example: ~
   >lua
   require "virt-column".setup()


update({config})                                        *virt-column.update()*

 Updates the virt-column configuration

 The first parameter is a configuration table.
 All values that are not passed in the table are kept as they are.
 List values get merged with the current list value.

 Parameters: ~
   • {config}  (|virt-column.config|) Configuration table

 Example: ~
   >lua
   require "virt-column".update { enabled = false }
<

overwrite({config})                                  *virt-column.overwrite()*

 Overwrites the virt-column configuration

 The first parameter is a configuration table.
 All values that are not passed in the table are kept as they are.
 All values that are passed overwrite existing and default values.

 Parameters: ~
   • {config}  (|virt-column.config|) Configuration table

 Example: ~
   >lua
   require "virt-column".overwrite {
     exclude = { filetypes = {} }
   }
<

setup_buffer({bufnr}, {config})                   *virt-column.setup_buffer()*

 Configures virt-column for one buffer

 All values that are not passed are cleared, and will fall back to
 the global config.
 List values get merged with the global config values.

 Parameters: ~
   • {bufnr}   (number) Buffer number (0 for current buffer)
   • {config}  (|virt-column.config|?) Configuration table

==============================================================================
 3. TYPES                                                  *virt-column.types*

config                                                    *virt-column.config*

 Configuration table for virt-column.

 Fields: ~
                                                  *virt-column.config.enabled*
   • {enabled}     (boolean)
                   Enables or disables virt-column

                   Default: `true` ~

                                                     *virt-column.config.char*
   • {char}        (string|string[])
                   Character, or list of characters, that get used to
                   display the virtual column
                   Each character has to have a display width of 0 or 1

                   Default: `┃` ~

                                               *virt-column.config.virtcolumn*
   • {virtcolumn}  (string)
                   comma-separated list of screen columns
                   same syntax as |'colorcolumn'|

                   Default: empty ~

                                                *virt-column.config.highlight*
   • {highlight}   (string|string[])
                   Highlight group, or list of highlight groups, that
                   get applied to the virtual column

                   Default: |hl-NonText| ~

   • {exclude}     (|virt-column.config.exclude|)
                   Configures what is excluded from virt-column

 Example: ~
   >lua
   {
       char = "|" ,
       virtcolumn = "+1,120"
   }
<

config.exclude                                    *virt-column.config.exclude*

 Configures what is excluded from virt-column

 Fields: ~
                                        *virt-column.config.exclude.filetypes*
   • {filetypes}  (string[])
                  List of |'filetype'|s for which virt-column is disabled

                  Default: ~
                    • `lspinfo`
                    • `packer`
                    • `checkhealth`
                    • `help`
                    • `man`
                    • `gitcommit`
                    • `TelescopePrompt`
                    • `TelescopeResults`

                                         *virt-column.config.exclude.buftypes*
   • {buftypes}  (string[])
                  List of |'buftype'|s for which virt-column is disabled

                  Default: ~
                    • `terminal`
                    • `nofile`
                    • `quickfix`
                    • `prompt`

 Example: ~
   >lua
   {
       filetypes = { "rust" },
       buftype = { "terminal" },
   }
<
]]
