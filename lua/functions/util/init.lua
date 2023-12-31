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

function SetKeymaps(keymap_tbl, bufnr)
  local modes = {
    { "insert","i"},
    { "normal","n"},
    { "visual","v"}
  }
  for _, v in ipairs(modes) do
    if keymap_tbl[v[1]] ~= nil then
      for _, km in ipairs(keymap_tbl[v[1]]) do
        local opts = km[3]
        if opts == nil and bufnr ~= nil then
          opts = {
            buffer = bufnr
          }
        end
        vim.keymap.set(v[2], km[1], km[2], opts)
      end
    end
  end
end
