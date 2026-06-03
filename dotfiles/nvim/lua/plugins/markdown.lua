return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      enabled = true,
      render_modes = false,
      atx = true,
      setext = true,
      sign = false,
      icons = { '# ', '## ', '### ', '#### ', '#### ', '###### ' },
      position = 'overlay',
      width = 'full',
      border = true,
      border_virtual = true,
    },

    code = {
      enabled = true,
      render_modes = false,
      sign = false,
      style = 'full',
      width = 'block',
    },

  },
}
