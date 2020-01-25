# Neovim Configurations.

I raise my productivity multiple times with Vim and was inspired and influenced by Ben Awad's [video](https://youtu.be/gnupOrSEikQ).

Here I explain some of my configurations. Go to configuration [ginit.vim](https://github.com/guandjoy/my-nvim-setup/blob/master/ginit.vim) file for more details.

## Main package is [coc.nvim](https://github.com/neoclide/coc.nvim)

Coc is a powerful package that makes vim work like VSCode. It has own [extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) inside. Here is what I pick.
```vim
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
  \ 
```

## [coc-exporer](https://github.com/weirongxu/coc-explorer) – drawer for the project.

IMHO so far the best project tree extension. Bind to open on `ctrl-n`:

```vim
" coc-explorer
nmap <C-n> :CocCommand explorer<CR>
```

## [FZF](https://github.com/junegunn/fzf.vim) – fuzzy finder

FZF is not just a package for vim. It is a powerful command-line tool. Try it!

Bind to search files on `ctrl-p`:

```vim
" FZF
nmap <C-p> :Files<CR>
```

## [Wintabs](https://github.com/zefei/vim-wintabs) – manage buffers and tabs

Wintabs, as I understand, is the only extension that manages both buffers and tabs. Both are useful, but it takes some time to adjust them to your workflow.

Here is my navigation bindings:
```vim
" Wintab navigate buffers
map <A-h> <Plug>(wintabs_previous)
map <A-l> <Plug>(wintabs_next)
map <A-w> <Plug>(wintabs_close)
" Navigate tabs
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>
```

## [Vim Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)

I use it to navigate between splits with `ctrl-h/j/k/l` keys, instead of standard `ctrl-w` and `hjkl` direction.

## Font

To use icons in your project tree, you should use fonts with NerdFort support. You can pick your favorite [here](https://www.nerdfonts.com/)

But I used to the standard Windows Consolas font which I downloaded from [here](https://github.com/whitecolor/my-nerd-fonts/tree/master/Consolas%20NF)

```vim
" Font
GuiFont! Consolas\ NF:h11
```

## Theme

It was not easy to find the best theme. From my experience, the best theme is the one that could highlight objects in React projects. I was lucky to find [one](https://github.com/rakr/vim-one) theme.

```vim
set background=dark
colorscheme one
let g:airline_theme='one'
```

## Vim commentary

I use React, so it is crucial to comment rjx files. [vim-commentary](https://github.com/rakr/vim-one) handle it well. Not perfect as VS Code, but better than nothing

```vim
" Comment/Uncommentd "ctrl-/"
xmap <C-/> <Plug>Commentary
nmap <C-/> <Plug>CommentaryLine
```

## Highlight customization for `one` theme:

Coc code highlighting customization:
```vim
" highlight link CocHighlightText Visual
highlight CursorColumn ctermbg=16 gui=underline guisp=#454C5E
highlight CocWarningHighlight ctermfg=Yellow gui=undercurl guisp=Yellow
highlight link CocInfoHighlight JavaScriptBraces
highlight link CocErrorHighlight Error
highlight CocHintHighlight ctermfg=Red  guifg=Red
```

Add contrast to wintabs:

```vim
" Tabline
highlight TablineFill ctermfg=59 ctermbg=17 guifg=#748CB7 guibg=#3e4452
```

## Rename on F2

Coc provides rename feature similar to VSCode

```vim
" Rename as VSCode
nmap <F2> <Plug>(coc-rename)
```

# ... and many more minor features. Copy them from [ginit.vim](./ginit.vim) file.

