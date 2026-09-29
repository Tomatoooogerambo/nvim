-- 抑制 golangci-lint 非零退出码的警告
-- golangci-lint v2 在某些场景下返回 code 3，不影响实际诊断结果
return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    -- 覆盖 golangcilint linter，添加 ignore_exitcode
    local lint = require("lint")
    local golangcilint = lint.linters["golangcilint"]
    if golangcilint then
      golangcilint.ignore_exitcode = true
    end
  end,
}
