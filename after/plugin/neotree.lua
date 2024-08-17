require("neo-tree").setup {
  close_if_last_window = true,
  netrw_hijack_behavior = "open_split",

  follow_current_file = {
    enabled = true
  },
  window = {
    position = "float",
    mappings = {
      ["P"] = { "toggle_preview", config = {use_image_nvim = true}}
    }
  }
}
