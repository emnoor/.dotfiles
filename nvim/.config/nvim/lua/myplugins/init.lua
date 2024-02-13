return {
  {
    'tpope/vim-fugitive', -- everything git
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
  },
  --'tpope/vim-rhubarb', -- everything github
  -- { 'lewis6991/gitsigns.nvim', opts = {} },

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'christoomey/vim-tmux-navigator',
  'godlygeek/tabular',
  'eandrju/cellular-automaton.nvim',
  -- 'mbbill/undotree',
  { 'laytan/cloak.nvim',     opts = {} },
  { 'folke/which-key.nvim',  opts = {} },
  { 'numToStr/Comment.nvim', opts = {} },

  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('oil').setup({
        columns = {},
        view_options = {
          show_hidden = true,
          is_always_hidden = function (name, bufnr)
            return vim.endswith(name, "venv")
          end,
        },
      })
      vim.keymap.set("n", "-", require('oil').open, { desc = "Open parent directory" })
    end,
  },

  -- {
  --   "folke/todo-comments.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = { signs = false },
  -- },

  -- { -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({ style = "night" })
      vim.cmd.colorscheme 'tokyonight'
    end
  },

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'tokyonight',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- { -- winbar (top breadcrumbs like thingy)
  --   "utilyre/barbecue.nvim",
  --   name = "barbecue",
  --   version = "*",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   opts = {
  --     theme = 'tokyonight',
  --   },
  -- },

}
