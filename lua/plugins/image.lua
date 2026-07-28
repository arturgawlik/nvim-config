-- added by me 28.06.26
return {
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      -- this require to install magick by "sudo dnf install ImageMagick"
      -- it is described here https://github.com/3rd/image.nvim#rendering-backend
      processor = "magick_cli"
    }
  }
}
