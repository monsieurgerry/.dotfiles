TelescopeMapArgs = TelescopeMapArgs or {}

local mapping = vim.api.nvim_set_keymap
local map_tele = function(key, f, options, buffer)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeMapArgs[map_key] = options or {}

  local mode = "n"
  local rhs = string.format("<cmd>lua require('taquitos.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    mapping(mode, key, rhs, map_options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end

mapping("c", "<c-r><c-r>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- Mappeando bb

-- Editar
map_tele("<leader>en", "edit_neovim")
map_tele("<leader>ez", "edit_zsh")
map_tele("<leader>ed", "edit_dwm")

map_tele("<space>fe", "escuela")

-- Walls
map_tele("<leader>w", "wallpaper_selector")

-- Busqueda
map_tele("<space>fp", "projects")
map_tele("<space>fa", "awesometimes")
map_tele("<space>fl", "all_files")
map_tele("<space>fd", "fd")
map_tele("<space>fz", "archivos_selectos")

map_tele("<space>b", "buffers")

map_tele("<space>fP", "nvim_plugins")
mapping("n", "<space>fh", "<cmd>Telescope help_tags<cr>", {noremap = true, silent = true})
map_tele("<space>fo", "vim_options")

map_tele("<space>fB", "builtin")

-- Strings
map_tele("<space>s/", "grep_busqueda", { -- Ultima busqueda hecha
  layout_strategy = "vertical",
})
map_tele("<space>ss", "live_grep")
map_tele("<space>sp", "grep_prompt")
map_tele("<space>sb", "curbuf")

-- Git
map_tele("<space>gf", "git_files")
map_tele("<space>gs", "git_status")
map_tele("<space>gc", "git_commits")

return map_tele
