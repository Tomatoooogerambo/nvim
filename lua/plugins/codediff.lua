-- codediff.nvim：VSCode 风格并排 diff 工作台（可随仓库变化实时刷新）。
-- diff 二进制库首次使用会自动下载，:CodeDiff install! 可强制重装。
-- 键位只用 LazyVim 未占用的 gv / gV / gH；gd 保持 Snacks git_diff，gh 保持 hunks 分组。
return {
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    keys = {
      { "<leader>gv", "<cmd>CodeDiff<cr>", desc = "CodeDiff 工作区变更" },
      { "<leader>gV", "<cmd>CodeDiff main...HEAD<cr>", desc = "CodeDiff 分支相对 main" },
      { "<leader>gH", "<cmd>CodeDiff history<cr>", desc = "CodeDiff 提交历史" },
    },
    opts = {},
  },
}
