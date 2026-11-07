-- 在 Neovim 里像 Jupyter 一样跑 Python：molten-nvim
--
-- 分块执行：用 `# %%` 分隔代码块（Jupyter / jupytext / VSCode 通用标记）
--   <leader>mc  执行光标所在的 cell
--   <leader>mj  跳到下一个 cell
--   <leader>mk  跳到上一个 cell
--   <leader>mp  用系统看图器打开当前输出里的图片（可自由缩放）

-- 一行是不是 cell 分隔标记："# %%" 或 "#%%"（允许前导空白）
local function is_marker(line)
  return line:match("^%s*#%s*%%%%") ~= nil
end

-- 光标所在 cell 的行范围（含首尾）
local function cell_bounds()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local cur = vim.api.nvim_win_get_cursor(0)[1]
  local first, last = 1, #lines
  for i = cur, 1, -1 do
    if is_marker(lines[i]) then
      first = i
      break
    end
  end
  for i = cur + 1, #lines do
    if is_marker(lines[i]) then
      last = i - 1
      break
    end
  end
  return first, last
end

-- 跳到上/下一个 cell 标记
local function goto_cell(dir)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local i = vim.api.nvim_win_get_cursor(0)[1] + dir
  while i >= 1 and i <= #lines do
    if is_marker(lines[i]) then
      vim.api.nvim_win_set_cursor(0, { i, 0 })
      return
    end
    i = i + dir
  end
  vim.notify("没有更多 cell 了", vim.log.levels.INFO)
end

return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins", -- molten 是 Remote Plugin，必须跑这一步
    init = function()
      -- 让 Neovim 用带 pynvim/jupyter_client 的那个 python
      vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/py3/bin/python")
      -- 复用已装的 image.nvim（ghostty 支持 kitty graphics，图能内联显示）
      vim.g.molten_image_provider = "image.nvim"
      -- 输出窗口越大，内联图片能占的面积越大（宽度默认就是不限制）
      vim.g.molten_output_win_max_height = 40
      vim.g.molten_output_win_max_width = 999999
      vim.g.molten_auto_open_output = true
      vim.g.molten_tick_rate = 200
      -- 想让每次出图都自动弹系统看图器，就打开下面这行
      -- vim.g.molten_auto_image_popup = true
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Molten: 启动 kernel" },

      -- 按 # %% 分块
      {
        "<leader>mc",
        function()
          local s, e = cell_bounds()
          vim.fn.MoltenEvaluateRange(s, e)
        end,
        desc = "Molten: 执行当前 cell (# %%)",
      },
      { "<leader>mj", function() goto_cell(1) end, desc = "Molten: 下一个 cell" },
      { "<leader>mk", function() goto_cell(-1) end, desc = "Molten: 上一个 cell" },

      -- 逐行 / 选区
      { "<leader>ml", ":MoltenEvaluateLine<CR>", mode = "n", desc = "Molten: 执行当前行" },
      { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Molten: 执行选中" },
      { "<leader>mr", ":MoltenReevaluateCell<CR>", desc = "Molten: 重跑 cell" },

      -- 输出窗口 / 图片
      { "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", desc = "Molten: 跳到输出窗口" },
      { "<leader>mp", ":MoltenImagePopup<CR>", desc = "Molten: 系统看图器打开图片" },
      { "<leader>mh", ":MoltenHideOutput<CR>", desc = "Molten: 隐藏输出" },
      { "<leader>mx", ":MoltenInterrupt<CR>", desc = "Molten: 中断执行" },
    },
  },
}
