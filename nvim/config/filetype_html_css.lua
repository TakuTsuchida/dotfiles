-- ------------------------------
-- HTML & CSS のフォーマット設定
-- ------------------------------
--
-- HTML & CSS ファイルのインデント設定
---
-- - `BufNewFile, BufRead` イベントにより、新規/既存のファイルに適用
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.html", "*.css"},
    callback = function()
        vim.opt_local.tabstop = 2          -- タブを2スペースとして扱う
        vim.opt_local.softtabstop = 2      -- スペースキーによるインデント幅を2に設定
        vim.opt_local.shiftwidth = 2       -- 自動インデントの幅を2に設定
        vim.opt_local.expandtab = true      -- タブをスペースに変換
        vim.opt_local.autoindent = true     -- 自動的に前の行のインデントを継承
        vim.opt_local.fileformat = 'unix'   -- 改行コードを Unix 形式に統一
    end,
})
