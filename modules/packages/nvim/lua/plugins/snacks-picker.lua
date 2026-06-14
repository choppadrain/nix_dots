return {
    "snacks.nvim",
    event = "DeferredUiEnter",
    after = function ()
        require ("snacks").setup({
            picker = {

            },
        })
    end,
}
