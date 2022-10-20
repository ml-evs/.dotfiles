-- stylua: ignore
local colors = {
  blue   = '#65B2FF',
  cyan   = '#63F2F1',
  black  = '#100E23',
  white  = '#CBE3E7',
  red    = '#F02E6E',
  violet = '#A37ACC',
  grey   = '#2D2B40',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black }, b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
}

local lsp_info = {
  function()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " ",
  color = { fg = "#56B6C2" },
}


local config = {
  options = {
    theme = bubbles_theme,
    icons_enabled = true,
    component_separators = '|',
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {
        {'filename', file_status = true},
        {'branch'},
        {'diff', symbols = { added = " ", modified = " ", removed = " " }},
    },
    lualine_c = {},
    lualine_x = {
        lsp_info, {'diagnostics', sources = {'nvim_lsp'}, always_visible = true},
    },
    lualine_y = {
        {'filetype', icons_enabled = true},
        {'filesize'},
        {'progress'},
    },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {'quickfix', 'nerdtree', 'fugitive'},
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

ins_left({
    'lsp_progress',
    separators = {
        component = ' ',
        progress = ' | ',
        message = { pre = '(', post = ')' },
        percentage = { pre = '', post = '%% ' },
        title = { pre = '', post = ': ' },
        lsp_client_name = { pre = '[', post = ']' },
        spinner = { pre = '', post = '' },
        message = { commenced = 'In Progress', completed = 'Completed' },
    },
    display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
    timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 10000 },
    spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
})

require('lualine').setup(config)
