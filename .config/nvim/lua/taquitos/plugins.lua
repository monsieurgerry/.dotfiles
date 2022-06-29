vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd vimball]]

return require("packer").startup {
  function(use)

    use "wbthomason/packer.nvim"

    use "lewis6991/impatient.nvim" -- Mejora el inicio de neovim
    use {"dstein64/vim-startuptime", cmd = "StatupTime",} -- Medir el tiempo de incio

    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    use "L3MON4D3/LuaSnip"

    -- LSP Plugins:

    use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"

    use {
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup {}
      end
    }

    -- Treesitter

    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/playground"

    -- Autocompletado

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    -- use "hrsh7th/cmp-cmdline"
    use "tamago324/cmp-zsh"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "saadparwaiz1/cmp_luasnip"

    -- Lenguajes:

    -- Lua
    use "euclidianAce/BetterLua.vim"
    -- Typescript
    use "windwp/nvim-ts-autotag"
    use "p00f/nvim-ts-rainbow"
    use "jelera/vim-javascript-syntax"
    use "othree/javascript-libraries-syntax.vim"
    use "leafgarland/typescript-vim"
    use "peitalin/vim-jsx-typescript"
    use "pangloss/vim-javascript"
    use "mxw/vim-jsx"
    -- HTML | CSS
    -- Latex
    use "lervag/vimtex"
    -- MarkDown
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = "cd app && npm install",
    --     setup = function() vim.g.mkdp_filetypes = {
    --         "markdown"
    --     } end,
    --     ft = { "markdown" }, })
    -- C++
    use "bfrg/vim-cpp-modern"
    -- JAVA
    use "mfussenegger/nvim-jdtls"

    -- Telescope

    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"

    -- Varios

    use "mhinz/vim-startify"
    use "rcarriga/nvim-notify"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "mbbill/undotree"
    use "RRethy/vim-illuminate"
    use {
      "kyazdani42/nvim-tree.lua", config = function() require'nvim-tree'.setup {} end
    }
    use "mkitt/tabline.vim"
    use "sbdchd/neoformat"

    -- use "ThePrimeagen/harpoon"

    -- Visuales

    use "karb94/neoscroll.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "tjdevries/cyclist.vim"

    -- Colors
    use "gruvbox-community/gruvbox"
    use "norcalli/nvim-colorizer.lua"
    use "folke/tokyonight.nvim"

  end,

  config = {
    display = {
      -- open_fn = require('packer.util').float,
    },
  },
}
