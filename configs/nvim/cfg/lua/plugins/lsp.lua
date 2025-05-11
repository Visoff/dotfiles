return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },

		{ 'neovim/nvim-lspconfig' },

		{ 'hrsh7th/nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'L3MON4D3/LuaSnip' },
	},
	config = function()
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({buffer = bufnr})

			vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "<leader>df", function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set("n", "<leader>fmt", function() vim.lsp.buf.format() end, opts)
		end)

		local lspconfig = require('lspconfig')

		require('mason').setup({})
		require('mason-lspconfig').setup({
			ensure_installed = {"denols", "ts_ls"},
			handlers = {
				lsp_zero.default_setup,
				["denols"] = function()
					lspconfig.denols.setup({
						init_options = {
							enable = true,
							lint = true,
							unstable = true,
							suggest = {
								imports = {
									hosts = {
										["*"] = true,
									},
								},
							}
						},
						single_file_support = true,
						root_dir = require'lspconfig'.util.root_pattern("deno.json", "deno.jsonc"),
					})
				end,
				["ts_ls"] = function ()
					require('lspconfig').ts_ls.setup({
						single_file_support = false,
						root_dir = require'lspconfig'.util.root_pattern("package.json", "tsconfig.json"),
					})
				end
			},
		})

		local cmp = require('cmp')
		local cmp_action = require('lsp-zero').cmp_action()

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				-- `Enter` key to confirm completion
				['<C-p>'] = cmp.mapping.confirm({select = false}),

				-- Ctrl+Space to trigger completion menu
				['<C-Space>'] = cmp.mapping.complete(),

				-- Navigate between snippet placeholder
				['<C-f>'] = cmp_action.luasnip_jump_forward(),
				['<C-b>'] = cmp_action.luasnip_jump_backward(),

				-- Scroll up and down in the completion documentation
				['<C-u>'] = cmp.mapping.scroll_docs(-4),
				['<C-d>'] = cmp.mapping.scroll_docs(4),
			})
		})

	end
}
