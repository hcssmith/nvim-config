function NotWindows()
    if vim.loop.os_uname().sysname == "Windows_NT" then
      return false
    end
    return true
end

function Gui()
  if vim.g.neovide or vim.g.nvy then
    return true
  end
  return false
end

function HasLsp()
  local lsp_clients = vim.lsp.get_clients({bufnr=0})
  if #lsp_clients > 0 then
    return true
  else
    return false
  end
end
