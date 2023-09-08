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

-- Capacidades adicionais
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

-- Configure individualmente cada servidor de linguagem utilizando o lspconfig

require("lspconfig").pyright.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall pyright

require("lspconfig").lua_ls.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall lua_ls

require("lspconfig").csharp_ls.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall csharp_ls

require("lspconfig").jdtls.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall jdtls

require("lspconfig").marksman.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall marksman

require("lspconfig").jsonls.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall jsonls

require("lspconfig").powershell_es.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall powershell_es

require("lspconfig").yamlls.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall yamlls

require("lspconfig").sqlls.setup{
	capabilities = capabilities,
	on_attach = on_attach
} -- :LspInstall sqlls

------------------------
-- LUASNIP E NVIM-CMP --
------------------------
local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert(
	{
    		['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    		['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    		-- C-b (back) C-f (forward) for snippet placeholder navigation.
    		['<C-Space>'] = cmp.mapping.complete(),
    		['<CR>'] = cmp.mapping.confirm 
		{
      			behavior = cmp.ConfirmBehavior.Replace,
      			select = true,
    		},
    		['<Tab>'] = cmp.mapping(function(fallback)
      			if cmp.visible() then
        			cmp.select_next_item()
      			elseif luasnip.expand_or_jumpable() then
        			luasnip.expand_or_jump()
      			else
        			fallback()
      			end
    		end, { 'i', 's' }),
    		['<S-Tab>'] = cmp.mapping(function(fallback)
      			if cmp.visible() then
        			cmp.select_prev_item()
      			elseif luasnip.jumpable(-1) then
        			luasnip.jump(-1)
      			else
        			fallback()
     		 	end
    		end, { 'i', 's' }),
  	}),
  	sources = {
    		{ name = 'nvim_lsp' },
    		{ name = 'luasnip' },
  	},
}


----------------------
-- MASON LSPCONFIG --
----------------------
-- São necessários instalar servidores com as configs de cada linguagem
-- Vamos colocar os principais servidores das linguagens que mais uso
require("mason-lspconfig").setup {
	ensure_installed = {
		"csharp_ls",                   -- C#
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

---------------------------
-- SETUP COM AUTOCOMPLETE
---------------------------
-- Requer o plugin cmp-nvim-lsp e nvim-cmp
