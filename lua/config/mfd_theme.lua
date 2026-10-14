-- Shared theme state between the mfd-theme-toggle shell script and Neovim.
-- The script writes the selected theme to a state file; Neovim reads it on
-- startup and whenever it regains focus, so both stay in sync.

local M = {}

M.LIGHT = "mfd-paper"
M.DARK = "mfd-amber"
-- Omarchy system theme mode: Ghostty follows the generated
-- ~/.local/state/omarchy/current/theme/ghostty.conf and Neovim follows the
-- theme's own generated .../current/theme/neovim.lua (aether for most
-- themes, but e.g. everforest for Everforest).
M.OMARCHY = "omarchy"
-- Fallback when the generated file is momentarily unreadable (theme swap).
M.NVIM_OMARCHY_SCHEME = "aether"
M.DEFAULT = M.LIGHT

-- Path of the Omarchy-generated Neovim theme. OMARCHY_NVIM_THEME_FILE
-- overrides it (used to test theme parsing without switching themes).
function M.omarchy_file()
  local override = vim.env.OMARCHY_NVIM_THEME_FILE
  if override ~= nil and override ~= "" then
    return override
  end
  return vim.fn.expand("$HOME/.local/state/omarchy/current/theme/neovim.lua")
end

-- Colorscheme the active Omarchy theme wants (its LazyVim entry), or the
-- fallback when the generated file is missing/unparseable.
function M.omarchy_scheme()
  local ok, spec = pcall(dofile, M.omarchy_file())
  if ok and type(spec) == "table" then
    local entries = spec
    if type(spec[1]) ~= "table" then
      entries = { spec }
    end
    for _, entry in ipairs(entries) do
      if type(entry) == "table" then
        local repo = entry[1]
        if repo == "LazyVim/LazyVim" or entry.name == "LazyVim" then
          if type(entry.opts) == "table" and type(entry.opts.colorscheme) == "string" then
            return entry.opts.colorscheme
          end
        end
      end
    end
  end
  return M.NVIM_OMARCHY_SCHEME
end

function M.state_file()
  local base = vim.env.XDG_STATE_HOME
  if base == nil or base == "" then
    base = vim.fn.expand("$HOME/.local/state")
  end
  return base .. "/mfd-theme/current"
end

local function normalize(theme)
  if theme == M.LIGHT or theme == M.DARK or theme == M.OMARCHY then
    return theme
  end
  return nil
end

function M.read_state()
  local handle = io.open(M.state_file(), "r")
  if handle == nil then
    return nil
  end
  local content = handle:read("*l")
  handle:close()
  if content == nil then
    return nil
  end
  return normalize(content:gsub("%s+", ""))
end

function M.write_state(theme)
  local path = M.state_file()
  vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
  local handle = io.open(path, "w")
  if handle == nil then
    return false
  end
  handle:write(theme .. "\n")
  handle:close()
  return true
end

function M.current()
  if vim.g.colors_name == M.omarchy_scheme() then
    return M.OMARCHY
  end
  return normalize(vim.g.colors_name) or M.DEFAULT
end

-- Colorscheme backing a mode (omarchy mode follows the Omarchy theme).
function M.scheme_for(theme)
  if theme == M.OMARCHY then
    return M.omarchy_scheme()
  end
  return theme
end

function M.apply(theme)
  if normalize(theme) == nil then
    return
  end
  local scheme = M.scheme_for(theme)
  if vim.g.colors_name ~= scheme then
    local ok, err = pcall(vim.cmd.colorscheme, scheme)
    if not ok then
      vim.notify("mfd theme: cannot apply " .. scheme .. ": " .. tostring(err), vim.log.levels.WARN)
      return
    end
  end
  M.write_state(theme)
end

function M.toggle()
  if M.current() == M.LIGHT then
    M.apply(M.DARK)
  else
    M.apply(M.LIGHT)
  end
  vim.notify("Theme: " .. M.current(), vim.log.levels.INFO)
end

-- Reapply the theme from the state file when it differs from the active one.
-- Used when Neovim regains focus after the shell script changed the theme.
function M.sync_from_state()
  local theme = M.read_state()
  if theme ~= nil then
    local scheme = M.scheme_for(theme)
    if vim.g.colors_name ~= scheme then
      pcall(vim.cmd.colorscheme, scheme)
    end
  end
end

-- Initial colorscheme for startup, before LazyVim applies its own default.
-- LazyVim expects a real colorscheme name, so omarchy mode maps to the
-- Omarchy theme's colorscheme.
function M.initial()
  local theme = M.read_state() or M.DEFAULT
  return M.scheme_for(theme)
end

return M
