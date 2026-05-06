return {
    {
        'mfussenegger/nvim-dap',
        lazy = true,
    },
    {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        dependencies = { 'mfussenegger/nvim-dap' },
    },
    {
        'rcarriga/nvim-dap-ui',
        lazy = true,
        dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    },
}
