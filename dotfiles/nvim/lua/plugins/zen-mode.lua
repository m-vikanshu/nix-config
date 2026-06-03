return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = function()
        return math.min(160, vim.o.columns * 0.60)
      end,
      height = 1,
      backdrop = 1,
      options = {
        signcolumn = "yes", -- disable signcolumn
        list = false,       -- disable whitespace characters
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,                -- disables the ruler text in the cmd line area
        showcmd = false,              -- disables the command in the last line of the screen
        -- statusline will be shown only if 'laststatus' == 3
        laststatus = 0,               -- turn off the statusline in zen mode
      },
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = false },     -- disables the tmux statusline
      todo = { enabled = false },     -- if set to "true", todo-comments.nvim highlights will be disabled
      -- this will change the font size on kitty when in zen mode
      -- to make this work, you need to set the following kitty options:
      -- - allow_remote_control socket-only
      -- - listen_on unix:/tmp/kitty
      kitty = {
        enabled = true,
        font = "+4", -- font size increment
      },
    },
    vim.keymap.set('n', '<leader>tz', vim.cmd.ZenMode, { desc = '[T]oggle [z]en mode' })

  }
}
