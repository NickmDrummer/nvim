-- Omarchy system theme bridge: registers the editor plugins from the
-- theme-generated ~/.local/state/omarchy/current/theme/neovim.lua so the
-- colorscheme the Omarchy theme wants actually exists in Neovim.
--
-- The file's LazyVim entry (which pins a global colorscheme) is skipped so
-- mfd-paper/mfd-amber stay the default; config.theme applies the theme's
-- colorscheme only in omarchy mode.
--
-- Every other known theme plugin is pinned below as dormant (lazy = true):
-- installed on disk but never loaded, so Lazy never flags them as unused and
-- theme switches never trigger install/clean churn. The active theme's own
-- spec always wins (dedupe by repo and resolved name, current first).
--
-- aether shares one plugin dir ("aether") between bjarneo (v2/v3, used by
-- the sakura-mochi overlay and greek-noir) and omacom (v3, generated
-- template). It is pinned here as bjarneo v2, the daily-driver identity;
-- visiting an omacom-aether theme flips that shared dir once. Excluded on
-- purpose: omacom/aether.nvim (same dir, loads via generated spec when its
-- themes are active) and bjarneo/hackerman.nvim (rare; its aether dependency
-- would fight the same shared dir).
--
-- To extend the pinned list, re-run:
--   grep -hoP '"\K[a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+(?=")' \
--     /usr/share/omarchy/themes/*/neovim.lua ~/.config/omarchy/themes/*/neovim.lua \
--     | sort -u
-- and keep each theme's canonical name = / branch = fields when present.
--
-- If the generated file is momentarily missing (theme swap), a bare eager
-- aether spec is returned instead so startup never fails on a missing
-- colorscheme. OMARCHY_NVIM_THEME_FILE overrides the generated file path
-- (testing hook).
local PINNED = {
  { "bjarneo/aether.nvim", branch = "v2", name = "aether", lazy = true },
  { "neanias/everforest-nvim", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "ribru17/bamboo.nvim", lazy = true },
  { "kepano/flexoki-neovim", lazy = true },
  { "ficcdaf/ashen.nvim", lazy = true },
  { "tahayvr/matteblack.nvim", lazy = true },
  { "OldJobobo/retro-82.nvim", lazy = true },
  { "omacom-io/lumon.nvim", lazy = true },
  { "steve-lohmeyer/mars.nvim", name = "mars", lazy = true },
}

local FALLBACK = { "bjarneo/aether.nvim", branch = "v2", name = "aether", priority = 1000 }

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
  if type(spec[1]) ~= "table" and type(spec[1]) ~= "string" then
    return { spec }
  end
  return spec
end

local function repo_of(entry)
  if type(entry) == "string" then
    return entry
  end
  if type(entry) == "table" and type(entry[1]) == "string" then
    return entry[1]
  end
  return nil
end

local function name_of(entry)
  if type(entry) == "string" then
    local repo = entry
    return repo:match("/(.+)$") or repo
  end
  if type(entry) == "table" then
    if type(entry.name) == "string" then
      return entry.name
    end
    return repo_of(entry)
  end
  return nil
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

local entries = theme_entries()
if entries == nil then
  return { FALLBACK }
end

local specs = {}
local seen_repos = {}
local seen_names = {}
for _, entry in ipairs(entries) do
  if not is_lazyvim(entry) then
    specs[#specs + 1] = entry
    local repo = repo_of(entry)
    if repo ~= nil then
      seen_repos[repo] = true
    end
    local name = name_of(entry)
    if name ~= nil then
      seen_names[name] = true
    end
  end
end
for _, pinned in ipairs(PINNED) do
  local repo = repo_of(pinned)
  local name = name_of(pinned)
  if not ((repo ~= nil and seen_repos[repo]) or (name ~= nil and seen_names[name])) then
    specs[#specs + 1] = pinned
  end
end
return specs
