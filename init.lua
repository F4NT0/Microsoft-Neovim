-- ╔══════════════════════════════════════════════════════════════════════════════════════╗
-- ║   _   _ ______ ______      _______ __  __    _____ ____  _   _ ______ _____ _____    ║
-- ║  | \ | |  ____/ __ \ \    / /_   _|  \/  |  / ____/ __ \| \ | |  ____|_   _/ ____|   ║
-- ║  |  \| | |__ | |  | \ \  / /  | | | \  / | | |   | |  | |  \| | |__    | || |  __    ║
-- ║  | . ` |  __|| |  | |\ \/ /   | | | |\/| | | |   | |  | | . ` |  __|   | || | |_ |   ║
-- ║  | |\  | |___| |__| | \  /   _| |_| |  | | | |___| |__| | |\  | |     _| || |__| |   ║
-- ║  |_| \_|______\____/   \/   |_____|_|  |_|  \_____\____/|_| \_|_|    |_____\_____|   ║
-- ║                                                                                      ║
-- ╚══════════════════════════════════════════════════════════════════════════════════════╝

-- ┌---------┐
-- | OPTIONS |
-- └---------┘
-- Options é as opções de funcionamento básico do VIM/NEOVIM
-- Localização: nvim/lua/fanto/options.lua
require "fanto.options"

-- ┌---------┐
-- | KEYMAPS |
-- └---------┘
-- Keymaps ficam os atalhos de teclado de comando usados no VIM/NEOVIM
-- Localização: nvim/lua/fanto/keymaps.lua
require "fanto.keymaps"

-- ┌---------┐
-- | PLUGINS |
-- └---------┘
-- Plugins é o arquivo onde ficam configurado todos os plugins adicionados ao nosso Neovim
-- Localização: nvim/lua/fanto/plugins.lua
require "fanto.plugins"

-- ┌---------┐
-- | TEMA    |
-- └---------┘
-- Definimos o colorscheme (tema) do nosso Neovim
-- o tema foi baixado no nosso gerenciador de plugins packer
-- Localização de onde está baixado: nvim/lua/fanto/plugins.lua
vim.cmd('colorscheme github_dark_high_contrast')

-- ┌--------------┐
-- | AUTOCOMPLETE | 
-- └--------------┘
-- Autocomplete mostra opções para completar o código
require "fanto.cmp"

-- ┌------------------------┐
-- | MASON (LSP e Debug)    | 
-- └------------------------┘
-- MASON possui seu prório diretório em nvim/lua/fanto/mason-config/
-- Aqui o require vai pegar o init.lua dentro do diretório mason-config/
-- Comandos:
-- :Mason = abre a tela do mason
-- Dentro da tela do mason:
--   Tecla I = instala o plugin com o mouse encima
--   Tecla U = atualiza o plugin com o mouse encima
require "fanto.mason-config"

