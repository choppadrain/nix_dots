return {
    "snacks.nvim",
    priority = 1000,
    lazy = false,
    after = function ()
        require ("snacks").setup({
input = { enabled = true },
            picker = {
                enabled = true,
                matcher = {
                    fuzzy = true,
                    smartcase = true,
                    ignorecase = true,
                    sort_empty = false,
                    filename_bonus = true,
                    file_pos = true,
                    cwd_bonus = true,
                    history_bonus = true,
                },
            },
        })
    end,
    keys = {
        { "<leader>ff", function() Snacks.picker.smart() end,                        desc = "Find Files" },
        { "<leader>fo", function() Snacks.picker.recent() end,                       desc = "Find Recent Files" },
        { "<leader>fg", function() Snacks.picker.grep() end,                         desc = "grep" },
    }
}
