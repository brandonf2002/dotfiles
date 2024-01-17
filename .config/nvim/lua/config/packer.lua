-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'links-lang/vim-links'

    use 'vim-scripts/promela.vim'

    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua' -- recommended if need floating window support

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins

    -- Useful Basics
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'tpope/vim-repeat'

    use 'rafi/awesome-vim-colorschemes'

    use 'zbirenbaum/copilot.lua'
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    }

    use 'ap/vim-css-color'

    -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    -- Pretty stuff
    use 'kyazdani42/nvim-web-devicons'
    use 'hoob3rt/lualine.nvim'

    use 'akinsho/flutter-tools.nvim'
    use 'p00f/clangd_extensions.nvim'

    -- Treesitter
    use ({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use 'nvim-treesitter/playground'

    -- Undotree
    use 'mbbill/undotree'

    -- LaTex
    use 'lervag/vimtex'

    use { "barreiroleo/ltex-extra.nvim" }

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    -- use 'brandonf2002/nvim-markdown'
    -- use 'ixru/nvim-markdown'

    use 'vale1410/vim-minizinc'
    -- use({
    --   "epwalsh/obsidian.nvim",
    --   tag = "*",  -- recommended, use latest release instead of latest commit
    --   requires = {
    --     -- Required.
    --     "nvim-lua/plenary.nvim",

    --     -- see below for full list of optional dependencies 👇
    --   },
    --   config = function()
    --     require("obsidian").setup({
    --       workspaces = {
    --         {
    --           name = "personal",
    --           path = "~/vaults/personal",
    --         },
    --         {
    --           name = "work",
    --           path = "~/vaults/work",
    --         },
    --       },

    --       -- see below for full list of options 👇
    --     })
    --   end,
    -- })

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required

        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional
        {'uga-rosa/cmp-dictionary'}, -- Optional
        {'f3fora/cmp-spell'},

        {'L3MON4D3/LuaSnip'},     -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    }
}

end)
