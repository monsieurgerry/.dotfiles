vim.g.loaded_matchparen = 1

local opt = vim.opt

-- Basics

opt.belloff = "all" -- Campanita tediosa.
opt.number = true -- Numeros a la izq.
opt.relativenumber = true -- Linea en la que estas.
opt.scrolloff = 8 -- La pantalla baja antes de llegar al final '8 lineas antes'
opt.showmode = true -- No -- INSERT -- en command line.
-- opt.guicursor = "" -- El cursor se queda en bloque.
opt.signcolumn = "yes" -- Para que no tenga que aparecer cada que hay errores.
opt.cursorline = true -- Barra en la linea en la que estas
opt.wrap = false -- No continuar la linea hacia abajo (personalmente no me gusta).
opt.updatetime = 1000
opt.colorcolumn = "100"

opt.equalalways = false
opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"
opt.hidden = true -- Buffers siempre abiertos (usa + RAM).
opt.shortmess = opt.shortmess + "c"

-- Busqueda
opt.incsearch = true
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

-- Mouse
-- opt.mouse = "nv"

-- Tabular
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.smartindent = true
opt.expandtab = true

-- C++
opt.makeprg = "gcc"

-- UNDOTREE
opt.undodir = "/home/gerry/.cache/nvim/undodir/"
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- TODO: Descubrir como hacer esto en LUA
vim.cmd [[
    au BufWinEnter * set formatoptions-=c formatoptions-=r formatoptions-=o
    au BufRead * set formatoptions-=c formatoptions-=r formatoptions-=o
    au BufNewFile * set formatoptions-=c formatoptions-=r formatoptions-=o
]]

--[[
opt.formatoptions = opt.formatoptions
    - "a" -- Autoformat
    - "t" -- Autoformat
    + "c" -- Comentarios respetan anchura.
    - "o" -- Dejar de comentar en 'o' y 'O'.
    - "r" -- Dejar de comentar en enter.
    + "j" -- Quitar comentarios si es posible.
--]]

opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"
