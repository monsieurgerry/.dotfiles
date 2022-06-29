local g = vim.g
local opt = vim.opt

local M = {}

function M.change_colors(color)
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

    local hl = function(highlight, opts)
        vim.api.nvim_set_hl(0, highlight, opts)
    end

    hl("SignColumn", {
        bg = "none"
    })
    hl("CursorLineNR", {
        bg = "None"
    })
    hl("LineNr", {
        fg = "#00ADB5"
    })

    if color == "gruvbox" then
        hl("Normal", {
            ctermbg = "none",
            bg = "none",
        })
    end
end

-- M.change_colors("gruvbox")
M.change_colors("tokyonight")

local mode = "n"
local map_options = {
    noremap = true,
    silent = true,
}
local map = vim.api.nvim_set_keymap
map(mode, "<leader><leader>g", "<cmd>lua require('after.plugin.colors').change_colors('gruvbox')<CR>", map_options)
map(mode, "<leader><leader>t", "<cmd>lua require('after.plugin.colors').change_colors('tokyonight')<CR>", map_options)

return M
