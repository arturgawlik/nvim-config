-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

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
      engines = {
        ripgrep = {
          defaults = {
            flags = "--sortr=modified --hidden --fixed-strings"
          }
        },
      },
    },
  },

  -- git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.codediff-nvim" },
  {
    "emrearmagan/atlas.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional but recommended
      "MeanderingProgrammer/render-markdown.nvim", -- optional but recommended
      "esmuellert/codediff.nvim", -- optional (PullRequest diff)
    },
    -- See Configuration below
    ---@type AtlasConfig
    opts = {
      providers = {
        github = {
          cache_ttl = 300, -- Set to 0 to disable caching.
        },
      },
      pulls = {
        delete_notes = false, -- Delete local PR notes after approval or merge.
        default_merge_method = "merge", -- "merge" or "squash".
        default_delete_branch = false,
        git_transport = "ssh", -- "https" or "ssh" for Atlas-managed Git remotes.
        diff = {
          -- Use codediff.nvim (esmuellert/codediff.nvim) as the PR diff/review viewer.
          -- open_cmd = "CodeDiff",
          show_review_panel = true, -- Show the review panel when a diff opens.
          comment_display = "virtual_lines", -- "virtual_lines" or compact "virtual_text" hints.
          review_panel = {
            height = 15,
          },
          layout = "side-by-side",
          explorer = {
            show_commits = false,
          },
          compact = false,
        },
        repo_config = {
          -- Maps `workspace/repo` to local paths. Used for checkout, diffs, and custom actions.
          paths = {
            ["FA-Switch-TX/*"] = "~/git/*",
          },
        },
        github = {
          ---@type AtlasGitHubViewConfig[]
          views = {
            {
              name = "Open repository PRs",
              key = "1",
              layout = "grouped",
              current_repo = true,
              search = "is:open sort:updated-desc",
            },
          },

          bookmarks = {
            key = "S", -- default
            label = "Search", -- default
            items = {
              ["Drafts"] = "is:pr is:draft author:@me",
              ["Recently merged"] = "is:pr is:merged author:@me sort:updated-desc",
              ["Review requested"] = "is:pr is:open review-requested:@me",
            },
          },
        },
      },
    },
    keys = {
      { "<leader>gP", "<cmd>Atlas pulls<cr>", desc = "GitHub Pull Requests (open)" },
    },
  },
  {
    "esmuellert/codediff.nvim",
    -- this specific version because otherwise there is bug
    -- in integration with neogit - that needs to be fixed in neogit
    -- there is issue https://github.com/NeogitOrg/neogit/issues/2008 for that
    tag = "v2.67.1",
    opts = {
      explorer = {
        view_mode = "tree"
      },
      history = {
        date_format = "%Y/%m/%d %H:%M:%S"
      },
    }
  },
  { import = "astrocommunity.git.openingh-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      -- by default disabled
      enabled = false,
    },
  },

  -- scroll
  { import = "astrocommunity.scrolling.vim-smoothie" },

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
  -- lua
  { import = "astrocommunity.pack.lua" },
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
  -- rust
  { import = "astrocommunity.pack.rust" },
  -- cpp
  { import = "astrocommunity.pack.cpp" },
}
