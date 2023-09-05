function NotWindows()
    if vim.loop.os_uname().sysname == "Windows" then
      return false
    end
    return true
end

function Config_files()
  local cwd = vim.fn.stdpath "config" .. "/"
  local config_dir = { cwd }

  require("telescope.builtin").find_files {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end

Footer = function()
  local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  local lazy_ok, lazy = pcall(require, "lazy")
  if lazy_ok then
    local total_plugins = lazy.stats().count .. " Plugins"
    local startuptime = (math.floor(lazy.stats().startuptime * 100 + 0.5) / 100)
    return version .. "   " .. total_plugins .. "  󰄉 " .. startuptime .. " ms"
  else
    return version
  end
end

NewFile = function ()
  local fname = vim.fn.input("File: ", "", "file")
  if fname == "" then return end
  vim.cmd("e " .. fname)
end

NewNote = function ()
  local date = vim.fn.strftime('%Y%m%d')
  local filename = Core.notesdir .. date .. ".md"
  local fname = vim.fn.input("open ", filename, "file")
  if fname == "" then return end
  vim.cmd("cd " .. Core.notesdir)
  vim.cmd("e " .. fname)
end

function SearchNotes()
  require('telescope').extensions.live_grep_args.live_grep_args({
    search_dirs = {
      Core.notesdir
    }
  })
end

Gui = function ()
  if vim.g.neovide or vim.g.nvy then
    return true
  end
  return false
end
