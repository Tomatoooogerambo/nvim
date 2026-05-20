return {
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Launch user api",
            request = "launch",
            mode = "debug",
            program = "/home/starry/opensource/iimsp/service/user/api/user.go",
            args = { "local" },
            cwd = "/home/starry/opensource/iimsp/service/user/api",
          },
          {
            type = "go",
            name = "Launch products api",
            request = "launch",
            mode = "debug",
            program = "/home/starry/opensource/iimsp/service/products/api/products.go",
            args = { "local" },
            cwd = "/home/starry/opensource/iimsp/service/products/api",
            env = {
              MONGO_HOST = "localhost",
              MONGO_PORT = "27017",
              MONGO_USERNAME = "",
              MONGO_PASSWORD = "",
              MONGO_DATABASE = "testdb",
            },
          },
        },
      })
    end,
  },
}
