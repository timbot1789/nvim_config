Required dependencies:
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [imagemagick](https://imagemagick.org/script/download.php)

All my custom commands exist under <leader> (space key). I don't remap any other vim keys 
- <leader> + `e` + option: file explorer commands (currently netrw)
    - P: open file in current window
- <leader> + `f` + option: advanced search commands (telescope)
- <leader> + `w` + option: window creation / navigation commands
- <leader> + `l` + option: lsp utilities
- <leader> + `g` + option: git utilities
- <leader> + <leader>: save document
- <leader> + `?`: show available keys
- <leader> + `fk`: show all keymaps
- <leader> + <Backspace>: show global motions

FAQs:
- See telescope commands: <C-/> in insert mode, ? in normal mode
- Send telescope results to QFList: <C-
- folding is under the z key:
    - zi toggle all folds
    - za toggle folds under cursor
    - zo open folds under cursor
    - zc close folds under cursor
