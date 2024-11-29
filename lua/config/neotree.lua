
-- Configuration for neo-tree
require("neo-tree").setup({
  close_if_last_window = false, -- Don't auto-close if there's only one window
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "*",
    },
    git_status = {
      symbols = {
        -- Change these to whatever you like
        added     = "✚",
        modified  = "",
        deleted   = "✖",
        renamed   = "",
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    position = "right",
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = true, -- When true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false, -- Only works on Windows for hidden files/directories
    },
    follow_current_file = true, -- This will find and focus the file in the active buffer every time the current file is changed while the tree is open.
    use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes instead of relying on nvim autocmd events.
  },
  event_handlers = {
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" then
          vim.cmd("wincmd p") -- Move cursor to the main window if neo-tree was opened
        end
      end
    },
  }
})

