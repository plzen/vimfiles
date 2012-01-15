"=============================================================================
" Description: Vim config
" Author: Nikolay Voronin <nickvor@gmail.com>
" URL: http://github.com/plzen/vimrc/
"=============================================================================

" Vundle setup
    set nocompatible " be iMproved
    filetype off     " required!

    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'
    
    " My Bundles here:
    " NOTE: comments after Bundle command are not allowed...
    "
    " Interface
        Bundle 'scrooloose/nerdtree'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'rygwdn/ultisnips'
        Bundle 'vim-scripts/bufexplorer.zip'
        Bundle 'vim-scripts/taglist.vim'
        Bundle 'altercation/vim-colors-solarized'

    filetype plugin indent on     " required!
    " Brief help
    " :BundleList          - list configured bundles
    " :BundleInstall(!)    - install(update) bundles
    " :BundleSearch(!) foo - search(or refresh cache first) for foo
    " :BundleClean(!)      - confirm(or auto-ap prove) removal of unused bundles
    " see :h vundle for more details or wiki for FAQ




" Interface
    set nonumber                  " Не показываем нумерацию строк
                                  " Во-первых, номер текущей строки всегда
                                  " есть в statusline, во-вторых, всегда можно
                                  " быстро перейти к нужной строке набрав :1
                                  " где 1 — номер строки.

    set encoding=utf-8            " character encoding used inside Vim.
    set fileencodings=utf8,cp1251 " Возможные кодировки файлов и последовательность определения
    set wildmenu " Саджест по <tab> в командной строке
                 " When 'wildmenu' is on, command-line completion operates in an enhanced
                 " mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
                 " the possible matches are shown just above the command line, with the
                 " first match highlighted (overwriting the status line, if there is
                 " one).
    set wildignore+=.hg,.git,.svn " Version control
    set wildignore+=*.pyc         " Python byte code
    set title    " window title
                 " the title of the window will be set to the value of 'titlestring'
                 " (if it is not empty), or to: filename [+=-] (path) - VIM
    set showcmd  " Show (partial) command in the last line of the screen
                 " Set this option off if your terminal is slow.
                 " In Visual mode the size of the selected area is shown:
                 " - When selecting characters within a line, the number of characters.
                 "   If the number of bytes is different it is also displayed: "2-6"
                 "   means two characters and six bytes.
                 " - When selecting more than one line, the number of lines.
                 " - When selecting a block, the size in screen characters:
                 "   {lines}x{columns}.
    " set scrolljump=5
    " set scrolloff=3
    set scrolloff=999       " focus mode like in Writer app http://www.iawriter.com/
    set showtabline=1       " Показывать табы всегда
    " set list                " display unprintable characters
    set wrap                " Включаем перенос строк (http://vimcasts.org/episodes/soft-wrapping-text/)
    if version >= 703
        set colorcolumn=80 " Подсвечиваем 80 столбец
    end
    set textwidth=80
    set formatoptions-=o    " dont continue comments when pushing o/O
    set linebreak           " Перенос не разрывая слов
    set autoindent          " Копирует отступ от предыдущей строки
    set smartindent         " Включаем 'умную' автоматическую расстановку отступов
    set expandtab
    set shiftwidth=4        " Размер сдвига при нажатии на клавиши << и >>
    set tabstop=4           " Размер табуляции
    set softtabstop=4
    set linespace=1         " add some line space for easy reading
    set cursorline          " Подсветка строки, в которой находится в данный момент курсор
    " set gcr=n:blinkon0      " Отключаем мигание курсора в MacVim. Больше никакого стресса.
    set guioptions=         " Вырубаем все лишнее из ГУИ, если надо потогглить см <F6>
    set t_Co=256            " Кол-во цветов
    set guicursor=          " Отключаем мигание курсора
    set splitbelow          " новый сплит будет ниже текущего :sp
    set splitright          " новый сплит будет правее текущего :vsp
    set shortmess+=I        " не показывать intro screen
    set mouseshape=s:udsizing,m:no " turn to a sizing arrow over the status lines
    set mousehide " Hide the mouse when typing text

    set hidden " this allows to edit several files in the same time without having to save them

    " Не бибикать!
        set visualbell " Use visual bell instead of beeping
        set t_vb=

    " Символ табуляции и конца строки
        if has('multi_byte')
            if version >= 700
                set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
            else
                set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
            endif
        endif

    " Символ, который будет показан перед перенесенной строкой
        if has("linebreak")
              let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
        endif


    " Приводим в порядок status line

        function! FileSize()
            let bytes = getfsize(expand("%:p"))
            if bytes <= 0
                return ""
            endif
            if bytes < 1024
                return bytes . "B"
            else
                return (bytes / 1024) . "K"
            endif
        endfunction

        function! CurDir()
            let curdir = substitute(expand('%:p'), '/home/miripiruni', '~', 'g')
            return curdir
        endfunction

        set laststatus=2
        set statusline=\ 
        set statusline+=%n:\                 " buffer number
        set statusline+=%t                   " filename with full path
        set statusline+=%m                   " modified flag
        set statusline+=\ \ 
        set statusline+=%{&paste?'[paste]\ ':''}
        set statusline+=%{&fileencoding}
        set statusline+=\ \ %Y               " type of file
        set statusline+=\ %3.3(%c%)          " column number
        set statusline+=\ \ %3.9(%l/%L%)     " line / total lines
        set statusline+=\ \ %2.3p%%          " percentage through file in lines
        set statusline+=\ \ %{FileSize()}
        set statusline+=%<                   " where truncate if line too long
        set statusline+=\ \ CurDir:%{CurDir()}





    " Show the line and column number of the cursor position
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

    " Создаем меню с кодировками
        menu Encoding.UTF-8 :e ++enc=utf8 <CR>
        menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
        menu Encoding.koi8-r :e ++enc=koi8-r<CR>
        menu Encoding.cp866 :e ++enc=cp866<CR>

    " Проверка орфографии
        if version >= 700
            set spell spelllang= 
            set nospell " По умолчанию проверка орфографии выключена
            menu Spell.off :setlocal spell spelllang= <cr>
            menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
            menu Spell.Russian :setlocal spell spelllang=ru <cr>
            menu Spell.English :setlocal spell spelllang=en <cr>
            menu Spell.-SpellControl- :
            menu Spell.Word\ Suggest<Tab>z= z=
            menu Spell.Previous\ Wrong\ Word<Tab>[s [s
            menu Spell.Next\ Wrong\ Word<Tab>]s ]s
        endif

    " Фолдинг
        " Всё, что нужно знать для начала:
        " za - скрыть/открыть текущую складку.
        " {zR, zM} - {открыть, скрыть} все складки.
        " from https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
        function! MyFoldText()
            let line = getline(v:foldstart)

            let nucolwidth = &fdc + &number * &numberwidth
            let windowwidth = winwidth(0) - nucolwidth - 3
            let foldedlinecount = v:foldend - v:foldstart

            " expand tabs into spaces
            let onetab = strpart(' ', 0, &tabstop)
            let line = substitute(line, '\t', onetab, 'g')

            let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
            let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
            return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
        endfunction
        set foldtext=MyFoldText()

        set foldcolumn=0        " Ширина строки где располагается фолдинг
        set foldmethod=indent   " Фолдинг по отступам
        set foldnestmax=10      " Глубина фолдинга 10 уровней
        set nofoldenable        " Не фолдить по умолчанию
        set foldlevel=1         " This is just what i use
        set fillchars="fold: "  " remove the extrafills --------

    " Не показывать парную скобку
        let loaded_matchparen=1 " перестает прыгать на парную скобку, показывая где она. +100 к скорости
        set noshowmatch " Не показывать парные <> в HTML

" Search
    set incsearch   " При поиске перескакивать на найденный текст в процессе набора строки
    set hlsearch    " Включаем подсветку выражения, которое ищется в тексте
    set ignorecase  " Игнорировать регистр букв при поиске
    set smartcase   " Override the 'ignorecase' if the search pattern contains upper case characters
    set gdefault    " Включает флаг g в командах замены, типа :%s/a/b/


" Environment
    set history=1000 " store lots of :cmdline history
    "cmap w!! %!sudo tee > /dev/null % " save file with root permissions"
    command! W exec 'w !sudo tee % > /dev/null' | e!

    " Backspacing settings
        " start     allow backspacing over the start of insert;
        "           CTRL-W and CTRL-U stop once at the start of insert.
        " indent    allow backspacing over autoindent
        " eol       allow backspacing over line breaks (join lines)
        set backspace=indent,eol,start

    " Backup и swp файлы
        set backupdir=~/.vim/bac//,/tmp " Директория для backup файлов
        set directory=~/.vim/swp//,/tmp " Директория для swp файлов

    " Загрузка предыдущей сессии
        set viminfo='10,\"100,:20,%,n~/.viminfo
        " Устанавливаем курсор в файле на место, где он был при закрытии этого файла
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " AutoReload .vimrc
        " from http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
        " Source the vimrc file after saving it
        if has("autocmd")
          autocmd! bufwritepost .vimrc source $MYVIMRC
        endif

    " Auto change the directory to the current file I'm working on
        autocmd BufEnter * lcd %:p:h

    " Актуально только для MacVim
        " Save on losing focus
            autocmd FocusLost * :wa

        " Resize splits when the window is resized
            au VimResized * exe "normal! \<c-w>="

" Плагины

    " NERDTree
        nmap <F2> :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

    " UltiSnips
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
        let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

    " BufExplorer
        nmap <F1> :BufExplorer<CR>

    " Taglist
        nmap <F3> :TlistToggle<CR>
        let Tlist_Compact_Format = 1
        let Tlist_Enable_Fold_Column = 0
        let Tlist_Exit_OnlyWindow = 0
        let Tlist_WinWidth = 35
        let tlist_php_settings = 'php;c:class;f:Functions'
        let Tlist_Use_Right_Window=1
        let Tlist_GainFocus_On_ToggleOpen = 1
        let Tlist_Display_Tag_Scope = 1
        let Tlist_Process_File_Always = 1
        let Tlist_Show_One_File = 1

    " Solarized
        syntax enable
        let g:solarized_termcolors=256
        set background=dark
        try
            colorscheme solarized
        catch /^Vim\%((\a\+)\)\=:E185/
            echo "Solarized theme not found. Run :BundleInstall"
        endtry

        try
            call togglebg#map("<Leader>b")
        catch /^Vim\%((\a\+)\)\=:E117/
            " :(
        endtry

