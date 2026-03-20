-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- require("mason").setup()
-- require("mason-lspconfig").setup()

require("dap-go").setup({
  -- 在这里可以直接添加自定义 dap 配置
  dap_configurations = {
    {
      type = "go", -- 必须是 "go"
      name = "Launch user api", -- 调试配置名称
      request = "launch", -- 启动类型
      mode = "debug",
      program = "/home/starry/opensource/iimsp/service/user/api/user.go",
      args = { "local" }, -- 启动参数
      cwd = "/home/starry/opensource/iimsp/service/user/api",
      -- env = { -- 可选环境变量
      --   MONGO_HOST = "localhost",
      --   MONGO_PORT = "27017",
      --   MONGO_USERNAME = "",
      --   MONGO_PASSWORD = "",
      --   MONGO_DATABASE = "testdb",
      -- },
    },
    {
      type = "go", -- 必须是 "go"
      name = "Launch products api", -- 调试配置名称
      request = "launch", -- 启动类型
      mode = "debug",
      program = "/home/starry/opensource/iimsp/service/products/api/products.go",
      args = { "local" }, -- 启动参数
      cwd = "/home/starry/opensource/iimsp/service/products/api",
      env = { -- 可选环境变量
        MONGO_HOST = "localhost",
        MONGO_PORT = "27017",
        MONGO_USERNAME = "",
        MONGO_PASSWORD = "",
        MONGO_DATABASE = "testdb",
      },
    },
  },
})

require("spring_boot").setup({
  java_cmd = "java",
  boot_run = {
    jvm_args = {
      "-Dspring.profiles.active=dev",
    },
  },
})
