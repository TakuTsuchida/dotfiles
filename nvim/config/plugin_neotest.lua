-- ------------------------------
-- neotest + neotest-python の設定
-- ------------------------------

local neotest_ok, neotest = pcall(require, 'neotest')
if not neotest_ok then return end

neotest.setup({
    adapters = {
        require('neotest-python')({
            runner = 'pytest',
            -- .venv があればそれを優先、なければ pyenv の python を使用
            python = function()
                local cwd = vim.fn.getcwd()
                if vim.fn.isdirectory(cwd .. '/.venv') == 1 then
                    return cwd .. '/.venv/bin/python'
                end
                return vim.fn.trim(vim.fn.system('pyenv which python'))
            end,
        }),
    },
})

-- ------------------------------
-- キーバインド
-- ------------------------------

-- <space>tt: カーソル位置のテストを実行
vim.keymap.set('n', '<space>tt', function()
    neotest.run.run()
end, { silent = true })

-- <space>tf: ファイル内の全テストを実行
vim.keymap.set('n', '<space>tf', function()
    neotest.run.run(vim.fn.expand('%'))
end, { silent = true })

-- <space>ts: テスト結果のサマリーをトグル
vim.keymap.set('n', '<space>ts', function()
    neotest.summary.toggle()
end, { silent = true })

-- <space>to: テスト出力を表示
vim.keymap.set('n', '<space>to', function()
    neotest.output.open({ enter = true })
end, { silent = true })
