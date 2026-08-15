return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    ---@diagnostic disable-next-line: missing-parameter
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    })
    local function map(lhs, rhs, opts)
      vim.keymap.set("n", lhs, rhs, opts or {})
    end
    map("<localleader>a", function()
      harpoon:list():add()
    end, { desc = "[A]dd to Harpoon" })
    map("<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "which_key_ignore" })
    map("<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "which_key_ignore" })
    map("<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "which_key_ignore" })
    map("<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "which_key_ignore" })
    map("<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "which_key_ignore" })
    map("<leader>5", function()
      harpoon:list():select(5)
    end, { desc = "which_key_ignore" })
    map("<leader>6", function()
      harpoon:list():select(6)
    end, { desc = "which_key_ignore" })
    map("<leader>7", function()
      harpoon:list():select(7)
    end, { desc = "which_key_ignore" })
    map("<leader>8", function()
      harpoon:list():select(8)
    end, { desc = "which_key_ignore" })
    map("<leader>9", function()
      harpoon:list():select(9)
    end, { desc = "which_key_ignore" })
    vim.keymap.set({ "n", "i" }, "<M-h>", function()
      harpoon:list():prev()
    end, { desc = "which_key_ignore" })
    vim.keymap.set({ "n", "i" }, "<M-l>", function()
      harpoon:list():next()
    end, { desc = "which_key_ignore" })
  end,
}
