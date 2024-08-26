-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
local silent_noremap = { noremap = true, silent = true }
local silent = { silent = true }

-- for UI frontends
vim.o.termguicolors = true
vim.g.neovide_input_use_logo = true -- Ensure we can pass the command key
vim.g.neovide_confirm_quit = true -- Prevent exit on unsaved buffer on window close
vim.g.neovide_cursor_vfx_mode = "railgun"
-- g.neovide_remember_window_size = true
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
-- without this, winbar scrolls up when scrolling https://github.com/neovide/neovide/issues/1550
vim.g.neovide_scroll_animation_length = 0

vim.o.guifont = "DankMono Nerd Font:h16"

vim.filetype.add {
  extension = {
    god = "ruby",
    rbi = "ruby",
    rabl = "ruby",
  },
  filename = {
    ["Dangerfile"] = "ruby",
    ["Appraisals"] = "ruby",
    ["Brewfile"] = "ruby",
    [".pryrc"] = "ruby",
  },
}

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/336
vim.cmd "autocmd FileType ruby setlocal indentkeys-=."
