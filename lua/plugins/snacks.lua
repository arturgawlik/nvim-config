return {
  {
    "folke/snacks.nvim",
    opts = {
      gh = {
        -- your gh configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      picker = {
        sources = {
          gh_issue = {
            -- your gh_issue picker configuration comes here
            -- or leave it empty to use the default settings
          },
          gh_pr = {
            -- your gh_pr picker configuration comes here
            -- or leave it empty to use the default settings
          },
          projects = {
          -- this function is basically taken from
          -- https://github.com/folke/snacks.nvim/blob/882c996cf28183f4d63640de0b4c02ec886d01f2/lua/snacks/picker/actions.lua#L662-L685
          -- but changed that there is no event fired, but `resession` used instead
          confirm = function(picker, item)
            local dir = item.file
            picker:close()
            if not item then
              return
            end
            -- use resession instead of firing even like it was in the original code
            -- save current session
            require("resession").save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
            vim.fn.chdir(dir)
            local session = Snacks.dashboard.sections.session()
            if session then
              vim.cmd(session.action:sub(2))
            end
            -- and load new one
            require("resession").load(
              dir,
              { dir = "dirsession", silence_errors = true }
            )
          end,
        },
        },
      },
    },
    keys = {
      { "<leader>gP", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    },
  }
}
