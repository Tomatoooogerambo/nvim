return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        -- 开始debug
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "contine to debug",
      },
      {
        -- step over
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "step over",
      },
      {
        -- step into
        "<F9>",
        function()
          require("dap").step_into()
        end,
        desc = "step into",
      },
      {
        -- step out
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "step_out",
      },
      {
        --设置断点
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "toggle_breakpoint",
      },
      {
        --结束
        "<leader>dc",
        function()
          require("dap").disconnect()
        end,
        desc = "disconnect",
      },
    },
  },
  { "leoluz/nvim-dap-go" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
}
