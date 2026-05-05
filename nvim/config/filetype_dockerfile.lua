-- ------------------------------
-- Dockerfile のファイルタイプ設定
-- ------------------------------

-- Dockerfile のファイルタイプを適用
-- ---------------------------------
-- - `BufNewFile, BufRead` イベントで、新規/既存の Dockerfile を対象に適用
-- - `set filetype=dockerfile` により、適切なシンタックスハイライトやプラグインを有効化
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "Dockerfile*",
    callback = function()
        vim.opt.filetype = 'dockerfile'
    end,
})
