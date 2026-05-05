-- ------------------------------
-- 文字コードとファイルの設定
-- ------------------------------
-- 読み込むファイルの改行コード形式を指定（優先順位順）
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
-- 新規ファイル保存時のエンコーディングをUTF-8に設定
vim.opt.fileencoding = 'utf-8'
-- ファイル読み込み時のエンコーディング候補を指定
vim.opt.fileencodings = { 'utf-8', 'iso-2022-jp', 'euc-jp', 'sjis' }
-- ------------------------------
-- カラースキームと表示の設定
-- ------------------------------
-- 背景色をダークモードに設定（カラースキームに影響）
vim.opt.background = 'dark'
-- ------------------------------
-- 検索関連の設定
-- ------------------------------
-- インクリメンタルサーチを有効化（検索文字列入力中にマッチをハイライト）
vim.opt.incsearch = true
-- 検索時に大文字・小文字を無視
vim.opt.ignorecase = true
-- 検索結果をハイライト表示
vim.opt.hlsearch = true

-- ------------------------------
-- カーソルと行番号の設定
-- ------------------------------
-- 行番号を表示
vim.opt.number = true
-- カーソル移動時に行をまたいで移動可能に設定
vim.opt.whichwrap:append('b,s,<,>,[,],~')
-- カーソル行・列をハイライト表示
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- ------------------------------
-- 編集操作の設定
-- ------------------------------
-- バックスペースキーでインデント、行末、挿入開始位置を削除可能に設定
vim.opt.backspace = { 'indent', 'eol', 'start' }
-- 対応する括弧を強調表示
vim.opt.showmatch = true
-- スワップファイルを作成しない
vim.opt.swapfile = false
-- スマートインデントを有効化（新しい行のインデントを自動調整）
vim.opt.smartindent = true

-- ------------------------------
-- ステータスラインの設定
-- ------------------------------
-- 常にステータスラインを表示
vim.opt.laststatus = 2
-- 現在のモード（挿入、ビジュアルなど）を表示
vim.opt.showmode = true
-- コマンド入力中にステータスライン下部に表示
vim.opt.showcmd = true
-- コマンドライン補完モードを設定
vim.opt.wildmode = { 'list', 'longest' }
-- シンタックスハイライトを有効化
vim.cmd('syntax enable')

-- ------------------------------
-- 表示関連の設定
-- ------------------------------
-- 80文字目に縦線を表示（コードの可読性向上）
vim.opt.colorcolumn = '80'
-- ファイルタイプに応じたプラグインとインデント設定を有効化
vim.cmd('filetype plugin indent on') -- required
-- 不要な空白の強調
vim.cmd([[highlight BadWhitespace ctermbg=red guibg=red]])

-- ------------------------------
-- インデントガイドの設定
-- ------------------------------
-- ターミナルでのインデントラインの色を設定
vim.g.indentLine_color_term = 239
-- GUIでのインデントラインの色を設定
vim.g.indentLine_color_gui = '#A4E57E'
-- インデントラインに使用する文字を設定
vim.g.indentLine_char_list = { '|', '¦', '┆', '┊' }

-- ------------------------------
-- ウィンドウ分割の設定
-- ------------------------------
-- 新しい水平分割ウィンドウを現在のウィンドウの下に開く
vim.opt.splitbelow = true
-- 新しい垂直分割ウィンドウを現在のウィンドウの右に開く
vim.opt.splitright = true

-- ------------------------------
-- ウィンドウナビゲーションのキーマッピング
-- ------------------------------
-- Ctrl + J/K/L/H でウィンドウ間を移動
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- ------------------------------
-- コードフォールディングの設定
-- ------------------------------
-- インデントに基づくコードフォールディングを有効化
vim.opt.foldmethod = 'indent'
-- デフォルトのフォールドレベルを設定（99でほとんどのフォールドを開いた状態に）
vim.opt.foldlevel = 99
-- スペースキーでフォールドを開閉
vim.api.nvim_set_keymap('n', '<space>', 'za', { noremap = true })
