-- created by me 19.07.26
-- based on the instruction from here https://docs.astronvim.com/recipes/dap/#setting-up-custom-debuggers

return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
  dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
  },
  opts = {
    -- configuration goes here
    lang = "typescript",
    storage = {
      -- points to repo catalog
      home = "/home/ag/git/let-code-tasks"
      -- cache = vim.fn.stdpath("cache") .. "/leetcode",
    },
    editor = {
        reset_previous_code = false, ---@type boolean
    },
    description = {
      position = "right",
      width = "40%", ---@type lc.size
    },
  },
}
