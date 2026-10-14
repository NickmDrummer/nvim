-- Shared theme state between the mfd-theme-toggle shell script and Neovim.
-- The script writes the selected theme to a state file; Neovim reads it on
-- startup and whenever it regains focus, so both stay in sync.

local M = {}

M.LIGHT = "mfd-paper"
M.DARK = "mfd-amber"
-- Omarchy system theme mode: Ghostty follows the generated
-- ~/.local/state/omarchy/current/theme/ghostty.conf and Neovim uses the
-- generated aether colorscheme from .../current/theme/neovim.lua.
M.OMARCHY = "omarchy"
M.NVIM_OMARCHY_SCHEME = "aether"
M.DEFAULT = M.LIGHT

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
  if vim.g.colors_name == M.NVIM_OMARCHY_SCHEME then
    return M.OMARCHY
  end
  return normalize(vim.g.colors_name) or M.DEFAULT
end

-- Colorscheme backing a mode (omarchy mode is backed by aether).
function M.scheme_for(theme)
  if theme == M.OMARCHY then
    return M.NVIM_OMARCHY_SCHEME
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
-- LazyVim expects a real colorscheme name, so omarchy mode maps to aether.
function M.initial()
  local theme = M.read_state() or M.DEFAULT
  return M.scheme_for(theme)
end

return M
