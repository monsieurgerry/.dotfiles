local nvim_lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local buf_key = vim.keymap.set
local custom_attach = function()
    -- Mappings
    buf_key("n", "K", vim.lsp.buf.hover, {buffer=0})
    buf_key("n", "gd", vim.lsp.buf.definition, {buffer=0})
    buf_key("n", "gD", vim.lsp.buf.declaration, {buffer=0})
    buf_key("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    buf_key("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    buf_key("n", "<space>dn", vim.diagnostic.goto_next, {buffer=0})
    buf_key("n", "<space>dp", vim.diagnostic.goto_prev, {buffer=0})
    buf_key("n", "<space>D", vim.lsp.buf.type_definition, {buffer=0})

    buf_key("n", "<space>r", vim.lsp.buf.rename, {buffer=0})

    buf_key("n", "<space>lR", "LspRestart")
    buf_key("n", "<space>lf", "Telescope lsp_references")
    buf_key("n", "<space>li", "Telescope lsp_implementations")

end

local language_path = "/home/monsieurgerry/.local/lib/"

nvim_lsp.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
    cmd = { language_path .. "lua-language-server/bin/lua-language-server" },
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", },
        },
      },
    },
}

nvim_lsp.gopls.setup {
  cwd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl" },
  capabilities = capabilities,
  on_attach = custom_attach,
}

nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
}

nvim_lsp.clangd.setup {
    cwd = { "cpp" },
    capabilities = capabilities,
    on_attach = custom_attach,
    filetypes = { "c", "cpp", "objc", "objcpp" }
}

nvim_lsp.html.setup{
    capabilities = capabilities,
    on_attach = custom_attach,
}

nvim_lsp.cssls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

nvim_lsp.texlab.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/monsieurgerry/.cache/jdtls/' .. project_name

nvim_lsp.jdtls.setup {
  cwd = { "jdtls" },
  cmd = {
    '/usr/lib/jvm/java-18-openjdk/bin/java', -- or '/path/to/java11_or_newer/bin/java'

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',

    '-jar', language_path .. 'jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', language_path .. 'jdt/config_linux',

    '-data', workspace_dir,
  },
  capabilities = capabilities,
  on_attach = custom_attach,
  filetypes = { "java" },
  init_options = {
    workspace = "/home/runner/workspace"
  },
}
