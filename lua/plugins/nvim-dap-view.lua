return {
  {
    "igorlfs/nvim-dap-view",
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
        position = "right",
        size = 0.4,
      },
      -- automatically opens and close when session is started/finished
      auto_toggle = true,
    }
  }
}
