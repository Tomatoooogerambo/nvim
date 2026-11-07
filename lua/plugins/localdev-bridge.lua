-- Local Dev Bridge：把 dev 集群对这个服务的调用接到你本机
--   代码只有一份源：~/syTech/localdev-bridge/nvim-plugin/localdev-bridge.nvim（改/更新走那个仓库）
--   懒加载：按下面的键或敲 :LocalDevBridge 才加载，不拖慢启动
--   用法：cd 到服务仓库再开 nvim → <leader>Bp 开面板 → c 创建并验证 → s 启动
-- 本地仓库只在装了它的机器上存在（比如另一台Mac），没有就直接跳过，避免 lazy 报缺插件
local plugin_dir = vim.fn.expand("~/syTech/localdev-bridge/nvim-plugin/localdev-bridge.nvim")
if vim.fn.isdirectory(plugin_dir) == 0 then
  return {}
end

return {
  {
    dir = plugin_dir,
    name = "localdev-bridge",
    lazy = true,
    cmd = { "LocalDevBridge", "LocalDevBridgeLog" },
    keys = {
      -- 一个键开面板：上面看状态（链路通不通在第一行），下面 j/k + 回车选操作
      { "<leader>B", "<cmd>LocalDevBridge<cr>", desc = "面板（状态 + 操作）" },
      -- 常用入口
      { "<leader>Bp", "<cmd>LocalDevBridge panel<cr>", desc = "面板（一个键一个动作）" },
      { "<leader>Bk", "<cmd>LocalDevBridge stop<cr>", desc = "停止本机服务（含残留子进程）" },
      { "<leader>Bx", "<cmd>LocalDevBridge release<cr>", desc = "结束并清理" },
      { "<leader>Bl", "<cmd>LocalDevBridge log<cr>", desc = "日志" },
      -- 分步用
      { "<leader>Bc", "<cmd>LocalDevBridge create<cr>", desc = "创建并验证" },
      { "<leader>Bs", "<cmd>LocalDevBridge start<cr>", desc = "启动本机服务" },
      { "<leader>Bw", "<cmd>LocalDevBridge status<cr>", desc = "查看现状" },
      { "<leader>Bv", "<cmd>LocalDevBridge verify<cr>", desc = "验证流量" },
      { "<leader>Br", "<cmd>LocalDevBridge refresh<cr>", desc = "刷新（IP 变了 / 漂移）" },
      -- 服务跑在终端分屏里，人在终端模式（insert）时 n-mode 映射不生效 —— 这些键再配一份 t-mode，
      -- 这样站在服务终端里也能直接停/清/看日志（不用先 <Esc><Esc>）
      { "<leader>Bk", "<cmd>LocalDevBridge stop<cr>", mode = "t", desc = "停止本机服务" },
      { "<leader>Bx", "<cmd>LocalDevBridge release<cr>", mode = "t", desc = "结束并清理" },
      { "<leader>Bs", "<cmd>LocalDevBridge start<cr>", mode = "t", desc = "启动本机服务" },
      { "<leader>Bp", "<cmd>LocalDevBridge panel<cr>", mode = "t", desc = "面板" },
      { "<leader>Bl", "<cmd>LocalDevBridge log<cr>", mode = "t", desc = "日志" },
      { "<leader>Bw", "<cmd>LocalDevBridge status<cr>", mode = "t", desc = "查看现状" },
    },
    opts = {
      -- 服务目录默认 = 你打开 nvim 的目录（所以在服务仓库里开 nvim 最省事）。
      -- 想固定在某个仓库、从任何目录都能「启动」，就放开下面这行：
      -- work_dir = vim.fn.expand("~/syTech/repair-workflow-service"),
    },
  },

  -- which-key 里把 <leader>B 显示成组名（照 LazyVim 自己的写法放进 which-key 的 spec，
  -- 别放进上面 keys 里 —— 那样 lazy 会造一个空映射把 <leader>B 这个前缀顶掉）
  {
    "folke/which-key.nvim",
    optional = true,
    opts = { spec = { { "<leader>B", group = "Local Dev Bridge", mode = "n" } } },
  },

  -- 可选：把接管状态挂到 lualine（显示成 `dev: nv-loc-xxxx → 10.10.249.31:30081`）。
  -- 注意：状态栏要能显示就得让插件常驻加载（每 10s 查一次集群，闲置时会自动降频），
  -- 不需要就别放开这段。
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, 1, require("localdev-bridge").lualine)
  --   end,
  -- },
}
