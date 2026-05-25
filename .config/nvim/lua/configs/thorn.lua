require("thorn").setup({
    -- Enable transparent background
    transparent = true,
    terminal = true,

    styles = {
        keywords = { italic = false, bold = true },
        comments = { italic = true, bold = false },
        strings = { italic = false, bold = false },
        diagnostic = {
                underline = true, -- if true, flat underlines will be used. Otherwise, undercurls will be used
                -- true will apply the bg highlight, false applies the fg highlight
                error = { highlight = false, },
                hint  = { highlight = false, },
                info  = { highlight = false, },
                warn  = { highlight = false, },
        },
    }, 
})

vim.cmd("colorscheme thorn")
