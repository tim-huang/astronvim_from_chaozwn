local dap = require 'dap'
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = 'Attach to running Neovim instance',
  }
}

local is_empty = function(str)
  return str == nil or string.match(str, '^%s*$')
end

dap.adapters.nlua = function(callback, config)
  local host, port = config.host, config.port
  if is_empty(host) then
    vim.ui.input({
      prompt="Host",
      default="127.0.0.1",
    }, function(input) host = input end)
    vim.print(host)
    if is_empty(host) then
      return
    end
  end
  if is_empty(port) then
    vim.ui.input({
      prompt="Port",
      default="8086",
    }, function(input) port = input end)

    vim.print(port)
    if is_empty(port) then
      return
    end
  end
  callback({
    type = 'server',
    host,
    port,
  })
end

---@type LazySpec
return {
  {
    'jbyuki/one-small-step-for-vimkind',
    dependencies= {
      "mfussenegger/nvim-dap",
    }
  }
}
