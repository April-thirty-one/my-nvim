local packer = require("packer")
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use 'wbthomason/packer.nvim'
        -- 你的插件列表...
        --------------------- 主题 colorschemes --------------------
        -- tokyonight
        use("folke/tokyonight.nvim")
        -- nord
        use("shaunsingh/nord.nvim")
        -- gruvbox
        use("morhetz/gruvbox")
        -- nvim-tree (左侧目录)
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- bufferline (底部信息显示)
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
        -- lualine (顶部标签栏)
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        -- telescope （模糊搜索）
        use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
        -- dashboard-nvim (启动页面)
        use("glepnir/dashboard-nvim")
        -- project
        use("ahmedkhalf/project.nvim")
        -- 括号匹配
        use("windwp/nvim-autopairs")
        -- 内置终端
        use("akinsho/toggleterm.nvim")
        -- 注释
        use {
          'numToStr/Comment.nvim',
          config = function()
              require('Comment').setup()
          end
        }
        --------------------- mason --------------------
        use({ "williamboman/mason.nvim" })
        use({ "williamboman/mason-lspconfig.nvim" })
        --------------------- LSP --------------------
        -- use("williamboman/nvim-lsp-installer")   -- 不再更新,弃用, 使用mason
        -- Lspconfig
        use({ "neovim/nvim-lspconfig" })
        -- 补全引擎
        use("hrsh7th/nvim-cmp")
        -- snippet 引擎
        use("hrsh7th/vim-vsnip")
        -- 补全源 
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
        use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
        use("hrsh7th/cmp-path") -- { name = 'path' }
        use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' } 
        -- 常见编程语言代码段
        use("rafamadriz/friendly-snippets")
        -- ui 
        use("onsails/lspkind-nvim")
        -- indent-blankline
        use("lukas-reineke/indent-blankline.nvim")
        -- treesitter （语法高亮）
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        -- 代码格式化
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -------------------------------------------------------
  end,
  config = {
    -- -- -- 并发数限制
    -- max_jobs = 16,
    -- -- -- 自定义源
    -- git = {
    --   --  default_url_format = "https://hub.fastgit.xyz/%s",
    --   -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
    --   -- default_url_format = "https://gitcode.net/mirrors/%s",
    --   -- default_url_format = "https://gitclone.com/github.com/%s",
    -- },
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  },
})

-- 矩形窗口
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded"}
--     end,
--   },
-- } 
