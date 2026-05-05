-- ------------------------------
-- YAML のシンタックス & インデント設定
-- ------------------------------

-- YAML ファイルのインデント設定
-- ---------------------------------
-- - `BufNewFile, BufRead` イベントで、新規/既存の YAML ファイルを対象に適用
-- - `setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab` で YAML のインデントを 2 スペースに統一
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.yml", "*.yaml"},
    callback = function()
        vim.opt_local.syntax = 'yaml'              -- YAML のシンタックスを適用
        vim.opt_local.tabstop = 2                   -- タブを2スペースとして扱う
        vim.opt_local.softtabstop = 2               -- スペースキーによるインデント幅を2に設定
        vim.opt_local.shiftwidth = 2                -- 自動インデントの幅を2に設定
        vim.opt_local.expandtab = true              -- タブをスペースに変換
    end,
})
