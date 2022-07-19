require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "phpdoc" },
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
