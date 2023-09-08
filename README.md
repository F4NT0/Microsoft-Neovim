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

## 3 - Organizando os dados

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

## 4 - Plugins instalados

### dashboard-nvim

- Localização do arquivo: `lua/fanto/plugins-config/dashboard.lua`

É um plugin para o Neovim (ou Vim) que cria uma página inicial personalizável e informativa quando você inicia o Neovim. 

Ele oferece uma visão geral rápida de informações úteis, como listas de arquivos recentes, projetos favoritos, comandos personalizados e muito mais. 

O dashboard-nvim é projetado para melhorar a produtividade do usuário, permitindo que você acesse facilmente seus projetos e arquivos frequentemente usados, além de fornecer uma experiência de inicialização mais agradável.

Para abrir o plugin, só escrever no terminal `nvim`

### indent-blankline

- Localização do arquivo: `lua/fanto/plugins-config/indentlines.lua`

É um arquivo simples que indenta as chaves de uma função e mostra uma linha conectando o inicio e o fim de uma função
