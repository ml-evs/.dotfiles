require("mason").setup {
    ui = {
        icons = {
            package_instsalled = "✓",
        }
    }
}
require("mason-lspconfig").setup {
}


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
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
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
    auto_install = true,
    highlight = {
        enable = true,
    }
}


local lspconfig = require'lspconfig'

lspconfig.tsserver.setup {
    on_attach = on_attach,
}

lspconfig.vuels.setup {
    on_attach = on_attach,
}

lspconfig.cssls.setup {
    on_attach = on_attach,
}

lspconfig.yamlls.setup {
    on_attach = on_attach,
}

lspconfig.bashls.setup {
    on_attach = on_attach,
}

lspconfig.jsonls.setup {
    on_attach = on_attach,
}

local ruff_on_attach = function(client, bufnr)
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
end

lspconfig.ruff_lsp.setup {
    on_attach = ruff_on_attach,
}

lspconfig.html.setup {
    on_attach = on_attach,
}

vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}

lspconfig.jinja_lsp.setup {
    on_attach = on_attach,
}


lspconfig.marksman.setup {
    on_attach = on_attach,
}

lspconfig.taplo.setup {
    on_attach = on_attach,
}


lspconfig.pyright.setup {
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
            }
        }
    },
    flags = {
        debounce_text_changes = 500,
    }
}

lspconfig.ansiblels.setup {
  on_attach = on_attach,
  ansible = {
    ansible = {
      path = "ansible"
    },
    executionEnvironment = {
      enabled = false
    },
    python = {
      interpreterPath = "python"
    },
    validation = {
      enabled = true,
      lint = {
        enabled = true,
        path = "ansible-lint"
      }
    }
  }
}

lspconfig.lua_ls.setup({
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
