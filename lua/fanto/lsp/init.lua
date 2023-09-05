--   ╔══════════════════════╗
--   ║  LSP CONFIGURATIONS  ║
--   ╚══════════════════════╝

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- ┌---------------------┐
-- | PLUGINS NECESSÁRIOS |
-- └---------------------┘
require("fanto.lsp.lsp-installer")
require("fanto.lsp.handlers").setup()
