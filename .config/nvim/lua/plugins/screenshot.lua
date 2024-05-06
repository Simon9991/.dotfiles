return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      mac_window_bar = true,
      title = "nvim",
      code_font_family = "JetBrainsMono Nerd Font",
      watermark_font_family = "Pacifico",
      watermark = "",
      -- bg_theme = "grape", -- bamboo, sea, peach, grape, dusk, summer, default
      bg_color = "#535c68",
      breadcrumbs_separator = "/",
      has_breadcrumbs = true,
      has_line_number = true,
    },
  },
}
