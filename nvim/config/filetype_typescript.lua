-- ------------------------------
-- TypeScript のフォーマット & シンタックス設定
-- ------------------------------

-- TypeScript ファイルのシンタックス & インデント設定
-- ---------------------------------
-- - `BufNewFile, BufRead` イベントで、新規/既存の TypeScript ファイルを対象に適用
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.ts", "*.tsx"},
    callback = function()
        vim.opt_local.syntax = 'typescript'  -- TypeScript のシンタックスを適用
        vim.opt_local.autoindent = true        -- 自動的に前の行のインデントを継承
    end,
})

-- TypeScript の自動フォーマット設定 (Prettier)
-- ---------------------------------
-- - `BufWritePre` イベントで、保存前に Prettier を実行
-- - `CocCommand prettier.formatFile` を実行し、コードを整形
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"*.ts", "*.tsx"},
    callback = function()
        vim.cmd("CocCommand prettier.formatFile")
    end,
})
