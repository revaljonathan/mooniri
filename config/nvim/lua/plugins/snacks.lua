return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = header,
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 3, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 3, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 3, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
