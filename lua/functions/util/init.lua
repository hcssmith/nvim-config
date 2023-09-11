function Config_files()
  local cwd = vim.fn.stdpath "config" .. "/"
  local config_dir = { cwd }

  require("telescope.builtin").find_files {
    prompt_title = "Config Files",
    search_dirs = config_dir,
    cwd = cwd,
  }
end

function Footer()
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

function NewFile()
  local fname = vim.fn.input("File: ", "", "file")
  if fname == "" then return end
  vim.cmd("e " .. fname)
end

function NewNote()
  local date = vim.fn.strftime('%Y%m%d')
  local filename = Core.NotesDir .. date .. ".md"
  local fname = vim.fn.input("open ", filename, "file")
  if fname == "" then return end
  vim.cmd("cd " .. Core.NotesDir)
  vim.cmd("e " .. fname)
end

function SearchNotes()
  require('telescope').extensions.live_grep_args.live_grep_args({
    search_dirs = {
      Core.NotesDir
    }
  })
end

function Home()
  if NotWindows() then
    return "HOME"
  else
    return "HOMEPATH"
  end
end

function LaunchDashboard()
  require('nvim-tree.api').tree.close()
  vim.cmd(":Dashboard")
end

function NotesDir()
  local notes = "/notes/"
  local od = os.getenv('OneDrive')
  local path = ""
  if od == nil then
    path = Core.Home .. notes
  else
    path = od .. notes
  end
  return path
end

function HasCCompiler()
  local comilers = {"cc", "gcc", "cl", "zig", "clang"}
  for _, cmp in ipairs(comilers) do
    if vim.fn.executable(cmp) == 1 then return true end
  end
  return false
end
