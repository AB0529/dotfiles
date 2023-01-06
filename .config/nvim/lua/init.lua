local mason = require("mason")
local lsp = require("lsp-zero")
local trouble = require("trouble")
local cmp = require("cmp")
local null_ls = require("null-ls")
local telescope = require("telescope")

telescope.setup({ defaults = { file_ignore_patterns = { "node_modules" } } })
mason.setup()
lsp.preset("recommended")
trouble.setup(require("trouble-setup"))

-- Keybindings for buffers
lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	for key, action in pairs(require("bindings")) do
		vim.keymap.set("n", key, action, opts)
	end
end)

-- LSP and tab complete bindings
lsp.setup()
cmp.setup(require("util"))

-- Formatting
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.formatting.clang_format
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", {})
	end,
})
