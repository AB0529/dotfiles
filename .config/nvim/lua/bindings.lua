local BUFFER_BINDINGS = {}

-- Jump to definition
BUFFER_BINDINGS["<leader>j"] = vim.lsp.buf.definition
-- Hover info
BUFFER_BINDINGS["K"] = vim.lsp.buf.hover
-- Workspace symbol
BUFFER_BINDINGS["<leader>vws"] = vim.lsp.buf.workspace_symbol
-- Open diagnostic float
BUFFER_BINDINGS["<leader>vd"] = vim.diagnostic.open_float
-- Goto next diagnostic
BUFFER_BINDINGS["[d"] = vim.diagnostic.goto_next
-- Goto prev diagnostic
BUFFER_BINDINGS["]d"] = vim.diagnostic.goto_prev
-- Perform code action
BUFFER_BINDINGS["<leader>ca"] = vim.lsp.buf.code_action
-- Find all references
BUFFER_BINDINGS["<leader>rf"] = vim.lsp.buf.references
-- Rename
BUFFER_BINDINGS["<leader>rn"] = vim.lsp.buf.rename

return BUFFER_BINDINGS
