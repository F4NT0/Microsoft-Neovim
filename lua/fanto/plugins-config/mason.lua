--   ╔═══════════════════════╗
--   ║  MASON CONFIGURATION  ║
--   ╚═══════════════════════╝

-- ┌--------------------┐
-- | PLUGINS REQUERIDOS |
-- └--------------------┘

-----------
-- MASON --
-----------
require("mason").setup{
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    keymaps = {
	toggle_package_expand = "<CR>",	 -- ENTER: Ver mais informações de um pacote
	install_package = "i", 	         -- i: Instalar um pacote (necessita estar com o mouse encima do pacote)
	update_package = "u", 	         -- u: Atualizar um pacote (necessita estar com o mouse em cima do pacote)
	check_package_version = "c",     -- c: Verifica a versão de um pacote (necessita estar com o mouse encima do pacote)
	uninstall_package = "x",         -- x: Desinstala um pacote (necessita estar com o mouse encima do pacote)
	update_all_packages = "U",       -- U: Atualiza todos os pacotes
	check_outdated_packages = "C",   -- C: Verifica a versão de todos os pacotes
	cancel_installation = "<C-c>",   -- Ctrl + c: para a instalação de um pacote
	apply_language_filter = "<C-f>", -- Ctrl + f: Aplica um filtro de busca de uma linguagem
	toggle_help = "g?",              -- g + ? : Ativa a ajuda no mason
    },
}

-----------------
-- LSPCONFIG  --
-----------------
-- Configure individualmente cada servidor de linguagem utilizando o lspconfig
require("lspconfig").pyright.setup{}       -- :LspInstall pyright
require("lspconfig").lua_ls.setup{}        -- :LspInstall lua_ls
require("lspconfig").csharp_ls.setup{}     -- :LspInstall csharp_ls
require("lspconfig").jdtls.setup{}         -- :LspInstall jdtls
require("lspconfig").marksman.setup{}      -- :LspInstall marksman
require("lspconfig").jsonls.setup{}        -- :LspInstall jsonls
require("lspconfig").powershell_es.setup{} -- :LspInstall powershell_es
require("lspconfig").yamlls.setup{}        -- :LspInstall yamlls

----------------------
-- MASON LSPCONFIG --
----------------------
-- São necessários instalar servidores com as configs de cada linguagem
-- Vamos colocar os principais servidores das linguagens que mais uso
require("mason-lspconfig").setup {
	ensure_installed = {
		"csharp_ls",                   -- C#
		"omnisharp_mono",              -- C#
		"omnisharp",                   -- C#
		"cssls",                       -- CSS
		"quick_lint_js",               -- JAVASCRIPT
		"html",                        -- HTML
		"jsonls",                      -- JSON
		"jdtls",                       -- JAVA
		"lua_ls",                      -- LUA
		"marksman",                    -- MARKDOWN 
		"powershell_es",               -- POWERSHELL
		"pyright",                     -- PYTHON
		"sqlls",                       -- SQL
		"yamlls"                       -- YAML
	}
}
