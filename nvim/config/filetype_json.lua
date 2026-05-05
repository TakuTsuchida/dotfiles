-- ------------------------------
-- JSON のシンタックス & インデント設定
-- ------------------------------

-- JSON ファイルのシンタックス & インデント設定
-- ---------------------------------
-- - `BufNewFile, BufRead` イベントで、新規/既存の JSON ファイルを対象に適用
-- - `setlocal syntax=json` で JSON のシンタックスハイライトを適用
-- - `setlocalstop=2 softtabstop=2 shiftwidth=2 expandtab` で JSON のインデントを 2 スペースに統一
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.json", "*.jsonc"},
    callback = function()
        vim.opt_local.syntax = 'json'          -- JSON のシンタックスを適用
        vim.opt_local.tabstop = 2               -- タブを2スペースとして扱う
        vim.opt_local.softtabstop = 2           -- スペースキーによるインデント幅を2に設定
        vim.opt_local.shiftwidth = 2            -- 自動インデントの幅を2に設定
        vim.opt_local.expandtab = true          -- タブをスペースに変換
    end,
})
