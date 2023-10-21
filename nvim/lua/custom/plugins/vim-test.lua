return {
  "vim-test/vim-test",
  config = function ()
    vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
    vim.keymap.set('n', '<Leader>tf', ':TestFile<CR>')
    vim.keymap.set('n', '<Leader>ts', ':TestSuite<CR>')
    vim.keymap.set('n', '<Leader>tl', ':TestLast<CR>')
    vim.keymap.set('n', '<Leader>tv', ':TestVisit<CR>')

    vim.cmd([[
      let test#php#phpunit#executable = 'vendor/bin/phpunit'
      let test#php#phpunit#options = '--colors=always'
    ]])
  end,
}
