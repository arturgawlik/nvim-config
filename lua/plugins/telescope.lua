-- added by me 20.08.26 
return { 
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                vimgrep_arguments = {
                    file_ignore_patterns = { 'node-modules', '.git', 'dist' }                    
                }
            },
            -- file_ignore_patterns = {
            --   "node_modules", "build", "dist"
            -- },
            pickers = {
                find_files = {
                    hidden = true 
                }
            }
        }
    }   
}

