# .vimrc 설정 라인별 설명

> 원본: [amix/vimrc](https://github.com/amix/vimrc) 기반 커스텀 설정

---

## 1-27: 헤더 주석
파일 출처(amix/vimrc)와 섹션 목차를 나열하는 주석 블록.

---

## General (일반 설정)

| 줄 | 코드 | 설명 |
|---|---|---|
| 34 | `set history=500` | 명령어/검색 히스토리를 500개까지 저장 |
| 37 | `filetype plugin on` | 파일 타입별 플러그인 활성화 (예: `.py`면 python 플러그인 로드) |
| 38 | `filetype indent on` | 파일 타입별 들여쓰기 규칙 활성화 |
| 41 | `set autoread` | 외부에서 파일이 변경되면 자동으로 다시 읽기 |
| 42 | `au FocusGained,BufEnter * silent! checktime` | vim에 포커스가 돌아오거나 버퍼 진입 시 파일 변경 여부 체크 |
| 46 | `let mapleader = ","` | 리더 키를 `,`로 설정. `<leader>w` → `,w` |
| 49 | `nmap <leader>w :w!<cr>` | `,w`로 강제 저장 (노멀 모드) |
| 53 | `command! W execute 'w !sudo tee % > /dev/null' <bar> edit!` | `:W`로 sudo 권한 저장 (권한 없는 파일 수정 시 유용) |

---

## VIM User Interface (UI 설정)

| 줄 | 코드 | 설명 |
|---|---|---|
| 60 | `set so=7` | `scrolloff=7`. 커서 위아래로 항상 7줄 여유 공간 유지 |
| 63 | `let $LANG='en'` | 환경 언어를 영어로 설정 |
| 64 | `set langmenu=en` | 메뉴 언어를 영어로 설정 |
| 65 | `source $VIMRUNTIME/delmenu.vim` | 기존 메뉴 삭제 (중국어 깨짐 방지) |
| 66 | `source $VIMRUNTIME/menu.vim` | 영어 메뉴 다시 로드 |
| 69 | `set wildmenu` | 명령줄에서 Tab 자동완성 시 후보 메뉴 표시 |
| 72 | `set wildignore=*.o,*~,*.pyc` | 자동완성에서 제외할 파일 패턴 |
| 73-77 | `if has("win16")...` | OS별 wildignore 추가 (`.git`, `.hg`, `.svn`, `.DS_Store`) |
| 80 | `set ruler` | 하단 상태줄에 커서 위치(줄:칼럼) 표시 |
| 83 | `set cmdheight=1` | 명령줄 높이를 1줄로 설정 |
| 86 | `set hid` | `hidden`. 버퍼 전환 시 저장하지 않아도 숨기기 허용 |
| 89 | `set backspace=eol,start,indent` | Backspace가 줄끝(eol), 삽입시작점(start), 들여쓰기(indent)를 넘어서 삭제 가능 |
| 92 | `set ignorecase` | 검색 시 대소문자 무시 |
| 95 | `set smartcase` | 검색어에 대문자가 포함되면 대소문자 구분 (ignorecase와 함께 사용) |
| 98 | `set hlsearch` | 검색 결과를 하이라이트 표시 |
| 101 | `set incsearch` | 타이핑하면서 실시간으로 검색 결과 표시 (incremental search) |
| 104 | `set lazyredraw` | 매크로 실행 중 화면 갱신 안 함 (성능 향상) |
| 107 | `set magic` | 정규식에서 매직 모드 활성화 (특수문자가 기본적으로 정규식 의미를 가짐) |
| 110 | `set showmatch` | 괄호 입력 시 매칭되는 괄호를 잠깐 표시 |
| 113 | `set mat=2` | `matchtime=2`. 매칭 괄호 표시 시간 0.2초 |
| 116 | `set noerrorbells` | 에러 시 비프음 끄기 |
| 117 | `set novisualbell` | 에러 시 화면 깜빡임 끄기 |
| 118 | `set t_vb=` | 비주얼 벨 터미널 코드를 빈 값으로 (완전 비활성화) |
| 119 | `set tm=500` | `timeoutlen=500`. 키 매핑 입력 대기 시간 500ms |
| 122-124 | `if has("gui_macvim")...` | MacVim에서 GUI 진입 시 비주얼 벨 완전 비활성화 |
| 127 | `set foldcolumn=1` | 왼쪽에 코드 접기(fold) 표시 칼럼 1칸 추가 |

---

## Colors and Fonts (색상/폰트)

| 줄 | 코드 | 설명 |
|---|---|---|
| 134 | `syntax enable` | 구문 하이라이팅 활성화 |
| 137 | `set regexpengine=0` | 정규식 엔진 자동 선택 (0=자동, 1=old, 2=NFA) |
| 140-142 | `if $COLORTERM == 'gnome-terminal'...` | Gnome 터미널에서 256색 활성화 |
| 144-147 | `try colorscheme desert catch endtry` | desert 컬러 스킴 적용 (없으면 무시) |
| 149 | `set background=dark` | 어두운 배경 테마 사용 |
| 152-157 | `if has("gui_running")...` | GUI 모드 옵션: 툴바 숨기기, 256색, 탭 라벨 포맷 |
| 160 | `set encoding=utf8` | 내부 인코딩을 UTF-8로 설정 |
| 163 | `set ffs=unix,dos,mac` | 파일 포맷 감지 우선순위: Unix → DOS → Mac |

---

## Files, backups and undo (파일/백업)

| 줄 | 코드 | 설명 |
|---|---|---|
| 170 | `set nobackup` | 백업 파일(`~`) 생성 안 함 |
| 171 | `set nowb` | 쓰기 전 백업 파일 생성 안 함 |
| 172 | `set noswapfile` | 스왑 파일(`.swp`) 생성 안 함 |

---

## Text, tab and indent (텍스트/탭/들여쓰기)

| 줄 | 코드 | 설명 |
|---|---|---|
| 179 | `set expandtab` | Tab 키 입력 시 스페이스로 변환 |
| 182 | `set smarttab` | 줄 시작에서 Tab 누르면 `shiftwidth`만큼, 그 외에는 `tabstop`만큼 삽입 |
| 185 | `set shiftwidth=2` | 들여쓰기(`>>`, `<<`) 시 2칸 |
| 186 | `set tabstop=2` | 탭 문자를 2칸으로 표시 |
| 189 | `set lbr` | `linebreak`. 화면 줄바꿈 시 단어 단위로 끊기 (단어 중간에서 안 끊김) |
| 190 | `set tw=500` | `textwidth=500`. 500자 넘으면 자동 줄바꿈 (실질적으로 비활성화 수준) |
| 192 | `set ai` | `autoindent`. 새 줄에서 이전 줄의 들여쓰기 유지 |
| 193 | `set si` | `smartindent`. `{`, `}` 등에 맞춰 자동 들여쓰기 |
| 194 | `set wrap` | 긴 줄을 화면에서 접어서 표시 (실제 줄바꿈은 아님) |

---

## Visual mode related (비주얼 모드)

| 줄 | 코드 | 설명 |
|---|---|---|
| 202 | `vnoremap <silent> * ...` | 비주얼 모드에서 `*` 누르면 선택한 텍스트를 앞으로 검색 |
| 203 | `vnoremap <silent> # ...` | 비주얼 모드에서 `#` 누르면 선택한 텍스트를 뒤로 검색 |

---

## Moving around, tabs, windows and buffers (이동/탭/창/버퍼)

| 줄 | 코드 | 설명 |
|---|---|---|
| 210 | `map <space> /` | Space로 검색(`/`) 시작 |
| 211 | `map <C-space> ?` | Ctrl+Space로 역방향 검색(`?`) 시작 |
| 214 | `map <silent> <leader><cr> :noh<cr>` | `,Enter`로 검색 하이라이트 끄기 |
| 217 | `map <C-j> <C-W>j` | Ctrl+j로 아래 창으로 이동 |
| 218 | `map <C-k> <C-W>k` | Ctrl+k로 위 창으로 이동 |
| 219 | `map <C-h> <C-W>h` | Ctrl+h로 왼쪽 창으로 이동 |
| 220 | `map <C-l> <C-W>l` | Ctrl+l로 오른쪽 창으로 이동 |
| 223 | `map <leader>bd :Bclose<cr>:tabclose<cr>gT` | `,bd`로 현재 버퍼 닫고 탭도 닫기 |
| 226 | `map <leader>ba :bufdo bd<cr>` | `,ba`로 모든 버퍼 닫기 |
| 228 | `map <leader>l :bnext<cr>` | `,l`로 다음 버퍼 |
| 229 | `map <leader>h :bprevious<cr>` | `,h`로 이전 버퍼 |
| 232 | `map <leader>tn :tabnew<cr>` | `,tn`으로 새 탭 |
| 233 | `map <leader>to :tabonly<cr>` | `,to`로 현재 탭만 남기고 나머지 닫기 |
| 234 | `map <leader>tc :tabclose<cr>` | `,tc`로 현재 탭 닫기 |
| 235 | `map <leader>tm :tabmove` | `,tm`으로 탭 위치 이동 |
| 236 | `map <leader>t<leader> :tabnext<cr>` | `,t,`로 다음 탭 |
| 239-241 | `let g:lasttab = 1 ...` | `,tl`로 마지막으로 사용한 탭과 토글 |
| 246 | `map <leader>te :tabedit ...` | `,te`로 현재 파일 디렉토리에서 새 탭으로 파일 열기 |
| 249 | `map <leader>cd :cd %:p:h<cr>:pwd<cr>` | `,cd`로 현재 파일 디렉토리를 작업 디렉토리로 변경 |
| 252-256 | `set switchbuf=useopen,usetab,newtab` | 버퍼 전환 시 이미 열린 창/탭 재사용, 없으면 새 탭 |
| 254 | `set stal=2` | `showtabline=2`. 탭 라인을 항상 표시 |
| 259 | `au BufReadPost * ...` | 파일 열 때 마지막 편집 위치로 커서 복원 |

---

## Status line (상태줄)

| 줄 | 코드 | 설명 |
|---|---|---|
| 266 | `set laststatus=2` | 상태줄을 항상 표시 (0=안보임, 1=창2개이상, 2=항상) |
| 269 | `set statusline=...` | 상태줄 포맷: `[PASTE MODE] 파일명 [수정/읽기전용] CWD: 경로  Line: 줄  Column: 칸` |

---

## Editing mappings (편집 키 매핑)

| 줄 | 코드 | 설명 |
|---|---|---|
| 276 | `map 0 ^` | `0` 키로 줄의 첫 번째 비공백 문자로 이동 (원래 `^`의 동작) |
| 279 | `nmap <M-j> mz:m+<cr>\`z` | Alt+j로 현재 줄을 아래로 이동 |
| 280 | `nmap <M-k> mz:m-2<cr>\`z` | Alt+k로 현재 줄을 위로 이동 |
| 281 | `vmap <M-j> ...` | 비주얼 모드에서 Alt+j로 선택 블록을 아래로 이동 |
| 282 | `vmap <M-k> ...` | 비주얼 모드에서 Alt+k로 선택 블록을 위로 이동 |
| 284-289 | `if has("mac")...` | macOS에서 Cmd+j/k도 같은 동작으로 매핑 |
| 292-298 | `fun! CleanExtraSpaces()...` | 후행 공백 제거 함수 (커서 위치와 검색 레지스터 보존) |
| 300-302 | `autocmd BufWritePre ...` | `.txt`, `.js`, `.py`, `.wiki`, `.sh`, `.coffee` 저장 시 후행 공백 자동 제거 |

---

## Spell checking (맞춤법 검사)

| 줄 | 코드 | 설명 |
|---|---|---|
| 309 | `map <leader>ss :setlocal spell!<cr>` | `,ss`로 맞춤법 검사 토글 |
| 312 | `map <leader>sn ]s` | `,sn`으로 다음 오타로 이동 |
| 313 | `map <leader>sp [s` | `,sp`로 이전 오타로 이동 |
| 314 | `map <leader>sa zg` | `,sa`로 단어를 사전에 추가 (good word) |
| 315 | `map <leader>s? z=` | `,s?`로 수정 제안 목록 표시 |

---

## Misc (기타)

| 줄 | 코드 | 설명 |
|---|---|---|
| 322 | `noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm` | `,m`으로 Windows 줄바꿈 문자(`^M`) 일괄 제거 |
| 325 | `map <leader>q :e ~/buffer<cr>` | `,q`로 `~/buffer` 파일을 스크래치 버퍼로 열기 |
| 328 | `map <leader>x :e ~/buffer.md<cr>` | `,x`로 `~/buffer.md` 파일을 마크다운 스크래치로 열기 |
| 331 | `map <leader>pp :setlocal paste!<cr>` | `,pp`로 붙여넣기 모드 토글 (자동 들여쓰기 방지) |
| 335 | `autocmd FileType gitcommit setlocal textwidth=0` | Git commit 메시지 편집 시 자동 줄바꿈 비활성화 |

---

## Helper functions (도우미 함수)

| 줄 | 함수 | 설명 |
|---|---|---|
| 342-347 | `HasPaste()` | 붙여넣기 모드 활성화 여부 반환. 상태줄에서 `PASTE MODE` 표시에 사용 |
| 350-368 | `Bclose` / `BufcloseCloseIt()` | 창을 닫지 않고 현재 버퍼만 삭제. 대체 버퍼가 있으면 전환, 없으면 새 버퍼 생성 |
| 370-372 | `CmdLine(str)` | 명령줄에 문자열을 입력하는 헬퍼 (VisualSelection에서 사용) |
| 374-389 | `VisualSelection(direction, extra_filter)` | 비주얼 모드 선택 텍스트를 검색 패턴으로 설정. `*`/`#` 매핑과 Ack 검색에 사용 |
