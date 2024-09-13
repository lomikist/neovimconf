require("nvim-treesitter.configs").setup {
  ensure_installed = { "cpp", "lua", "python" },

  ignore_install = { "php", "css", "kotlin", "angular", "bp", "d", "groovy", "html", "leo", "liquid" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  -- fold = { enable = true },
}
 
--vim.opt.foldmethod = 'expr'
--vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
--vim.opt.foldenable = true
