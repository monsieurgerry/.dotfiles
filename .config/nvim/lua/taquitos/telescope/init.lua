local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"

local tele_find = require("telescope.builtin").find_files

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local M = {}

function M.fd()
  local opts = themes.get_ivy {
      hidden = true,
      follow = true,
  }
  require("telescope.builtin").fd(opts)
end

-- Neovim

function M.edit_neovim()
  local opts_with_preview, opts_without_preview

  opts_with_preview = {
    prompt_title = "~ Neovim ~",
    shorten_path = false,
    follow = true,
    cwd = "~/.config/nvim",

    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,

      horizontal = {
        width = { padding = 0.15 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },

    attach_mappings = function(_, map)
      map("i", "<c-y>", set_prompt_to_entry_value)
      map("i", "<M-c>", function(prompt_bufnr)
        actions.close(prompt_bufnr)
        vim.schedule(function()
          require("telescope.builtin").find_files(opts_without_preview)
        end)
      end)

      return true
    end,
  }

  opts_without_preview = vim.deepcopy(opts_with_preview)
  opts_without_preview.previewer = false

  require("telescope.builtin").find_files(opts_with_preview)
end

function M.nvim_plugins()
  tele_find {
    cwd = vim.fn.stdpath "data" .. "/site/pack/packer/start/",
  }
end

function M.vim_options()
  require("telescope.builtin").vim_options {
    layout_config = {
      width = 0.5,
    },
    sorting_strategy = "ascending",
  }
end

-- ZSH ~ DWM

function M.edit_zsh()
  local width = 0.25

  local opts = themes.get_dropdown {
    winblend = 6,
    previewer = false,
    shorten_path = false,
    prompt_title = "~ ZSH ~",
    cwd = "~/.config/shell",

    follow = true,

    layout_config = {
      width = width,
    },
  }

  require("telescope.builtin").find_files(opts)
end

function M.edit_dwm()
  local width = 0.50
  local opts = themes.get_dropdown {
    cwd = "~/.config/dwm/",
    prompt_title = "~ DWM ~",

    previewer = false,
    shorten_path = false,
    hidden = false,
    follow = true,

    layout_strategy = "horizontal",
    layout_config = {
        width = width,
    },
  }
  require("telescope.builtin").find_files(opts)
end

-- Personal

function M.awesometimes()
  tele_find {
    prompt_title = "🤍 AWESOMETIMES 🖤",
    shorten_path = false,
    cwd = "~/awesometimes/",
    hidden = false,

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      preview_width = 0.65,
    },
  }
end

function M.projects()
    tele_find {
        shorten_path = false,
        cwd = "~/awesometimes/projects/",
        prompt = "~ DREAMS ~",
        hidden = true,

        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.55,
        },
    }
end

function M.escuela()
  local width = 0.50

  local opts = themes.get_dropdown {
    winblend = 10,
    previewer = false,
    shorten_path = false,
    hidden = true,

    cwd = "~/Documents/ceti/",
    prompt = "~  龎 ~",

    layout_config = {
      width = width,
    },
  }

  tele_find(opts)
end

-- GIT
function M.git_files()
  local path = vim.fn.expand "%:h"
  if path == "" then
    path = nil
  end

  local width = 0.25

  local opts = themes.get_dropdown {
    winblend = 5,
    previewer = false,
    shorten_path = false,

    cwd = path,

    layout_config = {
      width = width,
    },
  }

  require("telescope.builtin").git_files(opts)
end

function M.git_status()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require("telescope.builtin").git_status(opts)
end

function M.git_commits()
  require("telescope.builtin").git_commits {
    winblend = 5,
  }
end

-- Strings

function M.live_grep()
  require("telescope.builtin").live_grep {
    shorten_path = true,
    previewer = false,
    fzf_separator = "|>",
    hidden = true,
    follow = true,
  }
end

function M.grep_prompt()
  require("telescope.builtin").grep_string {
    path_display = { "shorten" },
    search = vim.fn.input "Grep String > ",
    follow = true,
  }
end

function M.grep_busqueda(opts)
  opts = opts or {}

  local register = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", "")

  opts.path_display = { "shorten" }
  opts.word_match = "-w"
  opts.search = register

  require("telescope.builtin").grep_string(opts)
end

function M.curbuf()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

function M.archivos_selectos()
  tele_find {
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input "Type: ",
    },
  }
end

function M.lsp_references()
  require("telescope.builtin").lsp_references {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
end

function M.lsp_implementations()
  require("telescope.builtin").lsp_implementations {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
end

function M.buffers()
  require("telescope.builtin").buffers {
    shorten_path = true,
  }
end

function M.all_files()
  tele_find {
    find_command = { "rg", "--no-ignore", "--files" },
  }
end

-- Walls
local function set_xwallpaper(content)
    vim.fn.system(
        "setbg \"" .. content .. "\"")
end

local function fun_walls(prompt_bufnr, map)
    local function cambiar_fondo(close)
        local content =
        require('telescope.actions.state').get_selected_entry(prompt_bufnr)
        set_xwallpaper(content.cwd .. "/" .. content.value)
        if close then
            require('telescope.actions').close(prompt_bufnr)
        end
    end

    map('i', '<C-p>', function()
        cambiar_fondo()
    end)

    map('i', '<CR>', function()
        cambiar_fondo(true)
    end)
end

local function selec_imagen(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            theme = "dropdown",
            prompt_title = prompt,
            prompt_prefix = "> ",
            cwd = cwd,
            previewer = false,
            layout_config = {
                height = 15,
                width = 70,
            },
            attach_mappings = function(prompt_bufnr, map)
                fun_walls(prompt_bufnr, map)
                return true
            end
        })
    end
end

M.wallpaper_selector = selec_imagen(" ~ 💜 ~ ", "~/Pictures/walls")

return M
