-- ===========================
--    OPTIONS CONFIGURATION
-- ===========================

-- Para informações escreva :help options

--------------------------
-- CONFIGURAÇÕES BÁSICAS
--------------------------
local options = {
	backup = false,                -- Cria um arquivo backup
	clipboard = "unnamedplus",     -- Libera que Neovim acesse meu clipboard
	fileencoding = "utf-8",        -- Para liberar acentos no arquivos no Neovim
	hlsearch = true,               -- Mostrar todas as palavras encontradas em uma pesquisa
	ignorecase = true,             -- Ignora se as palavras são maiusculas ou minusculas na busca
	mouse = "a",                   -- Libera o mouse no Neovim
	smartcase = true,              -- Smart case serve para ignorar verificações
	smartindent = true,            -- Identação de código mais esperta
	swapfile = false,              -- Quando abre um arquivo ele cria um arquivo swap desnecessário
	termguicolors = true,           -- Ativa melhores cores no terminal
	number = true,                 -- Mostra o número da linha
	cursorline = false,            -- Mostra a linha atual
	relativenumber = false,        -- Altera o número da linha para a que está atualmente
	numberwidth = 4,               -- Define que a coluna tem uma largura (padrão 4)
	splitbelow = true,             -- Deixa separar a tela em outro arquivo abaixo
	splitright = true,             -- Deixa separar a tela em uma nova tela a direita
	conceallevel = 0,              -- Deixa mostrar `` visivel no markdown
	cmdheight = 2,                 -- Mais espaço para a linha de comando do Neovim
	undofile = true,               -- Libera desfazer permanente
	updatetime = 300,              -- Completa mais rápido a escrita
	signcolumn = "yes",            -- Mostra o sinal da coluna
	scrolloff = 8,                 -- Scroll do Neovim
	sidescrolloff = 8,             -- Scroll do Neovim 2
}

-- Adicionando vim.opt para todas as opções
for k, v in pairs(options) do
	vim.opt[k] = v
end
