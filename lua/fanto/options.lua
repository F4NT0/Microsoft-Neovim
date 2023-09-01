-- ===========================
--    OPTIONS CONFIGURATION
-- ===========================

-- Para informações escreva :help options

--------------------------
-- CONFIGURAÇÕES BÁSICAS
--------------------------
vim.opt.backup = false                -- Cria um arquivo backup
vim.opt.clipboard = "unnamedplus"     -- Libera que Neovim acesse meu clipboard
vim.opt.fileencoding = "utf-8"        -- Para liberar acentos no arquivos no Neovim
vim.opt.hlsearch = true               -- Mostrar todas as palavras encontradas em uma pesquisa
vim.opt.ignorecase = true             -- Ignora se as palavras são maiusculas ou minusculas na busca
vim.opt.mouse = "a"                   -- Libera o mouse no Neovim
vim.opt.smartcase = true              -- Smart case serve para ignorar verificações
vim.opt.smartindent = true            -- Identação de código mais esperta
vim.opt.swapfile = false              -- Quando abre um arquivo ele cria um arquivo swap desnecessário
vim.opt.number = true                 -- Mostra o número da linha
vim.opt.cursorline = true             -- Mostra a linha atual
vim.opt.relativenumber = false        -- Altera o número da linha para a que está atualmente
vim.opt.numberwidth = 4               -- Define que a coluna tem uma largura (padrão 4)
vim.opt.splitbelow = true             -- Deixa separar a tela em outro arquivo abaixo
vim.opt.splitright = true             -- Deixa separar a tela em uma nova tela a direita
vim.opt.conceallevel = 0              -- Deixa mostrar `` visivel no markdown
vim.opt.cmdheight = 2                 -- Mais espaço para a linha de comando do Neovim
vim.opt.undofile = true               -- Libera desfazer permanente
vim.opt.updatetime = 300              -- Completa mais rápido a escrita
vim.opt.signcolumn = "yes"            -- Mostra o sinal da coluna
vim.opt.scrolloff = 8                 -- Scroll do Neovim
vim.opt.sidescrolloff = 8             -- Scroll do Neovim 2

