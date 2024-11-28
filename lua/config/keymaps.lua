-- ~/.config/nvim/lua/config/keymaps.lua
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'o', '<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Key mapping to open/close Terminal
vim.api.nvim_set_keymap('n', '<C-t>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })

-- Function to toggle terminal
function _G.ToggleTerminal()
    if vim.fn.bufwinnr('term://*') ~= -1 then
      vim.cmd('bwipeout! term://*')
    else
      vim.cmd('botright split | terminal')
    end
  end


-- Key mapping to compile and run Java files
vim.api.nvim_set_keymap('n', '<leader>c', ':!javac %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':lua CompileAndRunJava()<CR>', { noremap = true, silent = true })


-- Function to compile and run Java files
function _G.CompileAndRunJava()
    local file = vim.fn.expand('%:p')  -- Full path to the current file
    local root = vim.fn.getcwd()  -- Get the current working directory
    local src_dir = "src"  -- The source directory within the project
    local relative_path = vim.fn.fnamemodify(file, ':~:.')  -- Relative path from the home directory
    local class_dir = root .. "/out"  -- Directory to place compiled classes
    local classpath = class_dir
  
    -- Extract the fully qualified class name by removing the src directory and replacing slashes with dots
    local class_name = relative_path:match(src_dir .. '/(.+)$'):gsub("/", "."):gsub("%.java$", "")
  
    -- Compile the Java file and output classes to class_dir
    local compile_command = string.format('javac -d %s %s', class_dir, file)
    -- Run the compiled Java class
    local run_command = string.format('java -cp %s %s', classpath, class_name)
    
    -- Execute the compile and run commands
    vim.cmd('! ' .. compile_command .. ' && ' .. run_command)
  end
  

-- Key mappings for moving the cursor in insert mode using Ctrl + hjkl
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })

-- Additional useful key mappings (optional)
vim.api.nvim_set_keymap('i', '<C-e>', '<End>', { noremap = true, silent = true })  -- Move to end of line
vim.api.nvim_set_keymap('i', '<C-u>', '<C-G>u<C-U>', { noremap = true, silent = true })  -- Delete to beginning of line
vim.api.nvim_set_keymap('i', '<C-y>', '<C-G>u<C-W>', { noremap = true, silent = true })  -- Delete previous word


-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Use tab for trigger completion and navigate to the next complete item
vim.cmd([[
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
]])

-- Use <c-space> to trigger completion
map('i', '<C-Space>', 'coc#refresh()', { silent = true, expr = true })

-- Navigate diagnostics
map('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
map('n', ']g', '<Plug>(coc-diagnostic-next)', opts)

-- GoTo code navigation
map('n', 'gd', '<Plug>(coc-definition)', opts)
map('n', 'gy', '<Plug>(coc-type-definition)', opts)
map('n', 'gi', '<Plug>(coc-implementation)', opts)
map('n', 'gr', '<Plug>(coc-references)', opts)

-- Use K to show documentation in preview window
map('n', 'K', ':call CocActionAsync("doHover")<CR>', opts)

-- Enable Leader + f to format the code using coc.vin
vim.api.nvim_set_keymap('n', '<leader>f', ':call CocAction("format")<CR>', { noremap = true, silent = true })

