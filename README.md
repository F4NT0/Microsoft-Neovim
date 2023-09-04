# Neovim no Microsoft Windows

## 1 - Instalar o Chocolatey

Podemos baixar o Chocolatey com o seguinte script de powershell:

```powershell
# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir='C:\ProgramData\chocoportable'
$env:ChocolateyInstall="$InstallDir"

# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
Set-ExecutionPolicy Bypass -Scope Process -Force;

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Coloque o seguinte script em um arquivo chamado `ChocolateyInstallNonAdmin.ps1`

## 2 - Instalar o Neovim

Podemos instalar NEOVIM com o seguinte comando:

```powershell
choco install neovim
```

Vai falhar a instalação de um pacote, mas se tiver permissão de admin melhor

## 3 - Configuração do Neovim

Clique em <kbd>Win</kbd> + <kbd>R</kbd> e escreva `%appdata%` ou vá direto em `AppData\Local`

Crie um novo diretório chamado `nvim`

Dentro desse diretório iremos construir os arquivos de configuração que queremos

## 4 - Configuração com vimscript

É uma configuração mais simples usando vimscript

Arquivo principal: **init.vim**

TBD

## 5 - Configuração com a linguagem lua

É uma configuração mais avançada com várias configurações usando a linguagem de programação lua

Arquivo principal: **init.lua**

Deve ser criado um diretório chamado `nvim` em `C:\Users\nome\Appdata\Local\`.

A estrutura completa de arquivos deve ser assim:

```text
nvim
 |- init.lua
 |- lua/
     |- fanto/
         |- options.lua
 
```

### options.lua

É um arquivo de configuração com as opções do vim para configurar o neovim com opções básicas do vim.

Para saber todas as opções que o vim pode nos dar só rodar o comando `:help options` que vai trazer todas as opções e explicações.

Exemplo:

```lua
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

```

Para chamarmos esse arquivo de configuração devemos colocar a seguinte linha no arquivo `init.lua`

```lua
require "fanto.options"
```

Tudo que tiver dentro do diretório `lua` vai ser lido no arquivo `ìnit.lua`

### Melhorando o options

Podemos arrumar o arquivo options usando a linguagem lua para colocarmos melhor cada dado, para isso primeiro vamos criar uma lista de dados:

```lua
local options {}
```

Vamos colocar dentro todas as nossas opções sem o _vim.opt_:

```lua
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
```

Agora devemos construir um for que vai percorrer todas as opções e vai adicionar o vim.opt removido para organizar:

```lua
-- Adicionando vim.opt para todas as opções
for k, v in pairs(options) do
	vim.opt[k] = v
end
```

Com isso organizamos nossas opções para ficar mais visivel e mais simples de adicionar novas opções

### Keymaps

Criamos um arquivo em `nvim/lua/fanto/` chamado `keymaps.lua`.

Nesse arquivo colocamos todas as configurações dos atalhos de teclado que serão usados no neovim.

Configuração inicial:

```lua
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

---------------------
-- COMANDOS BÁSICOS
---------------------
keymap("n", "u", ":undo<CR>", opts) -- Desfaz o que foi alterado
keymap("v", "<C-c>", "y", opts) -- Ctrl + C para copiar os dados selecionados

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

--------------------------
-- NAVEGAR ENTRE BUFFERS
--------------------------
-- Buffers são outros documentos abertos no neovim ao mesmo tempo
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- ┌--------------------------------------┐
-- | KEYMAPS NO MODO INSERT (INSERT MODE) |
-- └--------------------------------------┘
-- Insert mode é o modo quando você edita um arquivo no VIM/NEOVIM
-- Definimos que um keymap é do modo insert colocando i no primeiro atributo do keymap
-- Glossário:
--    C = Ctrl
--    A = Alt
--    S = Shift
--    keymap(modo,novo comando, comando antigo, operador)

-- ┌--------------------------------------┐
-- | KEYMAPS NO MODO VISUAL (VISUAL MODE) |
-- └--------------------------------------┘
-- Visual mode é o modo quando você copia e cola informações em um arquivo no VIM/NEOVIM
-- Definimos que um keymap é do modo visual colocando v no primeiro atributo do keymap
-- No modo visual podemos utilizar o Ctrl + C e Ctrl + V para copiar e colar dados
-- Glossário:
--    C = Ctrl
--    A = Alt
--    S = Shift
--    keymap(modo,novo comando, comando antigo, operador)

--------------
-- IDENTAÇÃO
--------------
-- Podemos identar dados selecionando o texto desejado e
-- movemos com > ou < para identar os dados
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

------------------
-- MOVENDO TEXTO
-------------------
-- Podemos mover o texto selecionado para outra parte do código
keymap("v", "<A-j>", ":m .+1<CR>==", opts) -- Alt + J = move texto selecionado para baixo
keymap("v", "<A-k>", ":m .-2<CR>==", opts) -- Alt + K = move texto selecionado para cima
keymap("v", "p", "_dP", opts)


-- ┌--------------------------------------------------┐
-- | KEYMAPS NO MODO VISUAL BLOCK (VISUAL BLOCK MODE) |
-- └--------------------------------------------------┘
-- Visual block mode é o modo quando um arquivo no VIM/NEOVIM
-- Definimos que um keymap é do modo visual colocando v no primeiro atributo do keymap
-- No modo visual podemos utilizar o Ctrl + C e Ctrl + V para copiar e colar dados
-- Glossário:
--    C = Ctrl
--    A = Alt
--    S = Shift
--    keymap(modo,novo comando, comando antigo, operador)

----------------------------------------
-- MOVENDO TEXTO PARA CIMA E PARA BAIXO
----------------------------------------
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- ┌----------------------------┐
-- | TERMINAL DENTRO DO NEOVIM  |
-- └----------------------------┘

---------------------------------------
-- MELHOR NAVEGAÇÃO DENTRO DO TERMINAL
---------------------------------------
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
```
Como mostra no arquivo, temos várias configurações básicar do Neovim

### Organizando os dados

Organizamos como mostra acima da seguinte forma:

```lua
--   ╔═══════════════════════════════╗
--   ║  TÍTULO PRINCIPAL DO ARQUIVO  ║
--   ╚═══════════════════════════════╝

-- ┌----------------------------┐
-- | SUBTÍTULO DE CATEGORIA     |
-- └----------------------------┘

---------------------------------------
-- SUBTÍTULO DE CATEGORIA INTERNA
---------------------------------------
```

Dessa forma, temos o título do arquivo, uma categoria grande e as categorias internas, facilitando a documentação.
