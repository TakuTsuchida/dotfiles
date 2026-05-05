--------------------------------
-- 入力補完（インサートモード）の設定
--------------------------------
local base_completion = {}

-- 関数: check_back_space()
--------------------------------
-- 入力位置の直前に空白があるかを判定する関数
-- - col('.') - 1: 現在のカーソル位置の左の文字を取得
-- - getline('.')[col - 1] =~ '\s': 左の文字が空白であるか判定
-- - true: 直前が空白 または 先頭（col=0）の場合
-- - false: 直前に文字がある場合
local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or string.match(vim.fn.getline('.'), '.' .. col) == ' '
end

function base_completion.setup()

  -- Tabキーの挙動: 補完ナビゲーション、スニペット展開、通常のインデント
  --------------------------------
  -- - 補完メニューが表示されている場合: <C-n> で次の候補を選択
  -- - 直前が空白の場合: 通常のTabインデント処理
  -- - それ以外の場合: CoCの補完リフレッシュ
  vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : check_back_space() ? "\\<Tab>" : coc#refresh()', { expr = true, silent = true })
  
  -- Shift+Tab の挙動: 補完メニュー内の前の候補へ移動
  --------------------------------
  -- - 補完メニューが表示されている場合: <C-p> で前の候補を選択
  -- - それ以外の場合: 通常のバックスペース操作（<C-h>）
  vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() and "\\<C-p>" or "\\<C-h>"', { expr = true, silent = true })
  
  -- Enterキーの挙動: 補完確定 または 通常の改行
  --------------------------------
  -- - 補完メニューが表示されている場合: coc#_select_confirm() で確定
  -- - 通常の改行を実行しつつ `coc#on_enter()` を適用
  vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() and coc#_select_confirm() or "\\<C-g>u\\<CR>\\<C-r>=" .. coc#on_enter()', { expr = true, silent = true })
end

-- モジュールを返す
return base_completion
