-- Set <Space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Prepend lazy.nvim to the runtime path
vim.opt.rtp:prepend("C:/Users/Prasad Raju/AppData/Local/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate", 
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end 
  },

  -- LSP Config
  { "neovim/nvim-lspconfig", 
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      })
      lspconfig.pyright.setup({})
    end 
  },

  { "morhetz/gruvbox" },
  -- Autocompletion
  { "hrsh7th/nvim-cmp", 
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end 
  },

  -- Snippet engine
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },

  -- Devicons (REQUIRES NERD FONT - SEE TROUBLESHOOTING NOTES BELOW)
  { "nvim-tree/nvim-web-devicons", 
    config = function()
      require("nvim-web-devicons").setup()  -- Corrected setup
    end 
  },

-- File Explorer
{ "nvim-tree/nvim-tree.lua", 
  dependencies = { "nvim-tree/nvim-web-devicons" }, 
  config = function()
    require("nvim-tree").setup({
      hijack_unnamed_buffer_when_opening = false,
      open_on_setup = false,           -- Don't open on startup
      open_on_setup_file = false,      -- Don't open when opening a file
      view = {
        width = 30,                    -- Set width to 30 columns
        side = "left",                 -- Or "right" if you prefer
      },
      actions = {
        open_file = {
          quit_on_open = true,         -- Auto-close when opening a file
          window_picker = {
            enable = false,            -- Disable window picker for single-window close
          },
        },
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            git = true,
          },
        },
      },
    })
  end 
},


  -- Bufferline
  { "akinsho/bufferline.nvim", 
    version = "*", 
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    config = true 
  },

  -- Statusline
  { "nvim-lualine/lualine.nvim", 
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    config = true 
  },

  -- Fuzzy finder
  { "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" } 
  },

  -- Git tools
  { "lewis6991/gitsigns.nvim", config = true },
  { "tpope/vim-fugitive" },

  -- Keybinding helper
  { "folke/which-key.nvim", config = true },

  -- Auto pairs
  { "windwp/nvim-autopairs", config = true },

  -- UI enhancements
  { "folke/noice.nvim", 
    dependencies = { "MunifTanjim/nui.nvim" }, 
    config = true 
  },

  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "rebelot/kanagawa.nvim" },
})

-- Colorscheme
-- vim.cmd("colorscheme kanagawa-dragon")


vim.cmd("colorscheme gruvbox")
vim.opt.number = true 

-- vim.opt.relativenumber = true -- Show relative line numbers (optional)


-- Add this in your keybindings section or after your plugin configuration
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

