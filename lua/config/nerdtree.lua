-- Automatically open NERDTree when starting Neovim
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 then
        vim.cmd("NERDTree")
      end
    end,
  })
  
  -- Set up key mappings for NERDTree
  vim.api.nvim_set_keymap('n', '<Leader>t', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
 
  vim.g.NERDTreeFileLines = 1
