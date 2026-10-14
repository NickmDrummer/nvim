-- Omarchy system theme bridge: registers the editor plugins from the
-- theme-generated ~/.local/state/omarchy/current/theme/neovim.lua so the
-- colorscheme the Omarchy theme wants actually exists in Neovim.
--
-- The file's LazyVim entry (which pins a global colorscheme) is skipped so
-- mfd-paper/mfd-amber stay the default; config.mfd_theme applies the theme's
-- colorscheme only in omarchy mode.
--
-- If the generated file is momentarily missing (theme swap), a bare aether
-- spec is registered instead so startup never fails on a missing colorscheme.
-- OMARCHY_NVIM_THEME_FILE overrides the generated file path (testing hook).
local function theme_entries()
  local path = vim.env.OMARCHY_NVIM_THEME_FILE
  if path == nil or path == "" then
    path = vim.fn.expand("$HOME/.local/state/omarchy/current/theme/neovim.lua")
  end
  if vim.fn.filereadable(path) == 0 then
    return nil
  end
  local ok, spec = pcall(dofile, path)
  if not ok or type(spec) ~= "table" then
    return nil
  end
  if type(spec[1]) ~= "table" then
    return { spec }
  end
  return spec
end

local function is_lazyvim(entry)
  if type(entry) == "string" then
    return entry == "LazyVim/LazyVim"
  end
  if type(entry) ~= "table" then
    return false
  end
  return entry[1] == "LazyVim/LazyVim" or entry.name == "LazyVim"
end

local specs = {}
local entries = theme_entries()
if entries ~= nil then
  for _, entry in ipairs(entries) do
    if not is_lazyvim(entry) then
      specs[#specs + 1] = entry
    end
  end
end
if #specs == 0 then
  specs = { { "omacom/aether.nvim", branch = "v3", name = "aether", priority = 1000 } }
end
return specs
