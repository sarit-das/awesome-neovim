require'nvim-treesitter.configs'.setup {
  ensure_installed = {'cpp','c','yaml','comment','json','haskell','lua','python'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  incremental_selection = {
      enable = true
  },
  indent = {
    enable = true
  },
  autopairs={enable = true}
}