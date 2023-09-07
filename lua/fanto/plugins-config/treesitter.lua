-- ┌----------------------------┐
-- | TREESITTER CONFIGURATION   |
-- └----------------------------┘

-- Para instalar uma linguagem
-- :TSInstall nome-linguagem = instala uma linguagem
-- :TSInstallInfo = mostra as linguagens disponiveis e instaladas
-- Instalar o gcc: scoop install gcc

require("nvim.treesitter.configs").setup({
	ensure_installed = {
		"c_sharp",           -- :TSInstall c_sharp 
		"java",              -- :TSInstall java
		"json",              -- :TSInstall json
		"lua",               -- :TSInstall lua
		"markdown",          -- :TSInstall markdown
		"markdown_inline",   -- :TSInstall markdown_inline
		"python",            -- :TSInstall python
		"vim",               -- :TSInstall vim
		"yaml"               -- :TSInstall yaml
	},
	auto_install = true,
	highlight = {
	   enable = true
	}

})
