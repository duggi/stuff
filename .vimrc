" Last update: Tue Mar 26 09:34:18 AM Eastern Standard Time 2002

" ===================================================================
" DEFAULT

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
behave mswin


" ===================================================================
" OPTIONS

  set   nobackup
  set   backspace=2
  set   background=dark
" set   cindent
  set   clipboard=unnamed
" set   nodigraph
  set   diffopt+=iwhite
  set   noerrorbells
  set   esckeys
  set   expandtab
  set   formatoptions=cqrt
  set   hidden
  set   hlsearch
  set   noicon
  set   laststatus=2
  set   lazyredraw
" set   errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
" set   errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
  set   modeline modelines=1
" set   path=.,,~/.P/vim,~/.P/vim/runtime/syntax,~/.P/vim/source,$VIM/syntax/
  set   pastetoggle=<F11>
  set   report=0
  set   ruler
  set   shiftwidth=2
  set   shortmess=at
  set   showcmd
  set   showmatch
  set   suffixes=.obj,.pdb
  set   nostartofline
" set   printfont=consolas:h8
  set   printoptions=number:y
  set   splitbelow
  set   tabstop=2
  set   tags=tags;
" set   textwidth=78
  set   title
  set   titleold=duggi
  set   nottybuiltin
  set   viminfo=%,'50,\"100,:100
  set   visualbell
  set   whichwrap=<,>,[,]
  set   wildchar=<TAB>
  set   wildignore+=CVS
  set   wildmenu
  set   wrapmargin=1
  set   nowritebackup
if has("gui_running")
" set   guifont=Dina:h10:cANSI
  set   guifont=Anonymous:h9:cANSI
  set   guioptions+=a
  set   lines=49
  set   list listchars=tab:»·,trail:·,extends:$,precedes:<
  if has("win32")
    set columns=100
  endif
else
  set   list listchars=tab:>.,trail:.,extends:$,precedes:<
endif

if has("win32")
  set   dir=C:\\.tmp
else
" set   dir=~/.tmp
  set   dir=/Users/doug/tmp
  set   grepprg=grep\ -n\ $*\ /dev/null
endif

  let   mapleader=","


" ===================================================================
" DOUG

  set   nocindent
  set   noautoindent
  set   nosmartindent
  filetype indent off
  filetype plugin on
  filetype plugin off
  filetype plugin indent off
  autocmd BufEnter *.py  set et ts=4 sts=4 sw=4
  autocmd BufLeave *.py  set et ts=2 sts=2 sw=2
  map <F5>        :.!date<CR>


" ===================================================================
" JAVA

if has("win32")
  autocmd BufRead *.java set makeprg=C:\Java\apache-ant-1.7.0\bin\ant.bat\ -emacs\ build
  set dictionary=C:/wbin/.vim_keywords
else
  autocmd BufRead *.java set makeprg=ant\ -emacs\ build
  set dictionary=~/.vim_keywords
endif

  " without the -emacs option
  "autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

  " read import statements as paths
  set path=.,./,./src/java/,./src/main/java/
  autocmd BufRead *.java set include=^#\s*import
  autocmd BufRead *.java set includeexpr=substitute(v:fname,'\\.','/','g')
  map gc gdbgf

  "set complete=i,],.,b,w,t,k,.


" ===================================================================
" FOLDING

" set foldmethod=indent
  set foldmethod=marker
" set foldlevel=0
" set foldnestmax=2
" set fillchars=stl:_,stlnc:-,vert:\|,fold:\ ,diff:-
  map <Leader>F :let &fen = !&fen<CR>


" ===================================================================
" PLUGIN VARIABLES

if has("win32")
  let Grep_Cygwin_Find=1 " grep.vim
else
  set grepprg=grep\ -n\ $*\ /dev/null
endif


" ===================================================================
" CHANGE SPACING MODES

map \M <ESC>:set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4 nolist<CR>
map \m <ESC>:set expandtab tabstop=8 softtabstop=2 shiftwidth=2<CR>


" ===================================================================
" AUTOCOMMANDS

if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
    \ if &omnifunc == "" |
    \  setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif


" ===================================================================
" ABBREVIATIONS

  iab YDATE <C-R>=strftime("%a %b %d %X %z %Y")<CR>
  iab VV // vi:noexpandtab:ts=2:nolist
  iab VW <%-- vi:set noexpandtab ts=2 nolist: --%>

" Typos
  iab inlcude       include
  iab typdef        typedef
  iab sxl:          xsl:
  iab cosnt         const
  iab tempalte      template
  iab porperty      property

" Text Typos
  iab teh           the

" Debug
  iab +>            +++++>
  iab ++>           ++++++++++>

" Spelling
  cab asp           :w<CR>:!aspell -e -c %<CR>:e<CR><CR>


" ===================================================================
" COLORIZATION

if has("gui_running")
" color darkrobot
  color desert
else
 if has("win32")
" color astronaut
  color desert
 else
  set t_Co=256
" xterm-16
" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
" let xterm16_colormap    = 'allblue'
" Select brightness: 'low', 'med', 'high', 'default' or custom levels.
" let xterm16_brightness  = 'default'
" color xterm16
" color xoria256
  color desert
 endif
endif


" ===================================================================
" MAPPINGS

" The backslash ('\') is the only(?) unmapped key, so this is the best
" key to start mappings with as this does not take away a command key.
" However, the comma is also a good key to start mappings.

"     ,L  = "Last update" - replace old time stamp with a new one
"           preserving whitespace and using internal "strftime" command:
"           requires the abbreviation  "YDATE"

  map <Leader>L 1G/Last update:\s*/e+1<CR>CYDATE<ESC>
  map <Leader><Leader>L 1G/Last change:\s*/e+1<CR>CYDATE<ESC>

" 'A' (a.vim) plugin mappings
  map <Leader>a :A<cr>

" 'BufExplorer' plugin mappings
map <silent> <unique> <Leader>b :BufExplorer<CR>
"map <silent> <unique> <Leader>bs :SBufExplorer<CR>
"map <silent> <unique> <Leader>bv :VSBufExplorer<CR>
" Allow the . to execute once for each line of a visual selection
  vnoremap . :normal .<CR>

" Tags
  nmap <Leader>t :!(cd %:p:h;ctags *.[ch] *.hpp *.cpp)&

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" if no errors, it closes any open cwindow.
  :command -nargs=* Make make <args> | cwindow 3
  :map <Leader>j :Make<cr>

" GNU id-utils
  map _u :call ID_search()<Bar>execute "/\\<" . g:word . "\\>"<CR>
  map _n :n<Bar>execute "/\\<" . g:word . "\\>"<CR>

  function ID_search()
   let g:word = expand("<cword>")
   let x = system("lid --key=none ". g:word)
   let x = substitute(x, "\n", " ", "g")
   execute "next " . x
  endfun

" Special Keys
  map <C-F4>        :bd<C-M>
  map <C-Tab>       :bn<C-M>
 imap <C-Tab>       <ESC>:bn<C-M>
  map <C-S-Tab>     :bp<C-M>
 imap <C-S-Tab>     <ESC>:bp<C-M>
  map <Leader>k     :wa<C-M>
 imap <Leader>k     <ESC>:wa<C-M>

  map <C-S><C-S>    :set statusline=%<%f%h%m%r%=%o,%l,%c%V\ %P<CR>
  map <C-S><C-T>    :set statusline=%<%f%h%m%r%=%l,%c%V\ %P<CR>

" Retab
  map _R mz:set noet<CR>:set ts=4<CR>:retab!<CR>:set ts=2<CR>:set et<CR>:retab<CR>:set ts=8<CR>:%s/\s\+$//<CR>'z

" Clear trailing spaces
  map _S mz:%s/\s\+$//<CR>'z

" map _N mz:%s/^/\=strpart(line(".")."     ",0,5)'z

" taglist
  nnoremap <silent> <C-F8> :Tlist<CR>

" VCS
  let VCSCommandDisableMappings=1


" ===================================================================
" dbext Connection Profiles

let g:dbext_default_profile_my='type=MYSQL:user=root:passwd='
let g:dbext_default_profile_pg='type=PGSQL:user=postgres:passwd='

" each buffer to have its OWN Result buffer (default is 0)
"let g:dbext_default_use_sep_result_buffer = 1
" size of Result buffer window (default is 5)
let g:dbext_default_buffer_lines = 9

" display command in Result window
let g:dbext_default_display_cmd_line = 1


" ===================================================================
" HTML (UN)ESCAPING

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction

function HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction


" ===================================================================
" ASCII TABLES - YOU MAY NEED THEM SOME DAY
"
" 001005: In need of an ASII table?  Perl is your friend:
"         perl -e 'while($i++<256) { print chr($i); }'
"
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ===================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|
"
" ===================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ===================================================================

