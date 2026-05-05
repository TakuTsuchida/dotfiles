-- ------------------------------
-- CoC（Conquer of Completion）の拡張 & キーマッピング
-- ------------------------------

-- CoC で使用するグローバル拡張機能の設定
-- ---------------------------------
-- - 各プログラミング言語に対応する LSP（Language Server Protocol）を追加
-- - フォーマッター、補完リスト、静的解析ツールを含む
vim.g.coc_global_extensions = {
    'coc-solargraph',
    'coc-pyright',
    'coc-docker',
    'coc-yaml',
    'coc-json',
    'coc-tsserver',
    'coc-eslint',
    'coc-prettier',
    'coc-lists',
    'coc-html',
    'coc-css'
}

-- ------------------------------
-- CoC のコードナビゲーション & 操作用キーマッピング
-- ------------------------------

-- 定義ジャンプ（Go to Definition）
-- - `<space>gd` で定義元にジャンプ
vim.api.nvim_set_keymap('n', '<space>gd', '<Plug>(coc-definition)', { noremap = false, silent = true })

-- 型定義ジャンプ（Go to Type Definition）
-- - `<space>gy` で型定義へ移動
vim.api.nvim_set_keymap('n', '<space>gy', '<Plug>(coc-type-definition)', { noremap = false, silent = true })

-- 実装の参照（Go to Implementation）
-- - `<space>gi` で実装元へ移動
vim.api.nvim_set_keymap('n', '<space>gi', '<Plug>(coc-implementation)', { noremap = false, silent = true })

-- 参照一覧を表示（Find References）
-- - `<space>gr` でシンボルの参照箇所を一覧表示
vim.api.nvim_set_keymap('n', '<space>gr', '<Plug>(coc-references)', { noremap = false, silent = true })

-- CoC のリスト（ファイル・シンボルなどの検索）
-- - `<space><space>` で CoC のリスト UI を開く
vim.api.nvim_set_keymap('n', '<space><space>', ':<C-u>CocList<cr>', { noremap = true, silent = true })

-- コードフォーマットの適用（Format）
-- - `<space>fmt` で CoC のフォーマット機能を適用
vim.api.nvim_set_keymap('n', '<space>fmt', '<Plug>(coc-format)', { noremap = false, silent = true })

-- 変数・関数名のリネーム（Rename Symbol）
-- - `<space>rn` で変数・関数のリネームを実行
vim.api.nvim_set_keymap('n', '<space>rn', '<Plug>(coc-rename)', { noremap = false, silent = true })

-- ホバー情報を表示（Hover）
-- - `<space>h` でシンボルの詳細情報を表示
vim.api.nvim_set_keymap('n', '<space>h', ":<C-u>call CocAction('doHover')<cr>", { noremap = true, silent = true })
