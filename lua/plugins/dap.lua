local dap = require("dap")

-- 配置 Go 调试器
dap.configurations.go = {
  {
    type = "go",
    request = "launch",
    name = "Launch products",
    program = "/home/colom/opensource/iimsp/service/products/api/products.go", -- 替换为你自己的路径
    args = { "local" }, -- 命令行参数
    env = {
      MONGO_HOST = "localhost",
      MONGO_PORT = "27017",
      MONGO_USERNAME = "",
      MONGO_PASSWORD = "",
      MONGO_DATABASE = "testdb",
    },
    mode = "debug",
  },
}
