local cmp = require("cmp")

require("nvim-lsp-installer").setup({
    automatic_installation = true
})

cmp.setup({
    snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
    },
    mapping = cmp.mapping.preset.insert({
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true })
    }),
    sources = {
		{ name = 'nvim_lsp' },
    },
})

vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)

require("lspconfig").rust_analyzer.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").gopls.setup({})
