
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set number
set numberwidth=1
set relativenumber
set signcolumn=yes
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set splitbelow
set splitright
set hidden
set scrolloff=999
set noshowmode
set updatetime=250 
set encoding=UTF-8
set mouse=a

call plug#begin()

" List your plugins here
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'rebelot/kanagawa.nvim'

call plug#end()

" LSP
lua << EOF
	require'lspconfig'.clangd.setup{}
	require'nvim-treesitter.configs'.setup{highlight={enable=true}}  

	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
	
	vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, { desc = 'Telescope definitions' })
	vim.keymap.set('n', '<leader>fr', builtin.lsp_references , { desc = 'Telescope references' })
	
	require('kanagawa').setup({
		compile = false,             -- enable compiling the colorscheme
		undercurl = true,            -- enable undercurls
   		commentStyle = { italic = true },
   		functionStyle = {},
   		keywordStyle = { italic = true},
   		statementStyle = { bold = true },
   		typeStyle = {},
   		transparent = false,         -- do not set background color
   		dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
   		terminalColors = true,       -- define vim.g.terminal_color_{0,17}
   		colors = {                   -- add/modify theme and palette colors
   		    palette = {},
   		    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
   		},
   		overrides = function(colors) -- add/modify highlights
   		    return {}
   		end,
   		theme = "wave",              -- Load "wave" theme
   		background = {               -- map the value of 'background' option to a theme
   		    dark = "dragon",           -- try "dragon" !
   		    light = "lotus"
   		},
	})

	vim.cmd("colorscheme kanagawa")
EOF
