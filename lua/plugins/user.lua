-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  -- additional plugins
  {
    "jake-stewart/jfind.nvim",
    enabled = true,
    -- TODO: update to 2.0
    branch = "1.0",
    opts = {
      exclude = {
        ".git",
        ".idea",
        -- ".vscode",
        ".sass-cache",
        ".class",
        "__pycache__",
        "node_modules",
        "target",
        "build",
        "tmp",
        "assets",
        "dist",
        -- "public",
        "*.iml",
        "*.meta",
      },
    },
    keys = {
      {
        "<D-p>",
        function()
          local jfind = require "jfind"
          local key = require "jfind.key"

          jfind.findFile {
            preview = true,
            callback = {
              [key.DEFAULT] = vim.cmd.edit,
              [key.CTRL_S] = vim.cmd.split,
              [key.CTRL_X] = vim.cmd.split,
              [key.CTRL_V] = vim.cmd.vsplit,
            },
          }
        end,
      },
      {
        "<C-p>",
        function()
          local jfind = require "jfind"
          local key = require "jfind.key"

          jfind.findFile {
            preview = true,
            callback = {
              [key.DEFAULT] = vim.cmd.edit,
              [key.CTRL_S] = vim.cmd.split,
              [key.CTRL_X] = vim.cmd.split,
              [key.CTRL_V] = vim.cmd.vsplit,
            },
          }
        end,
      },
    },
  },
  -- customize astronvim defaults and astro-community
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        [[                                        ]],
        [[ ██████████████████████████████████████ ]],
        [[ █▄ ▀█▄ ▄█▄ ▄▄ █ ▄▄ █▄ █ ▄█▄ ▄█▄ ▀█▀ ▄█ ]],
        [[ ██ █▄▀ ███ ▄█▀█ ██ ██▄▀▄███ ███ █▄█ ██ ]],
        [[ ▀▄▄▄▀▀▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▀▄▀▀▀▄▄▄▀▄▄▄▀▄▄▄▀ ]],
        [[                                        ]],
      }
      return opts
    end,
  },

  { -- override nvim-autopairs plugin
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      -- run default AstroNvim config
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
      -- require Rule function
      local Rule = require "nvim-autopairs.rule"
      local npairs = require "nvim-autopairs"
      local ts_conds = require "nvim-autopairs.ts-conds"

      -- local not_string_or_comment = ts_conds.is_not_ts_node({ "string", "comment" })
      local not_inside_code_block = ts_conds.is_not_ts_node { "fenced_code_block", "indented_code_block", "code_span" }

      npairs.add_rules {
        -- markdown stuff
        -- italics
        Rule("_", "_", "markdown"):with_pair(not_inside_code_block),
        Rule("*", "*", "markdown"):with_pair(not_inside_code_block),
        -- bold --
        Rule("__", "__", "markdown"):with_pair(not_inside_code_block),
        Rule("**", "**", "markdown"):with_pair(not_inside_code_block),
      }
      npairs.add_rules(require "nvim-autopairs.rules.endwise-elixir")
      npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
      npairs.add_rules(require "nvim-autopairs.rules.endwise-ruby")
    end,
  },

  {
    -- FIXME: how to specify git source, and use dev=true?
    dir = "~/workspace/macos.nvim/",
    name = "macos.nvim",
    config = function()
      require("macos").setup {
        close_command = "bdelete",
        go_to_tab = function(tabnr) require("astrocore.buffer").nav_to(tabnr) end,
      }
    end,
    lazy = false,
  },
}
