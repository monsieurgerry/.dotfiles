require'nvim-treesitter.configs'.setup {
  ignore_install = { "javascript", "clangd", "cpp", },
  autotag = {
      enable = true,
  },
  highlight = {
    enable = true,
    disable = { "rust", "clangd", "cpp", "latex", "js", "markdown"},
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true,
  --   max_file_lines = nil,
  --   -- colors = {}, -- table of hex strings
  --   -- termcolors = {} -- table of colour name strings
  -- },
}
