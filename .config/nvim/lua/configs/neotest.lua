local mason_path = vim.fn.stdpath("data") .. "/mason/"
require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")

require('dap-python').test_runner = 'pytest'

require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      console = "integratedTerminal",
      runner = "pytest",
    }),
  },
})

vim.api.nvim_set_keymap("n", "tt", "<cmd>lua require('neotest').run.run()<cr>" , { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>" , { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tT", "<cmd>lua require('neotest').run.run({file = vim.fn.expand('%:p')})<cr>" , { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tD", "<cmd>lua require('neotest').run.run({file = vim.fn.expand('%:p'), strategy = 'dap'})<cr>" , { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "tS", "<cmd>lua require('neotest').run.run({suite = true})<cr>" , { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "ts", "<cmd>lua require('neotest').summary.open({enter = true})<cr>" , { noremap = true, silent = true })
