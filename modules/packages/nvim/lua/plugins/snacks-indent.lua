return {
    "snacks.nvim",
    lazy = false,
    after = function ()
        require ("snacks").setup({
            indent = {
                priority = 1,
                enabled=  true,
            },
            animate = {
                enabled = false,
            },

        })
    end,
}
