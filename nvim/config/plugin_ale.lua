-- ------------------------------
-- ALE の LSP 無効化 & Lint 実行タイミング設定
-- ------------------------------

-- ALE の LSP（Language Server Protocol）を無効化
-- ---------------------------------
-- - ALE には LSP の機能もあるが、CoC など他の LSP プラグインを使用するため無効化
vim.g.ale_disable_lsp = 1

-- ALE の Lint 実行タイミング設定
-- ---------------------------------
-- - 'always': テキスト変更時に常に Linter を実行
-- - 'never' : テキスト変更時に Linter を実行しない
-- - 'insert_leave': インサートモード終了時に Linter を実行
vim.g.ale_lint_on_text_changed = 'always'
