local g = vim.g
local opt = vim.opt
local hl = vim.api.nvim_set_hl

local M = {}

function M.awesome_colors(color)
    opt.termguicolors = true
    opt.background = "dark"
    require("colorizer").setup()

    -- Tokyonight
    g.tokyonight_style = "night"
    g.tokyonight_terminal_colors = true
    g.tokyonight_italic_functions = true
    g.tokyonight_transparent_sidebar = true
    g.tokyonight_transparent = true
    -- Gruvy
    g.gruvbox_contrast_dark = 'hard'
    g.gruvbox_invert_selection = '0'

    vim.cmd("colorscheme " .. color)

    hl(0, "SignColumn", { bg = "None" })
    hl(0, "ColorColumn", { bg = "#232d6b" })
    hl(0, "CursorLineNR", { bg = "None" })
    hl(0, "LineNr", { fg = "#5484b2" })
    hl(0, "NonText", { fg = "#232d6b" })

    if color == "gruvbox" then
        hl(0, "Normal", { ctermbg = "None", bg = "None" })
    end
end

-- M.awesome_colors("gruvbox")
M.awesome_colors("tokyonight")

local n = "n"
local map_opt = {
    noremap = true,
    silent = true,
}
local map = vim.api.nvim_set_keymap
map(n, "<leader><leader>g", "<cmd>lua require('after.plugin.colors').awesome_colors('gruvbox')<CR>", map_opt)
map(n, "<leader><leader>t", "<cmd>lua require('after.plugin.colors').awesome_colors('tokyonight')<CR>", map_opt)

return M
