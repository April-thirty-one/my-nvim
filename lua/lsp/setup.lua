-- local lsp_installer = require("nvim-lsp-installer")

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- local servers = {
-- --  sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
-- --  clangd = require("lsp.config.c")
-- }
-- -- 自动安装 Language Servers
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end

-- lsp_installer.on_server_ready(function(server)
--     local config = servers[server.name]
--     if config == nil then
--         return
--     end
--     if config.on_setup then
--         config.on_setup(server)
--     else
--         server:setup({})
--     end
-- end)


-- :h mason-default-settings
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "sumneko_lua",
    "clangd",
    -- "tsserver",
    -- "tailwindcss",
    -- "bashls",
    -- "cssls",
    -- "dockerls",
    -- "emmet_ls",
    -- "html",
    -- "jsonls",
    -- "pyright",
    -- "rust_analyzer",
    -- "taplo",
    -- "yamlls",
    -- "gopls",
  },
})
