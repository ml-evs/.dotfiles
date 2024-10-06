require("cyberdream").setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italics comments
    italic_comments = true,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = true,

    -- Modern borderless telescope theme - also applies to fzf-lua
    borderless_telescope = false,

    -- Set terminal colors used in `:terminal`
    terminal_colors = true,

    -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
    -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
    cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

    -- Disable or enable colorscheme extensions
    extensions = {
        telescope = true,
        notify = true,
        treesitter = true,
    },
})

vim.cmd("colorscheme cyberdream")
