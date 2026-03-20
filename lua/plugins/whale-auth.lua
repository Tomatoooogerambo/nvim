-- whale-auth.nvim plugin spec for LazyVim
return {
  "whale-auth.nvim",
  dir = "~/.config/nvim/whale-auth.nvim",
  config = function()
    require("whale-auth").setup({
      aksk = {
        access_key = "37a250a30b1148ad91845ed36afee511",
        secret_key = "be6dae58b7dd4d5673d3335b1ad0f4fdce469adf0312846e7213e1f1297fa44c",
      },
      access_token = {
        token = "", -- 填入你的 accessToken
        env = "dev2",
      },
      manage = {
        session_id = "", -- 填入你的 managerSessionId
        app_key = "whale_user_manager_dev",
        target_url = "/whale-user-boss/manage/user/user-info/list",
        env = "dev2",
      },
    })
  end,
}
