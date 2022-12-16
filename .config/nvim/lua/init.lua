local mason = require("mason")
local lsp = require("lsp-zero")

mason.setup()
lsp.preset("recommended")
lsp.setup()
