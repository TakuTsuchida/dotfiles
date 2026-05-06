-- ------------------------------
-- nvim-dap + nvim-dap-python の設定
-- ------------------------------

local dap_ok, dap = pcall(require, 'dap')
if not dap_ok then return end

local dap_python_ok, dap_python = pcall(require, 'dap-python')
if not dap_python_ok then return end

-- debugpy のパス（uv tool install debugpy でインストール）
dap_python.setup('~/.local/share/uv/tools/debugpy/lib/python3.9/site-packages/debugpy')

-- ------------------------------
-- nvim-dap-ui の設定
-- ------------------------------

local dapui_ok, dapui = pcall(require, 'dapui')
if dapui_ok then
    dapui.setup()

    -- デバッグ開始・終了時に UI を自動で開閉
    dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
    dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
    dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
end

-- ------------------------------
-- キーバインド
-- ------------------------------

-- <space>db: ブレークポイントのトグル
vim.keymap.set('n', '<space>db', dap.toggle_breakpoint, { silent = true })

-- <space>dc: デバッグ開始 / 続行
vim.keymap.set('n', '<space>dc', dap.continue, { silent = true })

-- <space>ds: ステップオーバー（次の行へ）
vim.keymap.set('n', '<space>ds', dap.step_over, { silent = true })

-- <space>di: ステップイン（関数内へ）
vim.keymap.set('n', '<space>di', dap.step_into, { silent = true })

-- <space>do: ステップアウト（関数から抜ける）
vim.keymap.set('n', '<space>do', dap.step_out, { silent = true })

-- <space>dq: デバッグ終了
vim.keymap.set('n', '<space>dq', dap.terminate, { silent = true })

-- <space>du: DAP UI のトグル
if dapui_ok then
    vim.keymap.set('n', '<space>du', dapui.toggle, { silent = true })
end
