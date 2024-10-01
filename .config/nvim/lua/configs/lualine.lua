-- stylua: ignore
local function get_py_venv()
	local segment = ""
	if os.getenv("VIRTUAL_ENV") ~= nil then
		segment = string.format("%s", io.popen("basename $VIRTUAL_ENV"):read("*a"))
	elseif os.getenv("PIPENV_ACTIVE") == "1" then
		segment = string.format("%s", io.popen("basename $(pipenv --venv)"):read("*a"))
	elseif os.getenv("CONDA_DEFAULT_ENV") ~= nil then
		segment = string.format("%s", os.getenv("CONDA_DEFAULT_ENV"))
	else
		segment = string.format("%s", io.popen("pyenv version"):read("*a"))
		for token in string.gmatch(segment, "[^%s]+") do
			segment = token
			break
		end
	end

	local version = io.popen("python --version"):read("*all")
	for token in string.gmatch(version, "[^%s]+") do
		version = token
	end

	return string.format("%s (%s)", version, segment)
end

local pyenv = get_py_venv()

local function get_pyenv_once()
	return pyenv
end

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
	-- color = { fg = "#56B6C2" },
}


local config = {
	options = {
		theme = "auto",
		icons_enabled = true,
		--component_separators = '|',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		--section_separators = { left = '', right = '' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			--{ 'mode', separator = { left = '' }, right_padding = 2 },
			{ 'mode', separator = { left = ' ' }, right_padding = 2 },
		},
		lualine_b = {
			{ 'filename', file_status = true },
			{ 'branch' },
			{ 'diff', symbols = { added = " ", modified = " ", removed = " " } },
		},
		lualine_c = {},
		lualine_x = {
			lsp_info, { 'diagnostics', always_visible = true },
		},
		lualine_y = {
			{ 'filetype', icons_enabled = true, cond = function() return vim.bo.filetype ~= 'python' end },
			{ get_pyenv_once, cond = function() return vim.bo.filetype == 'python' end, icon = " ", color = { fg = "#F2B482" } },
			{ 'filesize' },
			{ 'progress' },
		},
		lualine_z = {
			--{ 'location', separator = { right = '' }, left_padding = 2 },
			{ 'location', separator = { right = ' ' }, left_padding = 2 },
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
	extensions = { 'quickfix', 'nerdtree', 'fugitive' },
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local bufferline = require("bufferline")
bufferline.setup{
	options = {
			mode = "buffers", -- set to "tabs" to only show tabpages instead
			style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
			themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
			numbers = "none",
			diagnostics = "nvim_lsp",
			indicator = {
					icon = '▎', -- this should be omitted if indicator style is not 'icon'
					style = 'icon',
			},
			buffer_close_icon = '󰅖',
			modified_icon = '●',
			close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',
	}
}
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
	},
	display_components = { 'spinner' },
	timer = { progress_enddelay = 0, spinner = 0, lsp_client_name_enddelay = 0 },
	spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
})

require('lualine').setup(config)
