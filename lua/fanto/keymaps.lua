--   ╔══════════════════════════╗
--   ║  KEYMAPS CONFIGURATIONS  ║
--   ╚══════════════════════════╝

-- ┌-------------------------------┐
-- | ORGANIZAÇÃO DAS CONFIGURAÇÕES |
-- └-------------------------------┘
local opts = {noremap = true, silent = true } -- configuração das operações
local term_opts = { silent = true } -- configuração das operações no terminal
local keymap = vim.api.nvim_set_keymap

-- ┌----------------------┐
-- | REMAPEANDO A LEADER  |
-- └----------------------┘
-- Leader é a chave do teclado principal usada
-- Como padrão de outros sistemas, vamos configurar a Leader como o espaço do teclado
keymap("","<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ┌--------------------------------------┐
-- | TIPOS DE MODOS DO VIM/NEOVIM         |
-- └--------------------------------------┘
-- Temos os seguintes modos definidos
-- Normal mode = definido pela letra n - modo de leitura do arquivo
-- Insertion mode = definido pela letra i = modo de escrita em um arquivo
-- Visual mode = 

-- ┌--------------------------------------┐
-- | KEYMAPS NO MODO NORMAL (NORMAL MODE) |
-- └--------------------------------------┘
-- Normal mode é o modo quando você simplesmente abre o arquivo no VIM/NEOVIM
-- Definimos que um keymap é do modo normal colocando n no primeiro atributo do keymap
-- Glossário:
--    C = Ctrl
--    A = Alt
--    S = Shift
--    keymap(modo,novo comando, comando antigo, operador)

--------------------------------
-- MELHOR NAVEGAÇÃO ENTRE TELAS
--------------------------------
keymap("n", "<C-h>h", ":split<CR>", opts) -- Ctrl + H + H Comando para abrir uma nova tela na horizontal = :split
keymap("n", "<C-v>", ":vsplit<CR>", opts) -- Comando para abrir uma nova tela na vertical = :vsplit
keymap("n", "<C-h>", "<C-w>h", opts)      -- Ctrl + H move para a tela a esquerda
keymap("n", "<C-j>", "<C-w>j", opts)      -- Ctrl + J move para a tela abaixo  
keymap("n", "<C-k>", "<C-w>k", opts)      -- Ctrl + K move para a tela encima
keymap("n", "<C-l>", "<C-w>l", opts)      -- Ctrl + L move para a tela a direita

----------------------
-- RESIZE DAS TELAS
----------------------
keymap("n", "<C-Up>", ":resize -2<CR>", opts)             -- Resize para cima
keymap("n", "<C-Down>", ":resize +2<CR>", opts)           -- Resize para baixo
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)  -- Resize para a esquerda
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Resize para a direita



