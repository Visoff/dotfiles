vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'echasnovski/mini.nvim'
    -- Packer can manage itself
    use 'preservim/nerdcommenter'
    use 'wbthomason/packer.nvim'

    use 'mbbill/undotree'

    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
    })

    use {
        "folke/todo-comments.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    use 'norcalli/nvim-colorizer.lua'

    use 'Visoff/pomodoro.nvim'

    -- Let's goooooo, harpoon gaming
    use 'nvim-lua/plenary.nvim'
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use "rafamadriz/friendly-snippets"


    use {
        "Exafunction/codeium.vim",
    }

    use({
        "stevearc/oil.nvim",
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("oil").setup()
        end,
    })

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        --run = ':TSUpdate'
    }
end)
