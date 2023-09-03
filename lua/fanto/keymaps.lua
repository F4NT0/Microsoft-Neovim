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
keymap("n", "<C-h>v", ":vsplit<CR>", opts) -- Comando para abrir uma nova tela na vertical = :vsplit
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


-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
