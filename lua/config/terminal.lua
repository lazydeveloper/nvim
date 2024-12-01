-- currently using toggleterm.nvim to manage terminals 
-- https://github.com/akinsho/toggleterm.nvim#--toggletermnvim

require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  open_mapping = [[<c-\>]], -- Set this to whatever you want for opening the terminal
  direction = 'horizontal',-- 'vertical', 'horizontal', 'tab', or 'float'
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    border = 'single',
    width = 100,
    height = 30,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}


