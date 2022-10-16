
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,             -- false will disable the whole extension
    disable = { "help" },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
  },
}
EOF
