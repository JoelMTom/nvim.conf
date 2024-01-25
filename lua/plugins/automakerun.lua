return {
  -- "JoelMTom/nvim-automakerun",
  dir = "~/projects/nvimplugins/automakerun",
  name = "automakerun",
  lazy = false,
  --[[ dependencies = {
    "VonHeikemen/lsp-zero.nvim"
  }, ]]
  opts = {
    defaultTasks = {
      buildsystem = {
        cmd = "premake5",
        args = {
          "vs2022"
        },
        filename = "premake5.lua"
      },
      build = {
        cmd = "make",
        args = { "all" },
      },
      run = {
        cmd = "./main",
        args = {},
      }
    },
    tasksFilename = "tasks.json",
    buildFilename = "build.log",
    amrDir = ".nvim/",
  },
  -- init = function()
  --   vim.opt.rtp:append("~/projects/nvimplugins/automakerun")
  --   -- require("automakerun")
  -- end,
  config = function(_, opts)
    require("automakerun"):setup(opts)
  end
}
