-- python provider 必须在启动最早期配置（molten 等 remote plugin 依赖它）
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/py3/bin/python")

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
