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
         |- plugins/
         |- cmp.lua
         |- keymaps.lua
         |- options.lua
         |- plugins.lua
 
```

### Keymaps

Criamos um arquivo em `nvim/lua/fanto/` chamado `keymaps.lua`.

### Organizando os dados

Em todos os arquivos lua temos os seguintes títulos.

```lua
-- ╔═══════════════════════════════╗
-- ║  TÍTULO PRINCIPAL DO ARQUIVO  ║
-- ╚═══════════════════════════════╝

-- ┌----------------------------┐
-- | SUBTÍTULO DE CATEGORIA     |
-- └----------------------------┘

------------------------------------
-- SUBTÍTULO DE CATEGORIA INTERNA --
------------------------------------
```
