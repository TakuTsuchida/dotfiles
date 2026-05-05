-- ------------------------------
-- Python 開発環境の設定
-- ------------------------------

-- Python 3 インタープリタのパス設定
-- ---------------------------------
-- - pyenv を使用している場合、適切な Python3 インタープリタを取得
-- - system() 関数で `pyenv which python` の結果を取得し、trim() で余分な空白を削除
local handle = io.popen("pyenv which python")
local result = handle:read("*a")
handle:close()
vim.g.python3_host_prog = result:gsub("^%s*(.-)%s*$", "%1")  -- trim

-- ------------------------------
-- Pythonコード補完設定 (Jedi)
-- ------------------------------

-- jedi-vim の補完機能を有効化
vim.g.jedi_completions_enabled = 1

-- jedi-vim の自動初期化を有効化
vim.g.jedi_auto_initialization = 1

-- 関数の引数シグネチャを表示
-- 1: バッファ内に表示 (デフォルト)
-- 2: コマンドラインに表示
vim.g.jedi_show_call_signatures = "1"

-- ------------------------------
-- Python コードフォーマッターの設定 (Neoformat)
-- ------------------------------

-- Neoformat を使用し、Python のフォーマットに Black を設定
-- - `formatprg` は `gq` コマンドで実行されるフォーマッター
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.formatprg = "black -"
    end,
})

-- ------------------------------
-- Python のコード折りたたみ設定 (SimpylFold)
-- ------------------------------

-- DocString プレビューを有効化
vim.g.SimpylFold_docstring_preview = 1

-- ------------------------------
-- Python ファイルのフォーマット設定
-- ------------------------------

-- Python ファイルを開いた際のフォーマット設定
-- - `BufNewFile, BufRead` イベントにより新規/既存ファイルに適用
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.py", "*.pyw"},
    callback = function()
        vim.opt_local.tabstop = 4              -- タブを4スペースとして扱う
        vim.opt_local.softtabstop = 4          -- スペースキーによるインデント幅を4に設定
        vim.opt_local.shiftwidth = 4           -- 自動インデントの幅を4に設定
        vim.opt_local.textwidth = 79            -- 最大行長を79に設定（PEP8 準拠）
        vim.opt_local.expandtab = true          -- タブをスペースに変換
        vim.opt_local.autoindent = true         -- 自動的に前の行のインデントを継承
        vim.opt_local.fileformat = 'unix'       -- 改行コードを Unix 形式に統一
        vim.cmd([[match BadWhitespace /\s\+$/]]) -- 行末の不要な空白を強調表示
    end,
})

-- ------------------------------
-- Python の静的解析ツール (ALE)
-- ------------------------------

-- ALE (Asynchronous Lint Engine) を使用した Linter 設定
-- - flake8 を使用し、Python のコード品質チェックを行う
vim.g.ale_linters = { python = { 'flake8' } }
