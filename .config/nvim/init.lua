vim.opt.termguicolors = true
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- splits
vim.keymap.set("n", "<leader>v", "<cmd>vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", "<cmd>split<CR>", { noremap = true, silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Indents
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Status bar
vim.opt.showmode = false -- removes mode from command bar
