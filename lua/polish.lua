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

-- { macOS convenience keybinds }--
-- Cut/Copy/Paste to/from system clipboard
vim.keymap.set("v", "<D-c>", '"+y')
vim.keymap.set("v", "<D-x>", '"+c')
vim.keymap.set("", "<D-v>", '"+p')
vim.keymap.set("c", "<D-v>", "<C-r><C-o>+")
vim.keymap.set("i", "<D-v>", "<C-r><C-o>+")

-- ⌘ s - save
vim.keymap.set("n", "<D-s>", ":w<CR>", silent)
vim.keymap.set("n", "<leader>s", ":w<CR>", silent)
vim.api.nvim_set_keymap("n", "<C-S>", ":%s/", silent_noremap)
-- ⌘ a - select all
vim.keymap.set("n", "<D-a>", "ggVG", silent)

-- ⌘ / - close current window
local close_command = 'bdelete'
-- local close_command = "lua require('superesc').close()"
vim.keymap.set("", "<D-w>", "<cmd>" .. close_command .. "<cr>", silent)
vim.keymap.set("i", "<D-w>", "<cmd>" .. close_command .. "<cr>", silent)

-- Create new tab with Command-T
vim.keymap.set("", "<D-t>", "<cmd>tabnew<cr>", silent_noremap)
vim.keymap.set("i", "<D-t>", "<cmd>tabnew<cr>", silent_noremap)

-- { VS Code and other IDE like behavior }} --
-- ⌘ / - toggle comment
vim.keymap.set("n", "<D-/>", "gcc", silent)
vim.keymap.set("v", "<D-/>", "gc", silent)
-- ⌘ ]  - shift identation right
vim.keymap.set("n", "<D-]>", ">>", silent)
vim.keymap.set("v", "<D-]>", ">", silent)
vim.keymap.set("i", "<D-]>", "<C-O>>>", silent)

-- ⌘ ] - shift identation left vim.keymap.set("n", "<D-[>", "<<", silent)
vim.keymap.set("n", "<D-[>", "<<", silent)
vim.keymap.set("v", "<D-[>", "<", silent)
vim.keymap.set("i", "<D-[>", "<C-O><<", silent)
