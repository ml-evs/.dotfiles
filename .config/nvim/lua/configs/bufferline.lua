vim.opt.termguicolors = true
require('bufferline').setup({
    options = {
        numbers = "buffer_id",
        indicator = {icon = "▎", style = "icon"},
        buffer_close_icon = "",
        close_icon = "",
        diagnostics = "nvim_lsp",
        color_icons = true, --[[  | false, -- whether or not to add the filetype icon highlights ]]
        show_buffer_icons = true, --[[  | false, -- disable filetype icons for buffers ]]
        show_buffer_close_icons = false, --[[ true | false, ]]
        show_buffer_default_icon = true, --[[  | false, -- whether or not an unrecognised filetype should show a default icon ]]
        show_close_icon = false, --[[  | false, ]]
        show_tab_indicators = true, --[[  | false, ]]
        show_duplicate_prefix = true, --[[  | false, -- whether to show duplicate buffer prefix ]]
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin", --[[  "slant" | "thick" | "thin" | { "any", "any" }, ]]
        enforce_regular_tabs = false, --[[  | true, ]]
        always_show_bufferline = true, --[[   | false, ]]
        -- hover = {
    }
})

