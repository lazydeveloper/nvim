-- ~/.config/nvim/lua/config/plugins.lua
-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath('data') .. '/site/pack/lazy/opt/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:append(lazypath)

-- Use lazy.nvim to manage plugins
require('lazy').setup({

  --[[
  {
    'cpea2506/one_monokai.nvim',
    lazy = false,
    priority = 1000,
    config = function()
    -- Here you can add the setup configuration for the theme
      require('one_monokai').setup({
        style = 'classic',  -- Replace with available style options
        --  darken
        --  lighten
      })
      vim.cmd('colorscheme one_monokai')
    end,
    italics = false, --disable italics
   }, --]]

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = "#806d9c", -- Set the color for chunk lines
        },
        indent = {
          enable = true,
        },
        line_num = {
          enable = true,
        }
      })
    end,
  },

  -- Tokyo Night Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'night', -- Use 'night' for a dark background
      })
      vim.cmd 'colorscheme tokyonight'
    end,
  },

  -- barbar.nvim plugin
  {
    'romgrk/barbar.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }, -- for file icons
    config = function()
      -- barbar.nvim configuration can go here if needed
    end
  },


  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  {
    'preservim/nerdtree',
    config = function()
      -- Optional: You can add additional NERDTree configuration here
    end,
  },

  {
    -- coco.vim lsp manager
    'neoclide/coc.nvim',
    branch = 'release',
  },



  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "java", "python", "javascript", "html", "css"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },

})
