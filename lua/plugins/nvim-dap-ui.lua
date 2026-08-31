-- added by me 05.08.26
-- because I wanted to use different UI for debugger which is configured in `nvim-dap-ui.lua`
return {
  {
    "rcarriga/nvim-dap-ui",
    enabled = true,
    opts = {
      expand_lines = true,
      controls = { enabled = false }, -- no extra play/step buttons
      floating = { border = "rounded" },

      -- Set dapui window
      render = {
        max_type_length = 60,
        max_value_lines = 200,
      },

      -- Only one layout: just the "scopes" (variables) list at the bottom
      layouts = {
        -- {
        --   elements = {
        --     { id = "scopes", size = 0.8 }, -- 100% of this panel is scopes
        --     { id = "stacks", size = 0.2 }, -- 100% of this panel is scopes
        --   },
        --   size = 80,                       -- height in lines (adjust to taste)
        --   position = "right",             -- "left", "right", "top", "bottom"
        -- },
        {
          elements = {
            { id = "scopes", size = 0.8 }, -- 100% of this panel is scopes
            { id = "stacks", size = 0.2 }, -- 100% of this panel is scopes
          },
          size = 15,                       -- height in lines (adjust to taste)
          position = "bottom",             -- "left", "right", "top", "bottom"
        },
      },
    }
  }
}
