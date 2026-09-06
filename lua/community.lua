-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- search and replace
  {
    import = "astrocommunity.search.grug-far-nvim",
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = {
      minSearchChars = 1,
    },
  },

  -- git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.codediff-nvim" },
  {
    "esmuellert/codediff.nvim",
    -- this specific version because otherwise there is bug
    -- in integration with neogit - that needs to be fixed in neogit
    -- there is issue https://github.com/NeogitOrg/neogit/issues/2008 for that
    tag = "v2.67.1",
  },
  { import = "astrocommunity.git.openingh-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },

  -- game
  { import = "astrocommunity.game.leetcode-nvim" },
  {
    "kawre/leetcode.nvim",
    opts = {
      lang = "typescript",
      storage = {
        -- points to repo catalog
        home = "/home/ag/git/leetcode",
      },
      editor = {
        reset_previous_code = false,
      },
      description = {
        position = "right",
        width = "40%",
      },
    },
  },

  --session
  { import = "astrocommunity.recipes.auto-session-restore" },

  -- media
  { import = "astrocommunity.media.image-nvim" },

  -- languages
  -- typescript
  { import = "astrocommunity.pack.typescript" },
  -- markdown
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  -- sql
  { import = "astrocommunity.pack.full-dadbod" },
  -- xml
  { import = "astrocommunity.pack.xml" },
  -- json
  { import = "astrocommunity.pack.json" },
}
