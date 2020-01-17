call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'terryma/vim-multiple-cursors'
" Plug 'tpope/vim-obsession' " Sessions handler
" Plug 'mhinz/vim-startify' " Starter

" Git
Plug 'tpope/vim-fugitive'

" Statusline/tablines
Plug 'vim-airline/vim-airline'
Plug 'zefei/vim-wintabs'
" Plug 'zefei/vim-wintabs-powerline'
" Plug 'mkitt/tabline.vim'
"Plug 'itchyny/lightline.vim' " statusline/tabline

" Fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
" Plug 'mileszs/ack.vim'
Plug 'Yggdroot/LeaderF'

" Commenting
Plug 'tpope/vim-commentary' " Support JSX

" Highlight syntax
Plug 'sheerun/vim-polyglot'
" Plug 'dominikduda/vim_current_word'
"Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
"Plug 'pangloss/vim-javascript'
"Plug 'maxmellon/vim-jsx-pretty'

 "Simulating smooth scroll motions 
Plug 'terryma/vim-smooth-scroll'
"Plug 'yuttie/comfortable-motion.vim' " not working for some reason

Plug 'tpope/vim-surround' " wrap text with something
Plug 'fszymanski/deoplete-emoji', {'for': 'markdown'} " Emoji

" Linting
" Plug 'dense-analysis/ale'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'rakr/vim-one'
call plug#end()

" Themes
"colorscheme onehalfdark
" colorscheme onedark

set background=dark
colorscheme one
let g:airline_theme='one'

" General settings
syntax on
set mouse=a " Enable copy and paste with ctrl-c/v
source $VIMRUNTIME/mswin.vim
set encoding=UTF-8
set number
autocmd FileType netrw setl bufhidden=delete

" Font
" GuiFont! FuraCode\ NF:h11
" GuiFont! Iosevka\ NF:h12
GuiFont! Consolas\ NF:h11

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

" Maps
inoremap jj <Esc>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <esc> :noh<return><esc> 
" Comment/Uncommentd "ctrl-/"
" vmap <C-/> <plug>NERDCommenterToggle
" nmap <C-/> <plug>NERDCommenterToggle
xmap <C-/> <Plug>Commentary
nmap <C-/> <Plug>CommentaryLine
" Move lines up/down. Alternative to alt+up/down from VSCode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>
" Paste with shift insert
inoremap <silent>  <S-Insert>  <C-R>+
" ESLint
nmap <S-f> <Plug>(coc-codeaction)
" Rename as VSCode
nmap <F2> <Plug>(coc-rename)
" Tabs Navigation
" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>
" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>
" Wintab navigate
map <A-h> <Plug>(wintabs_previous)
map <A-l> <Plug>(wintabs_next)
map <A-w> <Plug>(wintabs_close)
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
" coc-explorer
nmap <C-n> :CocCommand explorer<CR>
" autocmd User CocNvimInit :CocCommand explorer " autostart

" Vim multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" Airline
GuiTabline 0
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#formatter = 'jsformatter'
" enable/disable displaying buffers with a single tab. (c) >
let g:airline#extensions#tabline#show_buffers = 1
" enable/disable displaying tabs, regardless of number. (c) >
let g:airline#extensions#tabline#show_tabs = 1
" Tabline
" let g:tablineclosebutton=1
" let g:wintabs_display = 'statusline'

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

" coc extentions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-svg',
  \ 'coc-css',
  \ 'coc-yank',
  \ 'coc-explorer',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden 
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorMoved * silent call CocActionAsync('highlight')

" highlight link CocHighlightText Visual
highlight CursorColumn ctermbg=16 gui=underline guisp=#454C5E
highlight CocWarningHighlight ctermfg=Yellow gui=undercurl guisp=Yellow
highlight link CocInfoHighlight JavaScriptBraces
highlight link CocErrorHighlight Error
highlight CocHintHighlight ctermfg=Red  guifg=Red

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
