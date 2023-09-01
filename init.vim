" -----------------------
"  NEOVIM CONFIGURATION
" -----------------------

" --------------------
"   VIM-PLUG PACKAGES
" --------------------
"  :PlugInstall = intall plugins added
"  :PlugClean = remove plugins that no longer are described here

call plug#begin()

Plug 'https://github.com/rcarriga/nvim-notify' "Notificações no neovim
Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary' " Comment the line (gcc) and uncomment (gcgc)
Plug 'https://github.com/preservim/nerdtree' " Directory and files tab
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal into nvim
Plug 'https://github.com/terryma/vim-multiple-cursors' " Ctrl + N get multiple cursors
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/rktjmp/lush.nvim'
Plug 'https://github.com/RRethy/nvim-base16'
Plug 'projekt0n/github-nvim-theme'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/dkarter/bullets.vim'
Plug 'https://github.com/glepnir/dashboard-nvim'
Plug 'https://github.com/mbbill/undotree'


call plug#end()


" BASE CONFIGURATION
set number
set mouse=a
set autoindent
set tabstop=4
set termguicolors
set softtabstop=4
set shiftwidth=4
set smarttab
set encoding=UTF-8

" -------------- 
"  COLORSCHEME
" --------------
:colorscheme github_dark_high_contrast

" ------------
"  VIM-NOTIFY
" ------------



" -----------------------
" NERDTREE CONFIGURATION
" -----------------------
"NerdTree is a plugin to open folders os archives into neovim
"C = Ctrl Keyboard

nnoremap <C-f> :NERDTreeFocus<cr>
nnoremap <C-n> :NERDTree<cr>
nnoremap <C-t> :NERDTreeToggle<cr>

" ------------------------
" TELESCOPE CONFIGURATION
" ------------------------

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" ------------------------
" DASHBOARD CONFIGURATION
" ------------------------
let g:dashboard_default_executive = 'clap'

