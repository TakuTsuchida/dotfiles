return {
    {
        'nvim-neotest/neotest',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-neotest/nvim-nio',
            'nvim-neotest/neotest-python',
        },
    },
    {
        'nvim-neotest/neotest-python',
        lazy = true,
    },
}
