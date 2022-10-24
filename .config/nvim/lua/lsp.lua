require("nvim-lsp-installer").setup({
    automatic_installation = true,
    icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
    }
})


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--
--

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
vim.diagnostic.config({
        virtual_text = {
            severity = {vim.diagnostic.severity.WARN, vim.diagnostic.severity.ERROR},
        },
        signs = {
            severity = {vim.diagnostic.severity.WARN, vim.diagnostic.severity.ERROR},
        },
        underline = {
            severity = {vim.diagnostic.severity.WARN, vim.diagnostic.severity.ERROR},
        },
        severity_sort = true,
        update_in_insert = true
    }
)
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "lua",
        "comment",
        "markdown",
        "html",
        "bash",
        "bibtex",
        "css",
        "diff",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "latex",
        "markdown",
        "rst",
        "python",
        "toml",
        "vim",
        "vue",
        "yaml",
    },
    auto_install = false,
}


-- Make sure to use this new on_attach function when you setup
-- your language servers
--
local lspconfig = require'lspconfig'
--local servers = {"sumneko_lua", "pyright"}
--for _, server in pairs(servers) do
--    lspconfig[server].setup{
--        on_attach = on_attach,
--    }
--end

lspconfig.pyright.setup {
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                useLibraryCodeForTypes = true,
                autoSearchPaths = true
            }
        }
    },
    flags = {
        debounce_text_changes = 500,
    }
}

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim", "use"},
                disable = {"lowercase-global"}
            },
        },
    },
    flags = {
        debounce_text_changes = 500,
    }
})
