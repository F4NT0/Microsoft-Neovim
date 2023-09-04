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

