function NotWindows()
    if vim.loop.os_uname().sysname == "Windows" then
      return false
    end
    return true
end
