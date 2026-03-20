# whale-auth.nvim

Token management plugin for LazyVim/Neovim. Copy pre-configured auth tokens to system clipboard with ease.

## Features

- Configure multiple tokens (dev, test, prod, etc.)
- Copy tokens to system clipboard with one command
- Interactive token selector with `<leader>ya`
- Tab completion for token names
- Zero external dependencies (uses Neovim built-in APIs)

## Installation

### LazyVim

```lua
-- in lua/plugins/*.lua
{
  "your-name/whale-auth.nvim",
  config = function()
    require("whale-auth").setup({
      tokens = {
        dev = "your-dev-token",
        test = "your-test-token",
        prod = "your-prod-token",
      },
    })
  end,
}
```

### Manual

```lua
-- in your init.lua or lua/config/*.lua
require("whale-auth").setup({
  tokens = {
    dev = "your-dev-token",
    test = "your-test-token",
    prod = "your-prod-token",
  },
})
```

## Usage

### Commands

```vim
" Copy specific token by name
:WhaleCopyToken dev

" Open token selector
:WhaleCopyToken

" Tab completion available
:WhaleCopyToken <Tab>
```

### Lua API

```lua
-- Copy token by name
require("whale-auth").copy("dev")

-- Get token value
local token = require("whale-auth").get_token("dev")

-- List all token names
local names = require("whale-auth").list_tokens()

-- Open interactive selector
require("whale-auth").select()
```

### Keymaps

| Keymap | Description |
|--------|-------------|
| `<leader>ya` | Open token selector |

## Security Note

⚠️ **Warning**: Tokens configured in your Neovim config may be exposed in:
- Git history (if config is version-controlled)
- Error messages and tracebacks
- Other plugins via Lua API

**Recommendations**:
- Don't commit tokens to dotfiles repositories
- Consider using environment variables instead of hardcoded tokens
- For production tokens, use a secrets manager

## License

MIT
