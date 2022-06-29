vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"

local lspkind = require "lspkind"
lspkind.init()

local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<c-y>"] = cmp.mapping(
        cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        { "i", "c" }
      ),
      ["<c-space>"] = cmp.mapping {
        i = cmp.mapping.complete(),
        c = function(
          _ --[[fallback]]
        )
          if cmp.visible() then
            if not cmp.confirm { select = true } then
              return
            end
          else
            cmp.complete()
          end
        end,
      },
      -- ["<tab>"] = cmp.config.disable,

      -- TODO: CTRL N and P wasn't working, disable later and fix.
      ["<C-n>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ["<C-p>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end,
    },

    sources = cmp.config.sources({
      { name = "nvim_lua" },

      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = "path" },
      { name = "buffer", keyword_length = 4 },
    }),
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        luasnip = "[Snip]",
        gh_issues = "[Issues]",
        tn = "[TabNine]",
        latex_symbols = "[LaTeX]",
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = false,
  },
})
