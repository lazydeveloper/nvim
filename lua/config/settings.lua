-- ~/.config/nvim/lua/config/settings.lua
local opt = vim.opt

-- General Settings
opt.number = true
opt.relativenumber = false
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
-- Example for init.lua
opt.statusline = "%F"  -- %F displays the full file path
opt.clipboard:append("unnamedplus")


vim.api.nvim_create_user_command('Refresh', function()
  require('lazy').reload()  -- Reloads Lazy.nvim plugins
  vim.cmd('luafile ~/.config/nvim/init.lua')  -- Reloads init.lua
end, { nargs = 0 })

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber"
})

vim.api.nvim_create_user_command("Term", function()
    vim.cmd("split | terminal")
end, {})

