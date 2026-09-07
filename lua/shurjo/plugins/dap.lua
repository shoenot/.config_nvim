return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui", 
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
        "jay-babu/mason-nvim-dap.nvim"
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        require("nvim-dap-virtual-text").setup()

        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)
        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>du", dapui.toggle)

        dap.adapters.python = {
          type = "executable",
          command = "python",
          args = { "-m", "debugpy.adapter" },
        }

        dap.configurations.python = {
          {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
          },
        }

        dap.adapters.codelldb = {
          type = "server",
          port = "${port}",
          executable = {
            command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
            args = { "--port", "${port}" },
          },
        }

        dap.configurations.rust = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
            end,
            cwd = "${workspaceFolder}",
          },
        }
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "codelldb" },
        automatic_installation = true,
        handlers = {},
      })
    end,
  },
}
