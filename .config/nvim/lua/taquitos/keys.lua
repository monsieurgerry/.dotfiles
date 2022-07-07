local maps = vim.api.nvim_set_keymap

local keymap = function(map, f, buffer)
    local mode = "n"
    local command = string.format("<cmd>%s<CR>",f)
    local map_options = {
        noremap = true,
        silent = true,
    }
    if not buffer then
        maps(mode, map, command, map_options)
    else
        maps(0, mode, map, command, map_options)
    end
end

keymap("<leader>r", "!remaps")
keymap("<leader>y", "%y+") -- Copiar todo
maps('n', '<leader>p', ':w!<CR> :so %<CR> :PackerSync<CR>', {noremap = true,}) -- Packer rapidin
keymap("<leader><leader>s", "source ~/.config/nvim/after/plugin/luasnip.lua") -- Recargar snippets

keymap("<space>e", "Lexplore") -- Explorador
keymap("<leader>q", "Startify")
keymap("<leader>u", "UndotreeToggle")
keymap("<space>t", "TroubleToggle") -- LSP diagnostics

keymap("<leader>gc", "!g++ -std=c++14 -o %< %") -- C++

-- Movimiento
-- Movimiento entre ventanas
maps('n', '<C-h>', '<C-w>h', {silent = true}) -- Izquierda
maps('n', '<C-j>', '<C-w>j', {silent = true}) -- Abajo
maps('n', '<C-k>', '<C-w>k', {silent = true}) -- Arriba
maps('n', '<C-l>', '<C-w>l', {silent = true}) -- Derecha
-- Mover texto
maps('v', '<', '<gv', {noremap = true, silent = true}) -- Izquierda
maps('v', '>', '>gv', {noremap = true, silent = true}) -- Derecha

-- Tabs
keymap("<leader>t", "tabnew")
keymap("tn", "tabnext")
keymap("tp", "tabprevious")
keymap("tc", "tabclose")
