return {
  {
    "rickhowe/diffchar.vim",
    config = function()
      -- Use bold/underline on adjacent chars instead of virtual blank columns.
      vim.g.DiffDelPosVisible = 1

      -- Disable diffchar default keymaps.
      -- See: https://github.com/rickhowe/diffchar.vim/issues/21
      vim.cmd([[
        nmap <leader>g <Nop>
        nmap <leader>p <Nop>
      ]])
    end,
  }
}
