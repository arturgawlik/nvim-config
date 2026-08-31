return {
  {
    "igorlfs/nvim-dap-view",
    enabled = false,
    opts = {
      winbar = {
        -- 'exceptions' removed
        sections = { "watches", "scopes", "breakpoints", "threads", "repl", "console" },
        default_section = "scopes",
        controls = {
          enabled = false,
        }
      },
      windows = {
        position = "below",
        size = 0.4,
      },
      -- automatically opens and close when session is started/finished
      auto_toggle = true,
    }
  }
}
