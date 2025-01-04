return {
  'mfussenegger/nvim-dap',
  event = 'BufReadPre',
  config = function()
    local dap = require('dap')

    -- Configure the JavaScript/TypeScript Debug Adapter
    dap.adapters.node2 = {
      type = 'executable',
      command = 'node',
      args = { '/path/to/vscode-js-debug/out/src/vsDebugServer.js' },
    }

    dap.configurations.javascript = {
      {
        name = 'Launch file',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
      },
    }

    dap.configurations.typescript = {
      {
        name = 'Launch file',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        outFiles = { '${workspaceFolder}/dist/**/*.js' },
      },
    }
  end,
}
