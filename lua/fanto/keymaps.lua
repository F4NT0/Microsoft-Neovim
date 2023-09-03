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
-- Comando para abrir uma nova tela na horizontal = :split
-- Comando para abrir uma nova tela na vertical = :vsplit

