return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- UI setup
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.35 },
              { id = "breakpoints", size = 0.15 },
              { id = "stacks",      size = 0.35 },
              { id = "watches",     size = 0.15 },
            },
            size = 50,
            position = "left",
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 12,
            position = "bottom",
          },
        },
      })

      -- Virtual text (shows variable values inline)
      require("nvim-dap-virtual-text").setup({
        commented = true,
      })

      -- Auto open/close UI with debug session
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- RP2040 / embedded GDB adapter
      dap.adapters.gdb = {
        type = "executable",
        command = "arm-none-eabi-gdb",
        args = { "-i", "dap" },
      }

      -- Configuration for RP2040 via probe-rs gdb server
      dap.configurations.c = {
        {
          name = "RP2040 Debug (probe-rs)",
          type = "gdb",
          request = "attach",
          -- probe-rs gdb server must be running separately:
          -- probe-rs gdb --chip RP2040 <your.elf>
          target = "localhost:1337",
          program = function()
            return vim.fn.input("ELF: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }

      -- Keymaps
      local map = vim.keymap.set
      map("n", "<F5>",  dap.continue,          { desc = "DAP Continue" })
      map("n", "<F10>", dap.step_over,          { desc = "DAP Step Over" })
      map("n", "<F11>", dap.step_into,          { desc = "DAP Step Into" })
      map("n", "<F12>", dap.step_out,           { desc = "DAP Step Out" })
      map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
      map("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP Conditional Breakpoint" })
      map("n", "<leader>dr", dap.repl.open,     { desc = "DAP REPL" })
      map("n", "<leader>du", dapui.toggle,      { desc = "DAP UI Toggle" })
      map("n", "<leader>dx", dap.terminate,     { desc = "DAP Terminate" })
    end,
  },
}
