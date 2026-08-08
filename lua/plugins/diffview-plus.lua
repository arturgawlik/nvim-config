return {
  {
    "dlyongemallo/diffview-plus.nvim",
    config = function(_, opts)
      -- to apply settings below
      -- here are passed opts from below
      require("diffview").setup(opts)
      -- set by me 03.08.26
      -- based on https://github.com/dlyongemallo/diffview-plus.nvim/blob/main/TIPS.md#faq
      vim.opt.fillchars:append { diff = "╱" }
    end,
    opts = {
      -- recommented options
      -- https://github.com/dlyongemallo/diffview-plus.nvim/blob/main/RECIPES.md#configuration-recipes
      show_help_hints = false,
      hide_merge_artifacts = true,
      clean_up_buffers = true,
      auto_close_on_empty = true,
      
      -- recommented for pr reviews
      -- https://github.com/dlyongemallo/diffview-plus.nvim/blob/main/RECIPES.md#configuration-recipes
      default_args = {
        DiffviewOpen = { "--imply-local" },
      },
      file_panel = {
        show_branch_name = true,
        always_show_sections = true,
      },
      
      persist_selections = { enabled = true },
    }
  }
}
