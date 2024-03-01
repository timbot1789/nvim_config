require("neo-tree").setup {
  close_if_last_window = true,
  netrw_hijack_behavior = "open_split",
  follow_current_file = {
    enabled = true
  },
  buffers = {
    follow_current_file = {
      enabled = true
    }
  }
}
