return {
  "nvim-neorg/neorg",
  lazy = false,
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.esupports.metagen"]     = { config = { type = "auto", update_date = true } },
        ["core.qol.toc"]               = {},
        ["core.qol.todo_items"]        = {},
        ["core.looking-glass"]         = {},
        ["core.presenter"]             = { config = { zen_mode = "zen-mode" } },
        ["core.summary"]               = {},
        -- ["core.ui.calendar"]           = {},
        ["core.defaults"]              = {},
        ["core.completion"]            = { config = { engine = "nvim-cmp", name = "[Norg]" } },
        ["core.integrations.nvim-cmp"] = {},
        ["core.concealer"]             = {},
        ["core.export"]                = {},
        ["core.export.markdown"]       = { config = { extensions = "all" } },
        ["core.keybinds"]              = {
          -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
          config = {
            default_keybinds = true,
            neorg_leader = "<Leader><Leader>",
          },
        },
        ["core.dirman"]                = {
          config = {
            workspaces = {
              notes = "~/personal/notes",
            }
          }
        }
      }
    }
  end,
}
