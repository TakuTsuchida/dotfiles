-- init.lua

-- lazy.nvim bootstrap: auto-install if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの設定
require("lazy").setup({
    spec = {
        { import = "plugins" }
    },
})

-- 設定ファイルの読み込み
local config_files = vim.fn.glob(vim.fn.stdpath('config') .. '/old.config/*.vim', true, true)
table.sort(config_files)
for _, fname in ipairs(config_files) do
    vim.cmd('source ' .. fname)
end
-- 設定ファイルの読み込み
local config_files = vim.fn.glob(vim.fn.stdpath('config') .. '/config/*.lua', true, true)
table.sort(config_files)
for _, fname in ipairs(config_files) do
    dofile(fname)
end

-- init.lua 更新時の再読み込み
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = 'init.lua',
    command = 'source <afile>'
})

