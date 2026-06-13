return {
    "nvim-treesitter",
    lazy = false,

    after = function ()
        require('nvim-treesitter').setup ({
                highlight  = {
                    enable = true,
                    additional_vim_regex_highlighting = false,

                },
                indent = { enable = true, },
        })
    end,
}
