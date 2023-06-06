local onedark_colours = require('onedark.colors')

function colour(name)
	return onedark_colours[name].gui
end

require('lualine').setup({
  options = {
    theme = {
	  normal = {
		a = { fg = colour('visual_black'), bg = colour('purple'), gui = "bold" },
		b = { fg = colour('white'), bg = colour('cursor_grey')},
		c = { fg = colour('black'), bg = colour('black') }
	  },

	  insert = { a = { fg = colour('black'), bg = colour('blue') } },
	  visual = { a = { fg = colour('black'), bg = colour('cyan') } },
	  replace = { a = { fg = colour('black'), bg = colour('red') } },

	  inactive = {
		a = { fg = colour('white'), bg = colour('black') },
		b = { fg = colour('white'), bg = colour('black') },
		c = { fg = colour('black'), bg = colour('black') }
	  },
	},
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2, gui = "bold" },
    },
    lualine_b = {
		'filename',
		'branch',
		{
			'diagnostics',
			  sources = { 'nvim_workspace_diagnostic' },
			  symbols = { error = ' ', warn = ' ', info = ' ' },
			  diagnostics_color = {
				color_error = { fg = colour('red') },
				color_warn = { fg = colour('yellow') },
				color_info = { fg = colour('cyan') },
			  },
		}
	},
	lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', },
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
  extensions = {},
})
