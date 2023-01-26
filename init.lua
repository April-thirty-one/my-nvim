-- 基础配置
require('basic')

-- 快捷键映射
require('keybindings')

-- Packer插件管理
require('plugins')

-- 主题设置
require('colorscheme')

-- 插件配置
require("plugin-config.nvim-tree")      -- 左侧目录结构
require("plugin-config.bufferline")     -- 顶部标签栏
require("plugin-config.lualine")        -- 底部信息显示

require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")

require("plugin-config.nvim-autopairs")

require("plugin-config.toggleterm")

require("plugin-config.Comment")



-- 内置LSP 
require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")
require("plugin-config.indent-blankline")
require("lsp.null-ls")
require'lspconfig'.clangd.setup{}
