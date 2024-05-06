return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
        },
      })
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      -- Set key bindings
      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add File" })
      vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon: Toggle Quick Menu" })
    end,
  },
}
