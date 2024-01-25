return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
    local configs = require("nvim-treesitter.configs")

---@diagnostic disable-next-line: missing-fields
    configs.setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
