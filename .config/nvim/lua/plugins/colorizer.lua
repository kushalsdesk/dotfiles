return {
  "norcalli/nvim-colorizer.lua",
  even = {"InsertEnter"},
  config = function()
    require 'colorizer'.setup({
      'css',
      'javascript',
      html = { mode = 'background' },
    }, { mode = 'foreground' })
  end
}
