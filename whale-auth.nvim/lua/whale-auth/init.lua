-- whale-auth.nvim
-- AKSK鉴权工具 for LazyVim/Neovim

local M = {}

M.config = {
  -- aksk 配置
  aksk = {
    access_key = '',
    secret_key = '',
  },
  -- accessToken 鉴权
  access_token = {
    token = '',
    env = 'dev2', -- dev2 | beta
  },
  -- manage 后台鉴权
  manage = {
    session_id = '',
    app_key = 'whale_user_manager_dev',
    target_url = '/whale-user-boss/manage/user/user-info/list',
    env = 'dev2', -- dev2 | beta
  },
}

function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend('force', M.config, opts)
  M._register()
end

-- 生成随机 nonce (字母数字混合)
local function random_nonce(len)
  len = len or 10
  local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  local result = ''
  for _ = 1, len do
    local idx = math.random(1, #chars)
    result = result .. chars:sub(idx, idx)
  end
  return result
end

-- 生成 HMAC-SHA256 签名 (hex)
local function hmac_sha256_hex(key, msg)
  -- 使用 openssl 生成 HMAC-SHA256，输出 hex
  local cmd = string.format(
    "echo -n %s | openssl dgst -sha256 -hmac %s | awk '{print $NF}'",
    vim.fn.shellescape(msg),
    vim.fn.shellescape(key)
  )
  local result = vim.trim(vim.fn.system(cmd))
  return result
end

-- 生成 Base64 编码
local function base64_encode(str)
  local result = vim.fn.system({ 'base64' }, str)
  return vim.trim(result)
end

-- 生成 aksk authorization (Base64 编码)
-- 格式: Base64({accessKey}/{nonce}/{timestamp}/{hmac_sha256})
function M.generate_aksk()
  local ak = M.config.aksk.access_key
  local sk = M.config.aksk.secret_key
  if ak == '' or sk == '' then
    vim.notify('[whale-auth] aksk 未配置', vim.log.levels.ERROR)
    return nil
  end

  local nonce = random_nonce(10)
  local timestamp = tostring(os.time())
  -- 签名字符串: ak+nonce+ts 无分隔符拼接
  local sign_str = ak .. nonce .. timestamp
  local signature = hmac_sha256_hex(sk, sign_str)
  -- 输出格式: {ak}/{nonce}/{ts}/{sig} 再 Base64
  local raw = ak .. '/' .. nonce .. '/' .. timestamp .. '/' .. signature

  return base64_encode(raw)
end

-- 生成 whale-identity (accessToken 鉴权)
function M.generate_whale_identity()
  local token = M.config.access_token.token
  local env = M.config.access_token.env
  if token == '' then
    vim.notify('[whale-auth] accessToken 未配置', vim.log.levels.ERROR)
    return nil
  end
  local identity = base64_encode(vim.fn.json_encode({
    accessToken = token,
    env = env,
  }))
  return identity
end

-- 生成 manage-identity (manage 后台鉴权)
function M.generate_manage_identity()
  local cfg = M.config.manage
  if cfg.session_id == '' then
    vim.notify('[whale-auth] managerSessionId 未配置', vim.log.levels.ERROR)
    return nil
  end
  local identity = base64_encode(vim.fn.json_encode({
    managerSessionId = cfg.session_id,
    appKey = cfg.app_key,
    targetUrl = cfg.target_url,
    env = cfg.env,
  }))
  return identity
end

-- 复制到剪贴板
local function copy_to_clipboard(value, label)
  if not value then return end
  vim.fn.setreg('+', value)
  vim.notify('[whale-auth] 已复制 ' .. label, vim.log.levels.INFO)
end

-- 打开选择器
function M.select()
  local items = {
    { label = 'aksk → authorization', fn = function() copy_to_clipboard(M.generate_aksk(), 'authorization') end },
    { label = 'accessToken → whale-identity', fn = function() copy_to_clipboard(M.generate_whale_identity(), 'whale-identity') end },
    { label = 'manage → manage-identity', fn = function() copy_to_clipboard(M.generate_manage_identity(), 'manage-identity') end },
  }

  local labels = vim.tbl_map(function(item) return item.label end, items)

  vim.ui.select(labels, { prompt = '选择鉴权类型:' }, function(_, idx)
    if idx then
      items[idx].fn()
    end
  end)
end

-- 注册命令和快捷键
function M._register()
  vim.api.nvim_create_user_command('WhaleAuth', function(args)
    local sub = args.args
    if sub == 'aksk' then
      copy_to_clipboard(M.generate_aksk(), 'authorization')
    elseif sub == 'whale-identity' then
      copy_to_clipboard(M.generate_whale_identity(), 'whale-identity')
    elseif sub == 'manage-identity' then
      copy_to_clipboard(M.generate_manage_identity(), 'manage-identity')
    else
      M.select()
    end
  end, {
    nargs = '?',
    complete = function()
      return { 'aksk', 'whale-identity', 'manage-identity' }
    end,
    desc = '生成鉴权信息并复制到剪贴板',
  })

  vim.keymap.set('n', '<leader>ya', M.select, { desc = '[Y]ank [A]uth - 鉴权生成' })
end

return M
