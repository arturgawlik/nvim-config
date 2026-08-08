return {
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      -- Only one of these is needed.
      "dlyongemallo/diffview-plus.nvim",        -- optional

      -- For a custom log pager
      "m00qek/baleia.nvim",            -- optional

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
    },
    opts = {
      integrations = { 
        diffview = true,
        telescope = true,
      },
      treesitter_diff_highlight = true,
    }
  },
}
