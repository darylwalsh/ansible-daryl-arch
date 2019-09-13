" Colors {{{
syntax enable           " enable syntax processing
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set encoding=UTF-8
set background=dark		" dark background for dark themes
set t_Co=256
set mouse=a
"set background=light    " light background for light themes
" colorscheme gruvbox
" colorscheme srcery
" colorscheme hackerman
colorscheme base16-darktooth
"let g:two_firewatch_italics=1
"colorscheme two-firewatch
"colorscheme ayu
filetype plugin indent on
set clipboard+=unnamedplus
set termguicolors
" }}}
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif
" Misc {{{
set history=1000
set backspace=indent,eol,start
let g:vimwiki_list = [{'path': '~/.wiki/'}]
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set noswapfile
set nobackup
set nowb
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"   \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"   \,sm:block-blinkwait175-blinkoff150-blinkon175et clipboard=unnamed
" }}}
" Spaces & Tabs {{{
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
set tabstop=2           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=2       " 4 space tab
set shiftwidth=2
set modelines=1
filetype indent on
filetype plugin on
set autoindent
set textwidth=80
set formatoptions+=t
set hidden
set splitbelow
" }}}
" UI Layout {{{
set number              " show line numbers
set relativenumber		" show relative line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
" nnoremap j gj
" nnoremap k gk
nnoremap <leader><space> :nohlsearch<CR>
noremap <C-Up> 5k
noremap <C-Down> 5j
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap gV `[v`]
" }}}
" Leader Shortcuts {{{
let mapleader=","		" leader is comma
"inoremap jk <esc>		" jk is escape
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  gg"*yG
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" " buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
nnoremap <silent> <leader>b :Buffers<CR>

" " tab switching
" nnoremap <C-l> gt
" nnoremap <C-h> gT
" nnoremap H gT
" nnoremap L gt

"split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" }}}

" {{{ minpac
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('vimwiki/vimwiki')
call minpac#add('mattn/calendar-vim')

" vimwiki stuff
"" Run multiple wikis
let g:vimwiki_list = [
	\{'path': '~/Documents/VimWiki/personal.wiki'},
 	\{'path': '~/Documents/VimWiki/tech.wiki'}
\]

au BufRead,BufNewFile *.wiki set filetype=vimwiki

:autocmd FileType vimwiki map dn :VimwikiMakeDiaryNote
function! ToggleCalendar()
 execute ":Calendar"
	if exists("g:calendar_open")
		if g:calendar_open == 1
			execute "q"
 			unlet g:calendar_open
	 else
			g:calendar_open = 1
	end
 else
	let g:calendar_open = 1
	end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()
"
" }}}

" {{{ colorschemes
call minpac#add('dunstontc/vim-vscode-theme')
call minpac#add('chriskempson/base16-vim')
call minpac#add('atelierbram/Base2Tone-vim')
call minpac#add('rakr/vim-two-firewatch')
call minpac#add('liuchengxu/space-vim-theme')
call minpac#add('shapeoflambda/dark-purple.vim')
call minpac#add('rhysd/wallaby.vim')
call minpac#add('lithammer/vim-eighties')
call minpac#add('kaicataldo/material.vim')
call minpac#add('maslaral/the-creator.vim')
call minpac#add('sainnhe/edge')
call minpac#add('sainnhe/gruvbox-material')
call minpac#add('vim-scripts/peaksea')
call minpac#add('rafalbromirski/vim-aurora')
call minpac#add('Rigellute/rigel')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('datMaffin/vim-colors-bionik')
call minpac#add('mr-ubik/vim-hackerman-syntax')
call minpac#add('shapeoflambda/dark-purple.vim')
call minpac#add('scottymoon/vim-twilight')
call minpac#add('joshdick/onedark.vim')
" }}}

" {{{
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('vim-airline/vim-airline')
let g:airline_theme='murmur'
"let g:airline_theme='twofirewatch'
let g:airline_powerline_fonts = 1
" }}}

" {{{
call minpac#add('mhinz/vim-mix-format')
call minpac#add('elixir-editors/vim-elixir')
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1
" let g:mix_format_elixir_bin_path = '/home/barko187/.asdf/shims/'
" }}}

" {{{ livedown
call minpac#add('shime/vim-livedown')
nmap gm :LivedownToggle<CR>
let g:livedown_browser = "firefox"
" }}}

call minpac#add('scrooloose/nerdtree')
call minpac#add('scrooloose/nerdcommenter')
map <F3> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['node_modules']
let g:NERDTreeWinSize=15
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBook<Space>
map <leader>nf :NERDTreeFind<cr>
map <F5> :NERDTreeFind<cr>
map <leader>f :NERDTreeFind<cr>
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('tiagofumo/vim-nerdtree-syntax-highlight')
call minpac#add('tpope/vim-surround')
" call minpac#add('janko-m/vim-test')
" nmap <silent> t<C-n> :TestNearest<CR>
" nmap <silent> t<C-f> :TestFile<CR>
" nmap <silent> t<C-s> :TestSuite<CR>
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>

call minpac#add('jiangmiao/auto-pairs')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('metakirby5/codi.vim')
let g:codi#width = 38
let g:ale_elixir_elixir_ls_release = '/home/barko187/elixir-ls'

call minpac#add('wellle/targets.vim')
call minpac#add('Raimondi/delimitMate')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('othree/xml.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('peitalin/vim-jsx-typescript')
call minpac#add('mxw/vim-jsx')
call minpac#add('jelera/vim-javascript-syntax')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('ntpeters/vim-better-whitespace')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('w0rp/ale')
call minpac#add('mattn/webapi-vim')
call minpac#add('ap/vim-css-color')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('Quramy/tsuquyomi')
call minpac#add('tpope/vim-rails')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/gem-browse')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-cucumber')
call minpac#add('tpope/vim-haml')
call minpac#add('hashivim/vim-terraform')
call minpac#add('juliosueiras/vim-terraform-completion')
call minpac#add('tpope/vim-endwise')
call minpac#add('mattn/gist-vim')
"call minpac#add('mattn/webapi-vim')
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'brave-dev %URL% &'
let g:gist_show_privates = 1
let g:gist_get_multiplefile = 1
call minpac#add('godlygeek/tabular')
call minpac#add('plasticboy/vim-markdown')
let g:vim_markdown_fenced_languages = ['javascript','typescript','jsx=js', 'react', 'html', 'python', 'elixir', 'css=css', 'css=sass', 'viml=vim', 'bash=sh', 'ini=dosini', 'fish=sh', 'ansible', 'terraform', 'go', 'rails', 'ruby', 'php','json','sql']

call minpac#add('ternjs/tern_for_vim', {'for': ['javascript', 'javascript.jsx'], 'do': 'npm install'})
call minpac#add('prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] })
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
call minpac#add('mrtazz/simplenote.vim')
call minpac#add('carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] })
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#depths = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'js',
                \ 'tsx',
                \ 'ts',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
call minpac#add('ervandew/supertab')
call minpac#add('Shougo/deoplete.nvim', {'do': 'silent! UpdateRemotePlugins'})
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

call minpac#add('tpope/vim-fugitive')
call minpac#add('pbogut/fzf-mru.vim')
call minpac#add('mboughaba/i3config.vim')

call minpac#add('skywind3000/asyncrun.vim')
call minpac#add('ekalinin/Dockerfile.vim')
call minpac#add('andrewstuart/vim-kubernetes')
call minpac#add('c9s/helper.vim')
call minpac#add('c9s/treemenu.vim')
call minpac#add('c9s/vikube.vim')

call minpac#add('jparise/vim-graphql')
call minpac#add('vim-perl/vim-perl')
call minpac#add('Lokaltog/vim-distinguished')
call minpac#add('morhetz/gruvbox')
call minpac#add('kien/rainbow_parentheses.vim')
call minpac#add('srcery-colors/srcery-vim')
call minpac#add('mhinz/vim-janah')
call minpac#add('w0ng/vim-hybrid')
call minpac#add('mhinz/vim-janah')
call minpac#add('w0ng/vim-hybrid')
call minpac#add('nanotech/jellybeans.vim')
call minpac#add('rakr/vim-one')
call minpac#add('ajh17/Spacegray.vim')
call minpac#add('moll/vim-bbye')
call minpac#add('yardnsm/vim-import-cost')
nnoremap <Leader>q :Bdelete<CR>
call minpac#add('sjl/gundo.vim')
call minpac#add('nathanaelkane/vim-indent-guides')

" {{{
call minpac#add('Vimjas/vim-python-pep8-indent')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('nvie/vim-flake8')
call minpac#add('mitsuhiko/vim-jinja')
call minpac#add('jmcantrell/vim-virtualenv')
" }}}
" {{{
let python_highlight_all=1
"}}}
" {{{
"python with virtualenv support
"py << import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
  "project_base_dir = os.environ['VIRTUAL_ENV']
  "activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  "execfile(activate_this, dict(__file__=activate_this))
"EOF
" }}}
com! PackClean     packadd minpac | source $MYVIMRC | call minpac#clean()
com! PackUpdate    packadd minpac | source $MYVIMRC | call minpac#clean() | call minpac#update()
com! PackListStart packadd minpac | source $MYVIMRC | Capture echo minpac#getpackages("", "start")
com! PackListOpt   packadd minpac | source $MYVIMRC | Capture echo minpac#getpackages("", "opt")
com! PackNameStart packadd minpac | source $MYVIMRC | Capture echo minpac#getpackages("", "start", "", 1)
com! PackNameOpt   packadd minpac | source $MYVIMRC | Capture echo minpac#getpackages("", "opt", "", 1)
command! -nargs=* Wrap set wrap linebreak nolist
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
nnoremap <C-p> :<C-u>FZF<CR>
" nnoremap <F5> :GundoToggle<CR>
nnoremap <F4> :buffers<CR>:buffer<Space>
nnoremap <silent> <leader><Space> :Files<CR>
nnoremap <silent> <leader>ff :FZFMru<CR>
map ff :FZFMru<cr>
 if filereadable('config/routes.rb')
  nnoremap <silent> <leader>cc :Files app/controllers<CR>
  nnoremap <silent> <leader>mm :Files app/models<CR>
  nnoremap <silent> <leader>vv :Files app/views<CR>
 else
  nnoremap <silent> <leader>ss :Files src/<CR>
  nnoremap <silent> <leader>cc :Files src/components<CR>
  nnoremap <silent> <leader>tt :Files src/__tests__/components<CR>
 endif
nnoremap <Tab> <c-w>w
nnoremap <bs> <c-w>W
nnoremap gV `[v`]
nnoremap <leader>u :GundoToggle<CR>
onoremap af :<C-u>normal! ggVG<CR>
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
" Fix JavaScript code with ESlint
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:jsx_ext_required = 0

" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
  \ 'scss': ['sasslint'],
	\ 'javascript': ['eslint'],
  \ 'typescript': ['tsserver', 'typecheck'],
	\ }
let g:ale_fixers = {
       \  'javascript': ['prettier', 'eslint'],
       \  'jsx': ['prettier', 'eslint'],
       \  'flow': ['prettier'],
       \  'typescript': ['prettier', 'eslint'],
       \  'css': ['prettier'],
       \  'less': ['prettier'],
       \  'scss': ['prettier'],
       \  'json': ['prettier'],
       \  'graphql': ['prettier'],
       \  'down': ['prettier'],
       \  'ruby': ['rubocop'],
     \ }

" let g:ale_fixers.javascript = ['eslint']
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:codi#aliases = {
	\ 'javascript.jsx': 'javascript',
	\ }

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options =
	\ '--single-quote --no-semi --trailing-comma es5 --tab-width 2 --print-width 80'


call minpac#add('mattn/emmet-vim')
let g:user_emmet_leader_key=','
call minpac#add('epilande/vim-es2015-snippets')

call minpac#add('epilande/vim-react-snippets')
call minpac#add('SirVer/ultisnips')
call minpac#add('mlaursen/vim-react-snippets')
" autocmd FileType javascript
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
 let g:SuperTabClosePreviewOnPopupClose = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:prettier#config#print_width = 80
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'

let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'

let g:prettier#config#bracket_spacing = 'true'

let g:prettier#config#jsx_bracket_same_line = 'true'

let g:prettier#config#arrow_parens = 'avoid'

let g:prettier#config#trailing_comma = 'es5'

let g:prettier#config#config_precedence = 'prefer-file'

let g:prettier#config#prose_wrap = 'preserve'

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.ts set filetype=typescript.tsx
" {{{ TypeScript JSX syntax theming
hi link xmlEndTag xmlTag

" dark red
hi tsxTagName guifg=#E06C75
hi Tag        ctermfg=04
hi xmlTag     ctermfg=04
hi xmlTagName ctermfg=04
hi xmlEndTag  ctermfg=04
" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
" light-grey
hi tsxTypeBraces guifg=#999999
" dark-grey
hi tsxTypes guifg=#666666
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
" }}}
" {{{ python PEP 8 indentation
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
" }}}
" Full stack development
au BufNewFile,BufRead *.js,*.html,*.css,*.ts,*.tsx,*.jsx set tabstop=2
au BufNewFile,BufRead *.js,*.html,*.css,*.ts,*.tsx,*.jsx set softtabstop=2
au BufNewFile,BufRead *.js,*.html,*.css,*.ts,*.tsx,*.jsx set shiftwidth=2
au BufNewFile,BufRead *.js,*.html,*.css,*.ts,*.tsx,*.jsx set expandtab
au BufNewFile,BufRead *.js,*.html,*.css,*.ts,*.tsx,*.jsx set autoindent
aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Elixir development
au BufNewFile,BufRead *.ex,*.exs,*.ejs set tabstop=2
au BufNewFile,BufRead *.ex,*.exs,*.ejs set softtabstop=2
au BufNewFile,BufRead *.ex,*.exs,*.ejs set shiftwidth=2
au BufNewFile,BufRead *.ex,*.exs,*.ejs set expandtab
au BufNewFile,BufRead *.ex,*.exs,*.ejs set autoindent
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=texmf | endif
