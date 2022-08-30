" vim config inspired by https://github.com/jonhoo/configs/blob/master/editor/.config/nvim/init.vim

let mapleader = "\<Space>"

" ==============================================================================
" # PLUGINS
" ==============================================================================

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'psf/black', { 'tag': '*' }

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
"Plug 'rhysd/vim-clang-format'
"Plug 'fatih/vim-go'
"Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'uarun/vim-protobuf'
Plug 'Vimjas/vim-python-pep8-indent'

" colorschemes
Plug 'altercation/vim-colors-solarized'
"Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()


" coc.nvim extensions
let g:coc_global_extensions = [
    \"coc-pyright",
    \"coc-go",
    \"coc-rust-analyzer",
    \"coc-sh",
    \"coc-html",
    \"coc-css",
    \"coc-tsserver",
    \"coc-json",
    \]

if has('nvim')
    " set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
end


" deal with colors
if !has('gui_running')
  set t_Co=256
endif

if exists('+termguicolors')
  set termguicolors
endif

" if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
"     " screen does not (yet) support truecolor
"     set termguicolors
" endif

" solarized
" set background=dark
" colorscheme solarized
" hi SignColumn ctermbg=black ctermfg=red
" hi VertSplit ctermbg=black ctermfg=black
" hi Normal ctermbg=NONE

" onehalf-dark
set background=dark
colorscheme onehalfdark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]


    " \ 'colorscheme': 'solarized',
let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \   'cocstatus': 'coc#status'
    \ },
    \ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


" Javascript
let javaScript_fold=0

" Latex
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

" Fortran
let fortran_free_source=1
let fortran_do_enddo=1

" Open hotkeys
map <C-p> :Files<CR>
map <leader>o :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>

" Close hotkeys
nmap <leader>q :q<CR>

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Completion
" Better display for messages
" set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000
set updatetime=300


" ==============================================================================
" # Editor Settings
" ==============================================================================
set autoindent
set timeoutlen=300
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions+=duplex:off,number:y,paper:a4
set signcolumn=yes

" Sane splits
set splitbelow
set splitright

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildignore+=__pycache__,*.pyc,*.pyo
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*.o,*.out,*.exe,*.dll,*.so
set wildignore+=*.sw?  " vim swap files
set wildignore+=target

" Use wide tabs
"set shiftwidth=8
"set softtabstop=8
"set tabstop=8
"set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
"set gdefault

" Search results centered please!
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/


" ==============================================================================
" # GUI Settings
" ==============================================================================
set guioptions-=m   " remove menu bar
set guioptions-=T   " remove toolbar
set guioptions-=r   " remove scrollbar
set vb t_vb=        " no more beeps
set backspace=2     " backspace over newlines
set nofoldenable
set ttyfast
"set lazyredraw
set synmaxcol=500
set laststatus=2
set number
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set colorcolumn=80,88
set showcmd
set mouse=a
set shortmess+=c
set shortmess+=l
set ruler

set autowrite
set cursorline
set hlsearch
set confirm
set path+=**
let g:loaded_matchparen = 1

set linebreak
set modeline
set history=1000
set completeopt-=preview
set listchars=nbsp:¬,tab:>-,trail:•,extends:»,precedes:«

" Switch between to beam in Insert and block in Normal modes
if !has('nvim') && !has('gui_running') "&& $TERM =~# '^xterm'
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif


" ==============================================================================
" # Keyboard shortcuts
" ==============================================================================
" shitty shift
nnoremap ; :
command! Q q
command! W w

" Ctrl+L to stop search highlights
nnoremap <C-l> :nohlsearch<CR>

" Copy & paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" No arrow keys --- force yourself to use the home row
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" " Left and right can move buffers
" nnoremap <left> :bp<CR>
" nnoremap <right> :bn<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 'Smart' nevigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Use Ctrl+Space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" <leader>, shows/hides hidden characters
" nnoremap <leader>, :set invlist<CR>

" Disable F1
map <F1> <ESC>
imap <F1> <ESC>


" ==============================================================================
" # PLUGINS
" ==============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Indent for filetypes
autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType rust set colorcolumn=100
autocmd FileType rust nnoremap <buffer> <leader>r :Cargo run<CR>
autocmd FileType rust nnoremap <buffer> <leader>b :Cargo build<CR>

" Help filetype detection
autocmd BufRead *.md set filetype=markdown

" black auto-format python code
" autocmd BufWritePre *.py execute ':Black'


let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
