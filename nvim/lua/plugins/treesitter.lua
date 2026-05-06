return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup()
            -- Python パーサーを neotest のために確実にインストール
            vim.schedule(function()
                local install = require('nvim-treesitter.install')
                install.install({ 'python', 'lua', 'typescript', 'javascript', 'json', 'yaml', 'dockerfile' })
            end)
        end,
    },
}
