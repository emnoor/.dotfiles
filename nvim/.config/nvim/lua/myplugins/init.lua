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
  { 'numToStr/Comment.nvim', opts = {} },
  { 'tpope/vim-surround' },

  -- Show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },

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

  -- Highlight todo, notes, etc in comments
  -- { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

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
        theme = 'tokyonight',
      },
    },
  },

  -- { -- Autoformat
  --   'stevearc/conform.nvim',
  --   opts = {
  --     notify_on_error = false,
  --     format_on_save = {
  --       timeout_ms = 500,
  --       lsp_fallback = true,
  --     },
  --     formatters_by_ft = {
  --       lua = { 'stylua' },
  --       -- Conform can also run multiple formatters sequentially
  --       -- python = { "isort", "black" },
  --       --
  --       -- You can use a sub-list to tell conform to run *until* a formatter
  --       -- is found.
  --       -- javascript = { { "prettierd", "prettier" } },
  --     },
  --   },
  -- },

}
