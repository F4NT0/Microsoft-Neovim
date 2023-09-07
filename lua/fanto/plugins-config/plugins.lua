-- ╔══════════════════════════╗
-- ║  PLUGINS CONFIGURATIONS  ║
-- ╚══════════════════════════╝
-- Usamos o plugin manager packer.nvim
-- Link: https://github.com/wbthomason/packer.nvim
-- Para instalar no windows: git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack:w\packer\start\packer.nvim"
-- Todos os plugins instalados vão ser salvos no windows em: C:\user\nomeuser\AppData\Local\nvim-data

-- ┌---------------------------------┐
-- |   COMANDOS BÁSICOS DO PACKER    |
-- └---------------------------------┘
-- :PackerInstall = instala os plugins adicionados neste arquivo
-- :PackerUpdate = atualiza os plugins adicionados neste arquivo
-- :PackerStatus = verifica os plugins adicionados no nossos Neovim



-- ┌-----------------------------------┐
-- |    CONFIGURAÇÃO BASE DO PACKER    |
-- └-----------------------------------┘
-- Você pode ignorar todo esse bloco de código abaixo
-- Configuração base do packer e algumas modificações extras

---------------------------
-- AUTORELOAD DO PACKER  --
---------------------------
-- Os comando abaixo são para quando é atualizado os plugins do neovim
-- ele atualiza automaticamente quando reabrir um arquivo
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

--------------------------
--    PROTECTED CALL    --
-------------------------- 
-- Protected call é uma forma de verificar se o packer vai ser ativado
-- e configurar os projetos
-- função sem validação: local packer = require("packer")
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Packer not worked properly")
	return
end

-------------------------------- 
--     POPUP WINDOW PACKER    --
--------------------------------
-- Packer pode ser iniciado uma tela popup toda vez que for configurar algo
-- essa função vai iniciar o packer toda vez que algo alterar
packer.init {
   display = {
      open_fn = function()
	      return require("packer.util").float { border = "rounded" }
      end,
   },
}


-- ┌---------------------------┐
-- |     SESSÃO DE PLUGINS     |
-- └---------------------------┘
-- ÁREA MAIS IMPORTANTE DO ARQUIVO
-- Aqui vão ser colocados os plugins que queremos para o nosso Neovim
-- Todos os plugins para neovim são Repositórios para o Github

-------------------------
-- PLUGINS INSTALADOS --
-------------------------
-- Coloque abaixo o nome dos plugins que deseja
-- que são usados no packer

return packer.startup(function(use)

-- Básico
use "wbthomason/packer.nvim"            -- Packer plugin manager oficial, faz o processo do comando :PackerUpdate
use "nvim-lua/popup.nvim"               -- Popup API para usar no VIM/NEOVIM
use "nvim-lua/plenary.nvim"             -- Funções lua úteis usados por muita gente

-- Colorschemes
use "projekt0n/github-nvim-theme"       -- Temas do Github no Neovim

-- CMP PACOTES DE AUTOCOMPLETE
use "hrsh7th/nvim-cmp"                  -- Plugin de Autocomplete
use "hrsh7th/cmp-buffer"                -- Autocomplete dos Buffers
use "hrsh7th/cmp-path"                  -- Autocomplete de paths
use "hrsh7th/cmp-cmdline"               -- Autocomplete do cmdline
use "saadparwaiz1/cmp_luasnip"          -- Autocomplete dos snippets

-- Snippet engine
use "L3MON4D3/LuaSnip"                  -- Snippet engine
use "rafamadriz/friendly-snippets"      -- Vários snippets para usar

--------------------
-- MASON PLUGINS --
--------------------

-- Mason (configurar linguagens de programação e debug)
use "williamboman/mason.nvim"           -- Plugin oficial do mason

-- Language Support Protocol [LSP]
use "williamboman/mason-lspconfig.nvim" -- Plugin de config do lsp do mason
use "neovim/nvim-lspconfig"             -- Plugin oficial do lsp do Neovim

-- Debug Adapter Protocol [DAP]
use "mfussenegger/nvim-dap"             -- Debugger para Neovim
use { "rcarriga/nvim-dap-ui",           -- Interface Gráfica do DAP do Neovim
      requires = {
	      "mfussenegger/nvim-dap"
      }
}

-- Linters (mostrar código colorido)
use "mfussenegger/nvim-lint"            -- Neovim linter funcional

-- Formatters (formatar código quando salvo)
use "mhartington/formatter.nvim"        -- Melhor formater até o momento


-----------------------
-- NERDTREE PLUGINS --
-----------------------
use "nvim-tree/nvim-tree.lua"           -- Plugin oficial do Nerdtree
use "nvim-tree/nvim-web-devicons"       -- Plugin de icones para o Nerdtree

-----------------------
-- LUALINE PLUGINS  --
-----------------------
use "nvim-lualine/lualine.nvim"         -- Plugin do lualine

----------------
-- TREESITTER --
----------------
use {
  'nvim-treesitter/nvim-treesitter',
  run = function()
  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  ts_update()
  end,
}

----------------
-- TELESCOPE --
----------------
-- Não esqueça de baixar o ripgrep: scoop install ripgrep

use {
  "nvim-telescope/telescope.nvim", tag = '0.1.2'  -- Plugin Oficial do telescope
}
use "nvim-telescope/telescope-file-browser.nvim"  -- Melhoria de busca de arquivos

end)



