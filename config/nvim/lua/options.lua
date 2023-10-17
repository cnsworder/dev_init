vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.cmd.colorscheme("catppuccin")
if vim.opt.guifont ~= nil then
  vim.opt.guifont = "FiraCode_Nerd_Font_Mono:h18"
end
