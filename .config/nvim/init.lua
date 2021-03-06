require "impatient"

package.path = "/home/gerry/.config/nvim/" .. package.path

-- Tecla leader
vim.g.mapleader = ","

-- Configuraciones
require "taquitos.configs"
require "taquitos.builtins"
require "taquitos.keys"

-- Plugins

-- LSP
require "taquitos.lsp"

-- Telescope
require "taquitos.telescope.setup"
require "taquitos.telescope.mappings"
