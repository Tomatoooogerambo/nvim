-- 把 .ipynb 当纯文本编辑：打开时转成 .py，保存时转回 notebook
-- 依赖: jupytext CLI（uv tool install jupytext）
return {
  {
    "GCBallesteros/jupytext.nvim",
    -- 必须不能懒加载！否则打开 .ipynb 只会看到一坨 JSON。
    -- 这个插件很小，对启动时间基本没影响。
    lazy = false,
    config = function()
      require("jupytext").setup({
        style = "hydrogen",        -- cell 分隔符就是 `# %%`，和现有 <leader>mc 键位一致
        output_extension = "auto", -- python 语言 → .py
      })
    end,
  },
}
