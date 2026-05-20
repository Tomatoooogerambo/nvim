return {
  -- nvim-java: 只在打开 Java 文件时加载，失败不崩溃
  {
    "nvim-java/nvim-java",
    ft = "java",
    config = function()
      local ok, err = pcall(function()
        require("java").setup()
        vim.lsp.enable("jdtls")
      end)
      if not ok then
        vim.notify("[nvim-java] 启动失败，Java LSP 不可用: " .. tostring(err), vim.log.levels.WARN)
      end
    end,
  },
  -- spring-boot.nvim: 同样加错误保护
  {
    "JavaHello/spring-boot.nvim",
    ft = "java",
    config = function()
      local ok, err = pcall(function()
        require("spring_boot").setup({
          java_cmd = "java",
          boot_run = {
            jvm_args = {
              "-Dspring.profiles.active=dev",
            },
          },
        })
      end)
      if not ok then
        vim.notify("[spring-boot.nvim] 启动失败: " .. tostring(err), vim.log.levels.WARN)
      end
    end,
  },
}
